#include <windows.h>
#include "Zip.h"
#pragma hdrstop

/* Globals.c
 * Copyright (C) 1990-1996 Mark Adler, Richard B. Wales, Jean-loup Gailly,
 * Kai Uwe Rommel, Onno van der Linden and Igor Mandrichenko.
 * Permission is granted to any individual or institution to use, copy, or
 * redistribute this software so long as all of the original files are included,
 * that it is not sold for profit, and that this copyright notice is retained.
 * This version modified by Chris Vleghert for BCB/Delphi Zip.
  ** distributed under LGPL license ** see license.txt for details
*/
#define GLOBALS // Include definition of errors[] in zip.h (ZipErr.h)

//#include "Globals.h"
#include "ZipErr.h"

extern int      extra_lbits[LENGTH_CODES];  // extra bits for each length code
extern int      extra_dbits[D_CODES];       // extra bits for each distance code
extern int      extra_blbits[BL_CODES];     // extra bits for each bit length code
extern uch      bl_order[BL_CODES];

#ifdef MULTITHREAD
DWORD           TgbIndex;                   // RCV added, our only non-constant
                                        ///global.
#else
struct Globals  *pGsav;
#endif

// Get the thread global data area, if not present create one first.
#pragma argsused
struct Globals *
GetGlobalPointer( int *ErrorNo )
{
#ifdef MULTITHREAD
  struct Globals  *pG = ( struct Globals * )TlsGetValue( TgbIndex );
  if ( !pG )
  {
    if ( GetLastError() != NO_ERROR )
    {
      *ErrorNo = ZEN_ABORT01;
      return NULL;
    }

    // We did not have a data area, w'll have to create it first.
    pG = ( struct Globals * )MALLOC( sizeof(struct Globals) );
    if ( pG && !TlsSetValue( TgbIndex, pG ) )
    {
      FREE( pG );
      *ErrorNo = ZEN_ABORT02;
      return NULL;
    }
  }

  return pG;
#else
  if ( !pGsav )
    pGsav = ( struct Globals * )MALLOC( sizeof(struct Globals) );
  return pGsav;
#endif
}

// Free the thread global data.
void
ReleaseGlobalPointer( void )
{
#ifdef MULTITHREAD
  struct Globals  *pG = ( struct Globals * )TlsGetValue( TgbIndex );
  if ( pG )
  {
    // if ( pG->zipfd )
    // close ( pG->zipfd ); /* Make sure we close the input file.
    FREE( pG );                     // Free the thread global structure.
  }

  TlsSetValue( TgbIndex, NULL );    // Reset the index for this thread.
#else
  if ( pGsav )
  {
    FREE( pGsav );
    pGsav = NULL;
  }

#endif
}

// This initializes the global structure on a per thread basis. We also need
//   to call this function when we reenter from a particular thread.
void
GlobalsInit( struct Globals *pG )
{
  memset( pG, 0, sizeof(struct Globals) );

  pG->pathput = 1;
  pG->method = DEFLATE;
  pG->level = 9;
  pG->dirnames = 1;
  pG->noisy = 1;

  // linked list for new files to be added (not yet in ZIP)
  pG->fnxt = &pG->found;
  pG->adjust = 1;

  // mark file handles as invalid
  pG->zfile = INVALID_HANDLE_VALUE; 
  pG->hTempzf = INVALID_HANDLE_VALUE;
  pG->hInz = INVALID_HANDLE_VALUE;
  pG->hOutz = INVALID_HANDLE_VALUE;   
  pG->hInfile = INVALID_HANDLE_VALUE;  
  pG->hLogFile = INVALID_HANDLE_VALUE;

  // User can specify if he wants to skip compressing these types:
  // List of special suffixes
  // v1.6 removed: pG->special =
  // ".gif:.png:.Z:.zip:.zoo:.arc:.lzh:.arj:.taz:.tgz:.lha";
  pG->dll_handles_errors = 1;       // By dflt, this DLL will generate
                                            ///error msg boxes

  // init_upper ( pG ); // build case map table
  pG->read_buf = file_read;         // a function
  pG->action = ADD;                 // Must be ADD - the default action
  pG->zipstate = -1;
  pG->wild_match_all = "*.*";

  pG->l_desc.dyn_tree = pG->dyn_ltree;
  pG->l_desc.static_tree = pG->static_ltree;
  pG->l_desc.extra_bits = extra_lbits;
  pG->l_desc.extra_base = LITERALS + 1;
  pG->l_desc.elems = L_CODES;
  pG->l_desc.max_length = MAX_BITS;

  pG->d_desc.dyn_tree = pG->dyn_dtree;
  pG->d_desc.static_tree = pG->static_dtree;
  pG->d_desc.extra_bits = extra_dbits;
  pG->d_desc.elems = D_CODES;
  pG->d_desc.max_length = MAX_BITS;

  pG->bl_desc.dyn_tree = pG->bl_tree;
  pG->bl_desc.extra_bits = extra_blbits;
  pG->bl_desc.elems = BL_CODES;
  pG->bl_desc.max_length = MAX_BL_BITS;
}

const char  upper[256] = { 0 };
const char  extend[256] = { 1 };

void
Setup_upper( void )
{
  int i;
  for ( i = 0; i < 256; i++ )
    ( char )upper[i] = ( char ) ( unsigned char )i;
  CharUpperBuff( ( char * )upper + 1, 255 );
  ( char )upper[( int )'/'] = '\\'; // ignore diference
}

void
Setup_extend( void )
{
  int i;
  for ( i = 0; i < 256; i++ )
    ( char )extend[i] = ( char ) ( unsigned char )i;
  CharToOemBuff( extend + 1, ( char * )extend + 1, 255 );
  for ( i = 0; i < 256; i++ )
    ( char )extend[i] = ( char )( extend[i] != ( char ) ( unsigned char )i );
}
