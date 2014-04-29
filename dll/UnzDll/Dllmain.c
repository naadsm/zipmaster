
/* Main UnZip DLL module
* This version modified by Chris Vleghert and Eric W. Engler
* for BCB/Delphi Zip.
* Based on Mike White's DLL, but is dissimilar in many ways.
* This module has the entry point for the two calls from BCB and Delphi. */

// EWE note: we get globals.h from this path:
// unzip.h -> unzpriv.h -> globals.h
#include <windows.h>
#include "wizunzip.h"
#include "unzip.h"
#include "version.h"
#include "consts.h"
#include <excpt.h>

bool FSetUpToProcessZipFile( struct Globals * pG, DCL1 * C );
void TakeDownFromProcessZipFile( struct Globals * pG );



//static int x_filter( EXCEPTION_POINTERS *xp );
//struct Globals *GlobalPointer;

#define PWLEN 80

#ifdef USE_MEMCHECK
static struct Tag_MemData
{
  void * memptr;
  long memcnt;
  long memtype;
  size_t memlen;
  int line;
  char file[MAX_PATH];
}
MemData[MEMCHECKSIZE];



#endif

// Not all values here are used
const char * errors[] =
{
  "", // 0=File not found
       "", // 1=password failed
       "", // 2=Unexpected end of zip file
       "Zip file structure invalid", // 3
       "Out of memory", // 4
       "", //5=Internal logic error
       "Central dir not in ZIP file", // 6
       "No multi-disk archives supported", // 7
       "Can't find start of central dir", // 8
       "Aborted by user", // 9
       "", // 10=Temporary file failure
       "Error reading a file", // 11
       "", // 12=Nothing to do!
       "Error opening ZIP file: %s", // 13
       "Error writing to a file", // 14
       "", // 15=Error creating file
       "Bad unzip options specified", // 16
       "", // 17=Password canceled
       "", // 18=File not found or no read permission
       "Fatal Error: central dir signature not found", // 19
       "Premature eof in archive" // 20
};

/* BOOL WINAPI DllEntryPoint (HINSTANCE hinstDll, DWORD fdwRreason, LPVOID plvReserved) { #ifdef MULTITHREAD
switch (fdwRreason) { case DLL_PROCESS_ATTACH:      // Allocate a index.
if ((TgbIndex = TlsAlloc ()) == 0xFFFFFFFF) return 0; break;

case DLL_PROCESS_DETACH: ReleaseGlobalPointer ();    // Make sure, only for the main thread. if (TgbIndex) {
TlsFree (TgbIndex);       // Release the index. TgbIndex = 0; } } #endif GlobalPointer = 0; return true; } */

/* ===================================================== */
long WINAPI GetUnzDllVersion( void )
{
  /* see version.h */
  return UNZVERS;
}

/* ===================================================== */
long WINAPI GetUnzDllPrivVersion( void )
{
  /* see version.h */
  return UNZPRIVVERS;
}


