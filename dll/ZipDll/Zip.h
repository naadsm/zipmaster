/* Zip.h
 * Copyright (C) 1990-1996 Mark Adler, Richard B. Wales, Jean-loup Gailly,
 * Kai Uwe Rommel, Onno van der Linden and Igor Mandrichenko.
 * Permission is granted to any individual or institution to use, copy, or
 * redistribute this software so long as all of the original files are included,
 * that it is not sold for profit, and that this copyright notice is retained.
 * This version modified by Chris Vleghert and Eric Engler for BCB/Delphi Zip.
  ** distributed under LGPL license ** see license.txt for details
*/

#ifndef __Zip_h
  #define __Zip_h

  #ifndef NO_STREAM
    #ifndef USE_STRM_OUTPUT
      #define USE_STRM_OUTPUT
    #endif
    #ifndef USE_STRM_INPUT
      #define USE_STRM_INPUT
    #endif
  #endif
  #ifdef __MT__
    #define MULTITHREAD
  #else
    #undef MULTITHREAD
    #error no Multithread
  #endif

  #include "windows.h"
//#include <stdarg>

  #define ZIP /* for crypt.c:  include zip password functions, not unzip */
  #define true  TRUE
  #define false FALSE
  #define bool  BOOL

  #ifndef CRYPT
    #define CRYPT 1
  #endif
  #include <process.h>                /* For prototype of getpid()      */
  #define ZCR_SEED2 getpid()          /* RCV Added; see note in Crypt.c */

//extern DWORD TgbIndex;          // RCV added, our only non-constant global.
  #ifndef USE_MEMCHECK                // RCV: 1.603
    #define MALLOC( s )         malloc( (s) )
    #define GLOBALALLOC( f, s ) GlobalAlloc( (f), (s) )
    #define FREE( p )           free( ( void * )(p) )
    #define GLOBALFREE( p )     GlobalFree( (p) )
  #else
    #define MEMCHECKSIZE        4000  // 4000 positions to save memory pointers
    #define MALLOC( s )         ExtAlloc1( (s), __LINE__, __FILE__ )
    #define GLOBALALLOC( f, s ) ExtAlloc2( (f), (s), __LINE__, __FILE__ )
    #define FREE( p )           ExtFree1( (p), __LINE__, __FILE__ )
    #define GLOBALFREE( p )     ExtFree2( (p), __LINE__, __FILE__ )
extern void *ExtAlloc1( size_t memsize, int line, char *file );
extern HGLOBAL  ExtAlloc2( UINT f, DWORD memsize, int line, char *file );
extern void     ExtFree1( void *ptr, int line, char *file );
extern HGLOBAL  ExtFree2( HGLOBAL ptr, int line, char *file );
extern void     DispMemDiag( void );
  #endif

// new function to replace diag & DLLprintf 1.72
  #define IERROR    0
  #define IWARNING  1
  #define IDIAG     2
  #define ITRACE    3
  #define IDEBUG    4
int __cdecl  Inform( struct Globals *pG, int err, int type, const char *format, ... );
  #define diag( m, g ) \
  if ( g->verbose < 0 )    \
    Inform( g, 0, IDIAG, (m) ) 


  /* added by E. Engler; these are in dllmain.c */
  enum ActionCodes
{
  zacTick, zacItem, zacProgress, zacEndOfBatch, zacMessage, zacCount, zacSize,
  zacNewName, zacPassword, zacCRCError, zacOverwrite, zacSkipped, zacComment,
  zacStream, zacData, zacXItem, zacXProgress
};

extern void user_callback( long action, long error_code, long fsize, char *name_or_msg,
                           struct Globals *pG );
extern void msgbox( char *msg, struct Globals *pG );

//extern void diag ( char *msg, struct Globals *pG );
//extern int __cdecl DLLprintf ( const char *format, ... );
extern int key_len;                   /* Added for password length checking */

/* Set up portability
 * Anything defined in tailor.h will cause the default in this
 * header file to be ignored.
 */
  #include "Tailor.h"

  #define MIN_MATCH 3
  #define MAX_MATCH 258

/* The minimum and maximum match lengths */
  #ifndef WSIZE
    #define WSIZE ( 0x8000 )
  #endif

