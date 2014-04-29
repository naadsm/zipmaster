#include <windows.h>
#include "Zip.h"
#pragma hdrstop
#include "ZipErr.h"

/* DLLmain.c * Copyright (C) 1997 Mike White and Eric W. Engler
* Permission is granted to any individual or institution to use, copy, or
* redistribute this software so long as all of the original files are included,
* that it is not sold for profit, and that this copyright notice is retained.
* This version modified by Chris Vleghert BCB/Delphi Zip.
** distributed under LGPL license
** see license.txt for details
1.73 12 July 2003 RP encryption
1.73.2.6 21 September 2003 trap exceptions in callbacks */
//#include "Globals.h"
//#include "crypt.h"
//#include <process.h>
#include <signal.h>
#include <stdarg.h>
#include <direct.h>

#include "WizZip.h"
#include "version.h"
#include "ttyio.h"

#ifdef USE_MEMCHECK           // RCV: 1.603
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
//extern int            zipmain( int, char **, struct Globals * );
extern int ZipProcess( struct Globals * pG );
extern int ZipSelect( struct Globals * pG, const ZCL2 * C );
//extern int      ZipSelect0( struct Globals *pG);

static int ZipSetParam( ZCL * C, struct Globals * pG );
//static bool           ZipSetParam( ZCL *C, int *i, char **argVee, struct Globals *pG );
static long ZipDllExec1( ZCL * C, struct Globals * pG );
static long ZipDllExec2( ZCL2 * C, struct Globals * pG );
static bool MakeLog( struct Globals * pG, const char * nl, const char * fzn );
static void GiveTime( struct Globals * pG );
static void GiveGlobals( struct Globals * pG );
#ifndef MULTITHREAD
extern struct Globals * pGsav; // global pG
#endif
/* static void * MakeCmdArg( char **ArgArr, int *i, int size, char *arg ) {
char  *m = ( char * )MALLOC( sizeof(char) * size ); if ( m ) { lstrcpy( m, arg ); ArgArr[( *i )++] = m; }

return m; } */

#define CRITICAL_ABORT      - 1
#define CRITICAL_ABORT2     - 2
#define CRITICAL_REENTER    - 3
#define CRITICAL_CANCELLED  - 4
#define CRITICAL_MEMORY     - 5
#define CRITICAL_STRUCT     - 6
#define CRITICAL_ERROR      - 7
#define CRITICAL_CALLBACK   - 8

// Add, update, freshen, move, or delete zip entries in a zip file. SEE THE
//   FILE "SWITCHES.TXT" FOR MORE INFO. ON PROCESSING
long WINAPI ZipDllExec( ZCL * C )
{
  int Error = 0;
  struct Globals * pG;
  long RetVal;

#ifdef MULTITHREAD
  // check if globals pointer available - only if busy
  pG = ( struct Globals * ) TlsGetValue( TgbIndex ); // 0 if error or not assigned
#else

  pG = pGsav;
#endif

  if ( !C ) // busy ?
  {
    if ( pG )
    {
      if ( pG->global_abort_sw > 1 )
        return CRITICAL_ABORT2; // busy abort asked
      pG->global_abort_sw = 2;
    }

    return CRITICAL_ABORT;
  }

  if ( pG )
    return CRITICAL_REENTER; // deny re-entry
  pG = GetGlobalPointer( & Error );
  if ( !pG )
  {
    char DllErrMsg[34];

    lstrcpy( DllErrMsg, errors[( Error & 0xFF0000 ) >> 16] );
    MessageBox( NULL, DllErrMsg, "Msg From ZIP DLL", MB_OK );
    return CRITICAL_MEMORY;
  }

  GlobalsInit( pG ); // We always want a 'fresh' structure when we start here.
#ifndef MULTITHREAD

  pGsav = pG;
#endif

  pG->GlobalCompVersion = C->fVersion;

  // Copy the window handle and context of caller to our global vars
  pG->global_handle = C->fHandle;
  pG->global_caller = C->fCaller;

  // point to the C++Builder/Delphi callback function
  pG->callb = C->fCallback;

  // Static callback data
  pG->callbackdata.handle = pG->global_handle; // Window handle of caller
  pG->callbackdata.caller = pG->global_caller; // object instance pointer
  ///of caller
  pG->callbackdata.version = ZIPVERS;
  pG->callbackdata.isoperationzip = true;

  if ( C->fVersion > 150 )
    RetVal = ZipDllExec2( ( ZCL2 * ) C, pG );
  else
    RetVal = ZipDllExec1( C, pG );

  if ( pG->verbose )
    GiveTime( pG );
  if ( pG->verbose < 0 )
    Inform( pG, 0, IDIAG, "RetVal = %d ", RetVal );

  if ( pG->hLogFile != INVALID_HANDLE_VALUE )
    CloseHandle( pG->hLogFile );
  if ( pG->LogName )
    FREE( pG->LogName );

  ReleaseGlobalPointer();

  return RetVal;
}