/* ===================================================== * Main entry point to unzip files. */
#define CRITICAL_ABORT -1
#define CRITICAL_ABORT2 -2
#define CRITICAL_REENTER -3
#define CRITICAL_CANCELLED -4
#define CRITICAL_MEMORY -5
#define CRITICAL_STRUCT -6
#define CRITICAL_ERROR -7
#define CRITICAL_CALLBACK -8
long WINAPI UnzDllExec( DCL1 * C )
{
  struct Globals * pG;
  int FilesActedOn;
  int abort_val;
  bool StructOK = false;

#ifdef MULTITHREAD
  pG = ( struct Globals * ) TlsGetValue( TgbIndex );
#else
  pG = pGsav;
#endif

  if ( !C )
  {
    if ( pG ) // request abort
    {
      if ( pG->global_abort_sw >= GA_CANCEL )
        return CRITICAL_ABORT2;
      pG->global_abort_sw = GA_ABORT;
    }
    return CRITICAL_ABORT; // busy and/or abort asked
  }
  if ( pG )
    return CRITICAL_REENTER;

#ifndef MULTITHREAD
  pGsav = NULL;
#endif
  //MessageBox (NULL, "Test version of UNZDLL - do not release", "Msg From UNZIP DLL", MB_OK);

  pG = GetGlobalPointer();
  GlobalsInit( pG ); // We always want a 'fresh' structure when we start here.

  pG->global_handle = C->fHandle; // Application handle; can be NULL.
  pG->global_caller = C->fCaller; // We just give this back in the callback call.
  pG->callb = C->fCallback; // Point to the BCB/Delphi callback function.
  pG->global_trace_opt = C->fTraceEnabled;
  pG->vflag = C->fVerbose; // verbose flag
  pG->qflag = C->fQuiet; // quiet flag
  pG->WantedCodePage = C->fWantedCodePage;
  pG->CallerVersion = C->fVersion;
  // setup for calback
  pG->CallBackData.handle = pG->global_handle; // Window handle of caller
  pG->CallBackData.caller = pG->global_caller; // Object instance pointer of caller
  pG->CallBackData.version = UNZVERS;
  pG->CallBackData.isoperationzip = false; // true=zip, false=unzip

  //    diag ( pG, "trace is on, function=UnzDllExec" );
  if ( C->fVersion > 151 )
  {
    if ( ( ( DCL2 * ) C )->fSeven == 7 ) // look in new struct if we are on a newer version
    {
      StructOK = true;
      if ( C->fVersion >= 177 )
      {
        pG->NewCB = ( ( DCL2 * ) C )->NewCB;
        //              if (pG->NewCB)
        MyTrace( pG, "New Callback is: %d", pG->NewCB );
      }
    }
  }
  else if ( C->fSeven == 7 )
    StructOK = true;
  if ( !StructOK )
  {
    //        user_callback ( pG, 4, UEN_PARMS02, 0, "Structure size mismatch" );
    ReleaseGlobalPointer();
    return CRITICAL_STRUCT;
  }
  MyTrace( pG, "trace is on, function=UnzDllExec" );

  if ( !C->fZipFN )
  {
    /* Something screwed up, we don't have a filename */
    user_callback( pG, 4, UEN_PARMS01, 0, "No zip filename received" ); // RCV changed was diag()
    ReleaseGlobalPointer();
    return CRITICAL_ERROR;
  }

  /* ---------------------------------------------------------------- */
  diag( pG, "ready to setup" );
  if ( FSetUpToProcessZipFile( pG, C ) )
  { // Parse our cmd line.
    if ( pG->global_trace_opt )
      pG->vflag = 1; // If tracing, make sure verbose is on.
    //        Trace ( ( pG, "UnzDllExec ver %i date %s",UNZPRIVVERS,REVDATE ) );
    if ( pG->vflag )
      MyDiag( pG, "Using UnzDLL.dll version %i.%02i.%i.%i %s", UNZVERS / 100, UNZVERS % 100, REVISION, PATCHLEVEL, mdate );

#ifdef USE_STRM_INPUT
    if ( C->fVersion >= 160 && pG->UseInStream )
      MemExtract( pG );
    else
#endif
    {
      process_zipfiles( pG ); // Pass ptr to global bufs.
      diag( pG, "*** BACK FROM CALL TO process_zipfiles ***" );
    }

    if ( pG->vflag )
    { // Verbose flag.
      // sprintf( pG->ewemsg, "Files acted on = %d", pG->files_acted_on );
      // user_callback( pG, 4, 0, 0, pG->ewemsg );
      DLLprintf( "Files acted on = %d", pG->files_acted_on );
    }
  }
  FilesActedOn = pG->files_acted_on;
  inflate_free( pG );
  TakeDownFromProcessZipFile( pG );
#ifdef USE_MEMCHECK
  DispMemDiag();
#endif

  abort_val = pG->global_abort_sw;
  ReleaseGlobalPointer();
  if ( abort_val & GA_EXCEPT )
    return CRITICAL_CALLBACK;
  return FilesActedOn;
}