/* Maximum window size = 32K. If you are really short of memory, compile
 * with a smaller WSIZE but this reduces the compression ratio for files
 * of size > WSIZE. WSIZE must be a power of two in the current implementation.
 */
  #define MIN_LOOKAHEAD ( MAX_MATCH + MIN_MATCH + 1 )

/* Minimum amount of lookahead, except at the end of the input file.
 * See deflate.c for comments about the MIN_MATCH + 1.
 */
  #define MAX_DIST  ( WSIZE - MIN_LOOKAHEAD )

/* In order to simplify the code, particularly on 16 bit machines, match
 * distances are limited to MAX_DIST instead of WSIZE.
 */
/* Forget FILENAME_MAX (incorrectly = 14 on some System V) */
  #define FNMAX 256

typedef unsigned char   uch;          /* unsigned 8-bit value */
typedef unsigned short  ush;          /* unsigned 16-bit value */
typedef unsigned long   ulg;          /* unsigned 32-bit value */

/* Lengths of headers after signatures in bytes */
  #define LOCHEAD 26
  #define CENHEAD 42
  #define ENDHEAD 18

  #include "WizZip.h"
  #include "Crypt.h"
  #include "Globals.h"

/* Structures for in-memory file information */
struct zlist
{
  /* See central header in zipfile.c for what vem...off are */
  ush           vem, ver, flg, how;
  ulg           tim, crc, siz, len;
  extent        nam, ext, cext, com;  /* offset of ext must be >= LOCHEAD                 */
  ush           dsk, att, lflg;       /* offset of lflg must be >= LOCHEAD                */
  ulg           atx, off;
  char          *name;                /* File name in zip file                            */
  char          *extra;               /* Extra field (set only if ext != 0)               */
  char          *cextra;              /* Extra in central (set only if cext != 0) */
  char          *comment;             /* Comment (set only if com != 0)                   */
  char          *zname;               /* External version of internal name                */
  char          *passw;               /* Password if set on a per file base -P switch changed 1.73 */
  int           mark;                 /* Marker for files to operate on                   */
  int           trash;                /* Marker for files to delete                       */
  int           dosflag;              /* Set to force MSDOS file attributes               */

  //      int      UseRoot;           /* Add current dir in FindFist and opening input*/
  struct zlist  *nxt;                 /* Pointer to next header in list                   */
};

struct flist
{
  char          *name;                /* Pointer to zero-delimited name external  */
  char          *zname;               /* Name used for zip file headers internal  */

  char          *passw;               /* Password if set on a per file base -P switch added R.Aelbrecht */

  ulg           len;                  /* Size of the file. RCV Added              */
  int           dosflag;              /* Set to force MSDOS file attributes               */
  struct flist  **lst;                /* Pointer to link pointing here  (last)    */
  struct flist  *nxt;                 /* Link to next name                                                                */
};

struct plist
{
  char  *zname;               /* Name used for zip file headers                   */
  //      int   select; RCV: 1.605 always x now   Selection flag ('i' or 'x' )
};

/* internal file attribute */
  #define UNKNOWN   ( -1 )
  #define BINARY    0
  #define ASCII     1
  #define __EBCDIC  2

/* extra field definitions */
  #define EF_VMCMS    0x4704  /* VM/CMS Extra Field ID ("G")                                                    */
  #define EF_MVS      0x470f  /* MVS Extra Field ID ("G")                                                               */
  #define EF_IZUNIX   0x5855  /* UNIX Extra Field ID ("UX")                                                             */
  #define EF_IZUNIX2  0x7855  /* Info-ZIP's new Unix ("Ux")                                                             */
  #define EF_TIME     0x5455  /* universal timestamp ("UT")                                                             */
  #define EF_OS2EA    0x0009  /* OS/2 Extra Field ID (extended attributes)                      */
  #define EF_ACL      0x4C41  /* ACL Extra Field ID (access control list, "AL") */
  #define EF_NTSD     0x4453  /* NT Security Descriptor Extra Field ID, ("SD")  */
  #define EF_BEOS     0x6542  /* BeOS Extra Field ID ("Be")                                                             */
  #define EF_QDOS     0xfb4a  /* SMS/QDOS ("J\373")                                                                             */
  #define EF_AOSVS    0x5356  /* AOS/VS ("VS")                                                                                          */
  #define EF_SPARK    0x4341  /* David Pilling's Acorn/SparkFS "(AC)"                           */

