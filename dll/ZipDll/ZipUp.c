/* This source has been formatted by an unregistered SourceFormatX */
/* If you want to remove this info, please register this shareware */
/* Please visit http://www.textrush.com to get more information    */

#include <windows.h>
#include "Zip.h"
#pragma hdrstop
#include "ZipErr.h"

// ZipUp.c Copyright (C) 1990-1996 Mark Adler, Richard B. Wales, Jean-loup
//   Gailly, Kai Uwe Rommel, Onno van der Linden and Igor Mandrichenko. This
//   version modified by Chris Vleghert and Eric Engler for BCB/Delphi Zip.
//   distributed under LGPL license ** see license.txt for details RP -
//   Corrected for relative paths 10 Jul 2002 1.73 12 July 2003 RP Extra Data
#include <ctype.h>

#include <share.h>

// Use the raw functions for MSDOS to save on buffer space. (This sort of
//   stuff belongs in fileio.c, but oh well.)
// include "ZipUp.h"
// Local functions
static int suffixes( char *, char * /* , struct Globals *pG */ );

// Return the percentage compression from n to m using only integer
//   operations. n :: Is the original size. m :: Is the new size.
int percent( ulg n, ulg m )
{
  if ( n > 0xFFFFFFL )
  {
    // If n >= 16M
    n += 0x80;
    n >>= 8; // then divide n and m by 256
    m += 0x80;
    m >>= 8;
  }

  return n > m ? ( int )( 1+( 200 *( n - m ) / n )) / 2: 0;
}

// Return true if a ends in any of the suffixes in the list s. a :: Name to
//   check suffix of. s :: List of suffixes separated by : or ;
static int suffixes( char *a, char *s )
{
  int m; // true if suffix matches so far
  char *p; // pointer into special
  char *q; // pointer into name a
  m = 1;
  q = a + lstrlen( a ) - 1;
  for ( p = s + lstrlen( s ) - 1; p >= s; p-- )
  {
    if ( *p == ':' ||  *p == ';' )
      if ( m )
        return 1;
      else
    {
      m = 1;
      q = a + lstrlen( a ) - 1;
    }
    else
    {
      m = m && q >= a && case_map( *p ) == case_map( *q );
      q--;
    }
  }

  return m;
}