/* =========================================================================== */
bool FSetUpToProcessZipFile( struct Globals * pG, DCL1 * C )
{
  char * ExtDir;
  int len;
  pG->vflag = C->fVerbose; // verbose flag
  pG->qflag = C->fQuiet; // quiet flag
  diag( pG, "FSetUpToProcessZipFile" );

  /* These flags all have a fixed value in this version. */
  pG->extract_flag = 1;
  pG->C_flag = 1;
  /* if true, match filenames case-insensitively */
  pG->tflag = C->fTest;
  /* if true, test zipfile */
  pG->T_flag = 1;
  /* -T: timestamps (unzip) or dec. time fmt (zipinfo) */

  // set options from caller
  pG->create_dirs = C->fDirectories; // used by main(), mapname(), checkdir()
  pG->dflag = C->fDirectories; // "recreate dir structure"
  pG->jflag = !( pG->dflag ); // "junk pathnames"

  pG->aflag = C->fConvert; // do ASCII/EBCDIC or EOL conversions
  if ( C->fHandle == 0 ) // if we don't have a window handle, then
         pG->qflag = true; // we need to be quiet (no dialog boxes)

  pG->uflag = C->fUpdate; // "Update" - extract only newer files & brand new files
  pG->fflag = C->fFreshen; // "freshen" (extract only newer files)

  if ( C->fOverwrite )
    pG->overwrite_all = true; // Don't ask, always overwrite else Don't overwrite; skip that file.

  pG->filespecs = C->fArgc; // number of fspecs

  pG->local_hdr_sig[0] = pG->central_hdr_sig[0] = pG->end_central_sig[0] = '\120'; // 'P'

  if ( ( pG->hZipFN = GLOBALALLOC( GMEM_MOVEABLE, FILNAMSIZ ) ) == NULL )
    return false;

  pG->zipfn = ( char * ) GlobalLock( pG->hZipFN );
  lstrcpy( pG->zipfn, C->fZipFN );

#ifdef CRYPT
  /* IMPORTANT! For ZIPDLL, the password is malloc'd, and then pointed-to
  * by the global "key",  However, in UNZDLL, this is done:
  * - "key" and "pG->key" must remain NULL
  * - pG->pwdarg must point to the password passed-in, or else must be NULL
  * - pG->P_flag must be set to true if a password was passed-in */

  /* if no password, we will prompt user later (only if encrypted file found) */
  if ( C->fPassword && lstrlen( C->fPassword ) > 0 )
  {
    /* allocate memory for the password, and point the * global password pointer to it */
    if ( ( pG->pwdarg = MALLOC( PWLEN + 1 ) ) == NULL )
      return 0;

    lstrcpy( pG->pwdarg, C->fPassword ); // copy password to global buf
    Trace( ( pG, "UNZDLL was passed password: %s", pG->pwdarg ) );
    pG->P_flag = true;
    /* command line password given */
  }
  pG->PwdReqCount = ( C->fVersion >= 160 ) ? ( ( DCL2 * ) C )->fPwdReqCount & 0x0F : 1;
#endif

  /*  MW: pG->wildzipfn needs to be initialized so that do_wild does not wind
  *  up clearing out the zip file name when it returns in process.c */
  if ( ( pG->hwildZipFN = GLOBALALLOC( GMEM_MOVEABLE, FILNAMSIZ ) ) == NULL )
    return false;
  pG->wildzipfn = GlobalLock( pG->hwildZipFN );
  lstrcpy( pG->wildzipfn, C->fZipFN );

#ifdef USE_STRM_INPUT

  if ( C->fVersion < 160 || !( ( DCL2 * ) C )->fUseInStream )
  {
#endif
    if ( stat( pG->zipfn, & pG->statbuf ) || ( pG->statbuf.st_mode & S_IFMT ) == S_IFDIR )
      lstrcat( pG->zipfn, ZSUFX );
    if ( stat( pG->zipfn, & pG->statbuf ) )
    {
      /* try again */
      DLLprintf( "error:  can't find zipfile [ %s ]\n", pG->zipfn );
      return false;
    }
    else
      pG->ziplen = pG->statbuf.st_size;
#ifdef USE_STRM_INPUT

  }
#endif

  if ( !C->fArgc )
    pG->process_all_files = true; // Skip fspec matching for speed.
  else
  {
    if ( C->fVersion > 151 ) // Just copy the pointer to the FileData array.
           pG->pfnames = ( ( DCL2 * ) C )->fFNV;
    else
    { // We need to copy the filename pointers to a FileData array.
      if ( ( pG->hFileDat = GLOBALALLOC( GMEM_MOVEABLE | GMEM_ZEROINIT,
           sizeof( fFileData ) * ( C->fArgc + 1 ) ) ) != NULL )
      {
        int i;

        pG->pfnames = pG->FileDat = ( fFileData( * ) [] ) GlobalLock( pG->hFileDat );
        for ( i = 0; i < C->fArgc; i++ )
          ( ( fFileData * ) ( pG->pfnames ) + i )->fFileSpec = C->fFNV[i];
      }
    }
  }
  //    pG->ExtractDir = ( ( DCL2 * )  C ) ->fExtractDir;   // v1.6024
  Trace( ( pG, "argc = %d, process_all_files = %d", C->fArgc, pG->process_all_files ) );

  /*---------------------------------------------------------------------------
  *     Ok, we have everything we need to get started.
  *---------------------------------------------------------------------------*/
  if ( ( pG->hInBuf = GLOBALALLOC( GMEM_MOVEABLE, INBUFSIZ + 4 ) ) != NULL )
  {
    pG->inbuf = ( uch * ) GlobalLock( pG->hInBuf );
    WinAssert( pG->inbuf );
  }
  if ( ( pG->hOutBuf = GLOBALALLOC( GMEM_MOVEABLE, OUTBUFSIZ + 1 ) ) != NULL )
  {
    pG->outbuf = ( uch * ) GlobalLock( pG->hOutBuf );
    WinAssert( pG->outbuf );
  }
  /*    if ( ( pG->hFileName = GLOBALALLOC ( GMEM_MOVEABLE, FILNAMSIZ ) )  != 0 ) {
  pG->filename = GlobalLock ( pG->hFileName ); WinAssert ( pG->filename ); }    */
  // 1.75 allocate memory for filename, rootpath, buildpathHPFS, buildpathFAT
  // plus DllPrintf buffer
  if ( ( pG->hFileName = GLOBALALLOC( GMEM_MOVEABLE, ( FILNAMSIZ * 7 ) + STDIO_BUF_SIZE ) ) != 0 )
  {
    pG->filename = GlobalLock( pG->hFileName );
    WinAssert( pG->filename );
    pG->rootpath = pG->filename + FILNAMSIZ + ( FILNAMSIZ / 4 );
    pG->rootlen = 0;
    pG->buildpathHPFS = pG->rootpath + FILNAMSIZ + ( FILNAMSIZ / 4 );
    * pG->buildpathHPFS = 0;
    pG->buildpathFAT = pG->buildpathHPFS + FILNAMSIZ + ( FILNAMSIZ / 4 );
    * pG->buildpathFAT = 0;
    pG->ExtractPath = pG->buildpathFAT + FILNAMSIZ + ( FILNAMSIZ / 4 );
    * pG->ExtractPath = 0;
    pG->ExtractPathEnd = pG->ExtractPath;
    pG->DllPrintBuf = pG->ExtractPath + FILNAMSIZ + ( FILNAMSIZ / 4 );
  }
  if ( !pG->inbuf || !pG->outbuf || !pG->zipfn || !pG->filename )
    return false;

  ExtDir = ( ( DCL2 * ) C )->fExtractDir; // v1.6024
  if ( ExtDir && * ExtDir )
    lstrcpy( pG->ExtractPath, ExtDir );
  else
  {
    GetCurrentDirectory( MAX_PATH, pG->ExtractPath ); // max = MAX_PATH
  }
  len = lstrlen( pG->ExtractPath );

  if ( len && pG->ExtractPath[len - 1] != '\\' && pG->ExtractPath[len - 1] != ':' )
  {
    pG->ExtractPath[len] = '\\';
    pG->ExtractPath[++len] = 0;
  }
  pG->ExtractPathEnd = pG->ExtractPath + len;
  if ( len > ( MAX_PATH - 20 ) )
    return false;

  pG->hold = & pG->inbuf[INBUFSIZ];
  /* to check for boundary-spanning signatures */

#ifdef USE_STRM_INPUT

  if ( C->fVersion >= 160 && ( ( DCL2 * ) C )->fUseInStream )
  {
    pG->UseInStream = ( ( DCL2 * ) C )->fUseInStream;
    pG->InStream = ( ( DCL2 * ) C )->fInStream;
    pG->InStreamSize = ( ( DCL2 * ) C )->fInStreamSize;
  }
#endif
#ifdef USE_STRM_OUTPUT
  if ( C->fVersion >= 160 && ( ( DCL2 * ) C )->fUseOutStream )
  {
    pG->redirect_data = true;
    pG->buffer_size = ( ( DCL2 * ) C )->fOutStreamSize;
    pG->redirect_buffer = ( ( DCL2 * ) C )->fOutStream;
  #ifdef USE_STRM_INPUT

    if ( pG->UseInStream )
    {
      pG->redirect_pointer = pG->outbuf; // Circular buffer inside DLL
      pG->redirect_size = OUTBUFSIZ;
    }
    else
    {
  #endif
      pG->redirect_pointer = pG->redirect_buffer;
      pG->redirect_size = ( ( DCL2 * ) C )->fOutStreamSize;
  #ifdef USE_STRM_INPUT

    }
  #endif
    if ( !pG->redirect_buffer )
      return false;
  }
#endif
  return true;
  /* set up was OK */
}


