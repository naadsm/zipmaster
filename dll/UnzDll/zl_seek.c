// substitute ZLSEEK macro

#include "unzip.h"
//#include "unzpriv.h"
/*                           // RCV Changed 29-1-99 USE_STRM_INPUT static void
_ZLS_RELOAD( struct Globals *pG, unsigned abs_offset ) { MTrace( (pG, "ZLSEEK: %cbs_offset = %ld, pG->extra_bytes = %ld\n", 'a',
(abs_offset), pG->extra_bytes) ); pG->cur_zipfile_bufstart = vclSeek( pG, ( long )bufstart, SEEK_SET );
MTrace( (pG, "       request = %ld, (abs+extra) = %ld, inbuf_offset = %ld\n", request,
((abs_offset) + pG->extra_bytes), inbuf_offset) ); MTrace( (pG, "       bufstart = %ld, cur_zipfile_bufstart = %ld\n",
bufstart, pG-> cur_zipfile_bufstart) ); if ( (pG->incnt = vclRead( pG, ( char * )pG->inbuf, INBUFSIZ )) <= 0 )
return ( PK_EOF ); pG->inptr = pG->inbuf + ( int )inbuf_offset; pG->incnt -= ( int )inbuf_offset; }      */

int zlseek( struct Globals * pG, long abs_offset )
{
  unsigned long request = ( abs_offset ) + pG->extra_bytes;
  unsigned long inbuf_offset = request % INBUFSIZ;
  unsigned long bufstart = request - inbuf_offset;

  //  if ( request < 0 )
  if ( request < ( unsigned )abs_offset && pG->extra_bytes > 0 )
  {
    return ( PK_BADERR );
  }
  else if ( bufstart != pG->cur_zipfile_bufstart )
  //		_ZLS_RELOAD( abs_offset );
  {
    MTrace( ( pG, "ZLSEEK: %cbs_offset = %ld, pG->extra_bytes = %ld\n", 'a', ( abs_offset ), pG->extra_bytes ) );
    pG->cur_zipfile_bufstart = vclSeek( pG, ( long )bufstart, SEEK_SET );
    MTrace( ( pG, "       request = %ld, (abs+extra) = %ld, inbuf_offset = %ld\n", request, ( ( abs_offset ) + pG->extra_bytes ), inbuf_offset ) );
    MTrace( ( pG, "       bufstart = %ld, cur_zipfile_bufstart = %ld\n", bufstart, pG->cur_zipfile_bufstart ) );
    if ( ( pG->incnt = vclRead( pG, ( char * ) pG->inbuf, INBUFSIZ ) ) <= 0 )
      return ( PK_EOF );
    pG->inptr = pG->inbuf + ( int )inbuf_offset;
    pG->incnt -= ( int )inbuf_offset;
  }
  else
  {
    pG->incnt += ( pG->inptr - pG->inbuf ) - ( int )inbuf_offset;
    pG->inptr = pG->inbuf + ( int )inbuf_offset;
  }

  return 0;
}