// Note: a zip "entry" includes a local header (which includes the file
//   name), an encryption header if encrypting, the compressed data and
//   possibly an extended local header.
// Compress the file z->name into the zip entry described by *z and write it
//   to the file *y. Encrypt if requested. Return an error code in the ZEN_
//   class. Also, update tempzn by the number of bytes written. z :: Zip entry
//   to compress. y :: Output file.
int zipup( struct zlist *z, HANDLE y, struct Globals *pG )
{
  ztimbuf f_utim; // UNIX GMT timestamps, filled by
  ///* filetime()
  ulg tim; // Time returned by filetime()
  ulg a = 0L; // Attributes returned by filetime()
  char *b; // Malloc'ed file buffer
  extent k = 0; // Result of zread
  int l = 0; // True if this file is a symbolic
  ///* link
  int m; // Method for this entry
  ulg o, p; // Offsets in zip file
  //  long          fsize = -3/*L*/;            // Size returned by filetime
  int fsize =  - 3; // Size returned by filetime
  int r; // Temporary variable
  ulg s = 0L; // Size of compressed data
  int isdir; // Set for a directory name
  int set_type = 0; // Set if file type (ascii/binary)
  ///* unknown
  unsigned char *tempextra; // to hold pointer returned by user
  long hi;

  z->nam = lstrlen( z->zname );
  isdir = z->zname[z->nam - 1] == '\\'; // SLASH
#ifdef USE_STRM_INPUT
  if ( pG->UseInStream )
  {
    // This replaces the filetime function
    a = (( ulg )( S_IFREG | S_IREAD ) << 16 ) | ( ulg )pG->StrFileAttr;
    fsize = pG->InStreamSize;
    tim = f_utim.actime = f_utim.modtime = pG->StrFileDate;
  }
  else
#endif
  if (( tim = filetime( z->name, &a, &fsize, &f_utim, pG )) == 0 || (( int )
      fsize <  - 2L ))
  {
    if (( int )fsize ==  - 3L )
      Inform( pG, ZEN_SIZE03, IWARNING, "%s is too big ", GetFullPath( pG, z
             ->name ));
    return ZEN_OPEN02;
  }

  // fsize is set to -1 if the input file is a device, -2 for a volume label
  if ( fsize ==  - 2L )
  {
    isdir = 1;
    fsize = 0;
  }
  else if ( isdir != (( a &MSDOS_DIR_ATTR ) != 0 ))
  {
    // don't overwrite a directory with a file and vice-versa
    return ZEN_MISS01;
  }

  z->att = ( ush )UNKNOWN; // will be changed later
  z->atx = 0; // may be changed by set_extra_field()

  // Free the old extra fields which are probably obsolete
  pG->key = z->passw; // 1.73 restore global password
  pG->window_size = 0L;

  // Select method based on the suffix and the global method
  m = pG->special != NULL && suffixes( z->name, pG->special /* , pG */ ) ?
                                      STORE : pG->method;

  // CHANGE 1.73 RAEL changed RPETERS Code added to generate and handle
  //   action code 14 file extra data Extra data needs to be delivered
  //   formatted according to PKZIP appnote.txt
  user_callback( zacData, ( long )z->extra, z->ext, GetFullPath( pG, z->name ),
                pG );

  if ( pG->global_abort_sw )
    return ZEN_ABORT04;
  if ( z->ext )
  // free any old data - probably
  ///obsolete
    FREE( z->extra );
  if ( z->cext && z->extra != z->cextra )
    FREE( z->cextra );
  z->ext = z->cext = 0;
  if ( pG->callbackdata.error_code )
  {
    // user changed extrafield data
    if ( pG->callbackdata.fsize > 512 )
      tempextra = ( unsigned char* )pG->callbackdata.Data;
    // pointer to data
    else
      tempextra = ( unsigned char* )pG->callbackdata.filenameormsg;
    if ( !tempextra )
      pG->callbackdata.fsize = 0;
    z->ext = pG->callbackdata.fsize;
    if ( z->ext )
    {
      if (( z->extra = ( char* )MALLOC( z->ext )) == NULL )
      // extra field in
      ///local header
      {
        Close_Handle( &pG->hInfile );
        return ZEN_MEM41;
      }

      memcpy( z->extra, tempextra, z->ext ); // copy data
      z->cext = z->ext;
      z->cextra = z->extra;
    }
  }

  if ( isdir )
  {
    // directory
    pG->hInfile = INVALID_HANDLE_VALUE;
    m = STORE;
    fsize = 0;
  }
  else
  {
    // Callback: action, error code, filesize, filename
    user_callback( zacItem, 0, z->len /* fsize */, z->name, pG );

    if ( pG->global_abort_sw )
      return ZEN_ABORT05;
    // Here's the open of the input file if applicable
    // This time it will stay open for a little while.
    if (
#ifdef USE_STRM_INPUT
    !pG->UseInStream &&
#endif
    ( pG->hInfile = CreateFile( GetFullPath( pG, z->name ), GENERIC_READ,
     FILE_SHARE_READ, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_ARCHIVE |
     FILE_ATTRIBUTE_HIDDEN | FILE_ATTRIBUTE_READONLY | FILE_ATTRIBUTE_SYSTEM |
     FILE_FLAG_SEQUENTIAL_SCAN, NULL )) == INVALID_HANDLE_VALUE )
    {
      int le = GetLastError();
      if ( le == ERROR_SHARING_VIOLATION )
        return ZEN_OPEN04;
      if ( le == ERROR_ACCESS_DENIED )
        return ZEN_OPEN05;
      return ZEN_OPEN03;
    }
  }
  z->tim = tim;

  if ( l || fsize == 0 )
    m = STORE;
  if ( m == BEST )
    m = DEFLATE;

  // Do not create STORED files with extended local headers if the input
  //   size is not known, because such files could not be extracted. So if the
  //   zip file is not seekable and the input file is not on disk, obey the -0
  //   option by forcing deflation with stored block. Note however that using
  //   "zip -0" as filter is not very useful... ??? to be done.
  // Fill in header information and write local header to zip file. This
  //   header will later be re-written since compressed length and crc are not
  //   yet known.
  // (Assume ext, cext, com, and zname already filled in.)
  // (RCV Added (ush)( ... )
  if ( !z->dosflag && !Extended( z->zname ))
  // mimic WinZip
    z->dosflag = 2;
  // if has no extended
  ///chars use MSDOS

  // Made under MSDOS by PKZIP 2.0, NTFS by PKZIP 2.2
  z->vem = ( ush )( z->dosflag ? 20 : OS_CODE + 22 );

  // For a FAT file system, we cheat and pretend that the file was not made
  //   on OS2, but under DOS. unzip is confused otherwise.
  // (RCV Added (ush)( ... )
  z->ver = ( ush )(( m == STORE ) ? 10 : 20 ); // Need PKUNZIP 2.0 to
  ///* extract, unless it is
  ///* stored
  z->crc = 0; // to be updated later

  // Assume first that we will need an extended local header:
  z->flg = 8; // to be updated later
#ifdef CRYPT
  if ( pG->key )
  {
    z->flg |= 1;

    // Since we do not yet know the crc here, we pretend that the crc is the
    //   modification time:
    z->crc = z->tim << 16;
  }

#endif // CRYPT
  z->lflg = z->flg;

  // (RCV Added below (ush)
  z->how = ( ush )m; // may be changed later
  z->siz = ( ulg )( m == STORE && fsize >= 0 ? fsize : 0 );
            // will be changed later
  z->len = ( ulg )( fsize >= 0 ? fsize : 0 ); // may be changed later
  z->dsk = 0;
  if ( z->att == ( ush )UNKNOWN )
  {
    z->att = BINARY; // set sensible value in
    ///* header
    set_type = 1;
  }

  // Attributes from filetime(), flag bits from set_extra_field():
  z->atx = z->dosflag ? a &0xFF: a | ( z->atx &0x0000FF00 );
  z->off = pG->tempzn;


  // now put it in the file
  if (( r = putlocal( z, y, pG )) != ZEN_OK )
  {
    Close_Handle( &pG->hInfile );
    //    if ( pG->ifile > 0 )
    //      close( pG->ifile );
    return r;
  }

  pG->tempzn += 4+LOCHEAD + z->nam + z->ext;

#ifdef CRYPT
  if ( pG->key )
  {
    crypthead( pG->key, z->crc, y, pG );
    z->siz += RAND_HEAD_LEN; // to be updated later
    pG->tempzn += RAND_HEAD_LEN;
  }

#endif // CRYPT

  //	if ( GetLastError() )               // should not get here if error
  //	{
  //		if ( pG->ifile > 0 )
  //			close( pG->ifile );
  //		ziperr( ZEN_WRITE05, pG );
  //	}
  // for error checking, ftell can fail on pipes
  hi = 0;
  o = SetFilePointer( y, 0, &hi /*NULL*/, FILE_CURRENT );
  if ( hi || ( o == INVALID_SET_FILE_POINTER && GetLastError()))
  {
    Close_Handle( &pG->hInfile );
    //    if ( pG->ifile > 0 )
    //      close( pG->ifile );
    ziperr( ZEN_WRITE05, pG );
  }

  /*  if ( pG->verbose )
  {
  Inform( pG, 0, IDIAG,  "at position %X", o);
  }*/
  // Write stored or deflated file to zip file
  pG->isize = 0L;
  pG->crc = crc32( 0L, ( uch* )NULL, 0 );

  if ( m == DEFLATE )
  {
    bi_init( y, pG );
    if ( set_type )
      z->att = ( ush )UNKNOWN;
    // will be changed in deflate()
    ct_init( &z->att, &m, pG );
    lm_init( pG->level, &z->flg, pG );

    // PERFORM THE DEFLATE
    s = deflate( pG );
    if ( pG->global_abort_sw )
    {
      Close_Handle( &pG->hInfile );
      //    if ( pG->ifile > 0 )
      //      close( pG->ifile );
      return ZEN_ABORT;
    }
  }
  else if ( !isdir )
  {
    if (( b = ( char* )MALLOC( CBSZ )) == NULL )
    {
      Close_Handle( &pG->hInfile );
      //    if ( pG->ifile > 0 )
      //      close( pG->ifile );
      return ZEN_MEM18;
    }

    if ( l )
    {
      // symbolic link processing
      k = rdsymlnk( z->name, b, CBSZ );

      // compute crc first because zfwrite will alter the buffer b points to !!
      pG->crc = crc32( pG->crc, ( uch* )b, k );
      if ( !zfwrite( b,  /*1,*/k, y, pG ))
      {
        FREE( b );
        Close_Handle( pG->hInfile );
        //      if ( pG->ifile > 0 )
        //        close( pG->ifile );
        return ZEN_TEMP05;
      }

      pG->isize = k;
    }
    else
    {
      // Trace ( ( "Storing %s ", GetFullPath ( pG, z->name )) );
      if ( pG->verbose )
        Inform( pG, 0, IDIAG, "Storing %s ", GetFullPath( pG, z->name ));


      if ( pG->compressed_len > ( 0xFFFFFFF0 - ( unsigned long )fsize ))
        return ZEN_SIZE02;
      //      while ( (k = file_read( b, CBSZ, pG )) > 0 && k != (extent) EOF )
      while ( ( k = file_read( pG->window, sizeof( pG->window ), pG )) > 0 && k
             != ( extent )EOF )
      {
        if ( pG->global_abort_sw )
        {
          FREE( b );
          Close_Handle( &pG->hInfile );
          //        if ( pG->ifile > 0 )
          //          close( pG->ifile );
          return ZEN_ABORT;
        }

        //        if ( !zfwrite( b, 1, k, y, pG ) )
        if ( !zfwrite( pG->window,  /*1,*/k, y, pG ))
        {
          FREE( b );
          Close_Handle( &pG->hInfile );
          //        if ( pG->ifile > 0 )
          //          close( pG->ifile );
          return ZEN_TEMP06;
        }
      }
    }

    FREE( b );
    s = pG->isize;
  }

  //  if ( pG->ifile > 0 && k == (extent) (-1) )

  if ( pG->hInfile == INVALID_HANDLE_VALUE && k == ( extent )(  - 1 ))
  {
    Inform( pG, 0, IWARNING, "could not read input file: %s", z->zname );
  }

  Close_Handle( &pG->hInfile );
  //  if ( pG->ifile > 0 )
  //    close( pG->ifile );                        // Close the input file
  pG->tempzn += s;
  p = pG->tempzn; // save for future fseek()

  // Check input size
  if ( fsize >= 0 && pG->isize != ( ulg )fsize && !pG->translate_eol )
  {
    Inform( pG, 0, IWARNING, " file size changed while zipping: %s", z->name );
    if ( pG->verbose < 0 )
      Inform( pG, 0, IDIAG, " i=%ld, fsize=%ld ", pG->isize, fsize );
  }

  // Try to rewrite the local header with correct information
  z->crc = pG->crc;
  z->siz = s;

#ifdef CRYPT
  if ( pG->key )
    z->siz += RAND_HEAD_LEN;
#endif
  z->len = pG->isize;

  hi = 0;
  if ( SetFilePointer( y, z->off, &hi, FILE_BEGIN ) == INVALID_SET_FILE_POINTER
      && GetLastError())
  {
    pG->CanSeek = 0; // 1.75 cannot seek
    if ( z->how != ( ush )m )
      ziperr( ZEN_WRITE06, pG );
    if ( m == STORE && fsize < 0 )
      ziperr( ZEN_PARMS14, pG );
    if (( r = putextended( z, y, pG )) != ZEN_OK )
      pG->tempzn += 16L;
    z->flg = z->lflg; // if flg modified by inflate
  }
  else
  {
    unsigned bw;
    // seek ok, ftell() should work, check compressed size
    if ( p - o != s )
    {
      Inform( pG, 0, IWARNING, " s=%ld, actual=%ld ", s, p - o );
      ziperr( ZEN_LOGIC06, pG );
    }

    pG->CanSeek = 1; // 1.75 can seek

    // (RCV Added in two lines below (ush)( ... )
    z->how = ( ush )m;
    z->ver = ( ush )(( m == STORE ) ? 10 : 20 ); // Need PKUNZIP 2.0 to
    ///* extract, unless it is
    ///* stored
    if (( z->flg &1 ) == 0 )
      z->flg &= ~8;
    // clear the extended local header flag
    z->lflg = z->flg;
    bw = pG->BytesWritten;
    // rewrite the local header:
    if (( r = putlocal( z, y, pG )) != ZEN_OK )
      return r;
    pG->BytesWritten = bw;
    /*long*/
    hi = 0;
    if ( SetFilePointer( y, p, &hi, FILE_BEGIN ) == INVALID_SET_FILE_POINTER &&
        GetLastError())
      return ZEN_READ03;
    if (( z->flg &1 ) != 0 )
    {
      // encrypted file, extended header still required
      if (( r = putextended( z, y, pG )) != ZEN_OK )
        return r;
      pG->tempzn += 16L;
    }
  }

  // Free the local extra field which is no longer needed
  if ( z->ext )
  {
    if ( z->extra != z->cextra )
      FREE( z->extra );
    z->ext = 0;
  }

  // Display statistics
  if ( pG->verbose )
  {
    // char tmpbuf[ 10 ];
    Inform( pG, 0, 0, "%s  in=%lu,  out=%lu,  %d%%", ( m == DEFLATE ) ?
           "deflated" : "stored", pG->isize, s, percent( pG->isize, s ));
  }

  return ZEN_OK;
}

