#include <windows.h>
#include "Zip.h"
#pragma hdrstop
#include "ZipErr.h"

/* DLLClBk.c
 * Copyright (C) 1997 Mike White and Eric W. Engler
 * Permission is granted to any individual or institution to use, copy, or
 * redistribute this software so long as all of the original files are included,
 * that it is not sold for profit, and that this copyright notice is retained.
 * This version modified by Chris Vleghert BCB/Delphi Zip.
 * modified R. Peters
	** distributed under LGPL license ** see license.txt for details
 * 1.78.5.0
*/

#include "WizZip.h"

    
/* This provides the calling program with updated info on what the DLL
 * is doing.  Regardless of the type of call being made, the user's
 * function must have a spin of the Windows message loop.  In fact, even
 * if user isn't using a progress bar, he should still spin the msg
 * loop upon getting these callbacks (but he doesn't need to do anything
 * else).  In Delphi, "Application.ProcessMessages;" or
 *         in BCPPB   "Application->ProcessMessages(); spins the loop.
 * Here are the types of calls:
 *
 *   ActionCode = 1, we're starting a zip operation on a new file
 *      error_code = N/A
 *      fsize = filesize of file we're going to operate on
 *      name_or_msg = pathname of file
 *   IMPORTANT: The user's function must do the math for the progress
 *   bar upon getting this call.  See the Delphi sample application.
 *
 *   ActionCode = 2, increment the progress bar
 *      These calls will occur after every 32K of input file has been
 *      processed. One additional call is made at the end of each file,
 *      just to make sure the progress bar is max'ed out - this is also
 *      critical for files less than 32K in size (this last one will be
 *      their only one).
 *      error_code = N/A
 *      fsize = N/A
 *      name_or_msg = N/A
 *
 *   ActionCode = 3, we're done with a batch of files - program flow
 *   will quickly return to the user's program.
 *   NOTE: the end of a every file will always be followed by an
 *         action of 1 or 3, so a separate call for end of one file
 *         isn't needed.
 *      error_code = N/A
 *      fsize = N/A
 *      name_or_msg = N/A
 *
 *   ActionCode = 4, a routine message is being passed
 *      error_code = code corresponding to message (not widely used yet)
 *      fsize = N/A
 *      name_or_msg = text of message
 *
 *   ActionCode = 5, the total number of files is being passed.
 *      error_code = N/A
 *      fsize = The total number of files.
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
 *   ActionCode = 8, Also reserved by Unzip DLL. Password
 *      error_code = Y (Y=1 from Zipdll, Y=2 from UnzipDll) (O)
 *      error_code = 1 if user entered a password or 0 when user canceled or empty password (I)
 *      fsize = The repeat count (I)unzip dll only (O) both dll's
 *      name_or_msg = the new password to try or empty when canceled (I)
 *
 *   Actioncode = 9, CRC32 error during Extract ( UnzDll only )
 *      error_code = Found CRC (O)
 *      fsize = Stored/Expected CRC (O)
 *      name_or_msg = File for which the CRC check went wrong.
 *
 *   Actioncode = 10, Extract(UnZip) Overwrite ask.
 *
 *   Actioncode = 11, Skipped during Extract ( UnzDll only )
 *
 *   Actioncode = 12, FileComment while adding ( ZipDll only )
 *      name_or_msg[0-255]   = File for which the filecomment is asked. (O)
 *      name_or_msg[256-511] = Old filecomment if present. (O)
 *      name_or_msg[0-511]   = New filecomment if present. (I)
 *      error_code = 1 if filecomment has changed (I)
 *      fsize = size of new filecomment (I)
 *
 *   Actioncode = 13, Adjust unzip stream size ( UnzDll only )
 *
 *   Actioncode = 14, Set Extra Data
 *      name_or_msg[0-503]      = File for which the filecomment is asked. (O)
 *      name_or_msg[504-507]    = pointer to Extra Data buffer (O)
 *      fsize = size of Extra Data (O)
 *      fsize = size of new Extra Data (I)
 *      name_or_msg[504-507]      = pointer to extra data (I)
 *
 *   ActionCode = 15, we're starting a zip operation on a new file
 *      error_code = type - 1 = archive bit 2 = move file
 *      fsize = filesize of file we're going to operate on
 *      name_or_msg = pathname of file
 *
 *
 *   ActionCode = 16, increment the progress bar
 *      These calls will occur after every 32K of input file has been
 *      processed. One additional call is made at the end of each file,
 *      just to make sure the progress bar is max'ed out - this is also
 *      critical for files less than 32K in size (this last one will be
 *      their only one).
 *      error_code = type
 *      fsize = N/A
 *      name_or_msg = N/A
*/

/* ===========================================================================
 * This calls the application program and passes status info.
 */
void
user_callback( long action, long error_code, long fsize, char *name_or_msg,
               struct Globals *pG )
{
  __try
  {
    int ret;

    // if has been exception in Callback or aborted - don't try again
    if ( pG->callb && !pG->Callback_Exception && pG->global_abort_sw <= 1 )
    {
      pG->callbackdata.actioncode = action;
      pG->callbackdata.fsize = fsize;  
        if (pG->GlobalCompVersion >= 176 && (action <= zacEndOfBatch && action >= zacItem))
        {       // only zacItem, zacProgress and zacEndOfBatch
//          error_code = pG->BytesWritten;
          pG->callbackdata.guard = 0;
          pG->callbackdata.Data = pG->BytesWritten;
          pG->BytesWritten = 0;
        }
      if ( name_or_msg == NULL )
        pG->callbackdata.filenameormsg[0] = '\0';
      else
      {
        if ( action == 12 )
          // In this case there is an extra 0 byte which have to be copied too.
          memcpy( pG->callbackdata.filenameormsg, name_or_msg, 512 );
        else if ( action == 7 || action == 14 )
        { // In this case error_code is pointer to full name or data
          lstrcpyn( pG->callbackdata.filename, name_or_msg, 498 );
          pG->callbackdata.guard = 0;
          pG->callbackdata.Data = /*( unsigned char * )*/error_code;
          error_code = 0;
        }
        else
          lstrcpyn( pG->callbackdata.filenameormsg, name_or_msg, 512 );
      }

      // Don't pass extended error info to components <= version 145
      pG->callbackdata.error_code = ( pG->GlobalCompVersion <= 145 ) ?
           ( int ) ( char )( error_code & 0xFF ) : error_code;

      // make the call and check the return code. If true is returned, user
      //   wants to abort the current batch job.
      ret = pG->callb( &pG->callbackdata ); // call user's program
      if ( ret )
      {
        pG->global_abort_sw = 1;            // vcl asked to abort
        if ( ret == Callback_Except_No )    // vcl handled it
        {
          pG->Callback_Exception = 1;
          pG->global_abort_sw = -1;
        }
      }
    }
  }

  __except( 1 )
  {
    pG->Callback_Exception = -1;
    pG->global_abort_sw = -1;
  }
}

 