long ZipDllExec1( ZCL * C, struct Globals * pG )
{
  //  char  **argVee;
  int //  argCee,
  //  i,
  k;
  long RetVal;
  //  int r;

  if ( C->fSeven != 7 )
  {
    user_callback( 4, ZEN_PARMS02, 0, "Structure size mismatch", pG );

    // ReleaseGlobalPointer ();
    return CRITICAL_STRUCT;
  }

  // malloc 26 vectors more than the no. of filenames - allows for max no.
  //   of command line arguments
  //  argVee = ( char ** )MALLOC( sizeof(char *) * (C->fTotFileSpecs + 26) );
  if ( !ZipSetParam( C, /* &i, argVee, */ pG ) )
  {
    // ReleaseGlobalPointer ();
    return CRITICAL_MEMORY;
  }
  RetVal = CRITICAL_ERROR;
#if 0
  // Malloc space for the name of the zip file, and copy the name in
  MakeCmdArg( argVee, & i, lstrlen( C->fZipFN ) + 1, C->fZipFN );

  // malloc space for each filename to add, and copy the names in FNV =
  //   filename vector in param struct: char *FNV[]; Note: "i" points to next
  //   free loc in the array we will send to ZipMain. We should already have
  //   some items in this array (cmd line sw's).
  for ( k = 0; k < C->fTotFileSpecs; k++ )
  {
    register char * p;

    MakeCmdArg( argVee, & i, lstrlen( C->FNV[k] ) + 1, C->FNV[k] );
    p = argVee[i - 1]; // Replace forward slashes.
    if ( p )
      while ( * p )
        if ( * p++ == '/' )
          * ( p - 1 ) = '\\';
  }

  // we won't malloc space for last one - it's just a null pointer
  argVee[i] = NULL; // no more filename args
  argCee = i; // no. of args for ZipMain
  ///* (1 based)
  for ( k = 0; k < argCee; k++ )
  {
    if ( pG->verbose )
      Inform( pG, 0, IDIAG, "Arg: %d for zipmain:  %s ", k, argVee[k] );
  }

  if ( zipmain( argCee, argVee, pG ) != 0 )
    pG->files_acted_on = 0;
  if ( pG->BatchStarted )
    user_callback( zacEndOfBatch, 0, 0, NULL, pG ); // done with a batch of
  ///files
  diag( "*** BACK FROM CALL TO ZIPMAIN ***", pG );

  // Free the arguments in the array
  for ( k = 0; k < argCee; k++ )
    FREE( argVee[k] );

  // Then free the array itself
  FREE( argVee );

  if ( C->fVerbose )
    Inform( pG, 0, 0, "Files acted on = %d", pG->files_acted_on );
#ifdef USE_MEMCHECK             // RCV: 1.603

  DispMemDiag();
#endif

  RetVal = pG->files_acted_on; // RCV: 1.6010
#endif
  // ReleaseGlobalPointer ();
  return RetVal;
}