// Read a new buffer from the current input file, perform end-of-line
//   translation, and update the crc and input file size. IN assertion: size >=
//   2 (for end-of-line translation)
int file_read( char *buf, unsigned size, struct Globals *pG )
{
  //  unsigned
  DWORD len, olen;
  char *b;

  if ( pG->translate_eol == 0 )
  {
#ifdef USE_STRM_INPUT
    if ( pG->UseInStream )
    {
      olen = len = size = min( pG->InStreamSize - pG->StreamPos, size );
      memcpy( buf, ( char* )pG->InStream + pG->StreamPos, size );
      pG->StreamPos += size;
    }
    else
    //      olen = len = read( pG->ifile, buf, size );
    {
      if ( !ReadFile( pG->hInfile, buf, size, &len, NULL ))
        return EOF;
      olen = len;
    }
#else
    //    olen = len = read( pG->ifile, buf, size );
    if ( !ReadFile( pG->hInfile, buf, size, &len, NULL ))
      return EOF;
    olen = len;
#endif
    //    if ( len == ( unsigned )EOF || !len )
    //      return ( int )len;
    if ( !len )
      return 0;
  }
  else if ( pG->translate_eol == 1 )
  {
    // Transform LF to CR/LF
    size >>= 1;
    b = buf + size;
    //    olen = size = len = read( pG->ifile, b, size );
    if ( !ReadFile( pG->hInfile, b, size, &len, NULL ))
      return EOF;
    if ( !len )
      return 0;
    size = olen = len;
    //    if ( len == ( unsigned )EOF || !len )
    //      return ( int )len;
    do
    {
      if (( *buf++ =  *b++ ) == '\n' )
      // replace LF with CR/LF
        *( buf - 1 ) = '\r',  *buf++ = '\n', len++;
    }
    while ( --size != 0 );
    buf -= len;
  }
  else
  {
    // Transform CR/LF to LF and suppress final ^Z
    b = buf;
    //    olen = size = len = read( pG->ifile, buf, size - 1 );
    if ( !ReadFile( pG->hInfile, buf, size - 1, &len, NULL ))
      return EOF;
    if ( !len )
      return 0;
    size = olen = len;
    //    if ( len == ( unsigned )EOF || !len )
    //      return ( int )len;
    buf[len] = '\n'; // I should check if next
    ///* char is really a \n
    do
    {
      if (( *buf++ =  *b++ ) == '\r' &&  *b == '\n' )
        buf--, len--;
    }
    while ( --size != 0 );

    if ( !len )
    {
      //      olen = read( pG->ifile, buf, 1 );
      if ( !ReadFile( pG->hInfile, buf, 1, &olen, NULL ))
        olen = 0;
      len = 1; // keep single \r if EOF
    }
    else
    {
      buf -= len;
      if ( buf[len - 1] == CTRLZ )
        len--;
      // suppress final ^Z
    }
  }

  // Callback: actioncode 2 = increment progress bar
  user_callback( zacProgress, 0, olen, NULL, pG ); // Added for progress bar
  ///support.
  pG->crc = crc32( pG->crc, ( uch* )buf, len );
  pG->isize += ( ulg )len;
  return ( int )len;
}