/* ============================================================ */
void TakeDownFromProcessZipFile( struct Globals * pG )
{
  if ( pG->hFileDat )
  {
    if ( pG->FileDat )
      GlobalUnlock( pG->hFileDat );
    GLOBALFREE( pG->hFileDat );
  }
  if ( pG->hInBuf )
  {
    if ( pG->inbuf )
      GlobalUnlock( pG->hInBuf );
    GLOBALFREE( pG->hInBuf );
  }
  if ( pG->hOutBuf )
  {
    if ( pG->outbuf )
      GlobalUnlock( pG->hOutBuf );
    GLOBALFREE( pG->hOutBuf );
  }
  if ( pG->hZipFN )
  {
    if ( pG->zipfn )
      GlobalUnlock( pG->hZipFN );
    GLOBALFREE( pG->hZipFN );
  }
  if ( pG->hwildZipFN )
  {
    if ( pG->wildzipfn )
      GlobalUnlock( pG->hwildZipFN );
    GLOBALFREE( pG->hwildZipFN );
  }
  if ( pG->hFileName )
  {
    if ( pG->filename )
      GlobalUnlock( pG->hFileName );
    GLOBALFREE( pG->hFileName );
  }
  if ( pG->key ) // RCV 1.608 Added
         FREE( pG->key );
}