// New entry function for components version >= 1.5
long ZipDllExec2( ZCL2 * C, struct Globals * pG )
{
  int //  i = 0,
  k, l; // RP extra variable for fRootDir length
  //  char  **argVee;
  long RetVal;
  int r;

  if ( C->fSeven != 7 )
  { // This Seven is at another place as in ZCL!
    Inform( pG, ZEN_PARMS02, 0, "Structure size mismatch" );

    // ReleaseGlobalPointer ();
    return CRITICAL_STRUCT;
  }

  // 1.74 verify version (1.72 echos DLL version)
  if ( C->fVersion > 173 && C->fVCLVer < 174 )
    C->fVersion = 172;

  if ( C->RootDir )
  {
    pG->OCDlength = lstrlen( C->RootDir );
    if ( ( pG->OrigCurrentDir = ( char * ) MALLOC( pG->OCDlength + 2 ) ) == NULL )
    { // RP allow space for '\'
      Inform( pG, ZEN_MEM36, 0, "CurrentDir allocation error" );
      return CRITICAL_MEMORY;
    }

    lstrcpy( pG->OrigCurrentDir, C->RootDir );
  }
  else
  {
    // DLL v1.608, Component v1.60L, RootDir support, change DLL v1.6017
    pG->OCDlength = GetCurrentDirectory( 0, pG->OrigCurrentDir );
    if ( ( pG->OrigCurrentDir = ( char * ) MALLOC( pG->OCDlength + 2 ) ) == NULL )
    { // RP allow space for '\'
      Inform( pG, ZEN_MEM36, 0, "CurrentDir allocation error" );

      return CRITICAL_MEMORY;
    }

    // Save the process defined current dir.
    GetCurrentDirectory( pG->OCDlength, pG->OrigCurrentDir );
  }
  // RP OrigCurrentDir must end trailing backslash
  l = lstrlen( pG->OrigCurrentDir );
  if ( l > 0 && ( pG->OrigCurrentDir ) [l - 1] != '\\' )
  {
    lstrcat( pG->OrigCurrentDir, "\\" );
    pG->OCDlength++;
  }

  pG->zcomment = C->fArchComment;
  if ( C->fArchComment )
    pG->zcomlen = lstrlen( C->fArchComment );
  if ( C->fArchiveFilesOnly )
    pG->ArchiveFiles = 1;
  if ( C->fResetArchiveBit )
    pG->ResetArchiveBit = 1;
  if ( C->fHowToMove )
    pG->HowToMove = true;

  // check for log
  if ( C->fVersion >= 173 )
  {
    for ( k = 0; k < C->fTotFileSpecs; k++ )
    {
      register char * p;
      const char * ln = C->fFDS[k].fFileSpec;
      if ( ln && * ln == '>' )
      {
        MakeLog( pG, ++ln, C->fZipFN );
        break;
      }
    }
  }

  r = ZipSetParam( ( ZCL * ) C, pG );
  if ( r > 0 )
    return -12; // password error (<160)
  if ( r < 0 )
    return r; // critical error

  if ( C->fTempPath )
  { // Temporary path -b
    pG->tempdir = 1;
    if ( ( pG->tempath = ( char * ) MALLOC( lstrlen( C->fTempPath ) + 1 ) ) == NULL )
      return CRITICAL_MEMORY;
    lstrcpy( pG->tempath, C->fTempPath );
  }
  // in this state, we need the name of the zip file
  if ( ( pG->zipfile = ziptyp( C->fZipFN, pG ) ) == NULL )
    return CRITICAL_MEMORY;
  if ( C->fVersion >= 160 )
    pG->WantedCodePage = C->fWantedCodePage; // v1.6017
  if ( C->fVersion >= 174 )
    pG->WantedOS = C->fWantedOS; // v1.74
  //MakeLog(pG, "+", C->fZipFN);
  if ( C->fVerbose )
  {
    Inform( pG, 0, IDIAG, "Using ZIPDLL.dll version %i.%02i.%i.%i %s", ZIPVERS / 100, ZIPVERS % 100,
            REVISION, PATCHLEVEL, mdate );
  }
  if ( pG->verbose )
    GiveTime( pG );
  if ( pG->verbose < 0 )
    GiveGlobals( pG );
#ifdef USE_STRM_INPUT

  if ( C->fVersion >= 160 && C->fUseInStream )
  {
    pG->UseOutStream = C->fUseOutStream; // In memory compression.
    pG->OutStream = C->fOutStream;
    pG->OutStreamSize = C->fOutStreamSize;
    pG->UseInStream = C->fUseInStream;
    pG->InStream = C->fInStream;
    pG->InStreamSize = C->fInStreamSize;
    pG->StrFileAttr = C->fStrFileAttr;
    pG->StrFileDate = C->fStrFileDate;
    if ( pG->UseOutStream )
    { // In-memory compression.
      // Pass total number of files always 1
      user_callback( 5, 0, 1, NULL, pG );

      // Pass total filesize.
      user_callback( 6, 0, pG->InStreamSize, NULL, pG );
      pG->OutStreamSize =
        memcompress( ( char * ) pG->OutStream, pG->OutStreamSize, ( char * ) pG->InStream, pG->InStreamSize, pG );
      pG->files_acted_on++;
      user_callback( 3, 0, 0, NULL, pG ); // done with this in-memory compression.
    }
  }

  if ( C->fVersion < 160 || !( C->fUseInStream && pG->UseOutStream))
  {
#endif

    if ( !ZipSelect( pG, C ) )
    {
      if ( ZipProcess( pG ) != 0 )
        pG->files_acted_on = 0;
      if ( pG->BatchStarted )
        user_callback( zacEndOfBatch, 0, 0, NULL, pG ); // done with a batch of files
      diag( "*** BACK FROM CALL TO ZipProcess ***", pG );
    }
    if ( C->fVerbose )
      Inform( pG, 0, 0, "Files acted on = %d", pG->files_acted_on );

#ifdef USE_STRM_INPUT

  }
#endif
  // DLL v1.608, Component v1.60L, RootDir support.
  if ( pG->OrigCurrentDir )
    FREE( pG->OrigCurrentDir );
#ifdef USE_STRM_INPUT

  if ( pG->UseInStream && pG->UseOutStream )
    C->fOutStreamSize = pG->OutStreamSize;
#endif
#ifdef USE_MEMCHECK               // RCV: 1.603

  DispMemDiag();
#endif

  if ( pG->Callback_Exception ) // <0 unhandled >0 vcl handled
    return CRITICAL_CALLBACK;
  if ( pG->global_abort_sw > 0 ) // <0 errors 1 vcl cancelled  2 Aborted
    return CRITICAL_CANCELLED;

  return pG->files_acted_on; // RCV: 1.6010
}

