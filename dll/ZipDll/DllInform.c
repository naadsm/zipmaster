#include <windows.h>
#include "Zip.h"
#pragma hdrstop

//#include "ZipErr.h"
/* DLLInform.c
 * Copyright (C) 1997 Mike White , Eric W. Engler and Russell Peters
 * Permission is granted to any individual or institution to use, copy, or
 * redistribute this software so long as all of the original files are included,
 * that it is not sold for profit, and that this copyright notice is retained.
  ** distributed under LGPL license ** see license.txt for details
*/
//#include <windows.h>
//#include "Zip.h"
//#include "Globals.h"
static const char *errs[5] = { "", "", "trace: ", "Trace: ", "Debug: " };
static void LogIt(struct Globals *pG, int err, char *msg);

int __cdecl
Inform( struct Globals *pG, int err, int type, const char *format, ... )
{
  va_list argptr;
  char    buf[513 + 15];
  char    *buffer = buf + 8;
  int     blen = 512;;
  
  if ( !pG )
    pG = ( struct Globals * )GlobalPointer; 
  if ( !pG )
    return -1;  // should not happen
  buf[0] = 0;
  if ( type != IWARNING && type <= IDEBUG )
  {
    lstrcpy( buffer, errs[type] );
    blen = lstrlen( buffer );
    buffer = buffer + blen;
    blen = 512 - blen;
  }

  va_start( argptr, format );
  vsnprintf( buffer, blen, format, argptr );
  buf[512 + 8] = 0;
  if (pG->LogName && *(pG->LogName))
    LogIt(pG, err, buf);

  // warning message, or info message only
  user_callback( 4, err, 0, buf + 8, pG );
  va_end( argptr );

  return 0;
}


void LogIt(struct Globals *pG, int err, char *msg)
{
  char erm[20];
  int i;
  DWORD br;
  HANDLE hLog = pG->hLogFile;
  if (hLog == INVALID_HANDLE_VALUE)
  {
//    log = fopen(pG->LogName, "a");
    hLog = CreateFile( pG->LogName, GENERIC_WRITE, 0, NULL, OPEN_EXISTING,
            FILE_ATTRIBUTE_NORMAL | FILE_FLAG_WRITE_THROUGH, NULL );
    if (hLog == INVALID_HANDLE_VALUE
      || SetFilePointer(hLog, 0, NULL, FILE_END) == (unsigned)-1)
//    if (!log)  // error
    {
       FREE(pG->LogName);
       pG->LogName = NULL;
       return;
    }
  }
  snprintf(erm, 18, "%6x      ", err);
  for (i = 0; i < 8; i++)
    msg[i] = erm[i];
  i = lstrlen(msg);
  lstrcat(msg, "\n");

//  fputs(msg, log);
  if (!WriteFile( hLog, msg, ++i, &br, NULL) || br != (unsigned)i) 
    {
       FREE(pG->LogName);
       pG->LogName = NULL;
    }
  msg[i] = 0;
  if (pG->hLogFile == INVALID_HANDLE_VALUE)
    CloseHandle(hLog);
//    fclose(log);
}