/* =========================================================================== * printf clone to support DLL */
int __cdecl DLLprintf( const char * format,... )
{
  struct Globals * pG = GetGlobalPointer();
  va_list argptr;
  //    HANDLE hMemory;
  LPSTR Buffer;

  //  if ( ( hMemory = GLOBALALLOC ( GMEM_MOVEABLE, STDIO_BUF_SIZE ) )  != NULL )
  //  {
  //    if ( ( Buffer = GlobalLock ( hMemory ) )  != NULL )
  if ( ( Buffer = pG->DllPrintBuf ) != NULL )
  {
    va_start( argptr, format );
    //      wvsprintf (Buffer, format, argptr);
    vsnprintf( Buffer, 512 - 1, format, argptr );
    Buffer[512 - 1] = 0; // mark absolute end
    // warning message, or info message only
    user_callback( pG, 4, 0, 0, Buffer );
    //     GlobalUnlock ( hMemory );
    va_end( argptr );
  }
  //  GLOBALFREE ( hMemory );
  //}
  return 0;
}

/* =================================================================== */
void __cdecl MyTrace( struct Globals * pG, const char * format,... )
{
  if ( pG->global_trace_opt )
  {
    va_list argptr;
    //        HANDLE hMemory;
    LPSTR Buffer;

    //        if ( ( hMemory = GLOBALALLOC ( GMEM_MOVEABLE, STDIO_BUF_SIZE ) )  != NULL )
    //        {
    //            if ( ( Buffer = GlobalLock ( hMemory ) )  != NULL )
    if ( ( Buffer = pG->DllPrintBuf ) != NULL )
    {
      lstrcpy( Buffer, "Trace msg: " );
      va_start( argptr, format );
      vsnprintf( Buffer + 11, 512 - 12, format, argptr );
      Buffer[512 - 1] = 0; // mark absolute end
      user_callback( pG, 4, 0, 0, Buffer );
      //     diag (pG, Buffer);
      //     GlobalUnlock ( hMemory );
      va_end( argptr );
    }
    //  GLOBALFREE ( hMemory );
    //    }
  }
}