int ZipSetParam( ZCL * C, struct Globals * pG )
{
  int ii;
  if ( C->fQuiet || !C->fHandle )
  { // quiet operation -q
    pG->noisy = 0; // shut us up!
    //    pG->verbose = 0;  // override verbose option
    pG->dll_handles_errors = 0; // All error msgs passed to caller via callback function
  }

  if ( C->fVerbose || C->fTraceEnabled ) // verbose messages -v
  {
    pG->noisy = 1;
    pG->verbose |= C->fTraceEnabled ? -1 : 1;
  }
  if ( pG->verbose ) // pG->global_trace_opt )
    diag( "trace is on in ZIPDLL.DLL", pG );
  if ( C->fZipFN == NULL )
  { // Something screwed up, we don't have a filename
    Inform( pG, ZEN_PARMS01, 0, "No zip filename received" );
    return CRITICAL_ERROR;
  }

  if ( C->fVersion != ZIPVERS )
  { // see version.h
    wsprintf( pG->ewemsg, "Warning: ZIPDLL.dll version %i.%02i.%i.%i %s is %s", ZIPVERS / 100, ZIPVERS % 100, REVISION,
              PATCHLEVEL, mdate, ( C->fVersion < ZIPVERS ) ? "newer" : "older\nPlease get an update" );

    // This message won't appear if user did pass us a zero Window handle.
    if ( !C->fQuiet )
      msgbox( pG->ewemsg, pG ); // Only a warning

    // Also report this fact via the C++Builder/Delphi callback.
    Inform( pG, 0, IWARNING, pG->ewemsg );
  }

  ii = C->fLevel;
  if ( ii < 0 )
    ii = 0;
  else
    if ( ii > 9 )
      ii = 9;
  pG->method = ii ? DEFLATE : STORE;
  pG->level = ii;
  if ( pG->verbose ) // < 0)
  {
    Inform( pG, 0, IDIAG, "setting compression level to %d", pG->level );
  }

  pG->action = C->fDeleteEntries ? PURGE : ADD;
  if ( C->fFreshen ) // Freshen zip file--overwrite only -f
  {
    if ( pG->action != ADD )
    {
      Inform( pG, ZEN_PARMS06, 0, "invalid options" );
      return CRITICAL_ERROR;
    }
    pG->action = FRESHEN;
  }
  if ( C->fUpdate ) // Update zip file--overwrite only if newer -u
  {
    if ( pG->action != ADD )
    {
      Inform( pG, ZEN_PARMS08, 0, "invalid options" );
      return CRITICAL_ERROR;
    }
    pG->action = UPDATE;
  }
  // build the conventional cmd line switches
  if ( C->fNoDirEntries ) // Do not add directory entries -D
    pG->dirnames = 0;
  if ( C->fGrow ) // Allow appending to a zip file -g Normally TRUE
    pG->AllowGrow = 255;
  if ( C->fJunkDir ) // Junk directory names -j
    pG->pathput = 0;
  if ( C->fJunkSFX ) // Junk sfx prefix
    pG->junk_sfx = 1;
  if ( C->fForce ) // Make entries using DOS names (k for Katz) -k
    pG->dosify = 1;
  if ( C->fCRLF_LF ) // Translate end-of-line -l
    pG->translate_eol++;
  if ( C->fMove ) // Delete files added or updated in zip file -m
    pG->dispose = 1;
  if ( C->fLatestTime ) // Set zip file time to time of latest file in it -o
    pG->latest = 1;

  if ( C->fRecurse && C->fVersion < 160 ) // recurse into subdirectories -r
    pG->recurse = 1; // we won't necessarily save dirnames

  // Not a command line option but we set the global var directly
  if ( C->fNoRecurseFiles == 2 )
    pG->norecursefiles = 1;
  if ( C->fSystem ) // include system and hidden files -S
    pG->hidden_files = 1;
  if ( C->fGenDateUsed )
  { // Exclude files earlier than specified date -t
    int yy, mm, dd;
    const char * p = C->fGenDate;
    mm =  10 *((int) (* p++ ) - 0x30);
    if (mm < 0 || mm > 90)
      mm = 0;
    mm += (int) (* p++) - 0x30;
    if ( * p++ != ' ' )
      mm = -1;        
    dd =  10 *((int) (* p++ ) - 0x30);
    if (dd < 0 || dd > 90)
      dd = 0;
    dd += (int) (* p++) - 0x30;
    if ( * p++ != ' ' )
      dd = -1;         
    yy =  10 *((int) (* p++ ) - 0x30);
    if (yy < 0 || yy > 90)
      yy = 0;
    yy += (int) (* p) - 0x30;
    if ( mm < 1 || mm > 12 || dd < 1 || dd > 31 )
    { // bad date
      Inform( pG, ZEN_PARMS11, 0, "invalid date" );
      //      return CRITICAL_ERROR;  
    }
    else
    {
      // No "year 2000" problem here!
      yy += yy < 80 ? 2000 : 1900;
      pG->before = dostime( yy, mm, dd, 0, 0, 0 );
      if ( pG->verbose )
        Inform( pG, 0, IDIAG, "From d=%d m=%d y=%d", dd, mm, yy);
    }

    // Date must follow the -t switch
  }

  if ( C->fVolume ) // Include volume label -$
    pG->volume_label = 1;
  if ( C->fExtra ) // Include extra attributes -X
    pG->extra_fields = 0;
  if ( C->fVersion < 160 )
  {
    if ( C->fComprSpecial ) // try to compress all files
      ///* that are already compressed
      pG->special = NULL;
    else
    { // Files with these extensions will not be compressed
      pG->special = ".gif:.png:.Z:.zip:.zoo:.arc:.lzh:.arj:.taz:.tgz:.lha";
    }
  }
  else
    pG->special = C->fSuffix; // Component v1.6 can specify the extensions that will
  ///* not be compressed
#ifdef CRYPT

  if ( C->fGenEncrypt && C->fVersion < 160 )
  { // Include Encryption -e

    // if no password, we will prompt user later
    if ( ( C->fGenPassword != NULL ) && ( lstrlen( C->fGenPassword ) > 0 ) )
    {
      // allocate memory for the password, and point the global password
      //   pointer to it.
      if ( ( pG->user_key = ( char * ) MALLOC( PWLEN + 1 ) ) == NULL )
      {
        ziperror( ZEN_MEM04, pG );
        return CRITICAL_MEMORY; //false;
      }

      lstrcpyn( pG->user_key, C->fGenPassword, PWLEN ); // copy password to global buf
      pG->key = pG->user_key; // p global password
    }
    else // no password supplied - get one
    {
      int pwrcode;
      char * ekey;// = NULL; // Double check password
      int r;
      // allocate memory for the password, and point the global
      //   password pointer to it
      diag( "ZIPDLL was not passed a password", pG );

      // p if ( ( pG->key = MALLOC ( PWLEN + 1 ) ) == NULL )
      if ( ( pG->user_key = ( char * ) MALLOC( PWLEN + 1 ) ) == NULL )
        return CRITICAL_MEMORY;
      pG->key = pG->user_key; // p
      pwrcode = getp( "Enter password: ", pG->user_key, pG );
      switch ( pwrcode )
      {
        case ZEN_PW_CANCELALL:
          return ( ziperror( ZEN_PW_CANCELALL, pG ) );
        case ZEN_PW_ERROR:
          return ( ziperror( ZEN_PW_ERROR, pG ) );
        case ZEN_PW_ENTERED:
          pG->user_key[pG->key_len] = '\0';

          diag( "password entered", pG );
      }

      if ( ( ekey = ( char * ) MALLOC( PWLEN + 1 ) ) == NULL )
        return CRITICAL_MEMORY;
      pwrcode = getp( "Verify password:", ekey, pG );
      switch ( pwrcode )
      {
        case ZEN_PW_CANCELALL:
          FREE( ekey );
          return ( ziperror( ZEN_PW_CANCELALL, pG ) );
        case ZEN_PW_ERROR:
          FREE( ekey );
          return ( ziperror( ZEN_PW_ERROR, pG ) );
        case ZEN_PW_ENTERED:
          ekey[pG->key_len] = '\0';
          diag( "2nd copy of password entered", pG );
      }

      r = strcmp( pG->user_key, ekey );
      FREE( ekey );
      if ( r )
      {
        diag( "passwords do not match", pG );
        return ( ziperror( ZEN_PW_ERROR, pG ) ); // pwds did NOT match
      }

      if ( * pG->user_key == '\0' )
      {
        diag( "no passwords entered: only CR", pG );
        return ( ziperror( ZEN_PW_ERROR, pG ) ); // no pwds entered
      }
    }
  }

#endif
  if ( C->fVersion >= 160 )
  {
    // Pass the excluded file spec. list.
    pG->pcount = ( ( ZCL2 * ) C )->fTotExFileSpecs;
    pG->ExternalList = ( struct plist * ) ( ( ( ZCL2 * ) C )->fExFiles );
  }

  return 0; //true;
}

