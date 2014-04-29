
/* This version by Chris Vleghert and Eric W. Engler
 * for BCB/Delphi Zip, Jun 18, 2000.
 */

/*---------------------------------------------------------------------------
 * globals.c
 * Routines to allocate and initialize globals, with or without threads.
 * Contents:  GetGlobalPointer()
 *            ReleaseGlobalPointer()
 *            GlobalsInit()
 *---------------------------------------------------------------------------*/

#include "unzip.h"
#include "process.h"

const fFileData inames[2] =
{
  {
    "*.*"
  },
  {
    NULL
  }
};
const fExFileData xnames[1] =
{
  {
    NULL
  }
};

#ifdef MULTITHREAD
DWORD TgbIndex; // RCV added, our only non-constant global.
#else
struct Globals * pGsav;



#endif

/* ===========================================================================
* Get the thread global data area, if not present create one first. */
struct Globals * GetGlobalPointer( void )
{
#ifdef MULTITHREAD
  struct Globals * pG = TlsGetValue( TgbIndex );
  if ( !pG )
  {
    if ( GetLastError() != NO_ERROR )
      _cexit();
    // We did not have a data area, w'll have to create it first.
    pG = ( struct Globals * ) MALLOC( sizeof( struct Globals ) );
    if ( pG && !TlsSetValue( TgbIndex, pG ) )
    {
      FREE( pG );
      _cexit();
    }
  }
  return pG;
#else

  if ( !pGsav )
    pGsav = ( struct Globals * ) MALLOC( sizeof( struct Globals ) );
  return pGsav;
#endif

}



/* ===========================================================================
* Free the thread global data and exit. */
void ReleaseGlobalPointer( void )
{
#ifdef MULTITHREAD
  struct Globals * pG;

  pG = TlsGetValue( TgbIndex );
  if ( pG )
  {
    //        if ( pG->zipfd )
    //            close ( pG->zipfd );        /* Make sure we close the input file. */
    FREE( pG );
    /* Free the thread global structure. */
  }

  TlsSetValue( TgbIndex, NULL );
  /* Reset the index for this thread. */
#else

  if ( pGsav )
  {
    FREE( pGsav );
    pGsav = NULL;
  }
#endif
}

/* ===========================================================================
* This initializes the global structure on a per thread basis.
* We also need to call this function when we reenter from a particular thread. */
void GlobalsInit( struct Globals * pG )
{
  memset( pG, 0, sizeof( struct Globals ) );

  pG->lflag = ( -1 );
  pG->wildzipfn = "";
  pG->pfnames = ( fFileData( * ) [] ) inames; //RCV was: (char **)fnames;
  pG->pxnames = ( fExFileData( * ) [] ) xnames; //RCV was: (char **)&fnames[1];
  pG->pInfo = pG->info;
  pG->sol = true;
  /* At start of line. */

#ifndef FUNZIP
  //      pG->message              = UzpMessagePrnt;
  //      pG->input                = UzpInput; // not used at the moment...
  //      pG->mpause               = NULL;     // has scrollbars:  no need
  //      pG->decr_passwd = UzpPassword;
#endif /* !FUNZIP */
}