/* ===================================================================== */
void MsgBox( struct Globals * pG )
{
  char ewetmp[2048];
  HWND wHandle = pG->global_handle;

  /* Did the user pass us a good window handle? if not, we can't pop-up a box. */
  if ( !wHandle )
    wHandle = GetDesktopWindow(); // v1.6021
  /* bring up a dialog box */
  lstrcpy( ewetmp, "Msg From UNZIP DLL: " );
  strncat( ewetmp, pG->ewemsg, 2027 );
  MessageBox( wHandle, ewetmp, "Message From UNZIP DLL", MB_OK );
}


/* ===================================================================== */
// RP - changed to be controlled by verbose flag
void diag( struct Globals * pG, char * msg )
{
  char ewetmp[512];

  if ( pG->vflag )
  {
    /* log the message through the routine message callback */
    lstrcpy( ewetmp, "Trace Msg: " );
    strncat( ewetmp, msg, 512 - 12 );
    /* specify a 0 error code to prevent a dialog box from coming
    *      up in the BCB/Delphi application program */
    user_callback( pG, 4, 0, 0, ewetmp );
  }
}

void __cdecl MyDiag( struct Globals * pG, const char * format,... )
{
  char Buffer[512];
  va_list argptr;

  if ( pG->vflag )
  {
    /* log the message through the routine message callback */
    lstrcpy( Buffer, "Trace Msg: " );
    va_start( argptr, format );
    vsnprintf( Buffer + 11, 512 - 12, format, argptr );
    Buffer[512 - 1] = 0; // mark absolute end
    /* specify a 0 error code to prevent a dialog box from coming
    *      up in the BCB/Delphi application program */
    user_callback( pG, 4, 0, 0, Buffer );
    va_end( argptr );
  }
}

/* * This provides the calling program with updated info on what the DLL
* is doing.  Regardless of the type of call being made, the user's
* function must have a spin of the Windows message loop.  In fact, even
* if user isn't using a progress bar, he should still spin the msg
* loop upon getting these callbacks (but he doesn't need to do anything
* else).  In Delphi, "Application.ProcessMessages;" spins the loop.
* Here are the types of calls: *
*   ActionCode = 1, we're starting a zip operation on a new file
*      error_code = N/A
*      fsize = filesize of file we're going to operate on
*      name_or_msg = pathname of file
*   IMPORTANT: The user's function must do the math for the progress
*   bar upon getting this call.  See the Delphi sample application.

*   ActionCode = 2, increment the progress bar
*      These calls will occur after every 32K of input file has been
*      processed. One additional call is made at the end of each file,
*      just to make sure the progress bar is max'ed out - this is also
*      critical for files less than 32K in size (this last one will be
*      their only one).
*      error_code = N/A
*       fsize = N/A
*      name_or_msg = N/A

*   ActionCode = 3, we're done with a batch of files - program flow
*   will quickly return to the user's program.
*   NOTE: the end of a every file will always be followed by an
*         action of 1 or 3, so a separate call for end of one file
*         isn't needed.
*      error_code = N/A
*      fsize = N/A
*      name_or_msg = N/A

*   ActionCode = 4, a routine message is being passed
*      error_code = code corresponding to message (not widely used yet)
*      fsize = N/A
*      name_or_msg = text of message
*
*   ActionCode = 5, the total number of files is being passed.
*      error_code = N/A *      fsize = The total number of files.
*      name_or_msg = N/A
*
*   ActionCode = 6, the total file size is being passed.
*      error_code = N/A
*      fsize = The total file size
*      name_or_msg = N/A
*
*   ActionCode = 7, the internal filename is being passed.
*      error_code = 1 if name_or_msg is changed (I)
*      fsize = 0 ZipDLL or 1 if UnzipDLL (O)
*      name_or_msg = the internal filename as the dll thinks it should be. (O)
*      name_or_msg = the new internal filename as the user says it must be. (I)
*
*   ActionCode = 8, Pasword miss/error
*      error_code = Y (Y=1 from Zipdll, Y=2 from UnzipDll) (O)
*      error_code = 1 if user entered a password or 0 when user canceled or empty password (I)
*      fsize = The repeat count (I) unzip dll only (O) both dll's
*                actioncode = CancelAll=0(I) unzip dll only (v1.6024)
*      name_or_msg = the new password to try or empty when canceled (I)
*
*   Actioncode = 9, CRC32 error during Extract ( UnzDll only )
*      error_code = Found CRC (O)
*      fsize = Stored/Expected CRC (O)
*      name_or_msg = File for which the CRC check went wrong.
*
*   ActionCode = 10, A request for what to do when OverWriting is needed.
*      error-code high word = reason why the call was made 1=EXISTS_AND_OLDER 2=EXISTS_AND_NEWER. (O)
*      error-code low  word = Central File Index, should correspond to:
*                             (ZipDirEntry *)ZipBuilder1->ZipContents->Items[] (O)
*      fsize = the default action to take (depending on the property ExtrOptions. (O)
*      fsize = the result of the query 0=Do Not Overwrite, 1=Overwrite. (I)
*      name_or_msg = the filename the request is made for. (O)
*
*   ActionCode = 11, A message for the user when a file is skipped when extracting.
*      error_code = Possibly a more specific error code why the file is skipped (O)
*      fsize = The reason why the file is skipped (O) (Value 0x0101-0x0109) (0x02.. reserved for ZipDll)
*      name_or_msg = the filename for which this message applies. (O)
*
*   ActionCode = 12, Used in ZipDLL for FileComment setting.
*
*   ActionCode = 13, Used to increase the output buffer when unzipping from a stream
*      to a stream.
*      fsize = requested new size (O)
*      fsize = pointer to the (new) output buffer (I)
*      error_code = 0 or !0 when memory could not be set. (I) */