long WINAPI GetZipDllVersion( void )
{
  return ZIPVERS; // see version.h
}

long WINAPI GetZipDllPrivVersion( void )
{
  return ZIPPRIVVERS;
}

// ziperr() is the preferred error msg function!!!
void msgbox( char * msg, struct Globals * pG )
{
  // Did user pass us a window handle?
  if ( pG->global_handle )
  { // RCV changed: was exit if no handle;
    lstrcpy( pG->ewetmp, "Msg From ZIP DLL: " );
    lstrcat( pG->ewetmp, msg );
    MessageBox( pG->global_handle, pG->ewetmp, "Msg From ZIP DLL", MB_OK );
  }
}

#ifdef USE_MEMCHECK

// RCV: 1.603
void * ExtAlloc1( size_t memsize, int line, char * file )
{
  int i, error;
  struct Globals * pG;
  void * Ptr = malloc( memsize );

  if ( Ptr )
  {
    for ( i = 0; i < 4000; i++ )
    {
      if ( MemData[i].memptr == Ptr || !MemData[i].memptr )
      {
        MemData[i].memptr = Ptr;
        MemData[i].memtype = 1;
        MemData[i].memlen = memsize;
        MemData[i].line = line;
        MemData[i].memcnt++;
        lstrcpy( MemData[i].file, file );
        return Ptr;
      }
    }
  }

  // Very unlikely but...
  pG = GetGlobalPointer( & error );
  user_callback( 4, 0, 0, "Pointer is NULL or to many pointers", pG );
  return NULL;
}

