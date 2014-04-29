#include <windows.h>
#pragma hdrstop
#include <stdlib.h>
#include <string.h>


//typedef  int (*cmp)(const void *, const void *);
/* qsort -- qsort interface implemented by faster quicksort */

#define SWAPINIT(a, es) swaptype =                            \
    (a - (char*) 0) % sizeof(long) || es % sizeof(long) ? 2 : \
    es == sizeof(long) ? 0 : 1;

#define swapcode(TYPE, parmi, parmj, n) {  \
    long i = (n) / sizeof(TYPE);           \
    register TYPE *pi = (TYPE *) (parmi);  \
    register TYPE *pj = (TYPE *) (parmj);  \
    do {                                   \
        register TYPE t = *pi;             \
        *pi++ = *pj;                       \
        *pj++ = t;                         \
    } while (--i > 0);                     \
}
   /*
void
swapfunc( char *a, char *b, int n, int swaptype )
{
  if ( swaptype <= 1 )
    swapcode ( long, a, b, n )
  else
    swapcode ( char, a, b, n )
}    */

#define swap(a, b)                         \
   {unsigned long t = *(a); *(a) = *(b); *(b) = t;}
#define nnnnnnnnnnnnnnnn \
    if (swaptype == 0) {                   \
        long t = * (long *) (a);           \
        * (long *) (a) = * (long *) (b);   \
        * (long *) (b) = t;                \
    } else                                 \
        swapfunc(a, b, es, swaptype)
#define vecswap(a, b, n) if (n > 0) swapfunc(a, b, n, swaptype)


void *
med3( void *a, void *b, void *c, int (*cmp) (void *, void *) )
{
  return ((*cmp)( a, b )) < 0 ?
    ( (*cmp)( b, c ) < 0 ? b : ((*cmp)( a, c ) < 0 ? c : a) )
    : ( (*cmp)( b, c ) > 0 ? b : ((*cmp)( a, c ) < 0 ? a : c) );
}

// base elements width = 4 bytes
void
zqsort( unsigned long *a, unsigned n, int (*cmp) (void *, void *) )
{               
//#define min(x, y) ((x)<=(y) ? (x) : (y))
  unsigned long  *pa,
        *pb,
        *pc,
        *pd,
        *pl,
        *pm,
        *pn;
  int   d,
        r,
        swaptype;

//  SWAPINIT( a, es );
  if ( n < 7 )
  {   /* Insertion sort on small arrays */
    for ( pm = a + 1; pm < a + n; pm ++ )
      for ( pl = pm; pl > a && cmp( pl - 1, pl ) > 0; pl-- )
        swap( pl, pl - 1 );
    return;
  }

  pm = a + ( n / 2 );
  if ( n > 7 )
  {
    pl = a;
    pn = a + ( n - 1 );
    if ( n > 40 )
    { /* On big arrays, pseudomedian of 9 */
      d = ( n / 8 );
      pl = med3( pl, pl + d, pl + 2 * d, cmp );
      pm = med3( pm - d, pm, pm + d, cmp );
      pn = med3( pn - 2 * d, pn - d, pn, cmp );
    }

    pm = med3( pl, pm, pn, cmp ); /* On mid arrays, med of 3 */
  }

  swap( a, pm );                  /* On tiny arrays, partition around middle */
  pa = pb = a + 1;
  pc = pd = a + ( n - 1 ) * 1;
  for ( ;; )
  {
    while ( pb <= pc && (r = cmp( pb, a )) <= 0 )
    {
      if ( r == 0 )
      {
        swap( pa, pb );
        pa += 1;
      }

      pb += 1;
    }

    while ( pb <= pc && (r = cmp( pc, a )) >= 0 )
    {
      if ( r == 0 )
      {
        swap( pc, pd );
        pd --;
      }

      pc --;
    }

    if ( pb > pc )
      break;
    swap( pb, pc );
    pb += 1;
    pc -= 1;
  }

  pn = a + n;
  r = min( pa - a, pb - pa );
  vecswap( a, pb - r, r );
  r = min( pd - pc, pn - pd - 1 );
  vecswap( pb, pn - r, r );
  if ( (r = pb - pa) > 1 )
    zqsort( a, r / 1, cmp );
  if ( (r = pd - pc) > 1 )
    zqsort( pn - r, r / 1, cmp );
}