/* ===========================================================================
* This calls the application program and passes status info. */
void user_callback( struct Globals * pG, long action, long error_code, unsigned long fsize, char * name_or_msg )
{
  int ret;
  CallBackStruct * cbd = & pG->CallBackData;

  if ( pG->callb && pG->global_abort_sw < GA_EXCEPT )
  {
    __try
    {
      //      cbd->handle = pG->global_handle;  // Window handle of caller
      //      cbd->caller = pG->global_caller;  // Object instance pointer of caller
      //      cbd->version = UNZVERS;
      //      cbd->isoperationzip = false;      // true=zip, false=unzip
      if ( pG->NewCB ) //* pG->CallerVersion */ >= 177 )
      {
        cbd->zero = 0;
        cbd->fname = name_or_msg;
        if ( !name_or_msg )
          cbd->zero = 0x7fff0000;
        else if ( action == zacNewName )
        {
          lstrcpyn( cbd->filename, name_or_msg, 499 );
          cbd->guard = 0;
          cbd->Data = ( unsigned char * ) error_code;
          error_code = 0;
        }
        //        else
        //          lstrcpyn( cbd->filenameormsg, name_or_msg, 512 );
        cbd->actioncode = action;
        cbd->error_code = error_code;
      }
      else
      {
        cbd->actioncode = action & 0x3F;
        if ( !name_or_msg )
          cbd->filenameormsg[0] = '\0';
        else if ( action == zacNewName )
        {
          lstrcpyn( cbd->filename, name_or_msg, 499 );
          cbd->guard = 0;
          cbd->Data = ( unsigned char * ) error_code;
          error_code = 0;
        }
        else
          lstrcpyn( cbd->filenameormsg, name_or_msg, 512 );
        cbd->error_code = ( pG->CallerVersion <= 145 ) ? ( int )( char )( error_code & 0xFF ) : error_code;
      }

      cbd->fsize = fsize;

      /* Make the call and save the return code.  If true is returned, user * wants to abort the current batch job asap. */
      //        pG->global_abort_sw |= pG->callb ( cbd );     // Call user's program.
      ret = pG->callb( cbd ); // Call user's program.
      if ( ret )
      {
        pG->global_abort_sw |= ( ret == Callback_Except_No ) ? GA_EXCEPT : GA_CANCEL;
      }
    }

    __except( 1 )
    {
      pG->global_abort_sw |= GA_EXCEPT;
    }
  }
}

/* ===========================================================================
* Custom version of ziperr as used by InfoZip's UNZIP program. c :: Error code from the UEN_ class - UnzErr.h */
void UnzErr( struct Globals * pG, int c )
{
  char errmsg[256];
  int oldC = ( c & 0xFF0000 ) >> 16;

  if ( pG->user_notified_of_abort )
    return;
  pG->user_notified_of_abort = 1;

  pG->global_error_code = oldC;
  /* last error code */

  if ( oldC == 0x7F )
    lstrcpyn( errmsg, pG->ewemsg, 256 ); // User defined message (NOT present in errors[]! )
  else if ( c == UEN_NAME01 )
    sprintf( errmsg, errors[oldC], pG->zipfn );
  else
    lstrcpy( errmsg, errors[oldC] );

  if ( pG->dll_handles_errors )
  {
    /* I'm passing the error via the callback just to get it logged in
    * the status box - I'm sending it in with a 0 error code to avoid
    * a dialog box from the application program. */
    user_callback( pG, 4, 0, 0, errmsg );
    sprintf( pG->ewemsg, "%s   code=%d", errmsg, c );
    MsgBox( pG );
  }
  else
    user_callback( pG, 4, c, 0, errmsg );
  /* Only application program handles errors. */
}