HGLOBAL ExtAlloc2( UINT f, DWORD memsize, int line, char * file )
{
  int i, error;
  struct Globals * pG;
  HGLOBAL Ptr = GlobalAlloc( f, memsize );

  if ( Ptr )
  {
    for ( i = 0; i < 4000; i++ )
    {
      if ( MemData[i].memptr == Ptr || !MemData[i].memptr )
      {
        MemData[i].memptr = Ptr;
        MemData[i].memtype = 2;
        MemData[i].memlen = memsize;
        MemData[i].line = line;
        MemData[i].memcnt++;
        lstrcpy( MemData[i].file, file );
        return Ptr;
      }
    }
  }

  // Very unlikely but...
  pG = GetGlobalPointer( & error );
  user_callback( 4, 0, 0, "Pointer is NULL or to many pointers", pG );
  return NULL;
}

#pragma argsused
void ExtFree1( void * ptr, int line, char * file )
{
  int i;

  for ( i = 0; i < 4000; i++ )
  {
    if ( MemData[i].memptr == ptr && MemData[i].memtype == 1 )
    {
      MemData[i].memcnt--;
      break;
    }
  }

  free( ptr );
}

#pragma argsused
HGLOBAL ExtFree2( HGLOBAL ptr, int line, char * file )
{
  int i;

  for ( i = 0; i < 4000; i++ )
  {
    if ( MemData[i].memptr == ptr && MemData[i].memtype == 2 )
    {
      MemData[i].memcnt--;
      break;
    }
  }

  return GlobalFree( ptr );
}

