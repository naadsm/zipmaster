
/* Version.h
 * This version modified by Chris Vleghert and Eric W. Engler
 * for BCB/Delphi Zip
 */
#ifndef _VERSION_H
#define _VERSION_H

#define UNZVERS 178
//#define UNZPRIVVERS 17504

#endif /* _VERSION_H */

#ifndef __revision_h
#define __revision_h

#define REVISION         2
#define PATCHLEVEL 	 1
#define UNZPRIVVERS ((UNZVERS * 100)+(REVISION*10)+PATCHLEVEL)
//#define VERSION  "UNZDLL.DLL 1.77.0.1"
//#define REVDATE  "July 15, 2004"   
const char *mdate = __DATE__;

#define COPYRIGHT_LINES 1

#ifdef NOCPYRT
extern const char *copyright[ COPYRIGHT_LINES ];
#else /* !NOCPYRT */

const char *copyright =
    {
        "\r\nCopyright (C) 1990-2001 Mark Adler, Richard B. Wales, Jean-loup Gailly,\r\n"
        "Samuel H. Smith, Greg Roelofs, Robert A. Heath, Mike White, and Eric W. Engler\r\n\r\n"
        "Modified Win32 UNZIP DLL by Eric W. Engler and Chris Vleghert\r\n"
        "Send bug reports to englere@abraxis.com\r\n"
        "\r\n"
        "Permission is granted to any individual or institution to use, copy, or\r\n"
        "redistribute this DLL so long as it is not sold for profit. If this DLL\r\n"
        "is modified in any way, credit must be given to the original authors\r\n"
        "identified above in the copyright statement, and the new version must be\r\n"
        "given a unique name and your own e-mail address for bug reports.\r\n"
        "\r\n"
        "Large portions of this DLL are based on code from the Info-Zip project.\r\n"
        "Consult their home page for free source code of their official releases:\r\n"
        "http://www.cdrom.com/pub/infozip/\r\n"
        "\r\n"
        "LIKE ANYTHING ELSE THAT'S FREE, THIS DLL AND ANY ASSOCIATED FILES AND\r\n"
        "UTILITIES ARE PROVIDED AS-IS AND COME WITH NO WARRANTY OF ANY KIND, EITHER\r\n"
        "EXPRESSED OR IMPLIED. IN NO EVENT WILL THE COPYRIGHT HOLDERS BE LIABLE FOR\r\n"
        "ANY DAMAGES RESULTING FROM THE USE OF THIS SOFTWARE.\r\n" ""
    };
#endif /* !NOCPYRT */

#endif /* !__revision_h */
