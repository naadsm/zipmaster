//#include <windows.h>
#pragma inline
#pragma hdrstop
//#include <stdlib.h>
//#include <string.h>


#define Exchange( l, r ) \
     {long t = *(l); *(l) = *(r); *(r) = t;}

 
void
zqSort( void *base, unsigned nElem, int (*Fcmp) ( void *, void *, void * ), void *pG )
{
  long      *pivotP,
            *leftP,
            *rightP,
            *pivotEnd,
            *pivotTemp,
            *leftTemp;
  unsigned  lNum;
  int       retval;

  pivotP = (long*)base;
  while ( 1 )
  {
    if ( nElem <= 2 )
    {
      if ( nElem == 2 )
      {
        if ( Fcmp( pivotP, rightP = 1 + pivotP, pG ) > 0 )
          Exchange( pivotP, rightP );
      }

      return;
    }

    rightP = ( nElem - 1 ) + pivotP;
    leftP = ( nElem >> 1 ) + pivotP;

    /*  sort the pivot, left, and right elements for "median of 3" */
    if ( Fcmp( leftP, rightP, pG ) > 0 )
    {
      Exchange( leftP, rightP );
    }

    if ( Fcmp( leftP, pivotP, pG ) > 0 )
    {
      Exchange( leftP, pivotP );
    }
    else if ( Fcmp( pivotP, rightP, pG ) > 0 )
    {
      Exchange( pivotP, rightP );
    }

    if ( nElem == 3 )
    {
      Exchange( pivotP, leftP );
      return;
    }

    /*  now for the classic Hoare algorithm */
    leftP = pivotEnd = pivotP + 1;

    do
    {
      while ( (retval = Fcmp( leftP, pivotP, pG )) <= 0 )
      {
        if ( retval == 0 )
        {
          Exchange( leftP, pivotEnd );
          pivotEnd++;
        }

        if ( leftP < rightP )
          leftP++;
        else
          goto qBreak;
      }

      while ( leftP < rightP )
      {
        if ( (retval = Fcmp( pivotP, rightP, pG )) < 0 )
          rightP--;
        else
        {
          Exchange( leftP, rightP );
          if ( retval != 0 )
          {
            leftP++;
            rightP--;
          }

          break;
        }
      }
    }
    while ( leftP < rightP );

qBreak:
    if ( Fcmp( leftP, pivotP, pG ) <= 0 )
      leftP = leftP + 1;

    leftTemp = leftP - 1;

    pivotTemp = pivotP;

    while ( (pivotTemp < pivotEnd) && (leftTemp >= pivotEnd) )
    {
      Exchange( pivotTemp, leftTemp );
      pivotTemp++;
      leftTemp--;
    }

    lNum = ( leftP - pivotEnd );
    nElem = ( (nElem + pivotP) - leftP );

    /* Sort smaller partition first to reduce stack usage */
    if ( nElem < lNum )
    {
      zqSort( leftP, nElem, Fcmp, pG );
      nElem = lNum;
    }
    else
    {
      zqSort( pivotP, lNum, Fcmp, pG );
      pivotP = leftP;
    }
  }
}