void DispMemDiag( void )
{
  int error;
  struct Globals * pG = GetGlobalPointer( & error );
  char ewetmp[2048], drive[MAXDRIVE], dir[MAXDIR], file[MAXFILE], ext[MAXEXT];
  int i;

  if ( pG->global_caller && pG->callb )
  {
    for ( i = 0; i < 4000; i++ )
    {
      if ( MemData[i].memcnt )
      {
        // The global pointer can't be freed first because we still need it,
        // so skip.
        if ( MemData[i].memptr == pG && MemData[i].memcnt == 1 )
          continue;

        fnsplit( MemData[i].file, drive, dir, file, ext );
        sprintf( ewetmp, "MemAlloc: at %p size %ld file %s line %d type %d", MemData[i].memptr, MemData[i].memlen, file,
                 MemData[i].line, MemData[i].memtype );
        user_callback( 4, 0, 0, ewetmp, pG );
        sprintf( ewetmp, "Data=: %*.*s", MemData[i].memlen, MemData[i].memlen, MemData[i].memptr );
        user_callback( 4, 0, 0, ewetmp, pG );
        MemData[i].memptr = NULL;
      }
    }
  }
}

#endif


static bool MakeLog( struct Globals * pG, const char * fn, const char * zfn )
{
  struct stat StatRes;
  HANDLE hTemp;
  //  FILE * temp;
  char buf[80];
  int len;
  int r;
  DWORD br;
  char * nn;
  char l = * fn;
  if ( l == '+' || l == '*' || l == '!' ) // verbose, trace, safe trace
  {
    pG->verbose = ( l == '+' ) ? 55 : -55;
    fn++;
  }
  // allocate space for filename
  len = lstrlen( fn );
  if ( !len )
    len = lstrlen( zfn ) + 4; // room for '.log'
  nn = MALLOC( len + 1 );
  if ( !nn )
    return false;
  if ( * fn )
    lstrcpy( nn, fn );
  else
  {
    lstrcpy( nn, zfn );
    lstrcat( nn, ".log" );
  }

  if ( LSSTAT( nn, & StatRes ) == 0 ) // file exists
  {
    r = 55;     // no match
    hTemp = CreateFile( nn, GENERIC_READ, 0, NULL, OPEN_EXISTING,
                        FILE_ATTRIBUTE_NORMAL, NULL );
    if (hTemp != INVALID_HANDLE_VALUE )
    {
      memset( buf, 0, 20 );
      if (ReadFile( hTemp, buf, 16, &br, NULL ) && br == 16)
        r = lstrcmp( buf, "ZipDll Error Log" );

      Close_Handle(&hTemp);
    }
    if (r) // either could not open or was not old log
    {
      FREE( nn );
      return false;
    }
  }
  //  temp = fopen( nn, "w" );
  hTemp = CreateFile( nn, GENERIC_WRITE, 0, NULL, OPEN_ALWAYS,
                      FILE_ATTRIBUTE_NORMAL | FILE_FLAG_WRITE_THROUGH, NULL );
  if (hTemp == INVALID_HANDLE_VALUE )
    //  if ( !temp )
  {
    FREE( nn );
    return false;
  }
  if ( l != '!' )
    pG->hLogFile = hTemp;
  pG->LogName = nn;
  wsprintf( buf, "ZipDll Error Log \n" );
  //  fwrite( buf, sizeof( char ), lstrlen( buf ), temp );
  WriteFile( hTemp, buf, lstrlen(buf), &br, NULL);
  if ( l == '!' )
    Close_Handle(&hTemp);
  return true;
}