/* Definitions for extra field handling: */
  #define EB_HEADSIZE     4   /* length of a extra field block header     */
  #define EB_ID           0   /* offset of block ID in header             */
  #define EB_LEN          2   /* offset of data length field in header    */

  #define EB_UX_MINLEN    8   /* minimal "UX" field contains atime, mtime */
  #define EB_UX_ATIME     0   /* offset of atime in "UX" extra field data */
  #define EB_UX_MTIME     4   /* offset of mtime in "UX" extra field data */

  #define EB_UX_FULLSIZE  12  /* full "UX" field (atime, mtime, uid, gid) */
  #define EB_UX_UID       8   /* byte offset of UID in "UX" field data    */
  #define EB_UX_GID       10  /* byte offset of GID in "UX" field data    */

/* ASCII definitions for line terminators in text files: */
  #define LF    10            /* '\n' on ASCII machines; must be 10 due to EBCDIC */
  #define CR    13            /* '\r' on ASCII machines; must be 13 due to EBCDIC */
  #define CTRLZ 26            /* DOS & OS/2 EOF marker (used in fileio.c)         */

/* Error return codes and PERR macro */
//#include "ZipErr.h"
/* Public globals */
//extern uch   upper[256];        /* Country dependent case map table               */
  #define BEST    - 1         /* Use best method (deflation or store)             */
  #define STORE   0           /* Store method                                     */
  #define DEFLATE 8           /* Deflation method                                 */

/* Diagnostic functions */
  #ifdef DEBUG
    #ifdef MSDOS
      #undef stderr
      #define stderr  stdout
    #endif
    #define Assert( cond, msg ) \
  {                             \
    if ( !(cond) )              \
      error( msg, pG );         \
  }

    #define Trace( x )      \
      Inform( pG, -1, IDEBUG, (x) );

    #define Tracev( x, y ) \
  {                     \
    if ( pG->verbose )  Inform( pG, -1, IDIAG, (x), (y) ); \
  }

    #define Tracevv( x, y )    \
  {                                         \
    if ( pG->verbose > 1 ) Inform( pG, -1, IDIAG, (x), (y) ); \
  }

    #define Tracec( c, x, y )    \
  {                           \
    if ( pG->verbose && (c) )   Inform( pG, -1, IDIAG, (x), (y) ); \
  }

    #define Tracecv( c, x, y )       \
  {                               \
    if ( pG->verbose > 1 && (c) ) Inform( pG, -1, IDIAG, (x), (y) ); \
  }

  #else
    #define Assert( cond, msg )
    #define Trace( x )
    #define Tracev( x, y )
    #define Tracevv( x, y )
    #define Tracec( c, x, y )
    #define Tracecv( c, x, y )
  #endif
  #define A_RONLY   0x01
  #define A_HIDDEN  0x02
  #define A_SYSTEM  0x04
  #define A_LABEL   0x08
  #define A_DIR     0x10
  #define A_ARCHIVE 0x20
                          
// Local option flags
#define PURGE   0 // RCV Changed: was DELETE. (delete is also a function)
#define ADD     1
#define UPDATE  2
#define FRESHEN 3

/* Public function prototypes */        
/* in DllMain.c */
int             ziperror( int c, struct Globals *pG );

/* in DllZip.c */
//void zipwarn ( char *, char * );
int             ziperr( int c, struct Globals *pG );
void            error( char *h, struct Globals *pG );

/* in ZipUp.c */
int             percent( ulg, ulg );
int             zipup( struct zlist *, HANDLE, struct Globals *pG );

//int zipup ( struct zlist *, FILE *, struct Globals *pG );
int             file_read( char *buf, unsigned size, struct Globals *pG );

/* in ZipFile.c */
struct zlist    *zsearch( char *, struct Globals *pG );
  #ifdef USE_EF_UX_TIME