/* Replacement for the EXIT macro, so application program will get an error and won't be aborted v1.6021. */
void EXIT( int x )
{
  struct Globals * pG = GetGlobalPointer();

  UnzErr( pG, x );
  RaiseException( x, 0, 0, NULL );
}

/* static int x_filter( EXCEPTION_POINTERS *xp ) { int rc; EXCEPTION_RECORD *xr = xp->ExceptionRecord;
//CONTEXT          *xc = xp->ContextRecord;

switch( xr->ExceptionCode ) { case UEN_READ01: rc = EXCEPTION_EXECUTE_HANDLER; break;

default:                // give up rc = EXCEPTION_CONTINUE_SEARCH; }; return rc; } */

/* ------------------------------------------------------------------- */

#ifdef USE_MEMCHECK
void * ExtAlloc1( size_t memsize, int line, char * file )
{
  int i;
  void * Ptr = malloc( memsize );

  if ( Ptr )
  {
    for ( i = 0; i < 4000; i++ )
      if ( MemData[i].memptr == Ptr || !MemData[i].memptr )
      {
        MemData[i].memptr = Ptr;
        MemData[i].memtype = 1;
        MemData[i].memlen = memsize;
        MemData[i].line = line;
        MemData[i].memcnt++;
        lstrcpy( MemData[i].file, file );
        break;
      }
  }
  return Ptr;
}

HGLOBAL ExtAlloc2( UINT f, DWORD memsize, int line, char * file )
{
  int i;
  HGLOBAL Ptr = GlobalAlloc( f, memsize );

  if ( Ptr )
  {
    for ( i = 0; i < 4000; i++ )
      if ( MemData[i].memptr == Ptr || !MemData[i].memptr )
      {
        MemData[i].memptr = Ptr;
        MemData[i].memtype = 2;
        MemData[i].memlen = memsize;
        MemData[i].line = line;
        MemData[i].memcnt++;
        lstrcpy( MemData[i].file, file );
        break;
      }
  }
  return Ptr;
}

void ExtFree1( void * ptr, int line, char * file )
{
  int i;

  for ( i = 0; i < 4000; i++ )
    if ( MemData[i].memptr == ptr && MemData[i].memtype == 1 )
    {
      MemData[i].memcnt--;
      break;
    }
  free( ptr );
}

HGLOBAL ExtFree2( HGLOBAL ptr, int line, char * file )
{
  int i;

  for ( i = 0; i < 4000; i++ )
    if ( MemData[i].memptr == ptr && MemData[i].memtype == 2 )
    {
      MemData[i].memcnt--;
      break;
    }
  return GlobalFree( ptr );
}

void DispMemDiag( void )
{
  struct Globals * pG = GetGlobalPointer();
  char ewetmp[2048], drive[MAXDRIVE], dir[MAXDIR], file[MAXFILE], ext[MAXEXT];
  int i;

  if ( pG->global_caller && pG->callb )
  {
    for ( i = 0; i < 4000; i++ )
      if ( MemData[i].memcnt )
      {
        // The global pointer can't be freed first because we still need it, so skip.
        if ( MemData[i].memptr == pG && MemData[i].memcnt == 1 )
          continue;

        fnsplit( MemData[i].file, drive, dir, file, ext );
        sprintf( ewetmp, "MemAlloc: at %p size %ld file %s line %d type %d", MemData[i].memptr, MemData[i].memlen, file,
             MemData[i].line, MemData[i].memtype );
        user_callback( pG, 4, 0, 0, ewetmp );
        MemData[i].memptr = NULL;
        // Very unlikely but...
        if ( i == 3999 )
          user_callback( pG, 4, 0, 0, "To many pointers, increase MEMCHECKSIZE" );
      }
  }
}
#endif