static void GiveTime( struct Globals * pG )
{
  SYSTEMTIME SystemT;

  if ( !pG->verbose )
    return;
  GetSystemTime( & SystemT );
  Inform( pG, 0, IDIAG, "Time Hour %d, min %d, sec %d msec %d", SystemT.wHour, SystemT.wMinute, SystemT.wSecond,
          SystemT.wMilliseconds );
}

char w( bool v )
{
  if ( v )
    return '+';
  return '-';
}

static void GiveGlobals( struct Globals * pG )
{
  if ( !pG->verbose )
    return;

  Inform( pG, 0, IDIAG, "g%c j%c J%c k%c m%c o%c S%c t%c", w( pG->AllowGrow ), w( pG->pathput ), w( pG->junk_sfx ), w( pG->dosify ), w( pG->dispose ), w( pG->latest ),
          w( pG->hidden_files ), w( pG->before ) );
}


// Issue a message for an error, clean up files and memory, and exit. return
//   value is the the same as 'c'. c :: Error code from the ZEN_ class.
int ziperror( int c, struct Globals * pG )
{
  char errmsg[ERRORLENGTH];
  int i;

  if ( pG->user_notified_of_abort )
    return c;
  pG->user_notified_of_abort = 1;

  pG->global_error_code = c; // Last error code
  pG->global_abort_sw = -1; // RCV Added; if we are here it's
  ///* serious we can't continue.
  if ( c != ZEN_OK )
  {
    i = ( c & 0xFF0000 ) >> 16;
    if ( c == ZEN_PW_ERROR )
      i = 1;
    else
      if ( c == ZEN_PW_CANCEL || c == ZEN_PW_CANCELALL )
        i = 17;
    lstrcpy( errmsg, errors[i] );
  }

  if ( pG->dll_handles_errors )
  {
    // I'm passing the error via the callback just to get it logged in the
    //   status box - I'm sending it in with a 0 error code to avoid a dialog
    //   box from the application program.
    user_callback( 4, ( pG->global_handle ) ? 0 : c, 0, errmsg, pG );
    sprintf( pG->ewemsg, "%s   code=%8.8X", errmsg, c );
    msgbox( pG->ewemsg, pG );
  }
  else
    user_callback( 4, c, 0, errmsg, pG ); // applic pgm handles errors (showing)
  if ( pG->tempath != NULL )
  {
    FREE( pG->tempath );
    pG->tempath = NULL;
  }

#ifdef CRYPT
  if ( pG->user_key ) // p release user password
  {
    FREE( pG->user_key );
    pG->user_key = NULL;
  }

#endif
  return c;
}