int             get_ef_ux_ztime( struct zlist *, ztimbuf * );
  #endif /* USE_EF_UX_TIME */

int             trash( struct Globals *pG );
char            *ziptyp( char *, struct Globals *pG );
int             readzipfile( struct Globals *pG );

//int putlocal ( struct zlist *, FILE *, struct Globals *pG );
//int putextended ( struct zlist *, FILE * );
//int putcentral ( struct zlist *, FILE *, struct Globals *pG );
//int putend ( int, ulg, ulg, extent, char *, FILE * );
//int zipcopy ( struct zlist *, FILE *, FILE *, struct Globals *pG );
int             putlocal( struct zlist *, HANDLE, struct Globals *pG );
int             putextended( struct zlist *, HANDLE, struct Globals *pG );
int             putcentral( struct zlist *, HANDLE, struct Globals *pG );
//int             putend( int, ulg, ulg, extent, char *, HANDLE );
int             putend( int, ulg, ulg, HANDLE, struct Globals *pG );
int             zipcopy( struct zlist *, HANDLE, HANDLE, struct Globals *pG );

/* in FileIO.c */
struct flist    *fexpel( struct flist *, struct Globals *pG );

//char    *getnam( char * );
char            *last( char *, int );
char            *DOSName( char *, struct Globals *pG );
int             check_dup( struct Globals *pG );
bool __fastcall filter( char *Name, struct Globals *pG );
int             newname( char *n, long nSize, struct Globals *pG );
time_t          dos2unixtime( ulg dostime );
ulg             dostime( int, int, int, int, int, int );
ulg             unix2dostime( time_t * );
int             issymlnk( ulg a );
  #ifdef S_IFLNK
    #define rdsymlnk( p, b, n ) readlink( p, b, n )

/* extern int readlink (char *, char *, int); */
  #else /* !S_IFLNK */
    #define rdsymlnk( p, b, n ) ( 0 )
  #endif /* !S_IFLNK */

int   destroy( const char *, struct Globals *pG );
int   replace( const char *, const char *, struct Globals *pG );

//int           getfileattr( char * );
int   setfileattr( char *, int );
char  *tempname( struct Globals *pG );

//int fcopy ( FILE *, FILE *, ulg );
int   fcopy( HANDLE, HANDLE, ulg, struct Globals *pG );

/* in system dependent FileIO code */
int   Wild( char *, struct Globals *pG );
char  *in2ex( char * );
char  *ex2in( char *, int *, struct Globals *pG );
int   procname( char *, bool, struct Globals *pG );
void  stamp( char *, ulg );
char *__fastcall GetFullPath ( struct Globals *pG, char *Filename );
int __fastcall Close_Handle(HANDLE *h);

/* in Win32Zip.c */
ulg   filetime( char *, ulg *, /*unsigned long*/int *, ztimbuf *, struct Globals *pG );

//int           set_extra_field( struct zlist *z, ztimbuf *z_utim );
/* in Util.c */
const char *__fastcall IsShExp ( const char * );

//int shmatch ( char *, char *, struct Globals *pG );
int __fastcall      dosmatch( const char *, const char * );               //, struct Globals *pG );

//void init_upper ( struct Globals *pG );
int _fastcall       Extended( const char *str );
int _fastcall       namecmp( const char *string1, const char *string2 );
void              **search( void *, void **, extent, int (*) ( const void *, const void * ) );
void              envargs( int *Pargc, char ***Pargv, char *envstr, char *envstr2 );
void              expand_args( int *argcp, char ***argvp );
int __fastcall      SameNameExt( const char *fname, const char *oname );  //, struct Globals *pG );

/* in CRC32.c */
//ulg crc32 ( ulg, const uch *, extent );
ulg __fastcall      crc32( ulg, const uch *, extent );

/* in CRCTab.c */
//ulg *get_crc_table ( void );
/* in Deflate.c */
void              lm_init( int pack_level, ush *flags, struct Globals *pG );
  #ifdef DYN_ALLOC
void              lm_free( struct Globals *pG );
  #endif
ulg               deflate( struct Globals *pG );

/* in Trees.c */
void              ct_init( ush *attr, int *method, struct Globals *pG );
int __fastcall      ct_tally( int dist, int lc, struct Globals *pG );
ulg               flush_block( char *buf, ulg stored_len, int eof, struct Globals *pG );

/* in Bits.c */
//void bi_init ( FILE * zipfile, struct Globals *pG );
void              bi_init( HANDLE zipfile, struct Globals *pG );
void __fastcall     send_bits( int value, int length, struct Globals *pG );
unsigned __fastcall bi_reverse( unsigned value, int length );
void __fastcall     bi_windup( struct Globals *pG );
void __fastcall     copy_block( char *block, unsigned len, int header, struct Globals *pG );
int seekable( struct Globals *pG );
extern int ( *read_buf ) ( char *buf, unsigned size, struct Globals *pG );
ulg memcompress( char *tgt, ulg tgtsize, char *src, ulg srcsize, struct Globals *pG );

  #ifdef __cplusplus
    #define min( a, b ) ( (a) < (b) ? (a) : (b) )
  #endif
  #define LOCSIG    0x04034b50L
  #define CENSIG    0x02014b50L
  #define ENDSIG    0x06054b50L
  #define EXTLOCSIG 0x08074b50L

  #pragma pack( push, 1 )

/*  The zipfile format is defined as below:
 *
 *   [Extra Extended Signature]
 *   NumberOfFiles *{ local header + Filename + [extra data] + [file data] + [data_descriptor] }
 *   NumberOfFiles *{ central directory + Filename + [extra data] + [filecomment] }
 *   End Of Central directory + [ZipFile comment]
 */
struct ZipLocalHeader
{
  unsigned long   HeaderSig;        // Should be 0x04034B50
  unsigned short  VersionNeed;
  unsigned short  Flag;
  unsigned short  ComprMethod;
  union
  {
    struct
    {
      unsigned short  ModifTime;
      unsigned short  ModifDate;
    };
    unsigned long ModifStamp;
  };
  unsigned long   CRC32;
  unsigned long   ComprSize;
  unsigned long   UnComprSize;
  unsigned short  FileNameLen;
  unsigned short  ExtraLen;

  //	... and the filename itself,
  // ... and the extra data.
};

struct ZipDataDescriptor
{
  unsigned long DataDescSig;        // Should be 0x08074B50
  unsigned long CRC32;
  unsigned long ComprSize;
  unsigned long UnComprSize;
};

struct ZipCentralHeader
{
  unsigned long HeaderSig;          // Should be 0x02014B50
  union
  {
    struct
    {
      unsigned char MadeByVersion;  // Made by version number
      unsigned char MadeByHost;     // Made by host number
    };
    unsigned short  MadeBy;
  };
  unsigned short  VersionNeed;
  unsigned short  Flag;
  unsigned short  ComprMethod;
  union
  {
    struct
    {
      unsigned short  ModifTime;
      unsigned short  ModifDate;
    };
    unsigned long ModifStamp;
  };
  unsigned long   CRC32;
  unsigned long   ComprSize;
  unsigned long   UnComprSize;
  unsigned short  FileNameLen;
  unsigned short  ExtraLen;
  unsigned short  FileComLen;
  unsigned short  DiskStart;        // The number of the disk on which this file begins.
  unsigned short  IntFileAtt;
  unsigned long   ExtFileAtt;
  unsigned long   RelOffLocal;      // This is the offset from the start of the first disk on

  // which this file appears, to where the local header
  // should be found.
  //	... and the filename itself,
  // ... and the extra data,
  // ... and the file comment.
};

struct ZipEndOfCentral
{
  unsigned long   HeaderSig;        // Should be 0x06054B50
  unsigned short  ThisDiskNo;
  unsigned short  CentralDiskNo;
  unsigned short  CentralEntries;   // Total number of entries in the central dir on this disk.
  unsigned short  TotalEntries;     // Total number of entries in the central dir.
  unsigned long   CentralSize;
  unsigned long   CentralOffset;    // Offset of start of central directory with respect to the starting disk number.
  unsigned short  ZipCommentLen;

  // And the comment itself.
};
  #pragma pack( pop )
#endif /* !__Zip_h */
