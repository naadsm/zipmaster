HelpScribble project file.
13
_hffryy ]rgref-15SP73
112
1
ZipMaster Component Help


Copyright © 1998-2004 TZipMaster by Russell Peters  v1.78  Sep, 30, 2004
TRUE
0x0C09   Australian
e:\DelphiZip\ZipMstr1780\HelpSrc
9
BrowseButtons()
CB(`About_Btn',`&About',`JI(`',`TZipMaster_Contact')')
SetHelpOnFile("ZipMstr.HLP")
AI(`mnu_options',`1000',`List PMEs &Alphabetically',`UI(`1002'):UI(`1003'):CI(`1000'):CI(`1001'):SaveMark("ListAlphabetically")')
AI(`mnu_floating',`1001',`List PMEs &Alphabetically',`UI(`1002'):UI(`1003'):CI(`1000'):CI(`1001'):SaveMark("ListAlphabetically")')
AI(`mnu_options',`1002',`List PMEs &By Object',`UI(`1000'):UI(`1001'):CI(`1002'):CI(`1003'):IF(IsMark("ListAlphabetically"),`DeleteMark("ListAlphabetically")')')
AI(`mnu_floating',`1003',`List PMEs &By Object',`UI(`1000'):UI(`1001'):CI(`1002'):CI(`1003'):IF(IsMark("ListAlphabetically"),`DeleteMark("ListAlphabetically")')')
CI(`1002')
CI(`1003')
0
FALSE
e:\DelphiZip\ZipMstr1780\Help\D7\
FALSE
TRUE
16777215
0
16711680
8388736
255
FALSE
FALSE
FALSE
2
TRUE
FALSE
Contents
%s Contents
Index
%s Index
Previous
Next
FALSE
E:\DelphiZip\ZipMstr1780\Help\Temp\zm1780.htm
199
10
Scribble10
ZipMaster component
ZipMaster;


:000010
Imported


TZipMaster;TZipMaster_Object
FALSE
21
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fswiss\fcharset0 Arial;}{\f2\froman\fcharset0 Times New Roman;}{\f3\fnil Arial;}{\f4\fnil\fcharset0 Arial;}}
{\colortbl ;\red255\green0\blue255;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\f0\fs20\{bmc ZipMaster.bmp\} \cf2\b\fs28 TZipMaster - Version 1.\f1 78\cf0\f0\{keepn\} 
\par \pard\tx355\cf3\ul\b0\fs20 Hierarchy\ulnone\{linkID=120\}\cf2\fs16\tab\cf3\tab\strike\fs20 Properties\strike0\{linkID=150>pme\}\tab\strike Methods\strike0\{linkID=230>pme\}\tab\strike Events\strike0\{linkID=270>pme\}\strike 
\par \pard\sa195\tx355\cf0\strike0 TZipMaster is a control designed to simplify the handling of Zip compressed files.
\par 
\par \b\fs24 Description:
\par \pard\tx355\b0\fs20 TZipMaster is a non-visual VCL wrapper for the freeware Zip and Unzip DLL\f2 '\f0 s.  At run time, the DLL's: ZIPDLL.dll and UNZDLL.dll must be present on the hard disk - in C:\\WINDOWS\\SYSTEM or else in your application directory, or a directory in the PATH.
\par 
\par These DLL\f2 '\f0 s are based on the \cf3\ul InfoZip\ulnone\{linkID=20\}\cf0  Official Freeware Zip/Unzip source code, but they are NOT equivalent to InfoZip\f2 '\f0 s DLL\f2 '\f0 s. I have modified the InfoZip source code to enhance their ease-of-use, power, and flexibility for use with Delphi and C++ Builder.  Please do NOT contact InfoZip for issues regarding this port.
\par 
\par TZipMaster is a component that uses the \cf3\strike Add\strike0\{linkID=1090\}\cf0 , and \cf3\strike Extract\strike0\{linkID=1250\}\cf0  methods to create or add files to, and extract files from Zip archives. The component can create self-extracting archives with the \cf3\strike ConvertSFX\strike0\{linkID=1150\}\cf0  method.
\par 
\par TZipMaster can encrypt and decrypt files through the \cf3\strike Password\strike0\{linkID=650\}\cf0  property.
\par 
\par The \cf3\strike OnMessage\strike0\{linkID=1610\}\cf0  event fires when the Zip or Unzip DLL\f2 '\f0 s report status. The \cf3\strike Trace\strike0\{linkID=810\}\cf0  and \cf3\strike Verbose\strike0\{linkID=890\}\cf0  properties control the amount of information written to the \cf3\strike Message\strike0\{linkID=600\}\cf0  property.
\par \pard\cf4\f3 
\par \f4  Now Distributed under the \cf3\b\strike\f3 GNU LESSER GENERAL PUBLIC LICENSE\cf5\strike0\{linkID=70\}\cf4\b0 
\par \pard\tx355\cf0\f0 
\par 
\par }
20
Scribble20
InfoZip information
InFoZip;



Done


InfoZip
FALSE
4
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss\fprq2\fcharset0 Arial;}{\f1\fswiss Arial;}}
{\colortbl ;\red0\green0\blue255;}
\viewkind4\uc1\pard\lang3081\f0\fs20 To obtain the official\{bmc infozip.WMF\}source code consult their Website: \cf1\uldb http://freesoftware.com/pub/infozip/Info-ZIP.html\ulnone\v %!EF("http://freesoftware.com/pub/infozip/Info-ZIP.html",`',1)\cf0\v0\f1\fs24 
\par }
30
Scribble30
Bug reports
About;Author;Bugs;


BROWSE0001:000020
Imported



FALSE
102
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\froman\fcharset0 Times New Roman;}{\f2\fswiss\fcharset0 Arial;}{\f3\fnil Courier New;}{\f4\fnil\fcharset0 Courier New;}{\f5\froman Times New Roman;}}
{\colortbl ;\red255\green0\blue255;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;\red255\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\f0\fs24\{bml ZipMaster.bmp\}\cf2\b\fs28 Bug Reports\cf0\{keepn\} 
\par \cf3\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf0 
\par 
\par \b Bug reports for TZipMaster, TZipBuilder, Dll\f1 '\f0 s and the Self Extracting Code:\b0 
\par \pard\fi-845\li845\sb235\sa235\tx845\tx3685\tab\cf2\f2 DelphiZip mailing list:\tab\strike\f3 delphizip@freelists.org\cf4\strike0\{link=*! ExecFile("\f4 m\f3 ail\f4 t\f3 o:delphizip@freelists.org")\}\cf0\f0 
\par \pard\sb115\sa595\tx845\tx3685\cf5\b When reporting bugs please mention: your Delphi or C++Builder version, Your ZipMaster or ZipBuilder version and the operating system you are using.
\par \pard\tx845\tx3685\cf0 For errors in the translation of ZipMaster and ZipBuilder resource files:
\par \b0 
\par \pard\fi-845\li845\tx845\tab Brazilian (Portuguese) translation found in ZipMsgBR.rc and ZipMsgBR.res\b 
\par \pard\fi-1125\li1125\tx1125\tx3685\b0\tab Walter Campelo:\cf2\fs16\tab\strike\fs20 walter@weasistemas.com.br\strike0\{link=%!EF("\f2 m\f0 ail\f2 t\f0 o:walter@weasistemas.com.br",`',1)\}\cf0 
\par \pard\tx1125\tx3685 
\par \pard\fi-845\li845\tx845\tab Chinese (\fs18 People Republic of China)\fs20  translation found in ZipMsgCN.rc and ZipMsgCN.res\b 
\par \b0\tab [ GB(K) - commonly used in China and Singapore for simplified Chinese writing.]\b 
\par \pard\fi-1125\li1125\tx1125\tx3685\b0\tab wxf.amm:\tab\cf2\strike wxf.amm@usa.net\strike0\{link=%!EF("\f2 m\f0 ail\f2 t\f0 o:wxf.amm@usa.net",`',1)\}\cf0 
\par \pard\tx1125\tx3685 
\par \pard\fi-845\li845\tx845\tab Catalan translation found in ZipMsgCT.rc and ZipMsgCT.res\b 
\par \pard\fi-1125\li1125\tx1125\tx3685\b0\tab\f2 Jordi March i Nogu\'e9:\f0\tab\cf2\strike march_ribot@teleline.es\strike0\{link=%!EF("\f2 m\f0 ail\f2 t\f0 o:eichler@sce.cz",`',1)\}\cf0 
\par \pard\tx1125\tx3685 
\par \pard\fi-845\li845\tx845\tab Czech translation found in ZipMsgCZ.rc and ZipMsgCZ.res\b 
\par \pard\fi-1125\li1125\tx1125\tx3685\b0\tab Ivo Eichler:\tab\cf2\strike eichler@sce.cz\strike0\{link=%!EF("\f2 m\f0 ail\f2 t\f0 o:eichler@sce.cz",`',1)\}\cf0 
\par \pard\fi-845\li845\tx845 
\par \tab Danish translation found in ZipMsgDK.rc and ZipMsgDK.res\b 
\par \pard\fi-1125\li1125\tx1125\tx3685\b0\tab Nicolaj:\tab\cf2\strike nikse@post11.tele.dk\strike0\{link=%!EF("\f2 m\f0 ail\f2 t\f0 o:cvleghrt@worldonline.nl",`',1)\}\cf0 
\par \pard\tx1125\tx3685 
\par \pard\fi-845\li845\tx845\tab Dutch translation found in ZipMsgNL.rc and ZipMsgNL.res\b 
\par \pard\fi-1125\li1125\tx1125\tx3685\b0\tab Chris Vleghert:\tab\cf2\strike cvleghrt@worldonline.nl\strike0\{link=%!EF("\f2 m\f0 ail\f2 t\f0 o:cvleghrt@worldonline.nl",`',1)\}\cf0 
\par \pard\tx1125\tx3685 
\par \pard\fi-845\li845\tx845\tab Finnish translation found in ZipMsgFI.rc and ZipMsgFI.res\b 
\par \pard\fi-1125\li1125\tx1125\tx3685\b0\tab Jussi Siponen:\tab\cf2\strike JIS@online.tietokone.fi\strike0\{link=%!EF("\f2 m\f0 ail\f2 t\f0 o:JIS@online.tietokone.fi",`',1)\}\cf0 
\par \pard\tx1125\tx3685 
\par \pard\fi-845\li845\tx845\tab French translation found in ZipMsgFR.rc and ZipMsgFR.res\b 
\par \pard\fi-1125\li1125\tx1125\tx3685\b0\tab Laurent Hilsz:\tab\cf2\strike hlcd@wanadoo.fr\strike0\{link=%!EF("\f2 m\f0 ail\f2 t\f0 o:hlcd@wanadoo.fr",`',1)\}\cf0  or  \cf2\strike hilsz@piedte.cea.fr\strike0\{link=%!EF("\f2 m\f0 ail\f2 t\f0 o:hilsz@piedte.cea.fr",`',1)\}\cf0 
\par \pard\tx1125\tx3685 
\par \pard\fi-845\li845\tx845\tab German translation found in ZipMsgDE.rc and ZipMsgDE.res\b 
\par \pard\fi-1125\li1125\tx1125\tx3685\b0\tab Markus Stephany:\tab\cf2\strike mirbir.st@t-online.de\strike0\{link=%!EF("\f2 m\f0 ail\f2 t\f0 o:mirbir.st@t-online.de",`',1)\}\cf0 
\par \pard\tx1125\tx3685 
\par \pard\fi-845\li845\tx845\tab Greek translation found in ZipMsgGR.rc and ZipMsgGR.res\b 
\par \pard\fi-1125\li1125\tx1125\tx3685\b0\tab x_gate:\tab\cf2\strike gate7__@hotmail.com\strike0\{link=%!EF("\f2 m\f0 ail\f2 t\f0 o:gate7__@hotmail.com",`',1)\}\cf0 
\par \pard\tx1125\tx3685 
\par \pard\fi-845\li845\tx845\tab Hungarian translation found in ZipMsgHU.rc and ZipMsgHU.res\b 
\par \pard\fi-1125\li1125\tx1125\tx3685\b0\tab\f2 G\'e1l Tam\'e1s:\f5  \f0\tab\cf2\strike tamas@rubin.hu\strike0\{link=%!EF("\f2 m\f0 ail\f2 t\f0 o:tamas@rubin.hu",`',1)\}\cf0 
\par \pard\tx1125\tx3685 
\par \pard\fi-845\li845\tx845\tab Italian translation found in ZipMsgIT.rc and ZipMsgIT.res\b 
\par \pard\fi-1125\li1125\tx1125\tx3685\b0\tab Fabrizio Atza:\tab\cf2\strike faatza@tin.it\strike0\{link=%!EF("\f2 m\f0 ail\f2 t\f0 o:faatza@tin.it",`',1)\}\cf0 
\par \pard\tx1125\tx3685 
\par \pard\fi-845\li845\tx845\tab Malaysia translation found in ZipMsgMY.rc and ZipMsgMY.res\b 
\par \pard\fi-1125\li1125\tx1125\tx3685\b0\tab Azrin Aris:\tab\cf2\strike azrin@rndtm.net.my\strike0\{link=%!EF("\f2 m\f0 ail\f2 t\f0 o:azrin@rndtm.net.my",`',1)\}\cf0 
\par \pard\tx1125\tx3685 
\par \pard\fi-845\li845\tx845\tab Norwegian translation found in ZipMsgNO.rc and ZipMsgNO.res\b 
\par \pard\fi-1125\li1125\tx1125\tx3685\b0\tab Vegard Larsen:\tab\cf2\strike veglar@frisurf.no\strike0\{link=%!EF("\f2 m\f0 ail\f2 t\f0 o:veglar@frisurf.no",`',1)\}\cf0 
\par \pard\tx1125\tx3685 
\par \pard\fi-845\li845\tx845\tab Polish translation found in ZipMsgPL.rc and ZipMsgPL.res\b 
\par \pard\fi-1125\li1125\tx1125\tx3685\b0\tab Marcin Koteras:\tab\cf2\strike bacik@pluton.farm.amwaw.edu.pl\strike0\{link=%!EF("\f2 m\f0 ail\f2 t\f0 o:bacik@pluton.farm.amwaw.edu.pl",`',1)\}\cf0 
\par \pard\tx1125\tx3685 
\par \pard\fi-845\li845\tx845\tab Romanian translation found in ZipMsgRO.rc\b 
\par \pard\fi-1125\li1125\tx1125\tx3685\b0\tab Cristian Musat:\tab\cf2\strike cristianm@bcr.ro\strike0\{link=%!EF("\f2 m\f0 ail\f2 t\f0 o:bacik@pluton.farm.amwaw.edu.pl",`',1)\}\cf0 
\par \pard\tx1125\tx3685 
\par \pard\fi-845\li845\tx845\tab Russian translation found in ZipMsgRU.rc and ZipMsgRU.res\b 
\par \pard\fi-1125\li1125\tx1125\tx3685\b0\tab Alex Ozerov:\cf2\fs16\tab\strike\fs20 ozerov@aha.ru\strike0\{link=%!EF("\f2 m\f0 ail\f2 t\f0 o:ozerov@aha.ru",`',1)\}\cf0 
\par \pard\tx1125\tx3685 
\par \pard\fi-845\li845\tx845\tab Serbian/Yugoslavia translation found in ZipMsgYU.rc and ZipMsgYU.res\b 
\par \pard\fi-1125\li1125\tx1125\tx3685\b0\tab Dejan Maksimovic:\cf2\fs16\tab\strike\fs20 dmaksimovic@yahoo.com\strike0\{link=%!EF("\f2 m\f0 ail\f2 t\f0 o:dmaksimovic@yahoo.com",`',1)\}\cf0  or \cf2\strike maksa@cent.co.yu\strike0\{link=%!EF("\f2 m\f0 ail\f2 t\f0 o:maksa@cent.co.yu",`',1)\}\cf0\fs16 
\par \pard\tx1125\tx3685\fs20 
\par \pard\fi-845\li845\tx845\tab Spanish translation found in ZipMsgS1.rc and ZipMsgS1.res\b 
\par \pard\fi-1125\li1125\tx1125\tx3685\b0\tab Saludos de WalySoft:\cf2\fs16\tab\strike\fs20 waly1@usa.net\strike0\{link=%!EF("\f2 m\f0 ail\f2 t\f0 o:waly1@usa.net",`',1)\}\cf0 
\par \pard\tx1125\tx3685 
\par \pard\fi-845\li845\tx845\tab Swedish translation found in ZipMsgSW.rc and ZipMsgSW.res\b 
\par \pard\fi-1125\li1125\tx1125\tx3685\b0\tab Johan Lindgren:\cf2\fs16\tab\strike\fs20 johan.lindgren@tt.se\strike0\{link=%!EF("\f2 m\f0 ail\f2 t\f0 o:johan.lindgren@tt.se",`',1)\}\cf0 
\par \pard\tx1125\tx3685 
\par \pard\fi-845\li845\tx845\tab Taiwanese (Traditional Chinese) translation found in ZipMsgTW.rc and ZipMsgTW.res\b 
\par \b0\tab [ Big5 - commonly used in Taiwan and Hong Kong for traditional Chinese writing.]\b 
\par \pard\fi-1125\li1125\tx1125\tx3685\b0\tab Michael Tsai:\cf2\fs16\tab\strike\fs20 easyman@ms2.seeder.net\strike0\{link=%!EF("\f2 m\f0 ail\f2 t\f0 o:easyman@ms2.seeder.net",`',1)\}\cf0 
\par \pard\tx1125\tx3685 
\par \b For errors in the translation of the SFX resources and source files:
\par \b0 
\par \pard\fi-845\li845\tx845\tab Catalan SFX translation as found in Sfx1.CT and SfxStringsCT.pas\b 
\par \pard\fi-1125\li1125\tx1125\tx3685\b0\tab\f2 Jordi March i Nogu\'e9:\f0\tab\cf2\strike march_ribot@teleline.es\strike0\{link=%!EF("\f2 m\f0 ail\f2 t\f0 o:eichler@sce.cz",`',1)\}\cf0 
\par \pard\tx1125\tx3685 
\par \pard\fi-845\li845\tx845\tab Czech SFX translation as found in Sfx1.CZ and SfxStringsCZ.pas\b 
\par \pard\fi-1125\li1125\tx1125\tx3685\b0\tab Ivo Eichler:\tab\cf2\strike eichler@sce.cz\strike0\{link=%!EF("\f2 m\f0 ail\f2 t\f0 o:eichler@sce.cz",`',1)\}\cf0 
\par \pard\tx1125\tx3685 
\par \pard\fi-845\li845\tx845\tab German translation found in ZipMsgDE.rc and ZipMsgDE.res\b 
\par \pard\fi-1125\li1125\tx1125\tx3685\b0\tab Roland Ruder:\tab\cf2\strike r.ruder@gmx.de\strike0\{link=%!EF("\f2 m\f0 ail\f2 t\f0 o: r.ruder@gmx.de",`',1)\}\cf0 
\par \pard\tx1125\tx3685 
\par \pard\fi-845\li845\tx845\tab Polish SFX translation as found in Sfx1PL.res, SfxStringsPL.pas and SfxGbls.pas\b 
\par \pard\fi-1125\li1125\tx1125\tx3685\b0\tab Marcin Koteras:\tab\cf2\strike bacik@pluton.farm.amwaw.edu.pl\strike0\{link=%!EF("\f2 m\f0 ail\f2 t\f0 o:bacik@pluton.farm.amwaw.edu.pl",`',1)\}\cf0  or \cf2\strike delphins@friko.onet.pl\strike0\{link=%!EF("\f2 m\f0 ail\f2 t\f0 o:delphins@friko.onet.pl",`',1)\}\cf0 
\par \pard\fi-1125\li1125\tx1125\tx2975 
\par \pard\fi-845\li845\tx845\tab Portuguese(Standard) SFX translation as found in Sfx1PT.res and SfxStringsPT.pas\b 
\par \pard\fi-1125\li1125\tx1125\tx3685\b0\tab Escola Secundaria de Silves:\tab\cf2\strike info@esec-silves.rcts.pt\strike0\{link=%!EF("\f2 m\f0 ail\f2 t\f0 o:info@esec-silves.rcts.pt",`',1)\}\cf0 
\par \pard\tx1125\tx3685 
\par \pard\fi-845\li845\tx845\tab Russian SFX translation as found in Sfx1RU.res and SfxStringsRU.pas\b 
\par \pard\fi-1125\li1125\tx1125\tx3685\b0\tab Alex Ozerov:\cf2\fs16\tab\strike\fs20 ozerov@aha.ru\strike0\{link=%!EF("MailTo:ozerov@aha.ru",`',1)\}\cf0 
\par \pard\tx1125\tx3685 
\par \pard\fi-845\li845\tx845\tab Serbian/Yugoslavia translation as found in SfxYU.res and SfxStringsYU.pas\b 
\par \pard\fi-1125\li1125\tx1125\tx3685\b0\tab Dejan Maksimovic:\cf2\fs16\tab\strike\fs20 dmaksimovic@yahoo.com\strike0\{link=%!EF("\f2 m\f0 ail\f2 t\f0 o:dmaksimovic@yahoo.com",`',1)\}\cf0  or \cf2\strike maksa@cent.co.yu\strike0\{link=%!EF("\f2 m\f0 ail\f2 t\f0 o:maksa@cent.co.yu",`',1)\}\cf0 
\par \pard\tx2975 
\par \pard\fi-845\li845\tx845\tab Spanish SFX translation as found in Sfx1SP.res and SfxStringsSP.pas\b 
\par \pard\fi-1125\li1125\tx1125\tx3685\b0\tab\f1 "\f0 Danny\f1 "\f0 :\cf2\tab\strike travolta@mx2.redestb.es\strike0\{link=%!EF("\f2 m\f0 ail\f2 t\f0 o:travolta@mx2.redestb.es",`',1)\}\cf0 
\par 
\par }
40
TZipMaster_Contact
Contact information
Contact information;


BROWSE0001:000010
Imported


TZipMaster_Contact
FALSE
12
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fnil Courier New;}{\f2\fnil Arial;}{\f3\fswiss\fcharset0 Arial;}}
{\colortbl ;\red255\green0\blue255;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;\red0\green0\blue128;}
\viewkind4\uc1\pard\cf1\lang3081\f0\fs24\{bml ZipMaster.bmp\}\cf2\b\fs28 Contact \{keepn\} Information
\par \cf3\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf2 
\par \cf0 
\par \b The latest version of TZipMaster, TZipBuilder and additional information such as bug fixes is available from:\cf4\b0\f1 
\par \cf2\strike http://www.delphizip.net/index.html\cf4\strike0\{link=*! ExecFile("http://www.delphizip.net/index.html")\}\cf0\f2 
\par \pard\tx1125 
\par \f0 
\par \pard\tx715\tx1435\tx2155\tx2875\tx3595\tx4315\tx5035\tx5755\tx6475\tx7195\cf5\i Please forward any \cf6 comments or suggestions\cf5  to \f3 mailing list \f0 at:
\par \pard\fi-1125\li1125\tx1125\tx3685\i0 e-mail:\cf0\tab\cf2\strike\f1 delphizip@freelists.org\cf4\strike0\{link=*! ExecFile("mailto:delphizip@freelists.org")\}\cf5\f0 
\par }
50
Scribble50
Copyright and distribution policyilTo:cve
Copyright;Distribution;


BROWSE0001:000030
Writing



FALSE
23
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\froman\fcharset0 Times New Roman;}{\f2\fswiss\fcharset0 Arial;}{\f3\fnil\fcharset0 Arial;}{\f4\fnil Arial;}}
{\colortbl ;\red255\green0\blue255;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\f0\fs24\{bml ZipMaster.bmp\}\cf2\b\fs28 Distribution Policy, Guidelines for Legal \{keepn\} Re-distribution
\par \cf3\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf2 
\par \cf0\b 
\par \pard\fi-275\li275\tx275 1\b0 .\tab This applies to both end-users and developers.  The meat of this package is the .DLL files, and they are needed by all of your end-users if you use this ZIP package in your program.
\par 
\par \b 2\b0 .\tab You must not charge money for any part of the ZIP package. Warning:  The primary concern here is if you will market a new package that is only slightly more than a verbatim copy of this package, or one of it's demos.  ANY release you sell is OK as long as you charge ONLY for the changes you make.
\par 
\par \b 3\b0 .\tab You MUST either distribute the source code for this ZIP package, or give a WWW site where it can be obtained freely. This can be on a Help...About screen, in printed documentation, or in text files distributed with your package.  Yes, it does seem odd to have this requirement for end-users who aren't programmers, but there is no mistake.  After all, it isn't hard to give them a URL and a few words explaining what it is for.
\par 
\par \b 4\b0 .\tab You must document the \cf3\ul Info-Zip\f1 '\f0 s\ulnone\{linkID=20\}\cf0  WWW home page URL, but don't expect any help from the Info-Zip group, since my release is only a derivative of their work.  They are very busy doing support for their "official" releases. Since much of the DLL source code comes from them, they deserve to be mentioned.
\par 
\par \b 5\b0 .\tab You must handle product support with your own end-users. This is needed because I don't have enough time to do support for end-users.
\par 
\par \b 6\b0 .\tab I will handle support issues with programmers using this package on a time-available basis. Since this is being distributed as freeware, you can't expect the kind of support you'd get from a commercial vendor.  Please limit your questions to those that directly pertain to this ZIP package.
\par 
\par \b 7\b0 .\tab You may NOT distribute executable versions of my demo programs to end-users without my approval.  These are only example applications to teach you how to use this package.
\par 
\par \f2 8.\tab Distributed \cf4\f3 under the \cf3\b\strike\f4 GNU LESSER GENERAL PUBLIC LICENSE\cf5\strike0\{linkID=70\}
\par \cf0\b0\f2  \f0 
\par 
\par }
60
Scribble60
Thanks



browse0001:000050
Imported



FALSE
27
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fswiss\fcharset0 Arial;}}
{\colortbl ;\red255\green0\blue255;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue128;\red0\green0\blue0;}
\viewkind4\uc1\pard\sa115\qc\cf1\lang3081\f0\fs24\{bml ZipMaster.bmp\}\cf2\b\fs28\{keepn\} Thanks...
\par \pard\cf3\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf2 
\par \pard\tx715\tx1435\tx2155\tx2875\tx3595\tx4315\tx5035\tx5755\tx6475\tx7195\cf0\b 
\par \cf4 A big THANKS to all those who helped me and/or suggested improvements along the way:
\par \pard\tx5665\cf5\b0 
\par \pard\tx275\tx2835\tab\f1 Roger Aelbrecht\f0 
\par \f1     \f0 Raymond Allan
\par \tab J.A. Bijsterbosch
\par \tab Tim Borman
\par \tab Sam Chan
\par \tab Julien Ferraro
\par \tab Sebastian Hildebrandt
\par \tab Alexander Hofmann
\par \tab Jim Hoops
\par \tab Teus de Jong
\par \tab Matthew Kent
\par \tab Greg Lorriman
\par \tab Harald Marschalek
\par \tab Almer.S. Tigelaar
\par \tab Kenan Uzay
\par \tab\f1 Jo\'e3o Lira\f0 
\par \tab Bob Dolan
\par 
\par 
\par }
70
Scribble70
Licence
Copyright;Licence;


BROWSE0001:000040
Writing



FALSE
472
{\rtf1\ansi\ansicpg1252\deff0\deflang3081{\fonttbl{\f0\fnil\fcharset0 Arial;}{\f1\fnil Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\b\fs32 Licence\cf2\b0\f1\fs20 
\par 
\par \tab\tab   \b GNU LESSER GENERAL PUBLIC LICENSE
\par \b0\tab\tab        Version 2.1, February 1999
\par 
\par  Copyright (C) 1991, 1999 Free Software Foundation, Inc.
\par      59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
\par  Everyone is permitted to copy and distribute verbatim copies
\par  of this license document, but changing it is not allowed.
\par 
\par [This is the first released version of the Lesser GPL.  It also counts
\par  as the successor of the GNU Library Public License, version 2, hence
\par  the version number 2.1.]
\par 
\par \tab\tab\tab     \b Preamble
\par \b0 
\par   The licenses for most software are designed to take away your
\par freedom to share and change it.  By contrast, the GNU General Public
\par Licenses are intended to guarantee your freedom to share and change
\par free software--to make sure the software is free for all its users.
\par 
\par   This license, the Lesser General Public License, applies to some
\par specially designated software packages--typically libraries--of the
\par Free Software Foundation and other authors who decide to use it.  You
\par can use it too, but we suggest you first think carefully about whether
\par this license or the ordinary General Public License is the better
\par strategy to use in any particular case, based on the explanations below.
\par 
\par   When we speak of free software, we are referring to freedom of use,
\par not price.  Our General Public Licenses are designed to make sure that
\par you have the freedom to distribute copies of free software (and charge
\par for this service if you wish); that you receive source code or can get
\par it if you want it; that you can change the software and use pieces of
\par it in new free programs; and that you are informed that you can do
\par these things.
\par 
\par   To protect your rights, we need to make restrictions that forbid
\par distributors to deny you these rights or to ask you to surrender these
\par rights.  These restrictions translate to certain responsibilities for
\par you if you distribute copies of the library or if you modify it.
\par 
\par   For example, if you distribute copies of the library, whether gratis
\par or for a fee, you must give the recipients all the rights that we gave
\par you.  You must make sure that they, too, receive or can get the source
\par code.  If you link other code with the library, you must provide
\par complete object files to the recipients, so that they can relink them
\par with the library after making changes to the library and recompiling
\par it.  And you must show them these terms so they know their rights.
\par 
\par   We protect your rights with a two-step method: (1) we copyright the
\par library, and (2) we offer you this license, which gives you legal
\par permission to copy, distribute and/or modify the library.
\par 
\par   To protect each distributor, we want to make it very clear that
\par there is no warranty for the free library.  Also, if the library is
\par modified by someone else and passed on, the recipients should know
\par that what they have is not the original version, so that the original
\par author's reputation will not be affected by problems that might be
\par introduced by others.
\par 
\par 
\par   Finally, software patents pose a constant threat to the existence of
\par any free program.  We wish to make sure that a company cannot
\par effectively restrict the users of a free program by obtaining a
\par restrictive license from a patent holder.  Therefore, we insist that
\par any patent license obtained for a version of the library must be
\par consistent with the full freedom of use specified in this license.
\par 
\par   Most GNU software, including some libraries, is covered by the
\par ordinary GNU General Public License.  This license, the GNU Lesser
\par General Public License, applies to certain designated libraries, and
\par is quite different from the ordinary General Public License.  We use
\par this license for certain libraries in order to permit linking those
\par libraries into non-free programs.
\par 
\par   When a program is linked with a library, whether statically or using
\par a shared library, the combination of the two is legally speaking a
\par combined work, a derivative of the original library.  The ordinary
\par General Public License therefore permits such linking only if the
\par entire combination fits its criteria of freedom.  The Lesser General
\par Public License permits more lax criteria for linking other code with
\par the library.
\par 
\par   We call this license the "Lesser" General Public License because it
\par does Less to protect the user's freedom than the ordinary General
\par Public License.  It also provides other free software developers Less
\par of an advantage over competing non-free programs.  These disadvantages
\par are the reason we use the ordinary General Public License for many
\par libraries.  However, the Lesser license provides advantages in certain
\par special circumstances.
\par 
\par   For example, on rare occasions, there may be a special need to
\par encourage the widest possible use of a certain library, so that it becomes
\par a de-facto standard.  To achieve this, non-free programs must be
\par allowed to use the library.  A more frequent case is that a free
\par library does the same job as widely used non-free libraries.  In this
\par case, there is little to gain by limiting the free library to free
\par software only, so we use the Lesser General Public License.
\par 
\par   In other cases, permission to use a particular library in non-free
\par programs enables a greater number of people to use a large body of
\par free software.  For example, permission to use the GNU C Library in
\par non-free programs enables many more people to use the whole GNU
\par operating system, as well as its variant, the GNU/Linux operating
\par system.
\par 
\par   Although the Lesser General Public License is Less protective of the
\par users' freedom, it does ensure that the user of a program that is
\par linked with the Library has the freedom and the wherewithal to run
\par that program using a modified version of the Library.
\par 
\par   The precise terms and conditions for copying, distribution and
\par modification follow.  Pay close attention to the difference between a
\par "work based on the library" and a "work that uses the library".  The
\par former contains code derived from the library, whereas the latter must
\par be combined with the library in order to run.
\par 
\par 
\par \tab\tab  \b  GNU LESSER GENERAL PUBLIC LICENSE
\par    TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION\b0 
\par 
\par   0. This License Agreement applies to any software library or other
\par program which contains a notice placed by the copyright holder or
\par other authorized party saying it may be distributed under the terms of
\par this Lesser General Public License (also called "this License").
\par Each licensee is addressed as "you".
\par 
\par   A "library" means a collection of software functions and/or data
\par prepared so as to be conveniently linked with application programs
\par (which use some of those functions and data) to form executables.
\par 
\par   The "Library", below, refers to any such software library or work
\par which has been distributed under these terms.  A "work based on the
\par Library" means either the Library or any derivative work under
\par copyright law: that is to say, a work containing the Library or a
\par portion of it, either verbatim or with modifications and/or translated
\par straightforwardly into another language.  (Hereinafter, translation is
\par included without limitation in the term "modification".)
\par 
\par   "Source code" for a work means the preferred form of the work for
\par making modifications to it.  For a library, complete source code means
\par all the source code for all modules it contains, plus any associated
\par interface definition files, plus the scripts used to control compilation
\par and installation of the library.
\par 
\par   Activities other than copying, distribution and modification are not
\par covered by this License; they are outside its scope.  The act of
\par running a program using the Library is not restricted, and output from
\par such a program is covered only if its contents constitute a work based
\par on the Library (independent of the use of the Library in a tool for
\par writing it).  Whether that is true depends on what the Library does
\par and what the program that uses the Library does.
\par   
\par   1. You may copy and distribute verbatim copies of the Library's
\par complete source code as you receive it, in any medium, provided that
\par you conspicuously and appropriately publish on each copy an
\par appropriate copyright notice and disclaimer of warranty; keep intact
\par all the notices that refer to this License and to the absence of any
\par warranty; and distribute a copy of this License along with the
\par Library.
\par 
\par   You may charge a fee for the physical act of transferring a copy,
\par and you may at your option offer warranty protection in exchange for a
\par fee.
\par 
\par 
\par   2. You may modify your copy or copies of the Library or any portion
\par of it, thus forming a work based on the Library, and copy and
\par distribute such modifications or work under the terms of Section 1
\par above, provided that you also meet all of these conditions:
\par 
\par     a) The modified work must itself be a software library.
\par 
\par     b) You must cause the files modified to carry prominent notices
\par     stating that you changed the files and the date of any change.
\par 
\par     c) You must cause the whole of the work to be licensed at no
\par     charge to all third parties under the terms of this License.
\par 
\par     d) If a facility in the modified Library refers to a function or a
\par     table of data to be supplied by an application program that uses
\par     the facility, other than as an argument passed when the facility
\par     is invoked, then you must make a good faith effort to ensure that,
\par     in the event an application does not supply such function or
\par     table, the facility still operates, and performs whatever part of
\par     its purpose remains meaningful.
\par 
\par     (For example, a function in a library to compute square roots has
\par     a purpose that is entirely well-defined independent of the
\par     application.  Therefore, Subsection 2d requires that any
\par     application-supplied function or table used by this function must
\par     be optional: if the application does not supply it, the square
\par     root function must still compute square roots.)
\par 
\par These requirements apply to the modified work as a whole.  If
\par identifiable sections of that work are not derived from the Library,
\par and can be reasonably considered independent and separate works in
\par themselves, then this License, and its terms, do not apply to those
\par sections when you distribute them as separate works.  But when you
\par distribute the same sections as part of a whole which is a work based
\par on the Library, the distribution of the whole must be on the terms of
\par this License, whose permissions for other licensees extend to the
\par entire whole, and thus to each and every part regardless of who wrote
\par it.
\par 
\par Thus, it is not the intent of this section to claim rights or contest
\par your rights to work written entirely by you; rather, the intent is to
\par exercise the right to control the distribution of derivative or
\par collective works based on the Library.
\par 
\par In addition, mere aggregation of another work not based on the Library
\par with the Library (or with a work based on the Library) on a volume of
\par a storage or distribution medium does not bring the other work under
\par the scope of this License.
\par 
\par   3. You may opt to apply the terms of the ordinary GNU General Public
\par License instead of this License to a given copy of the Library.  To do
\par this, you must alter all the notices that refer to this License, so
\par that they refer to the ordinary GNU General Public License, version 2,
\par instead of to this License.  (If a newer version than version 2 of the
\par ordinary GNU General Public License has appeared, then you can specify
\par that version instead if you wish.)  Do not make any other change in
\par these notices.
\par 
\par 
\par   Once this change is made in a given copy, it is irreversible for
\par that copy, so the ordinary GNU General Public License applies to all
\par subsequent copies and derivative works made from that copy.
\par 
\par   This option is useful when you wish to copy part of the code of
\par the Library into a program that is not a library.
\par 
\par   4. You may copy and distribute the Library (or a portion or
\par derivative of it, under Section 2) in object code or executable form
\par under the terms of Sections 1 and 2 above provided that you accompany
\par it with the complete corresponding machine-readable source code, which
\par must be distributed under the terms of Sections 1 and 2 above on a
\par medium customarily used for software interchange.
\par 
\par   If distribution of object code is made by offering access to copy
\par from a designated place, then offering equivalent access to copy the
\par source code from the same place satisfies the requirement to
\par distribute the source code, even though third parties are not
\par compelled to copy the source along with the object code.
\par 
\par   5. A program that contains no derivative of any portion of the
\par Library, but is designed to work with the Library by being compiled or
\par linked with it, is called a "work that uses the Library".  Such a
\par work, in isolation, is not a derivative work of the Library, and
\par therefore falls outside the scope of this License.
\par 
\par   However, linking a "work that uses the Library" with the Library
\par creates an executable that is a derivative of the Library (because it
\par contains portions of the Library), rather than a "work that uses the
\par library".  The executable is therefore covered by this License.
\par Section 6 states terms for distribution of such executables.
\par 
\par   When a "work that uses the Library" uses material from a header file
\par that is part of the Library, the object code for the work may be a
\par derivative work of the Library even though the source code is not.
\par Whether this is true is especially significant if the work can be
\par linked without the Library, or if the work is itself a library.  The
\par threshold for this to be true is not precisely defined by law.
\par 
\par   If such an object file uses only numerical parameters, data
\par structure layouts and accessors, and small macros and small inline
\par functions (ten lines or less in length), then the use of the object
\par file is unrestricted, regardless of whether it is legally a derivative
\par work.  (Executables containing this object code plus portions of the
\par Library will still fall under Section 6.)
\par 
\par   Otherwise, if the work is a derivative of the Library, you may
\par distribute the object code for the work under the terms of Section 6.
\par Any executables containing that work also fall under Section 6,
\par whether or not they are linked directly with the Library itself.
\par 
\par 
\par   6. As an exception to the Sections above, you may also combine or
\par link a "work that uses the Library" with the Library to produce a
\par work containing portions of the Library, and distribute that work
\par under terms of your choice, provided that the terms permit
\par modification of the work for the customer's own use and reverse
\par engineering for debugging such modifications.
\par 
\par   You must give prominent notice with each copy of the work that the
\par Library is used in it and that the Library and its use are covered by
\par this License.  You must supply a copy of this License.  If the work
\par during execution displays copyright notices, you must include the
\par copyright notice for the Library among them, as well as a reference
\par directing the user to the copy of this License.  Also, you must do one
\par of these things:
\par 
\par     a) Accompany the work with the complete corresponding
\par     machine-readable source code for the Library including whatever
\par     changes were used in the work (which must be distributed under
\par     Sections 1 and 2 above); and, if the work is an executable linked
\par     with the Library, with the complete machine-readable "work that
\par     uses the Library", as object code and/or source code, so that the
\par     user can modify the Library and then relink to produce a modified
\par     executable containing the modified Library.  (It is understood
\par     that the user who changes the contents of definitions files in the
\par     Library will not necessarily be able to recompile the application
\par     to use the modified definitions.)
\par 
\par     b) Use a suitable shared library mechanism for linking with the
\par     Library.  A suitable mechanism is one that (1) uses at run time a
\par     copy of the library already present on the user's computer system,
\par     rather than copying library functions into the executable, and (2)
\par     will operate properly with a modified version of the library, if
\par     the user installs one, as long as the modified version is
\par     interface-compatible with the version that the work was made with.
\par 
\par     c) Accompany the work with a written offer, valid for at
\par     least three years, to give the same user the materials
\par     specified in Subsection 6a, above, for a charge no more
\par     than the cost of performing this distribution.
\par 
\par     d) If distribution of the work is made by offering access to copy
\par     from a designated place, offer equivalent access to copy the above
\par     specified materials from the same place.
\par 
\par     e) Verify that the user has already received a copy of these
\par     materials or that you have already sent this user a copy.
\par 
\par   For an executable, the required form of the "work that uses the
\par Library" must include any data and utility programs needed for
\par reproducing the executable from it.  However, as a special exception,
\par the materials to be distributed need not include anything that is
\par normally distributed (in either source or binary form) with the major
\par components (compiler, kernel, and so on) of the operating system on
\par which the executable runs, unless that component itself accompanies
\par the executable.
\par 
\par   It may happen that this requirement contradicts the license
\par restrictions of other proprietary libraries that do not normally
\par accompany the operating system.  Such a contradiction means you cannot
\par use both them and the Library together in an executable that you
\par distribute.
\par 
\par 
\par   7. You may place library facilities that are a work based on the
\par Library side-by-side in a single library together with other library
\par facilities not covered by this License, and distribute such a combined
\par library, provided that the separate distribution of the work based on
\par the Library and of the other library facilities is otherwise
\par permitted, and provided that you do these two things:
\par 
\par     a) Accompany the combined library with a copy of the same work
\par     based on the Library, uncombined with any other library
\par     facilities.  This must be distributed under the terms of the
\par     Sections above.
\par 
\par     b) Give prominent notice with the combined library of the fact
\par     that part of it is a work based on the Library, and explaining
\par     where to find the accompanying uncombined form of the same work.
\par 
\par   8. You may not copy, modify, sublicense, link with, or distribute
\par the Library except as expressly provided under this License.  Any
\par attempt otherwise to copy, modify, sublicense, link with, or
\par distribute the Library is void, and will automatically terminate your
\par rights under this License.  However, parties who have received copies,
\par or rights, from you under this License will not have their licenses
\par terminated so long as such parties remain in full compliance.
\par 
\par   9. You are not required to accept this License, since you have not
\par signed it.  However, nothing else grants you permission to modify or
\par distribute the Library or its derivative works.  These actions are
\par prohibited by law if you do not accept this License.  Therefore, by
\par modifying or distributing the Library (or any work based on the
\par Library), you indicate your acceptance of this License to do so, and
\par all its terms and conditions for copying, distributing or modifying
\par the Library or works based on it.
\par 
\par   10. Each time you redistribute the Library (or any work based on the
\par Library), the recipient automatically receives a license from the
\par original licensor to copy, distribute, link with or modify the Library
\par subject to these terms and conditions.  You may not impose any further
\par restrictions on the recipients' exercise of the rights granted herein.
\par You are not responsible for enforcing compliance by third parties with
\par this License.
\par 
\par 
\par   11. If, as a consequence of a court judgment or allegation of patent
\par infringement or for any other reason (not limited to patent issues),
\par conditions are imposed on you (whether by court order, agreement or
\par otherwise) that contradict the conditions of this License, they do not
\par excuse you from the conditions of this License.  If you cannot
\par distribute so as to satisfy simultaneously your obligations under this
\par License and any other pertinent obligations, then as a consequence you
\par may not distribute the Library at all.  For example, if a patent
\par license would not permit royalty-free redistribution of the Library by
\par all those who receive copies directly or indirectly through you, then
\par the only way you could satisfy both it and this License would be to
\par refrain entirely from distribution of the Library.
\par 
\par If any portion of this section is held invalid or unenforceable under any
\par particular circumstance, the balance of the section is intended to apply,
\par and the section as a whole is intended to apply in other circumstances.
\par 
\par It is not the purpose of this section to induce you to infringe any
\par patents or other property right claims or to contest validity of any
\par such claims; this section has the sole purpose of protecting the
\par integrity of the free software distribution system which is
\par implemented by public license practices.  Many people have made
\par generous contributions to the wide range of software distributed
\par through that system in reliance on consistent application of that
\par system; it is up to the author/donor to decide if he or she is willing
\par to distribute software through any other system and a licensee cannot
\par impose that choice.
\par 
\par This section is intended to make thoroughly clear what is believed to
\par be a consequence of the rest of this License.
\par 
\par   12. If the distribution and/or use of the Library is restricted in
\par certain countries either by patents or by copyrighted interfaces, the
\par original copyright holder who places the Library under this License may add
\par an explicit geographical distribution limitation excluding those countries,
\par so that distribution is permitted only in or among countries not thus
\par excluded.  In such case, this License incorporates the limitation as if
\par written in the body of this License.
\par 
\par   13. The Free Software Foundation may publish revised and/or new
\par versions of the Lesser General Public License from time to time.
\par Such new versions will be similar in spirit to the present version,
\par but may differ in detail to address new problems or concerns.
\par 
\par Each version is given a distinguishing version number.  If the Library
\par specifies a version number of this License which applies to it and
\par "any later version", you have the option of following the terms and
\par conditions either of that version or of any later version published by
\par the Free Software Foundation.  If the Library does not specify a
\par license version number, you may choose any version ever published by
\par the Free Software Foundation.
\par 
\par 
\par   14. If you wish to incorporate parts of the Library into other free
\par programs whose distribution conditions are incompatible with these,
\par write to the author to ask for permission.  For software which is
\par copyrighted by the Free Software Foundation, write to the Free
\par Software Foundation; we sometimes make exceptions for this.  Our
\par decision will be guided by the two goals of preserving the free status
\par of all derivatives of our free software and of promoting the sharing
\par and reuse of software generally.
\par 
\par \fs16\tab\tab\tab     \b NO WARRANTY
\par \b0 
\par   15. BECAUSE THE LIBRARY IS LICENSED FREE OF CHARGE, THERE IS NO
\par WARRANTY FOR THE LIBRARY, TO THE EXTENT PERMITTED BY APPLICABLE LAW.
\par EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR
\par OTHER PARTIES PROVIDE THE LIBRARY "AS IS" WITHOUT WARRANTY OF ANY
\par KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE
\par IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
\par PURPOSE.  THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE
\par LIBRARY IS WITH YOU.  SHOULD THE LIBRARY PROVE DEFECTIVE, YOU ASSUME
\par THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.
\par 
\par   16. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN
\par WRITING WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY
\par AND/OR REDISTRIBUTE THE LIBRARY AS PERMITTED ABOVE, BE LIABLE TO YOU
\par FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR
\par CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE THE
\par LIBRARY (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING
\par RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A
\par FAILURE OF THE LIBRARY TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF
\par SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH
\par DAMAGES.
\par 
\par \tab\tab      \b END OF TERMS AND CONDITIONS\b0\fs20 
\par 
\par }
80
Scribble80
Changes v1.78



changes:000040
Writing



FALSE
15
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Arial;}{\f1\fswiss Arial;}{\f2\fnil Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green0\blue0;\red0\green128\blue0;\red128\green0\blue128;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\fs32 Changes v1.78\cf2\b0\fs20  \cf1\b\fs32\{keepn\} \cf0\f1\fs28 
\par \cf3\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf2 
\par \cf4\f2 
\par \lang1033\b Changes\cf2\b0 
\par \lang3081\f0    \lang1033\f2 Delphi versions \lang3081\f0 only 4 and above \lang1033\f2 supported\lang3081\f0  
\par \lang1033\f2 
\par \lang3081\f0    Dialogs and message boxes now go via new event \cf3\strike OnZipDialog \cf5\strike0\{linkID=1770>main\}\cf2 and, if not      handled, a new DialogBox.
\par 
\par    New Property    
\par     property \cf3\strike NotMainThread\cf5\strike0\{linkID=640>main\}\cf2 : Boolean; set true when running on thread
\par 
\par    OnAfterCallback renamed to \cf3\strike OnCheckTerminate\cf5\strike0\{linkID=1880>main\}\cf2\lang1033\f2 
\par }
90
Scribble90
Changes v1.77



changes:000030
Writing



FALSE
118
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Arial;}{\f1\fswiss Arial;}{\f2\fnil Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red128\green0\blue128;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\fs32 Changes v1.77\{keepn\} \cf0\f1\fs28 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \cf4\f2 
\par \b\f0  \lang1033\f2 Major Changes\cf3\b0 
\par 
\par Delphi versions \lang3081\f0 only 4 and above \lang1033\f2 supported\lang3081\f0  \lang1033\f2 
\par 
\par \b Directory Structure\b0 
\par   VCL - ZipMaster and ZipSFX files
\par   Packages - design- and run-time page files
\par   Dll - dlls and Dlls stored in resource
\par   Grid - sort grid (used in demos)
\par 
\par \b Configuration\b0 
\par   In VCL/ZipConfig.inc  \{\ul shown for maximum compatablity to earlier versions\lang3081\ulnone\f0\}\lang1033\f2 
\par //   \{ $DEFINE NO_SPAN\}  // uncomment to remove support for multi-part zip files
\par //   \{ $DEFINE NO_SFX\}   // define to remove support for self expanding zip files
\par \{$DEFINE INTERNAL_SFX\}  // define to include TZipSFX as part of ZipMaster 
\par //\{$DEFINE USE_ALLZIPSTRINGS\}  // define to use 'ResourceString's as default for all strings.
\par   No need to link ZipMsg??.res language file (US only but can translate using tools) 
\par //\{$DEFINE ALLOW_2G\}  // makes OnProgressEvent handle large files but not compatable\lang3081\f0  with earlier versions\lang1033\f2 .
\par 
\par \b Files\b0 
\par   VCL\lang3081\f0\\\lang1033\f2 
\par    VCL\\UnzDLL.pas \tab - definitions UnzDll
\par    VCL\\ZCallBck.pas \tab - definitions for Callback structure
\par    VCL\\ZipBase.pas \tab - primitive part of internal class ZMaster
\par    VCL\\ZipDLL.pas \tab - definitions for ZipDll
\par    VCL\\ZipMsg.pas \tab - Error message Ident constants
\par    VCL\\ZipMstr.pas \tab - Main TZipMaster class definitions
\par    VCL\\ZipPassDlg.pas \tab - Password dialog
\par    VCL\\ZipShldStrs.pas\tab - controllable read-only StringList 
\par    VCL\\ZipStrs.pas \tab - default strings as ResourceStrings
\par    VCL\\ZipStructs.pas \tab - definitions of internal zip file structures
\par    VCL\\ZipUtils.pas \tab - some handy functions for handling zip files
\par    VCL\\ZipXcpt.pas \tab - definitions of EZipMaster the exceptions raised by ZipMaster
\par    VCL\\ZLibLoad.pas \tab - low level loader for dlls
\par    VCL\\ZMaster.pas \tab - internal class that does the work
\par    vcl\\zipvers.inc\tab\lang3081\f0\tab\lang1033\f2 - include file for Delphi version\lang3081\f0  constant\lang1033\f2 s
\par    vcl\\zipconfig.inc\tab - include file to set options ('includes' zipvers.inc)
\par    VCL\\ZipMstrReg.pas\tab - register TZipMaster
\par // TZipSFX by markus stephany (DZUtils\lang3081\f0  slightly\lang1033\f2  modified by me\lang3081\f0  to share exception translation\lang1033\f2 )
\par    VCL\\DZUtils.pas 
\par    VCL\\SFXInterface.pas 
\par    VCL\\SFXStructs.pas 
\par    VCL\\ZipSFX.pas  
\par    vcl\\delver.inc
\par    vcl\\lang2.inc
\par    vcl\\missing_types.inc
\par    vcl\\sfxver.inc
\par    
\par    Packages\\ZM176R.dpk\tab - Run-time package (compile first)
\par    Packages\\ZM176D.dpk\tab - Design package (Install last)
\par 
\par    DLL\\ZipDll.dll\tab - compression routines
\par    DLL\\UnzDll.dll\tab - extraction routines
\par    dll\\resdlls.res\tab - dlls compressed and saved as resources (automatically extracted)
\par    
\par   \lang3081\b\f0 Installation\b0 
\par      Compile the\lang1033\f2  \lang3081\f0 run-time package then install the design package
\par \lang1033\f2 
\par   \lang3081\b\f0 E\lang1033\f2 vents\b0  
\par \lang3081\f0     \cf5\f2 Changed\cf3\lang1033 
\par   // FileSize changed to int64 to support 4G zip files \{only if ALLOW_2G defined\}
\par   TProgressEvent = procedure(Sender: TObject; ProgrType: ProgressType;
\par        Filename: string; FileSize: int64\{cardinal\}) of object;
\par     //  easier to use progress events
\par   TItemProgressEvent = procedure(Sender: TObject; Item: string;
\par        TotalSize: cardinal; PerCent: integer) of object; 
\par   TTotalProgressEvent = procedure(Sender: TObject; TotalSize: int64\{cardinal\};
\par        PerCent: integer) of object;   
\par \lang3081\f0     \cf5\f2 New\cf3\lang1033 
\par   TProgressDetailsEvent = procedure(Sender: TObject; details: TProgressDetails) of object;
\par    // gives bytes written to file \{zip only\}   see ZipBase.pas for details                          
\par   
\par   // new routines to alter stored / extracted names (full filename specified)
\par    \cf2\strike  TSetAddNameEvent\cf5\strike0\{linkID=1730\}\cf3  = procedure(Sender: TObject; var FileName: String;
\par       const ExtName: String; var IsChanged: Boolean) of object; 
\par     \cf2\strike TSetExtNameEvent\cf5\strike0\{linkID=1740\}\cf3  = procedure(Sender: TObject; var FileName: String;
\par     var IsChanged: Boolean) of object;  
\par     
\par \b Properties    \b0 
\par   \cf5 New  \cf3 
\par     property Busy: Boolean  - read-only true while busy
\par     
\par     published property Active: Boolean  default true to allow operating (false just sets properties - no side effects)
\par     
\par \b Functions\b0 
\par     CopyFile renamed (\lang3081\f0 stops \lang1033\f2 conflict)
\par       function Copy_File(const InFileName, OutFileName: String): Integer; 
\par      
\par     // in contents find first matching filename after idx
\par     function Find(const fspec: String; var idx: Integer): pZipDirEntry; 
\par     
\par     // in contents find matching filename
\par     function IndexOf(const fname: String): Integer;  
\par     
\par     // empty all records, strings and settings (not event handlers)
\par     // must use to reset after re-entry attempted
\par     procedure Clear;     
\par     
\par     // new overloaded versions returns user's response
\par     function \cf2\strike GetAddPassword\cf5\strike0\{linkID=1300\}\cf3 (var Response: ZipPassDlg.TPasswordButton): String; overload;
\par     function \cf2\strike GetExtrPassword\cf5\strike0\{linkID=1320\}\cf3 (var Response: ZipPassDlg.TPasswordButton): String; overload;
\par     
\par     // Remove the Re-entry value from the Error code
\par     function TheErrorCode(errCode: integer): integer;
\par     
\par 
\par \b Constants\b0 
\par     Reentry_Error = $4000000; // 'or'ed with ErrCode if Re-entry attempted while was busy
\par     // note - that mostly this will not interupt the running process\lang3081\f0  \lang1033\f2 
\par 
\par 
\par 
\par }
100
Scribble100
Changes v1.73



changes:000020
Writing



FALSE
66
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Arial;}{\f1\fswiss Arial;}{\f2\fnil Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red128\green0\blue128;\red128\green0\blue0;\red255\green0\blue255;}
\viewkind4\uc1\pard\cf1\b\fs32 Changes v1.73\cf0\lang3081\f1\fs28\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \f2 
\par \cf4\b New\cf3\b0  -
\par \f0   \b Compiler Definitions\b0  \tab 
\par \tab INTERNAL_SFX\tab 
\par \tab\tab\tab forces inclusion of integrated SFX support\f2 
\par \f0   \b Component\b0 
\par \tab\cf2\strike TZipSFX\cf5\strike0\{linkID=1890\}\cf3 
\par \tab\tab\tab handles SFX operations\f2 
\par 
\par \f0   \b Events
\par \tab\cf2\b0\strike TZipStrEvent \cf5\strike0\{linkID=1760\}\cf3 = procedure(Sender: TObject; ID: integer; var Str: String) of object;\lang1033  
\par   \tab\cf2\strike TItemProgressEvent \cf5\strike0\{linkID=1810\}
\par \tab\tab\cf3 = procedure(Sender: TObject; Item: string;  TotalSize, PerCent: cardinal) of object; 
\par   \tab\cf2\strike TTotalProgressEvent \cf5\strike0\{linkID=1790\}
\par \tab\tab\cf3 = procedure(Sender: TObject; TotalSize, PerCent: cardinal) of object;                        
\par \lang3081 
\par   \b Properties\b0\f2 
\par \lang1033\f0\tab\cf2\strike OnZipStr\cf5\strike0\{linkID=1760\}\cf0 : TZipStrEvent;
\par \tab\cf2\strike OnTotalProgress\cf5\strike0\{linkID=1790\}\cf0 : TTotalProgressEvent;
\par \tab\cf2\strike OnItemProgress\cf5\strike0\{linkID=1810\}\cf0 : TItemProgressEvent;
\par 
\par   \b Resource
\par \tab\b0 ResDlls.res : the dlls stored as a resource 
\par \tab ZipNew173.rc : new resource strings - already included in ZipMsgUS.rc
\par 
\par    \b Other
\par \tab\cf2\b0\strike AddOptions \cf5\strike0\{linkID=310\}\cf0 : addForceDest  - forces destination directory to exist
\par \tab\cf2\strike ExtrOptions \cf5\strike0\{linkID=470\}\cf0 : extrForceDir - forces destination directory to exist\cf3\lang3081\f2 
\par 
\par \cf4\b Changed \cf3\b0 -
\par \lang1033\f0\tab\cf2\lang3081\strike\f2 SFXSlave\cf5\strike0\{linkID=160\}\cf3 : \cf2\strike TCustomZipSFX \cf5\strike0\{linkID=180\}\cf3\f0 ;
\par \tab\tab\tab link to external SFX engine
\par \lang1033\tab\cf2\strike DirEntry \cf5\strike0\{linkID=210\}\cf3 : now returns pZipDirEntry
\par \lang3081\f2 
\par   \f0\tab\f2 SortGrid (for Delphi 6 + ) change\f0 d\f2  to reduce exceptions in IDE
\par 
\par   \f0\tab\f2 Latest SFX support
\par 
\par 
\par \cf6\b Removed\cf3\b0  -
\par    \b properties\b0 
\par \tab MinZipDllVers\tab allways 1.73
\par \tab MinUnzDllVers   allways 1.73
\par      if \b INTERNAL_SFX\b0  is \ul not \ulnone defined
\par \tab SFXCaption\lang1033\f0\tab\lang3081\f2\tab moved to SFXSlave (TZipSFX)
\par \tab SFXCommandLine\tab moved to SFXSlave (TZipSFX)
\par \tab SFXDefaultDir\lang1033\f0\tab\lang3081\f2\tab moved to SFXSlave (TZipSFX)
\par \tab SFXIcon \tab\tab moved to SFXSlave (TZipSFX)
\par \tab SFXMessage \tab\tab moved to SFXSlave (TZipSFX)
\par \tab SFXOptions \tab\tab moved to SFXSlave (TZipSFX)
\par \tab SFXOverWriteMode \tab moved to SFXSlave (TZipSFX)
\par \tab SFXPath\lang1033\f0\tab\lang3081\f2  \tab moved to SFXSlave (TZipSFX)
\par \tab\tab 
\par   Directories
\par   \f0\tab\f2 VCL \lang1033\f0      \lang3081\tab\f2 - TZipMaster
\par  \f0\tab\f2 VCL\\Grid\f0\tab\f2 - SortGrid
\par   \f0\tab\f2 VCL\\SFX \f0\tab\f2 - TZipSFX
\par \lang1033\f0      Delphi will need to find these directories (add to source path)\lang3081\f2 
\par \lang1033 
\par 
\par 
\par }
110
Scribble110
Changes V1.72
Changes;New;


changes:000010
Writing



FALSE
85
{\rtf1\ansi\ansicpg1252\deff0\deflang3081{\fonttbl{\f0\fnil\fcharset0 Arial;}{\f1\fswiss Arial;}{\f2\fnil Arial;}}
{\colortbl ;\red128\green0\blue0;\red0\green128\blue0;\red0\green0\blue0;\red128\green0\blue128;}
\viewkind4\uc1\pard\cf1\b\fs32 Changes V1.72\cf0\f1\fs28\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \f2 
\par \cf4\b New\cf3\b0  -
\par \f0   \b Compiler Definitions\b0  \tab 
\par \tab OLDSTYLE\tab 
\par \tab\tab\tab forces inclusion of integrated SFX support\f2 
\par \f0   \b Component\b0 
\par \tab\cf2\strike TZipSFXSlave\cf1\strike0\{linkID=180\}\cf3 
\par \tab\tab\tab handles SFX operations
\par \f2 
\par   \b const\f0 ants
\par \b0\tab\f2  BUSY_ERROR -255\tab 
\par \f0\tab\tab\tab\f2 returned when trying to re-enter function
\par 
\par \f0   \b Events\b0\f2 
\par   \f0\tab\cf2\strike\f2 TAfterCallbackEvent \cf1\strike0\{linkID=1880\}\cf3 = Procedure(Sender: TObject; Var abort: boolean) Of Object;
\par   \f0\tab\f2 TTickEvent = Procedure(Sender: TObject) Of Object;
\par 
\par \f0   \b Functions\b0\f2 
\par   \f0\tab\f2 Busy: Boolean
\par \tab\tab\tab true if operation in progress (not fully implemented yet)
\par 
\par \f0\tab Protected\f2 
\par         \f0\tab\cf2\strike\f2 CallBack\cf1\strike0\{linkID=1870\}\cf3 (ActionCode, ErrorCode: integer; NameOrMsg: pChar;\f0  \f2 FileSize: cardinal;
\par \f0\tab\tab\tab\f2  ZRec: PZCallBackStruct): integer;
\par \tab\tab\tab called from ZCallback to handle callbacks
\par \tab\tab\tab will be called in VCL for some operations to handle ProcessMessages
\par \f0 
\par   \b Properties\b0\f2 
\par   \f0\tab\cf2\strike\f2 SpanOptions\cf1\strike0\{linkID=200\}\cf3 : SpanOpts
\par \tab\tab\tab controls handling disk/file spanning
\par \tab\tab spNoVolumeName,
\par \tab\tab\tab Stops setting Disk Volume Name, use numbered files instead
\par \tab\tab spCompatName,
\par \tab\tab\tab use alternate naming
\par \tab\tab spWipeFiles,
\par \tab\tab\tab wipe files from new removable media (was AddDiskSpanErase)
\par \tab\tab spTryFormat
\par \tab\tab\tab if spWipeFiles then try to do low level format instead of deleting files
\par \tab\tab\tab (was \cf2\strike FormatErase\cf1\strike0\{linkID=190\}\cf3 )
\par 
\par   \f0\tab\cf2\strike\f2 KeepFreeOnAllDisks\cf1\strike0\{linkID=580\}\cf3 : Cardinal
\par \tab\tab\tab free space on all disks (\cf2\strike KeepFreeOnDisk1 \cf1\strike0\{linkID=560\}\cf3 is add\f0 ed to it\f2 )
\par 
\par   \f0\tab\cf2\strike\f2 OnAfterCallback\cf1\strike0\{linkID=1880\}\cf3 : TAfterCallbackEvent
\par \tab\tab\tab called at end of callback processing
\par \tab\tab\tab - used to stop calling ProcessMessages in multithread apps
\par \tab\tab\tab - allows abort checking
\par \tab\tab\tab - debug callbacks
\par 
\par   \f0\tab\cf2\strike\f2 OnTick\cf1\strike0\{linkID=1750\}\cf3 : TTickEvent
\par \tab\tab\tab called during slow dll operations to show activity
\par 
\par        \f0\tab\cf2\strike\f2 SFXSlave\cf1\strike0\{linkID=160\}\cf3 : \cf2\strike TZipSFXBase\cf1\strike0\{linkID=180\}\cf3\f0 ;
\par \tab\tab\tab link to external SFX engine
\par \f2 
\par \cf4\b\f0 Removed
\par \tab\cf2\b0\strike FormatErase\cf1\strike0\{linkID=190\}\cf0 
\par \tab\tab\tab use SpanOptions spWipeFiles instead\cf4\b\tab\cf3\b0\f2 
\par \cf4\b Changed \cf3\b0 -
\par   \f0\tab\cf2\strike\f2 TProgressEvent \cf1\strike0\{linkID=1670\}\cf3 = Procedure(Sender: TObject; ProgrType: ProgressType; 
\par \f0\tab\tab\tab\tab\tab\tab\f2 Filename: String; \b FileSize: \ul cardinal\ulnone\b0 ) Of Object;
\par \tab\tab\tab\b FileSize \b0 now \b cardinal \b0 (correctly handles large zips)
\par 
\par \f0       To functions (not procedures) - return BUSY_ERROR if busy else ErrCode when finished\f2 
\par   \f0\tab\tab\f2 List
\par   \f0\tab\tab\f2 Add
\par   \f0\tab\tab\f2 AddStreamToFile
\par   \f0\tab\tab\f2 Extract
\par   \f0\tab\tab\f2 Delete
\par 
\par   \f0\tab\f2 SortGrid (for Delphi 6 + ) change\f0 d\f2  to reduce exceptions in IDE
\par 
\par   \f0\tab\f2 Latest SFX support
\par 
\par   Directories
\par   \f0\tab\f2 VCL \f0\tab\tab\f2 - TZipMaster
\par  \f0\tab\f2 VCL\\Grid\f0\tab\f2 - SortGrid
\par   \f0\tab\f2 VCL\\SFX \f0\tab\f2 - TZipSFXSlave
\par   
\par \f0  NOW COVERED BY \cf2\b\strike\f2 GNU LESSER GENERAL PUBLIC LICENSE\cf1\strike0\{linkID=70\}\cf3\b0 
\par }
120
Scribble120
{}
Hierarchy;



Done



FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss\fprq2\fcharset0 Arial;}{\f1\fswiss Arial;}}
{\colortbl ;\red0\green0\blue0;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\nowidctlpar\cf1\lang3081\b\f0\fs20 Hierarchy
\par \b0 
\par \cf0\uldb TObject\ulnone\v 1QH34P>main@DEL4VCL\cf2\v0\fs16 
\par \cf0\fs20    |
\par \uldb TPersistent\ulnone\v 1Y6LKC_>main@DEL4VCL\cf2\v0\fs16 
\par \cf0\fs20    |
\par \uldb TComponent\cf3\ulnone\v 1JIX1J6>main@DEL4VCL\cf2\v0\fs16 
\par \cf0\fs20    |
\par \cf3\strike TZipMaster\cf4\strike0\{linkID=10\}\cf0 
\par \pard\f1\fs24 
\par }
130
Scribble130
Busy
Busy;Methods;



Writing



FALSE
16
{\rtf1\ansi\ansicpg1252\deff0\deflang3081{\fonttbl{\f0\fnil\fcharset0 Arial;}{\f1\fswiss Arial;}{\f2\fswiss\fcharset0 Arial;}{\f3\fnil Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red255\green0\blue255;}
\viewkind4\uc1\pard\cf1\b\fs32 TZipMaster.Busy\{keepn\} \cf0\f1\fs28 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}
\par 
\par \cf0\f2 check operation still in progress
\par \f1 
\par \f2 function Busy: boolean;
\par 
\par \b\fs32 Description
\par \cf3\b0\f0\fs20\tab returns true if an operation is in progress.
\par 
\par \tab\cf4 Still in devolopement\cf3\f3 
\par 
\par 
\par }
140
Scribble140





Done



FALSE
8
{\rtf1\ansi\deff0{\fonttbl{\f0\fnil Arial;}{\f1\fswiss Arial;}}
{\colortbl ;\red0\green0\blue255;\red255\green0\blue255;}
\viewkind4\uc1\pard\sb75\cf1\lang3081\b\f0\fs20 Scope\cf0\f1\fs22 
\par \pard\sb75\sa115\tx165\tx425\cf2\b0\fs20\{bmc GrnBullet.bmp\}\tab\tab\cf0 Published
\par \pard\tx165\tx425\b\fs22 Accessibility
\par \pard\sb75\sa115\tx165\tx425\cf2\b0\fs20\{bmc BluBullet.bmp\}\tab\tab\cf0 Read-only
\par 
\par }
150
Scribble150
Properties
Properties;


:000030
Writing



FALSE
70
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fswiss\fcharset0 Arial;}{\f2\fnil\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red255\green0\blue255;\red128\green0\blue0;\red255\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster Properties\cf0\{keepn\} 
\par \pard\tx355\cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\tab\tab\ul Legend\ulnone\{linkID=140\}\cf3 
\par \pard\sb215\sa115\tx355\b\fs22 In TZipMaster
\par \pard\tx165\tx425\cf4\b0\fs20\{bmc GrnBullet.bmp\}\tab\tab\cf2\strike AddCompLevel\strike0\{linkID=280>main\}
\par \cf4\{bmc GrnBullet.bmp\}\f1\tab\tab\cf2\strike AddFrom\cf5\strike0\{linkID=290>main\}\cf4\tab\cf3\f0 
\par \cf4\{bmc GrnBullet.bmp\}\tab\tab\cf2\strike AddOptions\strike0\{linkID=310>main\}\cf3 
\par \cf4\{bmc GrnBullet.bmp\}\tab\tab\cf2\strike AddStoreSuffixes\strike0\{linkID=320>main\}\cf3 
\par \tab\tab\cf2\strike Cancel\strike0\{linkID=340>main\}\cf3 
\par \cf4\{bmc GrnBullet.bmp\}\tab\tab\cf2\strike CodePage\strike0\{linkID=350>main\}\cf3 
\par \cf4\{bmc GrnBullet.bmp\}\tab\tab\cf2\strike ConfirmErase\strike0\{linkID=370>main\}\cf3 
\par \tab\cf4\{bmc BluBullet.bmp\}\tab\cf2\strike Count\strike0\{linkID=380>main\}
\par \f1\tab\{bmc BluBullet.bmp\}\tab\strike DirEntry\cf5\strike0\{linkID=210>main\}\tab\cf3\f0 
\par \tab\cf4\{bmc BluBullet.bmp\}\tab\cf2\strike DirOnlyCount\strike0\{linkID=390>main\}\cf3 
\par \cf4\{bmc GrnBullet.bmp\}\tab\tab\cf2\strike DLLDirectory\strike0\{linkID=400>main\}\cf3 
\par \tab\cf4\{bmc BluBullet.bmp\}\tab\cf2\strike ErrCode\strike0\{linkID=420>main\}\cf3 
\par \cf4\{bmc GrnBullet.bmp\}\tab\tab\cf2\strike ExtrBaseDir\strike0\{linkID=450>main\}\cf3 
\par \cf4\{bmc GrnBullet.bmp\}\tab\tab\cf2\strike ExtrOptions\strike0\{linkID=470>main\}
\par \f1\{bmc GrnBullet.bmp\}\tab\tab\strike FormatErase\cf5\strike0\{linkID=190>main\}\cf6  *\strike removed\cf5\strike0\{linkID=110>main\}\cf3\f0 
\par \cf4\{bmc GrnBullet.bmp\}\tab\tab\cf2\strike FSpecArgs\strike0\{linkID=480>main\}\cf3 
\par \cf4\{bmc GrnBullet.bmp\}\tab\tab\cf2\strike FSpecArgsExcl\strike0\{linkID=490>main\}\cf3 
\par \tab\cf4\{bmc BluBullet.bmp\}\tab\cf2\strike FullErrCode\strike0\{linkID=500>main\}\cf3 
\par \tab\tab\cf2\strike Handle\strike0\{linkID=520>main\}\cf3 
\par \cf4\{bmc GrnBullet.bmp\}\tab\tab\cf2\strike HowToDelete\strike0\{linkID=530>main\}\cf3 
\par \tab\cf4\{bmc BluBullet.bmp\}\tab\cf2\strike IsSpanned\strike0\{linkID=540>main\}\cf3 
\par \cf4\{bmc GrnBullet.bmp\}\tab\tab\cf2\strike KeepFreeOnDisk1\strike0\{linkID=560>main\}\cf3 
\par \cf4\{bmc GrnBullet.bmp\}\tab\tab\cf2\strike KeepFreeOn\f1 All\f0 Disk\f1 s\strike0\f0\{linkID=580>main\}\cf3 
\par \tab\cf4\{bmc BluBullet.bmp\}\tab\cf2\strike Message\strike0\{linkID=600>main\}\cf3 
\par \cf4\{bmc GrnBullet.bmp\}\tab\tab\cf2\strike MaxVolumeSize\strike0\{linkID=620>main\}\cf3 
\par \cf4\{bmc GrnBullet.bmp\}\tab\tab\cf2\strike MinFreeVolumeSize\strike0\{linkID=630>main\}\cf3 
\par \pard\f1       \cf4  \cf2\strike\f2\fs24 NotMainThread\cf5\strike0\{linkID=640>main\}\cf3\f0\fs20 
\par \pard\tx165\tx425\cf4\{bmc GrnBullet.bmp\}\tab\tab\cf2\strike Password\strike0\{linkID=650>main\}\cf3 
\par \cf4\{bmc GrnBullet.bmp\}\tab\tab\cf2\strike PasswordReqCount\strike0\{linkID=670>main\}
\par \cf4\f1\{bmc GrnBullet.bmp\}\cf2\tab\tab\strike RootDir\cf5\strike0\{linkID=680>main\}\cf3\f0 
\par \cf4\{bmc GrnBullet.bmp\}\tab\tab\cf2\strike SFXCaption\strike0\{linkID=690>main\}\cf3 
\par \cf4\{bmc GrnBullet.bmp\}\tab\tab\cf2\strike SFXCommandLine\strike0\{linkID=700>main\}\cf3 
\par \cf4\{bmc GrnBullet.bmp\}\tab\tab\cf2\strike SFXDefaultDir\strike0\{linkID=710>main\}\cf3 
\par \cf4\{bmc GrnBullet.bmp\}\tab\tab\cf2\strike SFXIcon\strike0\{linkID=720>main\}\cf3 
\par \cf4\{bmc GrnBullet.bmp\}\tab\tab\cf2\strike SFXMessage\strike0\{linkID=730>main\}\cf3 
\par \cf1\tab\cf4\{bmc BluBullet.bmp\}\tab\cf2\strike SFXOffset\strike0\{linkID=740>main\}\cf0 
\par \cf4\{bmc GrnBullet.bmp\}\tab\tab\cf2\strike SFXOptions\strike0\{linkID=750>main\}\cf3 
\par \cf4\{bmc GrnBullet.bmp\}\tab\tab\cf2\strike SFXOverWriteMode\strike0\{linkID=760>main\}\cf3 
\par \cf4\{bmc GrnBullet.bmp\}\tab\tab\cf2\strike SFXPath\strike0\{linkID=770>main\}\cf3 
\par \cf4\{bmc GrnBullet.bmp\}\tab\tab\cf2\strike SFX\f1 Slave\strike0\f0\{linkID=160>main\}\f1  \cf5 *\cf2\strike new \cf5\strike0\{linkID=110>main\}\cf2\f0 
\par \cf4\{bmc GrnBullet.bmp\}\tab\tab\cf2\strike S\f1 panOptions\cf5\strike0\{linkID=200\}   *\cf2\strike new \cf5\strike0\{linkID=110>main\}\cf1\f0 
\par \tab\cf4\{bmc BluBullet.bmp\}\tab\cf2\strike SuccessCnt\strike0\{linkID=780>main\}\cf0 
\par \cf4\{bmc GrnBullet.bmp\}\tab\tab\cf2\strike TempDir\strike0\{linkID=790>main\}\cf1 
\par \tab\cf4\{bmc BluBullet.bmp\}\tab\cf2\strike TotalSizeToProcess\strike0\{linkID=800>main\}\cf1\fs16 
\par \cf4\fs20\{bmc GrnBullet.bmp\}\tab\tab\cf2\strike Trace\strike0\{linkID=810>main\}\cf0 
\par \cf4\{bmc GrnBullet.bmp\}\tab\tab\cf2\strike Unattended\strike0\{linkID=830>main\}\cf0 
\par \tab\cf4\{bmc BluBullet.bmp\}\tab\cf2\strike UnzBusy\strike0\{linkID=850>main\}\cf0 
\par \tab\cf4\{bmc BluBullet.bmp\}\tab\cf2\strike UnzVers\strike0\{linkID=860>main\}\cf0 
\par \cf4\{bmc GrnBullet.bmp\}\tab\tab\cf2\strike Verbose\strike0\{linkID=890>main\}\cf0 
\par \tab\cf4\{bmc BluBullet.bmp\}\tab\cf2\strike ZipBusy\strike0\{linkID=910>main\}\cf0 
\par \tab\cf4\tab\cf2\strike ZipComment\strike0\{linkID=920>main\}\cf0 
\par \tab\cf4\{bmc BluBullet.bmp\}\tab\cf2\strike ZipContents\strike0\{linkID=930>main\}\cf0 
\par \tab\cf4\{bmc BluBullet.bmp\}\tab\cf2\strike ZipEOC\strike0\{linkID=1000>main\}\cf1\fs16 
\par \cf4\fs20\{bmc GrnBullet.bmp\}\tab\tab\cf2\strike ZipFileName\strike0\{linkID=1020>main\}\cf0 
\par \tab\cf4\{bmc BluBullet.bmp\}\tab\cf2\strike ZipFileSize\strike0\{linkID=1030>main\}\cf1\fs16 
\par \cf0\fs20\tab\cf4\{bmc BluBullet.bmp\}\tab\cf2\strike ZipSOC\strike0\{linkID=1040>main\}\cf1\fs16 
\par \cf0\fs20\tab\cf4\{bmc BluBullet.bmp\}\tab\cf2\strike ZipStream\strike0\{linkID=1060>main\}\cf1\fs16 
\par \cf0\fs20\tab\cf4\{bmc BluBullet.bmp\}\tab\cf2\strike ZipVers\strike0\{linkID=1080>main\}\cf1\fs16 
\par \cf3 
\par \pard\sb75\sa115\tx165\tx425\cf0\b\fs22 Derived from TComponent
\par \pard\sa115\tx165\tx425\cf4\b0\fs20\tab\tab\cf2\strike Name\strike0\{link=!AL(`TComponent_Name',1,`',`main')\}\cf0 
\par \cf4\tab\tab\cf2\strike Tag\strike0\{link=!AL(`TComponent_Tag',1,`',`main')\}\cf0 
\par 
\par 
\par }
160
Scribble160
SFXSlave
Properties;SFX;SFXSlave;TCustomZipSFX;TZipSFX;


sfx:000010
Writing


SFXSlave;TZipMaster_SFXSlave
TRUE
18
{\rtf1\ansi\ansicpg1252\deff0\deflang3081{\fonttbl{\f0\fnil\fcharset0 Arial;}{\f1\fswiss Arial;}{\f2\fnil\fcharset0 Times New Roman;}{\f3\fnil Arial;}{\f4\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\b\fs32 TZipMaster.SFXSlave\cf0\f1\fs28\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf0\f2\fs24\tab\cf2\ul See also:\cf3\ulnone\{linkID=170\}\cf0  
\par \cf4\f3\fs20 
\par \f0 links external SFX engine
\par \f3 
\par \b property \b0\f0 SFXSlave: \cf0\f4 TCustomZipSFX\cf3\f0\{linkID=180\}\cf4\f3 ;
\par 
\par \b\fs24 Description
\par \f0   \b0\fs20 Links to the SFX engine
\par 
\par \f3 
\par 
\par 
\par 
\par 
\par }
170
Scribble170
TCustomSFX see also




Writing



FALSE
5
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil Arial;}{\f1\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue0;\red0\green128\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\f0\fs20 
\par \cf2\lang3081\strike\f1 TCustomZipSFX\cf3\strike0\{linkID=180>main\}\cf1\lang1033\f0 
\par }
180
Scribble180
TCustomZipSFX
Classes;SFX;TCustomZipSFX;TZipSFX;


sfx:000020
Writing


TCustomZipSFX;SFX;TZipSFX
FALSE
12
{\rtf1\ansi\ansicpg1252\deff0\deflang3081{\fonttbl{\f0\fnil\fcharset0 Arial;}{\f1\fswiss Arial;}{\f2\fswiss\fcharset0 Arial;}{\f3\fnil Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\b\fs32 TCustomZipSFX \f1\fs28\{keepn\} \cf0 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb35\cf0 AddCompLevel can be used to set the compression level when using Zip.
\par \pard\sb115\sa115\b\f2 class TCustomZipSFX\b0\f1 ;
\par \pard\sa195\b\fs24 Description:
\par \b0\f2\fs20 base class for the TZipSFX conversion component by Markus Stephany\f1 
\par \pard\cf3\f3 
\par 
\par 
\par }
190
Scribble190
FormatErase
AddDiskSpanErase;AddOptions;FormatErase;



Writing



FALSE
14
{\rtf1\ansi\ansicpg1252\deff0\deflang3081{\fonttbl{\f0\fnil\fcharset0 Arial;}{\f1\fswiss Arial;}{\f2\fswiss\fcharset0 Arial;}{\f3\fnil Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red255\green0\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\b\fs32 TZipMaster.FormatErase\cf0\f1\fs28\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb35\cf0\f2 Specifies erase type for spanned disk.\f1 
\par \pard\sb115\sa115\b property\b0  \f2 FormatErase\f1 : Boolean;\f2  \cf4\b REMOVED
\par \cf0\b0 Replaced by\cf4\b  \cf0\b0 spTryFormat in SpanOptions\f1 
\par \pard\sa195\b\fs24 Description:
\par \pard\b0\fs20 If you set this to \b True\b0 , it will \f2 format a disk if AddDiskSpanErase is specified in \cf2\strike AddOptions\cf5\strike0\{linkID=310\}\cf0 , otherwise it will delete all files.\f1 
\par 
\par \f3 
\par 
\par 
\par }
200
Scribble200
SpanOptions
AddOptions;Multi Volume Zip Parts;Properties;SpanOptions;


properties:000340
Writing



FALSE
25
{\rtf1\ansi\ansicpg1252\deff0\deflang3081{\fonttbl{\f0\fnil\fcharset0 Arial;}{\f1\fswiss Arial;}{\f2\fswiss\fcharset0 Arial;}{\f3\fswiss\fprq2\fcharset0 Arial;}{\f4\fnil Arial;}}
{\colortbl ;\red0\green0\blue255;\red128\green0\blue0;\red0\green128\blue0;\red0\green0\blue0;\red255\green0\blue0;}
\viewkind4\uc1\pard\cf1\b\fs32 TZipMaster.SpanOptions\cf2\{keepn\}\cf1  \cf0\f1\fs28 
\par \cf3\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf4 
\par \pard\sb35\cf0\f2 Specifies options for spanned disk operations\f1 
\par \pard\sb115\sa115\b property\b0  \f2 SpanOptions: SpanOpts;\cf5\b 
\par \cf0\b0 New 1.72\f1 
\par \pard\sa195\b\fs24 Description:
\par \pard\b0\fs20 This property is used to modify the default action of\f2  the Disk spanning operations\f1 . 
\par If you want an option to be \b True\b0 , you need to add it to the Set.
\par \f2 The options (spNoVolumeName, spCompatName) may need to be the same for writing and reading zips\f1 
\par 
\par \i Example: ZipMaster1.\f2 Span\f1 Options:=[\f2 spNoVolume\f1 Name,\f2 spWipFiles\f1 ];
\par \i0\f3 
\par \trowd\trgaph105\trleft-6\cellx1985\cellx8355\pard\intbl\b Value\b0\cell\b Meaning\b0\cell\row
\intbl spNoVolumeName\cell If \b True\b0  then will use numbered files on removable drives \cell\row
\intbl spCompatName\cell If \b True \b0 then uses names of the form name.zip + name.z01 ... \cell\row
\intbl spWipeFiles\cell If \b True\b0 , removes the files from the removable drive before writing.     \cf5\b WARNING\cf0\b0 : Deletes all files and Directories \cell\row
\intbl spTryFormat\cell If \b True \b0 and spWipeFiles, try to Format removable disk.    \cf5\b WARNING\cf0\b0 : Wipes all files - non-recoverable\cell\row
\pard\sa195\b\f2\fs24  
\par \f1 
\par \pard\cf4\b0\f4\fs20 
\par 
\par 
\par }
210
Scribble210
DirEntry property
DirEntry;Properties;Property;



Writing


DirEntry;DirEntry_Property;TZipMaster_DirEntry
FALSE
24
{\rtf1\ansi\ansicpg1252\deff0\deflang3081{\fonttbl{\f0\fswiss Arial;}{\f1\fswiss\fcharset0 Arial;}{\f2\fnil\fcharset0 Times New Roman;}{\f3\fnil\fcharset0 Arial;}{\f4\fnil Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\f0\fs28 TZipMaster.\f1 DirEntry\cf0\b\f0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf0\f2\fs24\tab\cf2\ul See also:\cf3\ulnone\{linkID=220\}\cf0  
\par 
\par \cf4\f3\fs20 ZipContents entry at index
\par \f4 
\par \b property \b0 DirEntry[idx: integer\f3 ]\f4 : \lang1033\f3 p\lang3081\f4 ZipDirEntry;
\par 
\par \b\fs24 Description\b0\fs20 
\par 
\par \f3 returns a pointer to \cf2\strike ZipDirEntry\cf3\strike0\{linkID=940\}\cf4  from the \cf2\strike ZipContents\cf3\strike0\{linkID=930\}\cf4  list
\par 
\par \b Example\b0 
\par \tab\i // read filenames
\par \tab for i:=0 to ZipMaster1.Count-1 do
\par \tab   Memo1.Lines.Add(ZipMaster1.DirEntry[i]^.Filename);\f4 
\par \i0 
\par Run-time only
\par 
\par Read-only
\par \cf0 
\par 
\par }
220
Scribble220
DirEntry see also




Writing



FALSE
8
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Times New Roman;}{\f1\fnil Arial;}}
{\colortbl ;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\strike\f0\fs24 ZipDirEntry\cf2\strike0\{linkID=940>main\}\cf0 
\par \cf1\strike ZipContents\cf2\strike0\{linkID=930>main\}\cf0 
\par \lang1033 
\par \cf3\f1\fs20 
\par 
\par }
230
Scribble230
Methods
Methods;


:000050
Imported


TZipMaster_Component_Properties
FALSE
37
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red128\green0\blue0;\red255\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster Methods\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb215\sa115\b\fs22 In TZipMaster
\par \pard\cf2\b0\strike\fs20 Add\strike0\{linkID=1090>main\}\cf0 
\par \cf2\strike AddStreamToFile\strike0\{linkID=1110>main\}\cf0 
\par \cf2\strike AddStreamToStream\strike0\{linkID=1120>main\}\cf0 
\par \cf2\strike AppendSlash\strike0\{linkID=1140>main\}\cf0 
\par \cf2\strike\f1 Busy\strike0\f0\{linkID=130>main\}\f1  \tab\tab *\strike New\cf4\strike0\{linkID=110\}\cf0\f0 
\par \cf2\strike ConvertSFX\strike0\{linkID=1150>main\}\cf0 
\par \cf2\strike ConvertZIP\strike0\{linkID=1170>main\}\cf0 
\par \cf2\strike CopyFile\strike0\{linkID=1190>main\}\cf0 
\par \cf2\strike CopyZippedFiles\strike0\{linkID=1210>main\}\cf0 
\par \cf2\strike Delete\strike0\{linkID=1230>main\}\cf0 
\par \cf2\strike EraseFile\strike0\{linkID=1240>main\}\cf0 
\par \cf2\strike Extract\strike0\{linkID=1250>main\}\cf0 
\par \cf2\strike ExtractFileToStream\strike0\{linkID=1260>main\}\cf0 
\par \cf2\strike ExtractStreamToStream\strike0\{linkID=1280>main\}
\par \strike\f1 FullVersionString\cf4\strike0\{linkID=250>main\}\cf2\tab\cf5\f0 
\par \cf2\strike GetAddPassword\strike0\{linkID=1300>main\}\cf0 
\par \cf2\strike GetExtrPassword\strike0\{linkID=1320>main\}\cf0 
\par \cf2\strike GetPassword\strike0\{linkID=1340>main\}\cf0 
\par \cf2\strike List\strike0\{linkID=1390>main\}\cf0 
\par \cf2\strike Load_Unz_Dll\strike0\{linkID=1400>main\}\f1\tab\tab\cf0\f0 
\par \cf2\strike Load_Zip_Dll\strike0\{linkID=1410>main\}\f1\tab\tab\cf0\f0 
\par \cf2\strike MakeTempFileName\strike0\{linkID=1420>main\}
\par \strike\f1 PathConcat\cf4\strike0\{linkID=240\}  \cf2  \tab *\strike New\cf4\strike0\{linkID=110\}\cf0\f0 
\par \cf2\strike ReadSpan\strike0\{linkID=1430>main\}\cf0 
\par \cf2\strike Rename\strike0\{linkID=1450>main\}\cf0 
\par \cf2\strike ShowZipMessage\strike0\{linkID=1460>main\}\cf0 
\par \cf2\strike Unload_Unz_Dll\strike0\{linkID=1480>main\}\cf0 
\par \cf2\strike Unload_Zip_Dll\strike0\{linkID=1490>main\}\f1\tab\cf0\f0 
\par \cf2\strike WriteSpan\strike0\{linkID=1500>main\}\cf0 
\par 
\par 
\par }
240
Scribble240
PathConcat
Methods;PathConcat;



Writing



FALSE
16
{\rtf1\ansi\ansicpg1252\deff0\deflang3081{\fonttbl{\f0\fnil\fcharset0 Arial;}{\f1\fnil Arial;}{\f2\fswiss Arial;}}
{\colortbl ;\red0\green0\blue255;\red128\green0\blue0;\red0\green0\blue0;\red0\green128\blue0;}
\viewkind4\uc1\pard\cf1\b\fs32 PathConcat\cf2\{keepn\}\cf3\b0\f1\fs20 
\par \cf4\strike\f2 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \f1 
\par \f0 Global Function to join sections of path
\par 
\par function PathConcat(first, second: string): string;
\par 
\par \b\fs28 Description\b0\fs20 
\par   \tab appends second to first ensuring single backslash.
\par \tab ie
\par \tab first + second = first\\second
\par \tab first\\ + \\second = first\\second
\par \f1 
\par }
250
Scribble250
FullVersionString
FullVersionString;Methods;



Writing


TZipMaster_FullVersion
FALSE
15
{\rtf1\ansi\ansicpg1252\deff0\deflang3081{\fonttbl{\f0\fnil\fcharset0 Arial;}{\f1\fnil Arial;}{\f2\fswiss Arial;}{\f3\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\b\fs32 TZipMaster.\f1 FullVersionString\cf0\f2\fs28\{keepn\} 
\par \pard\tx355\cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf1\tab\cf3 
\par \pard\sb35\tx355\cf0 The \f3 FullVersionString\f2  method \f3 returns the version information for ZipMaster and the dlls.\f2 
\par \pard\sb115\sa115\tx355\b\f3 function\b0\f2  \f3 FullVersionString\f2 : \b String\b0 ;
\par \pard\sa195\tx355\b\fs24 Description:
\par \f3 New in 1.70\f2 
\par \pard\tx355\b0\f3\fs20 Returns the full version information of the ZipMaster component and the dlls if they are loaded.
\par This includes the version numbers.\f2 
\par 
\par \pard\cf3\f1 
\par 
\par 
\par }
260
Scribble260





Imported



FALSE
6
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red255\green0\blue255;}
\viewkind4\uc1\pard\lang3081\b\f0\fs22  Scope
\par \pard\sb75\sa115\tx165\tx425\cf1\b0\fs20\{bmc GrnBullet.bmp\}\tab\tab\cf0 Published
\par 
\par }
270
Scribble270
Events
Events;


:000040
Imported



FALSE
30
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fswiss\fcharset0 Arial;}{\f2\fnil\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red255\green0\blue255;\red255\green0\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster Events\cf0\{keepn\} 
\par \pard\tx355\cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\tab\tab\ul Legend\ulnone\{linkID=260\}\cf3 
\par \pard\sb215\sa115\tx355\b\fs22 In TZipMaster:
\par \pard\tx165\tx425\cf4\b0\fs20\{bmc GrnBullet.bmp\}\tab\tab\cf2\strike OnCopyZipOverwrite\strike0\{linkID=1530>main\}\cf0 
\par \cf4\{bmc GrnBullet.bmp\}\tab\tab\cf2\strike OnCRC32Error\strike0\{linkID=1550>main\}\cf0 
\par \cf4\{bmc GrnBullet.bmp\}\tab\tab\cf2\strike OnDirUpdate\strike0\{linkID=1560>main\}\cf0 
\par \cf4\{bmc GrnBullet.bmp\}\tab\tab\cf2\strike OnExtractOverwrite\strike0\{linkID=1570>main\}\cf0 
\par \cf4\{bmc GrnBullet.bmp\}\tab\tab\cf2\strike OnExtractSkipped\strike0\{linkID=1580>main\}\cf0 
\par \cf4\{bmc GrnBullet.bmp\}\tab\tab\cf2\strike OnFileComment\strike0\{linkID=1590>main\}\cf0 
\par \cf4\{bmc GrnBullet.bmp\}\tab\tab\cf2\strike OnGetNextDisk\strike0\{linkID=1600>main\}\cf0 
\par \cf4\{bmc GrnBullet.bmp\}\tab\tab\cf2\strike OnMessage\strike0\{linkID=1610>main\}\cf0 
\par \cf4\{bmc GrnBullet.bmp\}\tab\tab\cf2\strike OnNewName\strike0\{linkID=1630>main\}\cf0 
\par \cf4\{bmc GrnBullet.bmp\}\tab\tab\cf2\strike OnPasswordError\strike0\{linkID=1650>main\}\cf0 
\par \cf4\{bmc GrnBullet.bmp\}\tab\tab\cf2\strike OnProgress\strike0\{linkID=1670>main\}\f1  \cf5 Depreciated\f0 
\par \pard\cf4\{bmc GrnBullet.bmp\}\tab\f1             \cf2\strike\f2\fs24 OnProgressDetails\cf6\strike0\{linkID=1690>main\}\cf0\f0\fs20 
\par \pard\tx165\tx425\cf4\{bmc GrnBullet.bmp\}\tab\tab\cf2\strike OnSetNewName\strike0\{linkID=1720>main\}\cf0 
\par \cf4\{bmc GrnBullet.bmp\}\tab\tab\cf2\strike OnStatusDisk\strike0\{linkID=1830>main\}
\par \cf4\{bmc GrnBullet.bmp\}\tab\tab\cf2\strike\f1 OnTick\cf6\strike0\{linkID=1750>main\} 
\par \cf4\f0\{bmc GrnBullet.bmp\}\lang1033\f1\tab\tab\cf2\strike OnTotalProgress\lang3081   \cf6\strike0\{linkID=1790>main\}\cf2 *\strike new\cf6\strike0\{linkID=100\}
\par \cf4\f0\{bmc GrnBullet.bmp\}\lang1033\f1\tab\tab\cf2\strike OnItemProgress\lang3081   \cf6\strike0\{linkID=1810>main\}\cf2 *\strike new\cf6\strike0\{linkID=100\}\cf2\tab\cf0\f0 
\par \pard\cf4\{bmc GrnBullet.bmp\}\f1                   \cf2\strike\f2\fs24 OnZipDialog\cf6\strike0\{linkID=1770>main\}\f1\fs20 
\par \pard\tx165\tx425\cf0 Special event for Threads\cf2\tab\f0 
\par \cf4\{bmc GrnBullet.bmp\}\tab\tab\cf2\strike\f1 OnCheckTerminate\cf6\strike0\{linkID=1880>main\} 
\par \cf0 Event for multiple languages\cf4 
\par \f0\{bmc GrnBullet.bmp\}\lang1033\f1\tab\tab\cf2\strike OnZipStr\cf6\strike0\{linkID=1760>main\}\lang3081   \cf2 *\strike new\cf6\strike0\{linkID=100\}
\par \cf0\f0 
\par 
\par }
280
Scribble280
AddCompLevel
AddCompLevel;Property;


properties:000020
Done


AddCompLevel;AddCompLevel_Property;TZipMaster_AddCompLevel
FALSE
10
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.AddCompLevel\{keepn\} \cf0 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb35\cf0 AddCompLevel can be used to set the compression level when using Zip.
\par \pard\sb115\sa115\b property\b0  AddCompLevel: Integer;
\par \pard\sa195\b\fs24 Description:
\par \pard\b0\fs20 Compression Level.  Range 0 - 9, where 9 is the tightest compression.  2 or 3 is a good trade-off if you need more speed. Level 0 will just store files without compression. I recommend leaving this at 9 in most cases.
\par 
\par }
290
Scribble290
AddFrom
AddFrom;Property;


properties:000030
Testing


AddFrom;AddFrom_Property;TZipMaster_AddFrom
FALSE
12
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fswiss\fcharset0 Arial;}{\f2\fnil\fcharset0 Times New Roman;}{\f3\fnil\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;\red255\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.AddFrom\{keepn\} \cf0 
\par \pard\sb35\cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\f1\tab\cf0\f2\fs24\tab\cf2\ul See also:
\par \cf3\ulnone\f0\fs20\{linkID=300\}
\par \cf0 Add\f1 From \f0 can be used to set the \f1 Date for filtering files to add to a \f0 Zip.
\par \pard\sb115\sa115\b property\b0  Add\f1 From\f0 : \f1 TDate\f0 ;
\par \cf4\f3\fs18 New in version 1.70\cf0\f0\fs20 
\par \pard\sa195\b\fs24 Description:
\par \pard\b0\f1\fs20 The date used when the \cf2\strike AddOption\cf3\strike0\{linkID=310\}\cf0  - AddFromDate is set, files dated on or after this date can be selected.\f0 
\par 
\par }
300
Scribble300
AddFrom see also




Writing



FALSE
8
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Times New Roman;}{\f1\fnil Arial;}}
{\colortbl ;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\strike\f0\fs24 AddOptions\cf2\strike0\{linkID=310>main\}\cf0 
\par \cf1\strike FSpecArgs\cf2\strike0\{linkID=480>main\}\cf0 
\par \cf3\lang1033\f1\fs20 
\par 
\par 
\par }
310
Scribble310
AddOptions
AddArchiveOnly;AddDirNames;AddDiskSpan;AddDiskSpanErase;AddEncrypt;AddForceDest;AddForceDOS;AddFreshen;AddFromDate;AddHiddenFiles;AddMove;AddOptions;AddOpts;AddRecurseDirs;AddResetArchive;AddSafe;AddSeparateDirs;AddUpdate;AddVolume;AddZipTime;Multi Volume Zip Parts;Properties;Property;


properties:000040
Done


AddOptions;AddOptions_Property;TZipMaster_AddOptions
FALSE
36
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss\fprq2\fcharset0 Arial;}{\f1\froman\fprq2\fcharset0 Times New Roman;}{\f2\fswiss Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red128\green128\blue0;\red128\green0\blue0;\red255\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.AddOptions\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb35\cf0 AddOptions is a Set of options to modify the default action of the Add method.
\par \pard\sb115\sa115\b property\b0  AddOptions: AddOpts;
\par \pard\sa195\b\fs24 Description:
\par \pard\b0\fs20 This property is used to modify the default action of the \cf2\strike Add\strike0\{linkID=1090\}\cf0  method. If you want an option to be \b True\b0 , you need to add it to the Set.
\par 
\par \i Example: ZipMaster1.AddOptions:=[AddDirNames,AddRecurseDirs];
\par \i0 
\par \trowd\trgaph105\trleft-6\cellx1985\cellx8355\pard\intbl\b Value\b0\cell\b Meaning\b0\cell\row
\b\trowd\trgaph105\trleft-6\cellx1985\cellx8355\intbl AddArchiveOnly\b0\cell If \b True\b0  then only files with their archive bit set will be added to the zip file. \cf4\b NOTE:\cf0\b0  When combined with AddFreshen or AddUpdate both conditions must be met i.e. the files to add must be newer also. \cell\row
\b\trowd\trgaph105\trleft-6\cellx1985\cellx8355\intbl AddResetArchive\b0\cell Clears the archive bit after a successful Zip Add action. It\f1 '\f0 s not necessary to set AddArchiveOnly too. \cell\row
\cf5\trowd\trgaph105\trleft-6\cellx1985\cellx8355\intbl\{target=adn260\}\cf0\b AddDirNames\b0\cell If \b True\b0 , saves the pathname with each filename. Drive ID\f1 '\f0 s are never stored in Zip file directories. Unless \cf2\strike AddSeparateDirs\cf5\strike0\{linkTarget=asd260\}\cf0  is also true, empty directories are not stored. \cf4\b NOTE:\cf0\b0  the root directory name is never stored in a pathname; in other words, the first character of a pathname stored in the zip file's directory will never be a slash. \cell\row
\b\trowd\trgaph105\trleft-6\cellx1985\cellx8355\intbl AddForceDOS\b0\cell If \b True\b0 , force all filenames that go into the Zip file to meet the DOS 8.3 restriction. If \b False\b0 , long filenames are supported. \cell\row
\b\trowd\trgaph105\trleft-6\cellx1985\cellx8355\intbl AddZipTime\b0\cell If \b True\b0 , set Zip timestamp to that of the newest file in the archive. \cell\row
\b\trowd\trgaph105\trleft-6\cellx1985\cellx8355\intbl AddRecurseDirs\b0\cell If \b True\b0 , subdirectories below EACH given \cf2\ul file specification\ulnone\{linkID=1840\}\cf0  will be included in the Zip archive. Defaults to \b False\b0 . \cf4\b NOTE:\cf0\b0  It is also possible to override this option by setting some special characters at the beginning of a file specification look for this at the \cf2\strike FSpecArgs\strike0\{linkID=480\}\cf0  property. \cf6\b WARNING:\cf0\b0  This is potentially dangerous if the user does this from the root directory. The hard drive may fill up with a huge Zip file!\cell\row
\b\trowd\trgaph105\trleft-6\cellx1985\cellx8355\intbl AddHiddenFiles  \b0\cell If \b True\b0 , files with their Hidden or System attributes set will be included in the Add operation. \cell\row
\b\trowd\trgaph105\trleft-6\cellx1985\cellx8355\intbl AddVolume\b0\cell If \b True\b0 , will add the volume (drive) name of the first filespec - it must include drive letter\cell\row
\b\trowd\trgaph105\trleft-6\cellx1985\cellx8355\intbl AddEncrypt \b0\cell If \b True\b0 , add the files with standard zip encryption.  You will be prompted for the password to use. \cell\row
\cf5\trowd\trgaph105\trleft-6\cellx1985\cellx8355\intbl\{target=asd260\}\cf0 AddSeparateDirs\cell if \b True\b0  , add separate entries to the zip archive that will hold the name of each directory even if empty (No data is stored for these entries). \cf4\b NOTE:\cf0\b0  - To use this, you must also have \cf2\strike AddDirNames \cf5\strike0\{linkTarget=adn260\}\cf0 set. \cf4\b Also see\cf0\b0 : \cf2\strike UseDirOnlyEntries\cf5\strike0\{linkID=870\}\cf0\cell\row
\b\trowd\trgaph105\trleft-6\cellx1985\cellx8355\intbl AddFromDate\b0\cell If \b True\b0 , only add files created on or after AddFrom\cell\row
\b\trowd\trgaph105\trleft-6\cellx1985\cellx8355\intbl AddForceDest\b0\cell If \b True\b0 ; force existence of destination directory\cell\row
\b\trowd\trgaph105\trleft-6\cellx1985\cellx8355\intbl AddSafe\b0\cell If \b True \b0 and the zip file exists, will build to temporary file first\cell\row
\b\trowd\trgaph105\trleft-6\cellx1985\cellx8355\intbl AddDiskSpan\b0\cell if \b True\b0 , add the files and than write them to one or more disks. \cf4\b NOTE:\cf0\b0  - This can not be combined with AddFreshen or AddUpdate.  - Diskettes will not be formatted or erased!  - If on disk is less space available than \cf2\strike MinFreeVolumeSize\strike0\{linkID=630\}\cf0  you will be prompted for a new one. \cell\row
\b\trowd\trgaph105\trleft-6\cellx1985\cellx8355\intbl AddDiskSpanErase\b0\cell if \b True\b0 , add the files and than write them to one or more disks. \cf4\b NOTE:\cf0\b0  - This can not be combined with AddFreshen or AddUpdate.  - All used diskettes will be erased first! ( Depending on the value of \cf2\strike ConfirmErase\strike0\{linkID=370\}\cf0  you will be asked first if it\f1 '\f0 s ok to do so.) Sets spWipeFiles in \cf2\strike SpanOptions\cf5\strike0\{linkID=200\}\cf0\cell\row
\trowd\trleft104\cellx8195\pard\intbl\cf4\b NOTE:\cf0\b0  You can not have more than one of the following three options set to \f1 '\b\f0 True\b0\f1 '\f0 .  If all three are \b False\b0 , then you get a standard \f1 '\f0 Add\f1 '\f0 : all files in the \cf2\ul file specifications\ulnone\{linkID=1840\}\cf0  will be added to the archive regardless of their date/time stamp.  This is also the default. \cell\row
\trowd\trgaph105\trleft-6\cellx1985\cellx8355\pard\intbl\b AddMove \b0\cell If \b True\b0 , after adding to archive, delete original file. Potentially dangerous.  Use with caution! \cell\row
\trowd\trleft104\cellx8195\pard\intbl\cf4\b NOTE:\cf0\b0  Freshen and Update normally work on pre-existing archives. Freshen cannot create a new archive. \cell\row
\trowd\trgaph105\trleft-6\cellx1985\cellx8355\pard\intbl\b AddFreshen\b0\cell If \b True\b0 , add newer files to archive (only for files that are already in the archive). \cell\row
\b\trowd\trgaph105\trleft-6\cellx1985\cellx8355\intbl AddUpdate \b0\cell If \b True\b0 , add newer files to archive (but, any file in an \cf2\ul file specification\ulnone\{linkID=1840\}\cf0  that isn't already in the archive will also be added). \cell\row
\pard 
\par \f1 
\par \f2 
\par }
320
Scribble320
AddStoreSuffixes
AddStoreSuffixes;Property;


properties:000050
Writing


AddStoreSuffixes;AddStoreSuffixes_Property;TZipMaster_AddStoreSuffixes
FALSE
33
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.AddStoreSuffixes\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb35\cf0 AddStoreSuffixes is a Set of options to modify the default action of the Add method.
\par \pard\sb115\sa115\b property\b0  AddStoreSuffixes: AddStoreExts;
\par \pard\sa195\b\fs24 Description:
\par \pard\sb35\b0\fs20 AddStoreSuffixes can be used to set the file extensions for files that will be stored in the zip file in stead of the normal deflate.
\par \pard In versions < 1.6 this is fixed to .ARC, .ARJ, .GIF, .LZH, .PNG, .TAZ, .TGZ, .Z, .ZIP and .ZOO files.
\par 
\par \trowd\trgaph105\trleft-106\cellx2265\cellx8495\pard\intbl\b Value\b0\cell\b Default value\b0\cell\row
\intbl assGIF\cell\b True\cell\row
\b0\trowd\trgaph105\trleft-106\cellx2265\cellx8495\intbl assPNG\cell\b True\b0\cell\row
\intbl assZ\cell\b True\b0\cell\row
\intbl assZIP\cell\b True\b0\cell\row
\intbl assZOO\cell\b True\b0\cell\row
\intbl assARC\cell\b True\b0\cell\row
\intbl assLZH\cell\b True\b0\cell\row
\intbl assARJ\cell\b True\b0\cell\row
\intbl assTAZ\cell\b True\b0\cell\row
\intbl assTGZ\cell\b True\b0\cell\row
\intbl assLHA\cell\b True\b0\cell\row
\intbl assRAR\cell\b True\b0\cell\row
\intbl assACE\cell\b True\b0\cell\row
\intbl assCAB\cell\b True\b0\cell\row
\intbl assGZ\cell\b True\b0\cell\row
\intbl assGZIP\cell\b True\b0\cell\row
\intbl assJAR\cell\b True\b0\cell\row
\intbl assEXE\cell\b False\b0\cell\row
\f1\trowd\trgaph105\trleft-106\cellx2265\cellx8495\intbl assEXT\f0\cell\b\f1 False\b0\f0\cell\row
\pard 
\par 
\par }
330
Scribble330
ExtAddStoreSuffixes

AddStoreSuffixes;ExtAddStoreSuffixes

properties:000060
Writing



FALSE
17
{\rtf1\ansi\ansicpg1252\deff0\deflang3081{\fonttbl{\f0\fnil\fcharset0 Arial;}{\f1\fswiss Arial;}{\f2\fnil Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\b\fs32 TZipMaster.ExtAddStoreSuffixes\cf0\f1\fs28\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \f2 
\par \f0 allows excluding a list of file suffixes\f2 
\par 
\par \b Property \b0 ExtAddStoreSuffixes: String\f0 ;\f2 
\par 
\par \cf0\b\f0\fs32 Description\cf3\b0\fs20 
\par    Allows excluding extra suffixes from being compressed.
\par    Sets assEXT in \cf2\strike AddStoreSuffixes\cf4\strike0\{linkID=320\}\cf3 
\par 
\par   ie ExtAddStoreSuffixes := '.tar,.gz'
\par \f2 
\par 
\par }
340
Scribble340
Cancel
Cancel;Property;


properties:000070
Done


Cancel;Cancel_Property;TZipMaster_Cancel
FALSE
10
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.Cancel\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb35\cf0 Cancel is used to abort any ongoing Add or Extract action.
\par \pard\sb115\sa115\b property\b0  Cancel: Boolean;
\par \pard\sa195\b\fs24 Description:
\par \pard\b0\fs20 If you set this to \b True\b0 , it will abort any \cf2\strike Add\strike0\{linkID=1090\}\cf0  or \cf2\strike Extract\strike0\{linkID=1250\}\cf0  processing now in action.  There may be a slight delay before the abort will take place. Note that a Zip file can be corrupted if an \cf2\strike Add\strike0\{linkID=1090\}\cf0  operation is aborted.
\par 
\par }
350
Scribble350
CodePage
CodePage;Property;


properties:000080
Done


CodePage;CodePage_Property;TZipMaster_CodePage
FALSE
24
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\froman\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red128\green128\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.CodePage\cf0\{keepn\} 
\par \pard\tx355\cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf1\tab\tab\cf2\ul\fs18 General info about codepages:\ulnone\{linkID=360\}\cf3\fs20 
\par \pard\sb35\tx355\cf0 CodePage can be set to influence the way accented characters (or more general characters with a ASCII code > 127)  are read from the zip archive, more in particular the filenames and filecomments.
\par \pard\sb115\sa115\tx355\b property\b0  CodePage: CPOpts;
\par \pard\sa195\tx355\b\fs24 Description:
\par \pard\tx355\b0\fs20 CodePage is used in ZipMaster to implement the translation between the OEM codepages originally used by MS-DOS and the ISO codepages used with a slight modification by Windows \f1 '\f0 95, \f1 '\f0 98 and NT.
\par This property is not ment for general translation between languages, only zip filenames and comments made in a DOS or DOS like environment for one language can be translated into the windows equivalent for the same language.
\par But since codepages are different there is still a possibility that some characters are not or not completely translated.
\par 
\par \pard\tx3255\tx4245 Some possible codepage values for\tab OEM and\tab ISO:
\par \pard\li275\tx3255\tx4245 Western European\tab 850\tab 1252
\par Amerca\tab 437\tab 1252
\par Eastern European\tab 852\tab 1250
\par \pard\tx3255\tx4245 
\par You can set CodePage to one of the following values:
\par 
\par \trowd\trgaph105\trleft-106\cellx2265\cellx8495\pard\intbl\b Value\b0\cell\b Meaning\b0\cell\row
\intbl cpAuto \cell If set, ZipMaster will try to find the right codepage automatically. This can be unreliable in some cases (where the zip file does not identify it\f1 '\f0 s host id correctly.) If your filenames seems to be messed-up you have to use one of the other two options. \cell\row
\intbl cpISO \cell If set, filenames and file comments will \b NOT\b0  be converted in any way. \cf4\b NOTE:\cf0\b0  Needed for Norton Zip version 1. Needed for ZipMaster Zipfiles version 1.45 and before created with the option AddForceDOS set. \cell\row
\intbl cpOEM \cell If set, filenames and file comments will be converted to ISO. \cell\row
\pard 
\par }
360
Scribble360





Done



FALSE
12
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red0\green0\blue255;}
\viewkind4\uc1\pard\sa115\cf1\lang3081\b\f0\fs28 General Info About Codepages\cf0 
\par \b0\fs20 Codepages are basically just a character sets. A standard MS-DOS character set used codepage 850, which is called the "OEM" codepage. Windows 3.1 used this codepage also. Most Windows 95 and Windows NT systems use codepage 1252, which is for America and Western Europe. This one is called "ISO 8859-1, Latin 1", which I will call "ISO". There are other OEM and ISO codepages, but I want to limit this discussion to the 850 and 1252 \{keepn\} codepages.
\par Both the ISO and OEM codepages support the common accented characters used in Western Europe. However, the exact codes used for specific characters are different. Each of these also has some unique characters in the range $80 - $FF. We would like to be able to convert the accented character codes in the filenames when we extract them from a zip file.
\par In these two codepages, ISO and OEM, the bottom 128 codes are the same. Only the upper 128 codes are different. These upper codes are used for accented characters. Most ZIP files use only the lower 128 codes in their filenames, so the codepage used is irrelevant. It is only important when the non-English accented characters (or other upper codes) are used in filenames. 
\par Each zip file header includes an indicator of which Operating System (OS) was used when it was created. We assume that the current OS is Win 95/98/NT using codepage 1252. If the zip file layout is based on codepage 850 ( i.e. was made on MS-DOS or Win 3.1 or made by WinZip ), then we can translate it so the extracted filenames will appear correctly. Note that this conversion can not be 100% accurate because each of these character sets has some unique symbols.
\par This is not an ideal world, though, and many zip files do not correctly identify which OS was used to make them. And, even if we know the OS it was made on, they may not have used codepage 850, and we may not be using codepage 1252 right now! So, I allow 3 different settings of the CodePage property so you can have full control over conversions.
\par In this release, you do not have the ability to convert text files made with one codepage to another codepage. At this time only  filenames and zip file comments can be converted.
\par What about the other codepages: Korean, Japanese, Hebrew, etc? I don't know any way of translating those codes to codepage 1252, because most of their characters do not exist in codepage 1252. However, if you are using the Korean codepage, and the people you give your zip files to are also using the Korean codepage, then no translation is necessary! If you want to make a zip file for use by people in other countries, then you should make it using codepage 1252.
\par 
\par }
370
Scribble370
ConfirmErase
ConfirmErase;Property;


properties:000090
Done


ConfirmErase;ConfirmErase_Property;TZipMaster_ConfirmErase
FALSE
11
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.ConfirmErase\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb35\cf0 ConfirmErase set ZipMaster to ask for confirmation before each disk will be erased when the AddDiskSpanErase option is set.
\par \pard\sb115\sa115\b property\b0  ConfirmErase: Boolean;
\par \pard\sa195\b\fs24 Description:
\par \pard\sa115\b0\fs20 If you set this to \b False\b0 , you will not be asked for confirmation before a disk is erased. If \b True\b0  and the answer is No, the disk in question will be used as it is. If there is not enough space available you will be prompted for a new one.
\par \pard Default value = \b True
\par 
\par }
380
Scribble380
Count
Count;Properties;Property;


BROWSE0002:0007
Done


Count;Count_Property;TZipMaster_Count
FALSE
10
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\f0\fs28 TZipMaster.Count\cf0\b\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb35\cf0 Count is the number of files in the Zip archive.
\par \pard\sb115\sa115\b property\b0  Count: Integer;
\par \pard\sa195\b\fs24 Description:
\par \pard\b0\fs20 The number of files now in the Zip file.  Updated automatically or manually via the \cf2\strike List\strike0\{linkID=1390\}\cf0  method.
\par 
\par }
390
Scribble390
DirOnlyCount
DirOnlyCount;Properties;Property;


properties:000100
Done


DirOnlyCount;DirOnlyCount_Property;TZipMaster_DirOnlyCount
FALSE
10
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.DirOnlyCount\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb35\cf0 DirOnlyCount is the number of directory only entries in the Zip archive.
\par \pard\sb115\sa115 __property \b int\b0  DirOnlyCount;
\par \pard\sa195\b\fs24 Description:
\par \pard\b0\fs20 The number of directory only entries now in the Zip file. Updated automatically or manually via the \cf2\strike List\strike0\{linkID=1390\}\cf0  method.
\par 
\par }
400
Scribble400
DLLDirectory
DLLDirectory;Property;


properties:000120
Done


DLLDirectory;DLLDirectory_Property;TZipMaster_DLLDirectory
FALSE
10
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\froman\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.DLLDirectory\cf0\{keepn\} 
\par \pard\tx355\cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf1\fs16\tab\tab\cf2\ul\fs18 Note  about the DLL\f1 '\f0 s:\ulnone\{linkID=410\}\cf3\fs20 
\par \pard\sb35\tx355\cf0 DLLDirectory allows manual specification of the directory where the DLL\f1 '\f0 s are stored.
\par \pard\sb115\sa115\tx355\b property\b0  DLLDirectory: \b String\b0 ;
\par \pard\sa195\tx355\b\fs24 Description:
\par \pard\tx355\b0\fs20 The directory used for ZIPDLL.DLL and UNZDLL.DLL. Should not end in a slash.  This is an optional property if used, it overrides the Windows search path for DLL\f1 '\f0 s.  If you specify a directory here, but the DLL\f1 '\f0 s are not actually in that dir, then the standard Windows search path will be consulted, anyway.
\par 
\par }
410
Scribble410
Zip/Unzip DLL loading and unloading
ZipDLL's;



Done



FALSE
26
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\froman\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red128\green128\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs24\tab DLL Loading and Unloading\cf0 
\par \pard\tx425\b0\fs20 This table show you which DLL is needed for each method:
\par \pard\fi-425\li425\tx425\tx2835\tab Add\tab requires ZIPDLL\b .\b0 DLL
\par \tab AddFileToStream\tab requires ZIPDLL\b .\b0 DLL
\par \tab AddStreamToStream\tab requires ZIPDLL\b .\b0 DLL
\par \tab Delete\tab requires ZIPDLL\b .\b0 DLL
\par \tab Extract\tab requires UNZDLL\b .\b0 DLL
\par \tab ExtractFileToStream\tab requires UNZDLL\b .\b0 DLL
\par \tab ExtractStreamToStream\tab requires UNZDLL\b .\b0 DLL
\par 
\par All other methods do not need the Zip or UnZip DLl\f1 '\f0 s.
\par \pard\tx425\tx2265 
\par \pard\fi-845\li845\tx845\cf2\b NOTE:\cf0\b0   \f1 '\f0 Test\f1 '\f0  is a sub-option of Extract.
\par \pard\tx425\tx2265 
\par The following 4 methods give you explicit control over loading and unloading of the DLL\f1 '\f0 s. For simplicity, you can do the loads in your form\f1 '\f0 s OnCreate event handler and do the unloads in your form\f1 '\f0 s OnDestroy event handler.
\par \pard\fi-425\li425\tx425\tx2265\tab Load_Zip_Dll\tab Loads ZipDLL.DLL, if not already loaded.
\par \tab Load_Unz_Dll\tab Loads UnzDLL.DLL, if not already loaded.
\par \tab UnLoad_Zip_Dll\tab Unloads ZipDLL.DLL.
\par \tab UnLoad_Unz_Dll\tab Unloads UnzDLL.DLL.
\par \pard\tx425\tx2265 
\par For compatibility with older programs the loading and unloading will be done automatically if your program does not do it.
\par This can, however, incur performance penalty because it will reload the needed DLL for each operation.
\par 
\par }
420
Scribble420
ErrCode
ErrCode;Property;


properties:000130
Done


ErrCode;ErrCode_Property;TZipMaster_ErrCode
FALSE
12
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fnil\fcharset0 Times New Roman;}{\f2\froman\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.ErrCode\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf0\f1\fs24\tab\cf2\ul See also:\cf3\ulnone\{linkID=430\}\cf0  
\par \pard\sb35\tx355\f0\fs20 ErrCode is the last \cf2\ul error number found by the DLL\f2 '\f0 s\ulnone\{linkID=440\}\cf0  or a \cf2\strike resource message ID number\strike0\{linkID=1860\}\cf0  if it is from the component.
\par \pard\sb115\sa115\tx355\b property\b0  ErrCode: Integer;
\par \pard\sa195\tx355\b\fs24 Description:
\par \pard\tx355\b0\fs20 Holds a copy of the last error code sent to your program by one of the DLL\f2 '\f0 s or the component.
\par 0 = No Error.
\par See the \cf2\strike OnMessage\strike0\{linkID=1610\}\cf0  event.  Most messages from the DLL\f2 '\f0 s will have an ErrCode of 0.
\par 
\par }
430
Scribble430
ErrCode see also




Writing



FALSE
8
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Times New Roman;}{\f1\fnil Arial;}}
{\colortbl ;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\strike\f0\fs24 FullErrCode\cf2\strike0\{linkID=500>main\}\cf0 
\par \cf1\strike Message\cf2\strike0\{linkID=600>main\}\cf0 
\par \cf3\lang1033\f1\fs20 
\par 
\par 
\par }
440
Scribble440
ZipMaster DLL error numbers
ZipMaster DLL errors;



Done



FALSE
22
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\froman\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs24 Possible error numbers given by the DLL\f1 '\f0 s\cf0\b0\{keepn\} 
\par \pard\fi-985\li985\sa15\tqr\tx565\tqr\tx985\fs20\tab\b -5\b0\tab Password error
\par \tab\b -4\b0\tab All further passwords cancelled
\par \tab\b -3\b0\tab Password cancelled
\par \tab\b -1\b0\tab File not found
\par \tab  \b 2\b0\tab Unexpected end of zip file
\par \tab  \b 3\b0\tab Zip file structure invalid
\par \tab  \b 4\b0\tab Out of memory
\par \tab  \b 5\b0\tab Internal logic error
\par \tab  \b 9\b0\tab Aborted by user
\par \tab\b 10\b0\tab Temporary file failure
\par \tab\b 11\b0\tab Error reading a file
\par \tab\b 12\b0\tab Nothing to do!
\par \tab\b 13\b0\tab Missing or empty zip file
\par \tab\b 14\b0\tab Error writing to a file
\par \tab\b 15\b0\tab Error creating file
\par \tab\b 16\b0\tab Bad zip options specified
\par \tab\b 18\b0\tab File not found or no read permission
\par 
\par }
450
Scribble450
ExtrBaseDir
ExtrBaseDir;Property;


properties:000260
Done


ExtrBaseDir;ExtrBaseDir_Property;TZipMaster_ExtrBaseDir
FALSE
10
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fnil\fcharset0 Times New Roman;}{\f2\froman\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.ExtrBaseDir\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf0\f1\fs24\tab\cf2\ul See also:\cf3\ulnone\{linkID=460\}\cf0 
\par \pard\sb35\tx355\f0\fs20 ExtraBaseDir is base directory used for extracting a Zip archive.
\par \pard\sb115\sa115\tx355\b property\b0  ExtrBaseDir: \b String\b0 ;
\par \pard\sa195\tx355\b\fs24 Description:
\par \pard\tx355\b0\fs20 This base directory applies only to \f2 '\f0 Extract\f2 '\f0  operations.  The Unzip DLL will make this directory the current directory before extracting any files. If you don't specify a value for this property, then the directory of the ZipFile itself will be the base directory for extractions.
\par 
\par }
460
Scribble460
ExtrBaseDir see also




Writing



FALSE
7
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Times New Roman;}{\f1\fnil Arial;}}
{\colortbl ;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\strike\f0\fs24 Extract\cf2\strike0\{linkID=1250>main\}\cf0 
\par \cf3\lang1033\f1\fs20 
\par 
\par 
\par }
470
Scribble470
ExtrOptions
ExtrDirNames;ExtrFreshen;ExtrOptions;ExtrOpts;ExtrOverWrite;ExtrTest;ExtrUpdate;Properties;Property;


properties:000220
Done


ExtrOptions;ExtrOptions_Property;TZipMaster_ExtrOptions
FALSE
19
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss\fprq2\fcharset0 Arial;}{\f1\froman\fprq2\fcharset0 Times New Roman;}{\f2\fswiss Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red128\green128\blue0;\red255\green0\blue255;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.ExtrOptions\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb35\cf0 ExtrOptions is a Set of Options used to modify the default actions of the Extract method.
\par \pard\sb115\sa115\b property\b0  ExtrOptions: ExtrOpts;
\par \pard\sa195\b\fs24 Description:
\par \pard\b0\fs20 This property is used to modify the default action of the \cf2\strike Extract\strike0\{linkID=1250\}\cf0  method. If you want an option to be \b True\b0 , you need to add it to the Set.
\par 
\par \trowd\trgaph105\trleft-106\cellx1985\cellx8205\pard\intbl\b Value\b0\cell\b Meaning\b0\cell\row
\intbl ExtrDirNames \cell If \b True\b0 , extracts and recreates the relative pathname that may have been stored with each file. Empty directories stored in the archive (if any) will also be recreated. \cell\row
\intbl ExtrOverWrite \cell If \b True\b0 , overwrite pre-existing files during Extraction. \cf4\b NOTE:\cf0\b0  -ReadOnly files will be overwritten too.  -If a file will be overwritten also depends on the return value set in the \cf2\strike OnExtractOverwrite\strike0\{linkID=1570\}\cf0  event if present. \cf5\b IMPORTANT:\cf0\b0  Files opened by other applications (Windows a.o.) with exclusive rights are \b not\b0  overwritten. In this case an \cf2\strike OnExtractSkipped\strike0\{linkID=1580\}\cf0  event will follow. \cell\row
\intbl ExtrFreshen \cell If \b True\b0 , extract newer files from archive (only for files that already exist).  Won't extract any file that isn't already present. \cell\row
\intbl ExtrUpdate \cell If \b True\b0 , extract files that don\f1 '\f0 t already exist and if ExtrOverWrite is also set to true, it will extract newer files from the archive. \cell\row
\intbl ExtrTest\cell If \b True\b0 , only test the archive to see if the files could be successfully extracted. Testing is done by extracting the files, but NOT writing the extracted data to the disk. Only the CRC code of the files is used to determine if they are stored correctly. To use this option, you will also need to define an Event handler for \cf2\strike OnMessage\strike0\{linkID=1610\}\cf0 . \cf5\b IMPORTANT:\cf0\b0  In this release, All files are tested not just some of them.\cell\row
\intbl ExtrForceDirs\cell If \b True\b0 , forces the existence of the destination directory\cell\row
\pard\f1 
\par \pard\tx1735\f2 
\par }
480
Scribble480
FSpecArgs
FSpecArgs;Property;


properties:000210
Done


FSpecArgs;FSpecArgs_Property;TZipMaster_FSpecArgs
FALSE
41
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fnil\fcharset0 Times New Roman;}{\f2\froman\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red128\green0\blue0;\red128\green128\blue0;\red0\green0\blue128;\red255\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.FSpecArgs\cf0\{keepn\} 
\par \pard\tx1735\cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb35\tx1735\cf0 FSpecArgs is a list of files used in the Add, Delete or Extract methods.
\par \pard\sb115\sa115\b property\b0  FSpecAr\f1\fs24 gs: TStrings;\f0\fs20 
\par \pard\sa195\tx1735\b\fs24 Description:
\par \pard\tx1735\b0\fs20 Stringlist containing all the \cf2\ul file specifications\ulnone\{linkID=1840\}\cf0  used as arguments for \cf2\strike Add\strike0\{linkID=1090\}\cf0 , \cf2\strike Delete\strike0\{linkID=1230\}\cf0 , and \cf2\strike Extract\strike0\{linkID=1250\}\cf0  methods. Every entry can contain MS-DOS wildcards.
\par 
\par If you give filenames without pathnames, or if you use \cf2\ul relative pathnames\ulnone\{linkID=1130\}\cf0  with filenames, then the base drive/directory is assumed to be that of the Zipfile.
\par 
\par You can specify either the MS-DOS backslash path symbol, or the one normally used by PKZip ( the Unix path separator: / ). They are treated exactly the same.
\par 
\par Add, Delete, and Extract are the only methods that use FSpecArgs. The \cf2\strike List\strike0\{linkID=1390\}\cf0  method doesn't - it just lists all files.
\par 
\par You can easily combine many different filespecs into one Add, Delete, or Extract operation. For example:
\par 
\par It is also possible to override the AddRecurseDirs option of the \cf2\strike AddOptions\cf4\strike0\{linkID=310\}\cf0  property by adding special characters at the beginning of any entry:
\par \pard\li275\tx705\b >\b0\tab will force recursion into subdirectories.
\par \b |\b0\tab will stop recursion into subdirectories.
\par \pard\fi-845\li845\sb115\tx845\cf5\b NOTE:\cf0\b0\tab This is \b only\b0  possible while Adding to a zip archive, When using Extract, Delete or CopyZippedFiles \b never\b0  use this!!!
\par \pard\sb115\tx845 Further it is possible to override the default password by appending the file specification with a \f2 '\f0 <\f2 '\f0  and then the new password or leave it empty to cancel an existing password temporarily as set in the \cf2\strike Password\strike0\{linkID=650\}\cf0  property.
\par \pard\fi-845\li845\sb115\tx845\cf5\b NOTE:\cf0\b0\tab This is \b only\b0  possible while Adding to a zip archive, When using Extract, Delete or CopyZippedFiles \b never\b0  use this!!!
\par \pard\tx845 
\par \pard\fi-395\li565\tx565\cf6\b Add entries directly to the FSpecArgs property:
\par \pard\tx1125\cf0\b0\i\tab ZipMaster1.FSpecArgs.Add( \i0\f2 '\i\f0 C:\\AUTOEXEC.BAT\i0\f2 '\i\f0  );
\par \tab ZipMaster1.FSpecArgs.Add( \i0\f2 '\i\f0 *.EXE\i0\f2 '\i\f0  );
\par \tab ZipMaster1.FSpecArgs.Add( \i0\f2 '\i\f0 C:\\WINDOWS\\*.INI\i0\f2 '\i\f0  );
\par \pard\fi-395\li565\tx565\cf6\b\i0 And some special cases which can be used when adding to zip archive:
\par \pard\fi-1125\li1125\tx1125\tx7505\cf0\b0\i\tab ZipMaster1.FSpecArgs.Add( \i0\f2 '\i\f0 >C:\\Windows\\System\\*.Dll\i0\f2 '\i\f0  );\tab\cf7 // Force recusion\cf0 
\par \tab ZipMaster1.FSpecArgs.Add( \i0\f2 '\i\f0 |C:\\Windows\\*.exe\i0\f2 '\i\f0  );\tab\cf7 // Stop recursion\cf0 
\par \tab ZipMaster1.FSpecArgs.Add( \i0\f2 '\i\f0 C:\\Bat\\Test.txt*MyNewPassword\i0\f2 '\i\f0  );\tab\cf7 // A new password\cf0 
\par \tab ZipMaster1.FSpecArgs.Add( \i0\f2 '\i\f0 C:\\Bat\\Test.txt*\i0\f2 '\i\f0  );\tab\cf7 // Cancel existing password\cf0 
\par \pard\tx1125\tx7505\i0 
\par \pard\fi-395\li565\tx565\cf6\b Take the filespecs from a StringList, just assign them all over to ZipMaster1.
\par \pard\tx1125\cf0\b0\i\tab ZipMaster1.FSpecArgs.Assign( StringList1 );
\par \i0 
\par \pard\fi-395\li565\tx565\cf6\b Take the filespecs from a ListBox, just assign them all over to ZipMaster1.
\par \pard\tx1125\cf0\b0\i\tab ZipMaster1.FSpecArgs.Assign( ListBox1.Items );
\par 
\par }
490
Scribble490
FSpecArgsExcl
FSpecArgsExcl;Property;


properties:000150
Done


FSpecArgsExcl;FSpecArgsExcl_Property;TZipMaster_FSpecArgsExcl
FALSE
28
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fnil\fcharset0 Times New Roman;}{\f2\froman\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red0\green0\blue128;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.FSpecArgsExcl\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb35\cf0 FSpecArgsExcl is a list of files to exclude while using the Add and Delete methods.
\par \pard\sb115\sa115\b property\b0  FSpecArgsExcl: \f1\fs24 TStrings\f0\fs20 ;
\par \pard\sa195\b\fs24 Description:
\par \pard\b0\fs20 Stringlist containing all the \cf2\ul file specifications\ulnone\{linkID=1850\}\cf0  used as arguments for \cf2\strike Add\strike0\{linkID=1090\}\cf0 , and \cf2\strike Delete\strike0\{linkID=1230\}\cf0  methods. Every entry can contain MS-DOS wildcards.
\par 
\par You can specify either the MS-DOS backslash path symbol, or the one normally used by PKZIP ( the Unix path separator: / ). They are treated exactly the same.
\par When using full path names in FSpecArgs you must also use full path names in FSpecArgsExcl or appropriate wildcards like \f2 '\f0 *.tmp\f2 '\f0 , \f2 '\f0 *test.*\f2 '\f0 , this is important when the Add option AddRecurseDirs is set.
\par 
\par Add and Delete are the only methods that use FSpecArgsExcl. The \cf2\strike List\strike0\{linkID=1390\}\cf0  method doesn't - it just lists all files.
\par 
\par You can easily combine many different filespecs into one Add or Delete operation. For example:
\par 
\par \pard\fi-395\li565\tx565\cf4\b Add entries directly to the FSpecArgsExcl property:
\par \pard\tx1125\cf0\b0\i\tab ZipMaster1.FspecArgsExcl.Add( \f2 '\f0 C:\\Builder\\BIN\\Builder.EXE\f2 '\f0  );
\par \tab ZipMaster1.FspecArgsExcl.Add( \f2 '\f0 C:\\WINDOWS\\*.TMP\f2 '\f0  );
\par \tab ZipMaster1.FspecArgsExcl.Add( \f2 '\f0 *.TMP\f2 '\f0  );
\par \i0 
\par \pard\fi-395\li565\tx565\cf4\b Take the filespecs from a StringList, just assign them all over to ZipMaster1.
\par \pard\tx1125\cf0\b0\i\tab ZipMaster1.FspecArgsExcl.Assign( StringList1 );
\par \i0 
\par \pard\fi-395\li565\tx565\cf4\b Take the filespecs from a ListBox, just assign them all over to ZipMaster1.
\par \pard\tx1125\cf0\b0\i\tab ZipMaster1.FspecArgsExcl.Assign( ListBox1.Items );
\par 
\par }
500
Scribble500
FullErrCode
FullErrCode;Property;


properties:000140
Done


FullErrCode;FullErrCode_Property;TZipMaster_FullErrCode
FALSE
19
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fnil\fcharset0 Times New Roman;}{\f2\froman\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.FullErrCode\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf0\f1\fs24\tab\cf2\ul See also:\cf3\ulnone\{linkID=510\}\cf0  
\par \pard\sb35\tx355\f0\fs20 FullErrCode is the last error number found by the DLL\f2 '\f0 s.
\par \pard\sb115\sa115\tx355\b property\b0  FullErrCode: Integer;
\par \pard\sa195\tx355\b\fs24 Description:
\par \pard\tx355\b0\fs20 Holds a copy of the last error code sent to your program by one of the DLL\f2 '\f0 s.
\par 
\par \pard\sa55\tx355 The difference between ErrCode and FullErrCode is:
\par \pard\fi-275\li275\sa55\tx275 1) FullErrCode is only used by both Dll\f2 '\f0 s while ErrCode is also used for errors originating from the component.
\par \pard\fi-275\li275\tx275 2) There is extra information available in FullErrCode which ErrCode does not have.
\par \tab To interpret this extra information you will have to perform a logical AND as follows.
\par \tab FullErrCode \b and\b0  $00FF gives the same value as ErrCode.
\par \tab FullErrCode \b and\b0  $FF00 gives a sequence number and with this number the exact location in the DLL where the error occurred can be found.
\par \pard\tx275 
\par If this property is 0 then there is no error.
\par 
\par }
510
Scribble510
FullErrorCode see also




Writing



FALSE
9
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Times New Roman;}{\f1\fnil Arial;}}
{\colortbl ;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\strike\f0\fs24 ErrCode\cf2\strike0\{linkID=420>main\}\cf0 
\par \cf1\strike Message\cf2\strike0\{linkID=600>main\}\cf0 
\par \cf1\strike OnMessage \cf2\strike0\{linkID=1610>main\}\cf0 
\par \cf3\lang1033\f1\fs20 
\par 
\par 
\par }
520
Scribble520
Handle
Handle;Property;


properties:000160
Done


Handle;Handle_Property;TZipMaster_Handle
FALSE
11
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\froman\fcharset0 Times New Roman;}{\f2\fnil\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.Handle\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb35\cf0 Handle is the application window handle the DLL\f1 '\f0 s will use to connect to some dialog boxes.
\par \pard\sb115\sa115\b property\b0  Handle: \f2\fs24 THandle;\f0\fs20 
\par \pard\sa195\b\fs24 Description:
\par \pard\b0\fs20 Used for some DLL generated dialogs.
\par Default it is set to the form where TZipMaster is created.
\par 
\par }
530
Scribble530
HowToDelete
HowToDelete;Properties;Property;


properties:000180
Done


HowToDelete;HowToDelete_Property;TZipMaster_HowToDelete
FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.HowToDelete\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf0\fs16 
\par \pard\sb35\fs20 HowToDelete specifies on how \cf2\strike EraseFile\strike0\{linkID=1240\}\cf0  is going to delete a file.
\par \pard\sb115\sa115\b property\b0  HowToDelete: DeleteOpts;
\par \pard\sa195\b\fs24 Description:
\par \pard\b0\fs20 HowToDelete can take one of the following values:
\par \pard\sb115\sa115\tx1985\b\fs24 Value\tab Meaning
\par \pard\tx1985\b0\fs20 htdFinal\tab Perform a DeleteFile.
\par htdAllowUndo\tab Move the old file into the recycle bin (The default).
\par 
\par }
540
Scribble540
IsSpanned
IsSpanned;Multi Volume Zip Parts;Property;


properties:000170
Done


IsSpanned;IsSpanned_Property;TZipMaster_IsSpanned
FALSE
10
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fnil\fcharset0 Times New Roman;}{\f2\froman\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.IsSpanned\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf0\f1\fs24\tab\cf2\ul See also:\cf3\ulnone\{linkID=550\}\cf0  
\par \pard\sb35\tx355\f0\fs20 IsSpanned gives an indication if the opened zip archive is a spanned archive.
\par \pard\sb115\sa115\tx355\b property\b0  IsSpanned: Boolean;
\par \pard\sa195\tx355\b\fs24 Description:
\par \pard\tx355\b0\fs20 IsSpanned returns True if the opened archive is a spanned archive, even if the \f2 '\f0 set\f2 '\f0  consists of only one disk.
\par 
\par }
550
Scribble550
IsSpanned see also




Writing



FALSE
8
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Times New Roman;}{\f1\fnil Arial;}}
{\colortbl ;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\strike\f0\fs24 ReadSpan\cf2\strike0\{linkID=1430>main\}\cf0 
\par \cf1\strike WriteSpan \cf2\strike0\{linkID=1500>main\}\cf0 
\par \cf3\lang1033\f1\fs20 
\par 
\par 
\par }
560
Scribble560
KeepFreeOnDisk1
KeepFreeOnDisk1;Properties;Property;


properties:000190
Writing


KeepFreeOnDisk1;KeepFreeOnDisk1_Property;TZipMaster_KeepFreeOnDisk1
FALSE
12
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fswiss\fcharset0 Arial;}{\f2\fnil\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.KeepFreeOnDisk1\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\f1\tab\cf0\f2\fs24\tab\cf2\ul See also: \cf3\ulnone\{linkID=570\}\cf4\f0\fs20 
\par \pard\sb35\cf0 KeepFreeOnDisk1 is used to keep some space available on the first disk of a spanned set.
\par \pard\sb115\sa115\b property\b0  KeepFreeOnDisk1: Integer;
\par \pard\sa195\b\fs24 Description:
\par \pard\b0\fs20 Holds a value in bytes and will use this value to keep bytes free on the first disk of a set of disks. For example to leave space for a setup program.
\par By default this is set to zero.
\par \pard\tx165\tx425\cf3\f1 *\cf2\strike new \cf3\strike0\{linkID=110>main\}\cf0  This is in Addition to \cf2\strike KeepFreeOnAllDisks\cf3\strike0\f0\{linkID=560\}\cf0 
\par \pard 
\par }
570
Scribble570
KeepFreeDisk1 see also




Writing



FALSE
5
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Times New Roman;}{\f1\fnil Arial;}}
{\colortbl ;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\strike\f0\fs24 KeepFreeOnAllDisks \cf2\strike0\{linkID=580>main\}\cf3\lang1033\f1\fs20 
\par 
\par }
580
Scribble580
KeepFreeOnAllDisks
Changes;KeepFreeOnAllDisks;Properties;


properties:000200
Writing


KeepFreeOnAllDisks;TZipMaster_KeepFreeOnAllDisks
FALSE
16
{\rtf1\ansi\ansicpg1252\deff0\deflang3081{\fonttbl{\f0\fnil\fcharset0 Arial;}{\f1\fswiss Arial;}{\f2\fnil\fcharset0 Times New Roman;}{\f3\fswiss\fcharset0 Arial;}{\f4\fnil Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\b\fs32 TZipMaster.KeepFreeOnAllDisks\cf0\f1\fs28\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf0\f2\fs24\tab\cf2\ul See also:\cf3\ulnone\{linkID=590\}\cf0  \cf4\f1\fs20 
\par \pard\sb35\cf0 KeepFreeOn\f3 All\f1 Disk\f3 s\f1  is used to keep some space available on the first disk of a spanned set.
\par \pard\sb115\sa115\b property\b0  KeepFreeOn\f3 All\f1 Disk\f3 s\f1 : Integer;
\par \pard\sa195\b\fs24 Description:
\par \pard\b0\fs20 Holds a value in bytes and will use this value to keep bytes free on \f3 all\f1  disk\f3 s\f1  of a set. For example to leave \f3 slack \f1 space \f3 CDs\f1 .
\par By default this is set to zero.
\par 
\par 
\par \cf4\f4 
\par 
\par 
\par 
\par }
590
Scribble590
KeepFreeOnAllDisks see also




Writing



FALSE
6
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Times New Roman;}{\f1\fnil Arial;}}
{\colortbl ;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\strike\f0\fs24 KeepFreeOnDisk1\cf2\strike0\{linkID=560>main\}\cf3\lang1033\f1\fs20 
\par 
\par 
\par }
600
Scribble600
Message
Message;Property;


properties:000240
Done


Message;Message_Property;TZipMaster_Message
FALSE
10
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fnil\fcharset0 Times New Roman;}{\f2\froman\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.Message\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf0\f1\fs24\tab\cf2\ul See also:\cf3\ulnone\{linkID=610\}\cf0  
\par \pard\sb35\tx355\f0\fs20 Message is the last message sent by the DLL.\f2 '\f0 s or the resource message string if it is from the component.
\par \pard\sb115\sa115\tx355\b property\b0  Message: \b String\b0 ;
\par \pard\sa195\tx355\b\fs24 Description:
\par \pard\tx355\b0\fs20 Holds a copy of the last message sent to your program by one of the DLL\f2 '\f0 s or the component. See the \cf2\strike OnMessage\strike0\{linkID=1610\}\strike  \cf0\strike0 event.
\par 
\par }
610
Scribble610
Message see also




Writing



FALSE
8
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Times New Roman;}{\f1\fnil Arial;}}
{\colortbl ;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\strike\f0\fs24 ErrCode\cf2\strike0\{linkID=420>main\}\cf0 
\par \cf1\strike FullErrCode\cf2\strike0\{linkID=500>main\}\cf0 
\par \cf3\lang1033\f1\fs20 
\par 
\par 
\par }
620
Scribble620
MaxVolumeSize
MaxVolumeSize;Property;


properties:000230
Done


MaxVolumeSize;MaxVolumeSize_Property;TZipMaster_MaxVolumeSize
FALSE
12
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.MaxVolumeSize\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb35\cf0 MaxVolumeSize is used to set the maximum size of any archive part of a spanned set.
\par \pard\sb115\sa115\b property\b0  MaxVolumeSize: Integer;
\par \pard\sa195\b\fs24 Description:
\par \pard\b0\fs20 This property holds a value in bytes to set the maximum size of the destination zipfile on a disk.
\par \pard\sa115 This will be most useful if the destination disk is a harddisk.
\par \pard The default is 0 which means the maximum size of a disk will be used. It is possible to use different sized disks interchangeable (ie. 720Kb or 1,44Mb)  (As long as they fit in the same drive.)
\par 
\par }
630
Scribble630
MinFreeVolumeSize
MinFreeVolumeSize;Property;


properties:000250
Done


MinFreeVolumeSize;MinFreeVolumeSize_Property;TZipMaster_MinFreeVolumeSize
FALSE
12
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red128\green128\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.MinFreeVolumeSize\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb35\cf0 MinFreeVolumeSize is the minimum size a disk MUST have before it can be used in diskspanning.
\par \pard\sb115\sa115\b property\b0  MinFreeVolumeSize: Integer;
\par \pard\sa195\b\fs24 Description:
\par \pard\b0\fs20 This contains a value in bytes of the minimum available size a disk must have before it will be used to write (a part of) the archive.
\par \pard\sa115 The default is 65536 bytes.
\par \pard\fi-845\li845\tx845\cf4\b NOTE:\cf0\b0\tab It is not very practical to set this to a smaller value because you will need a lot of disks or get many files.
\par 
\par }
640
Scribble640
NotMainThread




Writing



FALSE
11
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Arial;}{\f1\fswiss Arial;}{\f2\fnil Arial;}}
{\colortbl ;\red0\green0\blue255;\red128\green0\blue0;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\fs32 TZipMaster.NotMainThread\cf2\{keepn\}\cf0\f1\fs28 
\par \cf3\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\tab\cf4\lang1033\f2 
\par 
\par \b property \b0 NotMainThread: Boolean 
\par 
\par \lang3081\b\f0\fs24 Description\b0\fs20 
\par    When true it does not do some things that should be done when running on separate thread
\par \lang1033\f2 
\par }
650
Scribble650
Password
Password;Property;


properties:000270
Done


Password;Password_Property;TZipMaster_Password
FALSE
13
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fnil\fcharset0 Times New Roman;}{\f2\froman\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;\red255\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.Password\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf0\f1\fs24\tab\cf2\ul See also:\cf3\ulnone\{linkID=660\}\cf2\f0\fs20\tab\ul\fs18 Note on passwords:\ulnone\{linkID=1380\}\cf4\fs20 
\par \pard\sb35\tx355\cf0 Password is the password used when encrypting or decrypting a Zip archive.
\par \pard\sb115\sa115\tx355\b property\b0  Password: \b String\b0 ;
\par \pard\sa195\tx355\b\fs24 Description:
\par \pard\tx355\b0\fs20 The user's encryption/decryption password. Setting a password to this property is not needed if you want to let the DLL\f2 '\f0 s prompt the user for a password. This is only used if you want to prompt the user yourself.
\par \pard\sb115\tx355 It is possible to override this default Password by appending the file specification with an asterix \b *\b0  and then the new Password or leave it empty to cancel an existing password. Look for this at the \cf2\strike FSpecArgs\strike0\{linkID=480\}\cf0  property.
\par \pard\tx355 
\par \pard\fi-1415\li1415\tx1415\cf5\b WARNING:\tab\cf0\b0 If you set the password in the Object Inspector, and you never change the password property at runtime, then your users will never be able to use any other password.  If you leave it blank, the DLL\f2 '\f0 s will prompt users each time a password is needed.
\par 
\par }
660
Scribble660
Password see also




Writing



FALSE
9
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Times New Roman;}{\f1\fnil Arial;}}
{\colortbl ;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\strike\f0\fs24 GetAddPassword\cf2\strike0\{linkID=1300>main\}\cf0 
\par \cf1\strike GetExtrPassword\cf2\strike0\{linkID=1320>main\}\cf0 
\par \cf1\strike GetPassword\cf2\strike0\{linkID=1340>main\}\cf0 
\par \cf1\strike OnZipDialog\cf2\strike0\{linkID=1770>main\}\cf3\lang1033\f1\fs20 
\par 
\par 
\par }
670
Scribble670
PasswordReqCount
PasswordReqCount;Property;


properties:000280
Done


PasswordReqCount;PasswordReqCount_Property;TZipMaster_PasswordReqCount
FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red128\green128\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.PasswordReqCount\cf0\{keepn\} 
\par \pard\tx355\cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\tab\ul\fs18 Note on passwords:\ulnone\{linkID=1380\}\cf3\fs20 
\par \pard\sb35\tx355\cf0 PasswordReqCount sets the number of times a password is requested (per file) while decrypting.
\par \pard\sb115\sa115\tx355\b property\b0  PasswordReqCount: LongWord;
\par \pard\sa195\tx355\b\fs24 Description:
\par \pard\tx355\b0\fs20 Password Request Count is used for setting the total number of times a password is requested per file in the ziparchive (by calling \cf2\strike OnPasswordError\strike0\{linkID=1650\}\cf0 ). The maximum is 15 and the minimum = 0.
\par Setting it to 0 will make sure that a password is never requested, effectively skipping all encrypted files.
\par 
\par \pard\fi-845\li845\tx845\cf4\b NOTE:\cf0\b0\tab Setting this property while extracting is in progress does not have any effect until the next call to Extract.
\par 
\par }
680
Scribble680
RootDir
Property;RootDir;


properties:000330
Done


RootDir;RootDir_Property;TZipMaster_RootDir
FALSE
19
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\froman\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red0\green0\blue128;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TzipMaster.RootDir\cf0\{keepn\} 
\par \pard\tx355\cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\tab\strike See also:How to Use and Store Relative Paths\strike0\{linkID=1130\}\cf3 
\par \pard\sb35\tx355\cf0 RootDir sets the base directory for relative file specifications.
\par \pard\sb115\sa115\tx355\b property\b0  RootDir: \b String\b0 ;
\par \pard\sa195\tx355\b\fs24 Description:
\par \pard\tx355\b0\fs20 The RootDir property determines where zipping will start for any filenames or wildcard entries in the \cf2\strike FSpecArgs\strike0\{linkID=480\}\cf0  property.
\par 
\par \pard\fi-395\li565\tx565\cf4\b Example:
\par \pard\tx1125\cf0\b0\i\tab ZipMaster1.RootDir := \f1 '\f0 D:\\Program Files\\Start\f1 '\f0 ;
\par \tab ZipMaster1.FSpecArgs.Add( \f1 '\f0 Dir1\\MyFile.html\f1 '\f0  );
\par \tab ZipMaster1.FSpecArgs.Add( \f1 '\f0 *.h\f1 '\f0  );
\par \tab ZipMaster1.Add;
\par \i0 
\par This will add the file \f1 "\f0 D:\\Program Files\\Start\\Dir1\\MyFile.htm\f1 "\f0  as \f1 "\f0 Dir1\\MyFile.html\f1 "\f0 
\par and all files \f1 "\f0 D:\\Program Files\\Start\\*.h\f1 "\f0  as \f1 "\f0 *.h\f1 "\f0  to the ziparchive.
\par 
\par }
690
Scribble690
SFXCaption
Property;SFXCaption;


sfx:000030
Done


SFXCaption;SFXCaption_Property;TZipMaster_SFXCaption
FALSE
11
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\froman\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.SFXCaption\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb35\cf0 SFXCaption is the caption of the SFX dialog box when you start executing a .EXE archive.
\par \pard\sb115\sa115\b property\b0  SFXCaption: \b String\b0 ;
\par \pard\sa195\b\fs24 Description:
\par \pard\b0\fs20 When you start a executable which was build by ConvertSFX then this will be the caption of the dialog box you will see.
\par If you don\f1 '\f0 t set it yourself "Self-extracting Archive" will be used as default.
\par 
\par }
700
Scribble700
SFXCommandLine
Property;SFXCommandLine;


sfx:000040
Done


SFXCommandLine;SFXCommandLine_Property;TZipMaster_SFXCommandLine
FALSE
23
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.SFXCommandLine\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb35\cf0 SFXCommandLine can contain a command line to execute after extracting the executable.
\par \pard\sb115\sa115\b property\b0  SFXCommandLine: \b String\b0 ;
\par \pard\sa195\b\fs24 Description:
\par \pard\b0\fs20 This is the command line that will be executed immediately after extracting the files.  Typically used to view the readme file, but can do anything. There is a predefined symbol that can be used in the command line to tell you which target directory was actually used.
\par 
\par \b Special symbols:
\par |\b0     (Vertical bar) is the command / argument separator.
\par \b ><\b0  Is the actual extraction directory selected by user.
\par 
\par \i Example:\i0  notepad.exe\b |><\b0 Readme.txt
\par This will run notepad to show "Readme.txt" in the actual extraction dir.
\par 
\par You can also install .inf scripts, even with support for different sections depending on the 
\par operating system
\par "><setup.inf" will run the [DefaultInstall] section of "EXTRACTPATH\\setup.inf".
\par "><setup.inf|.ntx86" will run the [DefaultInstall] section if the User's OS is Win95/98,
\par but [DefaultInstall.ntx86] section if it's Windows NT.
\par 
\par }
710
Scribble710
SFXDefaultDir
Property;SFXDefaultDir;


sfx:000050
Done


SFXDefaultDir;SFXDefaultDir_Property;TZipMaster_SFXDefaultDir
FALSE
28
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\froman\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red0\green0\blue128;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.SFXDefaultDir\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb35\cf0 SFXDefaultDir is the directory that will be used by the executable when extracting.
\par \pard\sb115\sa115\b property\b0  SFXDefaultDir: \b String\b0 ;
\par \pard\sa195\b\fs24 Description:
\par \pard\b0\fs20 The directory can be changed in the SFX dialog box before extracting.
\par If you don't specify this, the user's current directory will be the default.
\par 
\par If you specify the special symbol \b ><\b0  here, then the user\f1 '\f0 s temporary directory will be the default extraction directory.  A Windows API call will be used at runtime to determine the name of this directory.
\par 
\par The path can also be read from the user's registry by typing a registry key.
\par \pard\fi-395\li565\sb235\sa115\tx565\cf4\b Some examples:
\par \pard\li275\tx565\cf0\b0\i HKEY_LOCAL_MACHINE\\
\par HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ProgramFilesDir
\par HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\CommonFilesDir
\par HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\WallPaperDir
\par HKEY_CURRENT_USER\\Software\\Borland\\C++Builder\\3.0\\
\par HKEY_CURRENT_USER\\Software\\Borland\\Delphi\\4.0\\
\par HKCU\\Software\\
\par HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Shell Folders\\
\par \i0 HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Shell Folders\\
\par \pard\tx565 
\par Also creating subfolders in these registry-read paths is possible by entering a pipe ( ' | ' ) 
\par and then the name of the new sub directory after the registry key.
\par 
\par }
720
Scribble720
SFXIcon
Property;SFXIcon;


sfx:000060
Done


SFXIcon;SFXIcon_Property;TZipMaster_SFXIcon
FALSE
15
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fnil\fcharset0 Times New Roman;}{\f2\froman\fcharset0 Times New Roman;}{\f3\froman Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.SFXIcon\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb35\cf0 SFXIcon sets the icon used when converting from .Zip to .Exe.
\par \pard\sb115\sa115\b property\b0  SFXICon:\f1\fs24  TIcon;\f0\fs20 
\par \pard\sa195\b\fs24 Description:
\par \pard\b0\fs20 Used to set a custom icon for the Self Extracting Archive. This is the picture you see in the explorer and on your desktop.
\par 
\par Because the original size of the icon in ZipSFX.bin has a fixed size, the size and number of colors used must be exactly the same this means: 32 x 32 pixels and 16 colors.
\par If you supply an icon which is not exactly the same you will get error \f2 -\f0 12 when using the \cf2\strike ConvertSFX\strike0\{linkID=1150\}\cf0  method.
\par 
\par \pard\sb35 This property is automatically set when converting (back) from .Exe to .Zip.\f3 
\par 
\par }
730
Scribble730
SFXMessage
Property;SFXMessage;


sfx:000070
Done


SFXMessage;SFXMessage_Property;TZipMaster_SFXMessage
FALSE
17
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.SFXMessage\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb35\cf0 SFXMessage is used to specify a message given before the main extraction dialog shows itself.
\par \pard\sb115\sa115\b property\b0  SFXMessage: \b String\b0 ;
\par \pard\sa195\b\fs24 Description:
\par \pard\b0\fs20 You can specify a message that will be displayed before the main extraction dialog pops up.
\par 
\par You can also specify the type of the message box:
\par \pard\fi-1415\li1415\tx135\tx1415 -\tab Standard:\tab The messagebox shows an 'OK' button. The User cannot cancel starting the SFX application.
\par -\tab Information:\tab The messagebox shows the buttons 'OK' and 'Cancel'. if the User presses 'Cancel', sfx will stop.
\par \tab Set the first character of the string to:  #1.
\par -\tab Confirmation:\tab The messagebox shows the buttons 'Yes' and 'No'. if the User presses 'No', sfx will stop.
\par \tab Set the first character of the string to:  #2.
\par 
\par }
740
Scribble740
SFXOffset
Property;SFXOffset;


sfx:000080
Done


SFXOffset;SFXOffset_Property;TZipMaster_SFXOffset
FALSE
10
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.SFXOffset\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb35\cf0 SFXOffset is the size of the self-extracting code at the beginning of the zipfile.
\par \pard\sb115\sa115\b property\b0  SFXOffset: Integer;
\par \pard\sa195\b\fs24 Description:
\par \pard\b0\fs20 SFXOffset is valid after a zip file's contents have been read successfully (which happens when you assign something to \cf2\strike ZipFileName\strike0\{linkID=1020\}\cf0 ). When using non SFX zip files or when using diskspanning this will be zero.
\par 
\par }
750
Scribble750
SFXOptions
Property;SFXAskCmdLine;SFXAskFiles;SFXAutoRun;SFXHideOverWriteBox;SFXNoSuccessMsg;SFXOptions;


sfx:000090
Done


SFXOptions;SFXOptions_Property;TZipMaster_SFXOptions
FALSE
18
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\froman\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red128\green128\blue0;\red255\green0\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.SFXOptions\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb35\cf0 SFXOptions is a Set of options used to modify the default actions of the ConvertSFX method.
\par \pard\sb115\sa115\b property\b0  SFXOptions: SfxOpts;
\par \pard\sa195\b\fs24 Description:
\par \pard\b0\fs20 If you want an option to be \b True\b0  or \b False\b0 , you need to add or subtract it to/from the Set.
\par 
\par \trowd\trgaph105\trleft-106\cellx2685\cellx8495\pard\intbl\b Value\b0\cell\b Meaning\b0\cell\row
\intbl SFXAskCmdLine \cell If \b True\b0 , allows user (at runtime) to de-select the SFX program\f1 '\f0 s command line checkbox. Once de-selected, the command line will not be executed. \cf4\b NOTE:\cf0\b0  The checkbox doesn't appear unless there is a command line specified. \cell\row
\intbl SFXAskFiles \cell If \b True\b0 , lets user (at runtime) modify the SFX program's list of files to be extracted. \cell\row
\intbl SFXAutoRun\cell If \b True\b0 , extraction of the SFX contents will be performed automatically, no user actions are required.  \cf4\b NOTE:\cf0\b0  This works only if the SFX's filename starts with an exclamation mark ( \b ! \b0 ) -for security reasons- For example: \b !\b0 AUTORUN.EXE  \cf5\b WARNING:\cf0\b0  Use this only in rare cases! We advise you \cf6\b\i NOT\cf0\i0  \b0 to use this because files will be extracted onto the user's disk without his knowledge. \cell\row
\intbl SFXCheckSize\cell If \b True\b0 , then the size of the SFX executable will be checked before extracting. By default checking is set to \b True\b0 . If size checking is off (\b False\b0 ) and the SFX file layout is wrong it is very likely you will get a system error. \cell\row
\intbl SFXHideOverWriteBox\cell If \b True\b0 , does NOT show the user (at runtime) the SFX program\f1 '\f0 s dialog box that lets him choose the overwrite action for files that already exist. \cell\row
\intbl SFXNoSuccessMsg\cell if \b True\b0 , the message given at the end of the extraction process will not be given.\cell\row
\pard 
\par }
760
Scribble760
SFXOverWriteMode
OvrAlways;OvrConfirm;OvrNever;OvrOpts;Property;SFXOverWriteMode;


sfx:000100
Done


SFXOverWriteMode;SFXOverWriteMode_Property;TZipMaster_SFXOverWriteMode
FALSE
16
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\froman\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.SFXOverWriteMode\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb35\cf0 SFXOverWriteMode sets the the action for what the SFX program is supposed to do if it finds files that already exist.
\par \pard\sb115\sa115\b property\b0  SFXOverWriteMode: OvrOpts;
\par \pard\sa195\b\fs24 Description:
\par \pard\b0\fs20 If the option \f1 '\f0 SFXHideOverWriteBox\f1 '\f0  is \b True\b0 , then this option will be used during extraction.
\par 
\par \b SFXOverWriteMode\b0  can take one of the following values:
\par \pard\sb115\sa115\tx1985\b\fs24 Value\tab Meaning
\par \pard\tx1985\b0\fs20 OvrConfirm\tab Ask user when each file is found  (The default).
\par OvrAlways\tab Always overwrite existing files.
\par OvrNever\tab Never overwrite - skip those files.
\par 
\par }
770
Scribble770
SFXPath
Property;SFXPath;


sfx:000110
Done


SFXPath;SFXPath_Property;TZipMaster_SFXPath
FALSE
21
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\froman\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.SFXPath\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb35\cf0 SFXPath is the path where ZipSFX.bin is stored.
\par \pard\sb115\sa115\b property\b0  SFXPath: \b String\b0 ;
\par \pard\sa195\b\fs24 Description:
\par \pard\b0\fs20 SFXPath can be set to where the ZipSFX.bin file is located on disk. Must include the whole pathname, filename, and extension.
\par 
\par This is only used by the \cf2\strike ConvertSFX\strike0\{linkID=1150\}\cf0  method. If you don\f1 '\f0 t give the location yourself ZipMaster will try to locate the file as following:
\par \pard\fi-565\li565\tx565\tab\b 1.\b0  Location given by the SFXPath property. (This could be another name too.)
\par \tab\b 2.\b0  The current directory.
\par \tab\b 3.\b0  The application directory. (location of current .EXE file.)
\par \tab\b 4.\b0  The Windows System directory. (where DLL\f1 '\f0 s go.)
\par \tab\b 5.\b0  The Windows directory. (where DLL\f1 '\f0 s go.)
\par \tab\b 6.\b0  Location given by the DLLDirectory property.
\par \pard\tx565 
\par When searching, the default name \f1 '\f0 ZipSFX\f1 '\f0 .bin is used, except when given an explicit name by means of  this property.
\par SFXPath will be set to where ZipSFX.bin was found.
\par 
\par }
780
Scribble780
SuccessCnt
Property;SuccessCnt;


properties:000320
Done


SuccessCnt;SuccessCnt_Property;TZipMaster_SuccessCnt
FALSE
10
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\froman\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.SuccessCnt\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb35\cf0 SuccessCnt is the number of files the DLL\f1 '\f0 s could successfully handle.
\par \pard\sb115\sa115\b property\b0  SuccessCnt: Integer;
\par \pard\sa195\b\fs24 Description:
\par \pard\b0\fs20 Number of files that were successfully operated on (within the current Zip file). You can read this after every \cf2\strike Add\strike0\{linkID=1090\}\cf0 , \cf2\strike Delete\strike0\{linkID=1230\}\cf0 , and \cf2\strike Extract\strike0\{linkID=1250\}\cf0  operation.
\par 
\par }
790
Scribble790
TempDir
Property;TempDir;


properties:000350
Done


TempDir;TempDir_Property;TZipMaster_TempDir
FALSE
17
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\froman\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.TempDir\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb35\cf0 TempDir is the path and directory that will be used instead of the default temporary directory.
\par \pard\sb115\sa115\b property\b0  TempDir: \b String\b0 ;
\par \pard\sa195\b\fs24 Description:
\par \pard\b0\fs20 If TempDir is set to a drive/directory then this full path will be used.
\par 
\par While using Diskspanning:
\par \pard\li135 This can be useful when spanning large archives.
\par If this property is not set then the used path is the system default temporary directory. This is either the path set with the TEMPDIR or TMPDIR environment variable or if both are not available the current directory on the current drive.
\par \pard 
\par While using the DLL\f1 '\f0 s:
\par \pard\li135 If this property is not set then the used path is the same directory as where the zipfile is located.
\par 
\par }
800
Scribble800
TotalSizeToProcess
Property;TotalSizeToProcess;


BROWSE0002:0025
Done


TotalSizeToProcess;TotalSizeToProcess_Property;TZipMaster_TotalSizeToProcess
FALSE
12
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.TotalSizeToProcess\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb35\cf0 TotalSizeToProcess is the total uncompressed size of all files going to be processed.
\par \pard\sb115\sa115\b property\b0  TotalSizeToProcess: Cardinal;
\par \pard\sa195\b\fs24 Description:
\par \pard\b0\fs20 Total uncompressed file size of all files going to be processed while doing an \cf2\strike Add\strike0\{linkID=1090\}\cf0 ,  \cf2\strike Extract\strike0\{linkID=1250\}\cf0  or \cf2\strike Test\strike0\{linkID=1250\}\cf0\fs16  \fs20 operation. It is set in the \cf2\strike OnProgress\strike0\{linkID=1670\}\cf0  event with event type: TotalSize2Process.
\par \f1 Change in V1.72 may change during operation but valid after processing is complete
\par \f0 
\par 
\par }
810
Scribble810
Trace
Property;Trace;


properties:000300
Done


Trace;Trace_Property;TZipMaster_Trace
FALSE
12
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fnil\fcharset0 Times New Roman;}{\f2\froman\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;\red128\green128\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.Trace\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf0\f1\fs24\tab\cf2\ul See also:\cf3\ulnone\{linkID=820\}\cf0  
\par \pard\sb35\tx355\f0\fs20 Trace is an option to get extended messages from the DLL\f2 '\f0 s
\par \pard\sb115\sa115\tx355\b property\b0  Trace Boolean;
\par \pard\sa195\tx355\b\fs24 Description:
\par \pard\tx355\b0\fs20 Similar to Verbose, except that this one is aimed at developers. It lets you trace the execution of the code in the DLL\f2 '\f0 s. Helps you locate possible bugs in the DLL\f2 '\f0 s, and helps you understand why something is happening a certain way.
\par 
\par \pard\fi-845\li845\tx845\cf4\b NOTE:\tab\cf0\b0 Text messages for the Trace come to you through the \cf2\strike OnMessage\strike0\{linkID=1610>main\}\cf0  event.
\par 
\par }
820
Scribble820
Trace see also




Writing



FALSE
8
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Times New Roman;}{\f1\fnil Arial;}}
{\colortbl ;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\strike\f0\fs24 Verbose\cf2\strike0\{linkID=890>main\}\cf0 
\par \cf1\strike Unattended \cf2\strike0\{linkID=830>main\}\cf0 
\par \cf3\lang1033\f1\fs20 
\par 
\par 
\par }
830
Scribble830
Unattended
Property;Unattended;


properties:000310
Done


TZipMaster_Unattended;Unattended;Unattended_Property
FALSE
35
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fnil\fcharset0 Times New Roman;}{\f2\froman\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;\red255\green0\blue0;\red128\green128\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.Unattended\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\tab\ul\f1\fs24 See also:\cf3\ulnone\{linkID=840\}\cf0  
\par \pard\sb35\tx355\f0\fs20 Unattended is an option to make sure you won\f2 '\f0 t get ANY error and/or warning messages from the component or the DLL\f2 '\f0 s.
\par \pard\sb115\sa115\tx355\b property\b0  Unattended: Boolean;
\par \pard\sa195\tx355\b\fs24 Description:
\par \pard\tx355\b0\fs20 Default is that error or warning messages are given by the component/DLL\f2 '\f0 s which need user interaction. With this property set to \b True \b0 ALL messages are suppressed. This also implies that you will not be visually informed of problems while executing your code.
\par 
\par If you want to use this property to test for bad zipfiles look at the following code:
\par 
\par \pard\tx275\cf4\i\tab // Set Unattended to avoid technical errors from being displayed.
\par \tab // You can still catch error messages in your OnMessage handler, if you want.
\par \cf0\tab ZipMaster1.Unattended := True;
\par 
\par \cf4\tab // The open occurs when you assign the filename
\par \cf0\tab ZipMaster1.ZipFileName := a_File_Name;
\par 
\par \cf4\tab // If the zipfile is bad, the open fails and the filename is set to an empty string.
\par \cf0\tab If ZipMaster1.ZipFileName = \f2 ''\f0  then
\par \tab begin
\par \pard\tx275\tx565\cf4\tab\tab // Do something: (skip) (check the ErrCode property) (write to a log file)
\par \cf0\tab\tab ShowMessage( \f2 '\f0 Error in Zipfile\f2 '\f0  + IntToStr( ZipMaster1.ErrCode) );
\par \pard\tx275\tab end else
\par \tab begin
\par \pard\tx275\tx565\tab\tab ZipMaster1.Unattended := False;\tab\cf4 // Not needed, depends on the next action\cf0 
\par \cf4\tab\tab // Continue processing.   
\par \pard\tx275\cf0\tab end;
\par \cf4\tab // Turn on Unattended again in case there's another problem that we are not looking for.
\par \cf0\tab ZipMaster1.Unattended := False;
\par \i0 
\par \pard\fi-1125\li1125\sa115\tx1125\cf5\b NOTE1:\tab\cf0\b0 All messages are still available in the \cf2\strike OnMessage\strike0\{linkID=1610>main\}\cf0  event and the \cf2\strike ErrCode\strike0\{linkID=420>main\}\cf0  and \cf2\strike Message\strike0\{linkID=600>main\}\cf0  properties.
\par \pard\fi-1125\li1125\tx1125\cf5\b NOTE2:\tab\cf0\b0 For this to work correctly you must use DLL versions 1.5 or later.
\par 
\par }
840
Scribble840
Unattended see also




Writing



FALSE
8
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Times New Roman;}{\f1\fnil Arial;}}
{\colortbl ;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\strike\f0\fs24 Message\cf2\strike0\{linkID=600>main\}\cf0 
\par \cf1\strike Verbose\cf2\strike0\{linkID=890>main\}\cf0 
\par \cf1\strike Trace\cf2\strike0\{linkID=810>main\}\cf3\lang1033\f1\fs20 
\par 
\par 
\par }
850
Scribble850
UnzBusy
Property;UnzBusy;


BROWSE0002:0028
Done


TZipMaster_UnzBusy;UnzBusy;UnzBusy_Property
FALSE
10
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.UnzBusy\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb35\cf0 UnzBusy gives the status from the UnZip process.
\par \pard\sb115\sa115\b property\b0  UnzBusy: Boolean;
\par \pard\sa195\b\fs24 Description:
\par \pard\b0\fs20 If \b True\b0 , an Unzip operation is processing - you must delay your next \cf2\strike Extract\strike0\{linkID=1250\}\cf0  operation until this is \b False\b0 . You won't need to be concerned about this in most applications. This can be used to synchronize UnZip operations in a multi-threaded program.
\par 
\par }
860
Scribble860
UnzVers
Property;UnzVers;


BROWSE0002:0029
Done


TZipMaster_UnzVers;UnzVers;UnzVers_Property
FALSE
10
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.UnzVers\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb35\cf0 UnzVers gives the version number of the UnZip DLL.
\par \pard\sb115\sa115\b property\b0  UnzVers: Integer;
\par \pard\sa195\b\fs24 Description:
\par \pard\b0\fs20 The version number of UNZDLL.DLL. For example, 160 = version 1.60.
\par 
\par }
870
Scribble870
UseDirOnlyEntries
Property;UseDirOnlyEntries;


properties:000110
Done


TZipMaster_UseDirOnlyEntries;UseDirOnlyEntries;UseDirOnlyEntries_Property
FALSE
10
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fnil\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.UseDirOnlyEntries\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf0\f1\fs24\tab\cf2\ul See also:\cf3\ulnone\{linkID=880\}\cf0 
\par \pard\sb35\tx355\f0\fs20 UseDirOnlyEntries can be set to include directories in the ZipDirEntry records.
\par \pard\sb115\sa115\tx355\b property\b0  UseDirOnlyEntries: Boolean;
\par \pard\sa195\tx355\b\fs24 Description:
\par \pard\sb35\tx355\b0\fs20 UseDirOnlyEntries can be set to \b True\b0  to include directories in the ZipDirEntry structures, default is \b False\b0  because on a windows system directory only entries are not needed and normally not present in a ziparchive.
\par 
\par }
880
Scribble880
UseDirOnlyEntries see only




Writing



FALSE
8
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Times New Roman;}{\f1\fnil Arial;}}
{\colortbl ;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\strike\f0\fs24 DirEntry\cf2\strike0\{linkID=210>main\}\cf0 
\par \cf1\strike DirOnlyCount \cf2\strike0\{linkID=390>main\}\cf0 
\par \cf1\strike Count\cf2\strike0\{linkID=380>main\}\cf3\lang1033\f1\fs20 
\par 
\par 
\par }
890
Scribble890
Verbose
Property;Verbose;


properties:000290
Done


TZipMaster_Verbose;Verbose;Verbose_Property
FALSE
10
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fnil\fcharset0 Times New Roman;}{\f2\froman\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.Verbose\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf0\f1\fs24\tab\cf2\ul See also:\cf3\ulnone\{linkID=900\}\cf0 
\par \pard\sb35\tx355\f0\fs20 Verbose is an option to get more messages from the DLL\f2 '\f0 s
\par \pard\sb115\sa115\tx355\b property\b0  Verbose: Boolean;
\par \pard\sa195\tx355\b\fs24 Description:
\par \pard\tx355\b0\fs20 If \b True\b0 , ask for the maximum amount of "possibly important" information from the DLL\f2 '\f0 s.  The informational messages are delivered to your program via the \cf2\strike OnMessage\strike0\{linkID=1610\}\cf0  event, and the \cf2\strike ErrCode\strike0\{linkID=420\}\cf0  and \cf2\strike Message\strike0\{linkID=600\}\cf0  properties. This is primarily used to determine how much info you want to show your "end-users" - developers can use the \cf2\strike Trace\strike0\{linkID=810\}\cf0  property to get additional information.
\par 
\par }
900
Scribble900
Verbose see also




Writing



FALSE
8
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Times New Roman;}{\f1\fnil Arial;}}
{\colortbl ;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\strike\f0\fs24 Trace\cf2\strike0\{linkID=810>main\}\cf0 
\par \cf1\strike Unattended\cf2\strike0\{linkID=830>main\}\cf0 
\par \cf1\strike OnMessage\cf2\strike0\{linkID=1610>main\}\cf3\lang1033\f1\fs20 
\par 
\par 
\par }
910
Scribble910
ZipBusy
Property;ZipBusy;


BROWSE0002:002c
Done


TZipMaster_ZipBusy;ZipBusy;ZipBusy_Property
FALSE
10
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.ZipBusy\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb35\cf0 ZipBusy gives the status from the Zip process.
\par \pard\sb115\sa115\b property\b0  ZipBusy: Boolean;
\par \pard\sa195\b\fs24 Description:
\par \pard\b0\fs20 If \b True\b0 , a Zip operation is processing - you must delay your next Add/Delete operation until this is \b False\b0 .  You won't need to be concerned about this in most applications. This can be used to synchronize Zip operations in a multi-threaded program.
\par 
\par }
920
Scribble920
ZipComment
Property;ZipComment;


properties:000360
Done


TZipMaster_ZipComment;ZipComment;ZipComment_Property
FALSE
13
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.ZipComment\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb35\cf0 Use ZipComment to set and if present get, the comment appended to the zip file.
\par \pard\sb115\sa115\b property\b0  ZipComment: \b String\b0 ;
\par \pard\sa195\b\fs24 Description:
\par \pard\b0\fs20 Setting this property during runtime will change the comment in the ziparchive.
\par Every ziparchive(file) can have a general comment appended to it. This comment is not zipped and may have a maximum size of 64K. It is however not desirable to have a comment of this size because it is not packed. A better solution would be to use and include an ASCII file (i.e. xxx.DIZ) in the zipped archive.
\par 
\par \f1 To build an archive with a comment, set ZipComment after setting the \cf2\strike ZipFilename\cf4\strike0\{linkID=1020\}\cf0\f0 
\par 
\par }
930
Scribble930
ZipContents
Property;ZipContents;ZipDirEntry;


BROWSE0002:002e
Done


TZipMaster_ZipContents;ZipContents;ZipContents_Property
FALSE
15
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fnil\fcharset0 Times New Roman;}{\f2\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.ZipContents\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\tab\cf3 
\par \pard\sb35\tx355\cf0 ZipContents is a list of Zip archive information.
\par \pard\sb115\sa115\b property\b0  ZipContents: \f1\fs24 TList;\f0\fs20 
\par \pard\sa195\tx355\b\fs24 Description:
\par \pard\b0\f1 TList \cf3\f0\fs20 that contains the directory of the archive specified in the \cf2\strike ZipFileName\strike0\{linkID=1020\}\cf3  property. Every entry in the list points to a ZipDirEntry record.  This is automatically filled with data whenever an assignment is made to ZipFileName, and can be manually filled by calling the List method. For your convenience, this VCL hides the TList memory allocation issues from you. Automatic updates to this list occur whenever this VCL changes the Zip file. The event \cf2\strike OnDirUpdate\strike0\{linkID=1560\}\cf3  is triggered for you each time this list is updated - that is your queue to refresh your directory display.
\par \pard\tx355 
\par Each entry in the ZipContents TList is a pointer to \cf2\strike ZipDirEntry\cf4\strike0\{linkID=940\}\cf3  record\f2 ;
\par 
\par DEPRECIATED
\par Replaced by \cf2\strike DirEntry\cf4\strike0\{linkID=210\}\cf3 .\cf0\f0 
\par 
\par }
940
Scribble940
ZipDirEntry
record;ZipDirEntry;


properties:000370
Done


TZipMaster_ZipDirEntry;ZipDirEntry;ZipDirEntry_record
FALSE
35
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fswiss\fcharset0 Arial;}{\f2\fnil\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.DirEntry\{keepn\} \cf0 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\tab\cf3 
\par \pard\sb35\tx355\cf0 Zip\f1 DirEntry\f0  is a \f1 record\f0  of Zip archive \f1 file \f0 information.
\par \pard\sb115\sa115\tx355\b\f1 record\b0\f0  Zip\f1 DirEntry;\f0 
\par \pard\sa195\tx355\b\fs24 Description:
\par \pard\b0\f2 TList\cf3\f0\fs20  that contains the directory of the archive specified in the \cf2\strike ZipFileName\strike0\{linkID=1020\}\cf3  property. Every entry in the list points to a ZipDirEntry record.  This is automatically filled with data whenever an assignment is made to ZipFileName, and can be manually filled by calling the List method. For your convenience, this VCL hides the TList memory allocation issues from you. Automatic updates to this list occur whenever this VCL changes the Zip file. The event \cf2\strike OnDirUpdate\strike0\{linkID=1560\}\cf3  is triggered for you each time this list is updated - that is your queue to refresh your directory display.
\par \pard\tx355 
\par Each entry in the \cf2\strike ZipContents\cf4\strike0\{linkID=930\}\cf3  TList is a pointer to ZipDirEntry record:\cf0 
\par 
\par ZipDirEntry = \b packed Record\b0 
\par \pard\fi-425\li425\tx425\tx2685\tab\cf2\ul MadeByVersion\ulnone\{linkID=950\}\cf0\tab : Byte;
\par \tab\cf2\ul HostVersionNo\ulnone\{linkID=980\}\cf0\tab : Byte;
\par \tab Version\tab : Word;
\par \tab\cf2\ul Flag\ulnone\{linkID=970\}\cf0\tab : Word;
\par \tab\cf2\ul CompressionMethod\ulnone\{linkID=990\}\cf0\tab : Word;
\par \pard\fi-425\li425\tx425\tx2685\tx4105\tab DateTime\tab : LongInt;\tab\cf1\i\{\- Time: Word; Date: Word; \}\cf0\i0 
\par \pard\fi-425\li425\tx425\tx2685\tab CRC32\tab : LongInt;
\par \tab CompressedSize\tab : LongInt;
\par \tab UncompressedSize\tab : LongInt;
\par \tab FileNameLength\tab : Word;
\par \tab ExtraFieldLength\tab : Word;
\par \tab FileCommentLen\tab : Word;
\par \tab StartOnDisk\tab : Word;
\par \pard\fi-425\li425\tx425\tx2685\tx4105\tab IntFileAttrib\tab : Word;\tab\cf1\i\{\- Some zip programs set bit 0 to indicate a text file. \}\cf0\i0 
\par \tab ExtFileAttrib\tab : LongWord;\tab\cf1\i\{\- The low-order byte is the orig. directory attributes for this file. \}\cf0\i0 
\par \pard\fi-425\li425\tx425\tx2685\tab RelOffLocalHdr\tab : LongWord;
\par \tab FileName\tab : \b String\b0 ;
\par \tab FileComment\tab : \b String\b0 ;
\par \tab\cf2\ul Encrypted\ulnone\{linkID=960\}\cf0\tab : Boolean; 
\par \pard\fi-425\li425\tx425\tx2685\tx4105\tab ExtraData\tab : pChar;\tab\cf1\i\{\- ExtraFieldLength bytes from the central header. \}\cf0\i0 
\par \pard\tx425\tx2685\tx4105\b end\b0 ;
\par 
\par }
950
Scribble950





Done



FALSE
3
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
\viewkind4\uc1\pard\sa115\lang3081\f0\fs24 This indicates the version number of the software used to encode the file.  The value \b /\b0\fs20  10 indicates the major version number and the value \b mod\b0  10 is the minor version number.
\par }
960
Scribble960





Done



FALSE
3
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
\viewkind4\uc1\pard\sa115\lang3081\f0\fs24 This indicates if you need a password to extract the file.
\par }
970
Scribble970





Done



FALSE
16
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red128\green128\blue0;}
\viewkind4\uc1\pard\sa115\lang3081\b\f0\fs24 Bit 0\b0\fs20 : If set, indicates that the file is encrypted.
\par \pard\tx565\tab If method 6 Imploding is used:
\par \pard\fi-565\li565\tx565\b Bit 1:\b0\tab If set, indicates an 8K sliding dictionary was used. if clear, then a 4K sliding dictionary was used.
\par \pard\fi-565\li565\sa115\tx565\b Bit 2:\b0\tab If set, indicates 3 Shannon-Fano trees were used to encode the sliding dictionary output.  If clear, then 2 Shannon-Fano trees were used.
\par \pard\tx565\tab If method 8 Deflating is used:
\par \b Bit 2  Bit 1
\par \pard\tx135\tx705\tx1125\b0\tab 0\tab 0\tab Normal compression option was used.
\par \tab 0\tab 1\tab Maximum compression option was used.
\par \tab 1\tab 0\tab Fast compression option was used.
\par \pard\sa115\tx135\tx705\tx1125\tab 1\tab 1\tab Super Fast compression option was used.
\par \pard\fi-1125\li1125\sa115\tx1125\cf1\b NOTE1:\tab\cf0\b0 Bits 1 and 2 are undefined if the compression method is any other.
\par \pard\fi-565\li565\sa115\tx565\b Bit 3:\tab\b0 If this bit is set, the fields CRC32, CompressedSize and UncompressedSize are set to zero.  The correct values are put in the data descriptor immediately following the compressed data.
\par \pard\fi-1125\li1125\tx1125\cf1\b NOTE2:\tab\cf0\b0 The upper three bits are reserved and used internally by some software when processing the zipfile. The remaining bits are unused.
\par }
980
Scribble980
Zip Operating systems
ZipHostSystem;



Done



FALSE
14
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\froman\fcharset0 Times New Roman;}}
\viewkind4\uc1\pard\lang3081\f0\fs24 Type of operating system used to make archive:
\par \pard\tqr\tx275\tqr\tx425\tqr\tx2405\tqr\tx2545\tab 0\tab - MS-DOS, OS/2 and Win32
\par \tab 1\tab - Amiga\tab 2\tab - VAX / VMS
\par \tab 3\tab - Unix\tab 4\tab - VM / CMS
\par \tab 5\tab - Atari ST\tab 6\tab - OS/2 H.P.F.S.
\par \tab 7\tab - Macintosh\tab 8\tab - Z-System
\par \tab 9\tab - CP/M\tab 10\tab - TOPS20
\par \tab 11\tab - NTFS\tab 12\tab - QDOS
\par \tab 13\tab - Acorn\tab 14\tab - VFAT W\f1\fs20 '\f0 95 and NT
\par \tab 15\tab - MVS\tab 16\tab - BeOS
\par \tab 17\tab - Tandem / NSK\tab 18\tab thru 255 \f1 -\f0  unused
\par 
\par }
990
Scribble990
Zip Compression Methods
Compression methods;



Done



FALSE
15
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red255\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\f0\fs24\tab\cf0\fs20 0\tab - The file is stored (no compression)
\par \tab 1\tab - The file is Shrunk
\par \tab 2\tab - The file is Reduced with compression factor 1
\par \tab 3\tab - The file is Reduced with compression factor 2
\par \tab 4\tab - The file is Reduced with compression factor 3
\par \tab 5\tab - The file is Reduced with compression factor 4
\par \tab 6\tab - The file is Imploded
\par \tab 7\tab - Reserved for Tokenizing compression algorithm
\par \tab 8\tab - The file is Deflated
\par \tab 9\tab - Reserved for enhanced Deflating
\par \tab 10\tab - PKWARE Date Compression Library Imploding
\par 
\par }
1000
Scribble1000
ZipEOC
Property;ZipEOC;


BROWSE0002:002f
Done


TZipMaster_ZipEOC;ZipEOC;ZipEOC_Property
FALSE
10
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fnil\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.ZipEOC\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf0\f1\fs24\tab\cf2\ul See also:\cf3\ulnone\{linkID=1010\}\cf0  \cf4\f0\fs20 
\par \pard\sb35\tx355\cf0 ZipEOC contains the location measured from the start of the zip file of the End-Of-Central-Dir.
\par \pard\sb115\sa115\tx355\b property\b0  ZipEOC: Integer;
\par \pard\sa195\tx355\b\fs24 Description:
\par \pard\sa115\tx355\b0\fs20 ZipEOC is valid after a zip file's contents have been read successfully (which happens when you assign something to \cf2\strike ZipFileName\strike0\{linkID=1020\}\cf0 ).
\par 
\par }
1010
Scribble1010
ZipEOC see also




Writing



FALSE
6
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Times New Roman;}{\f1\fnil Arial;}}
{\colortbl ;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\strike\f0\fs24 ZipSOC\cf2\strike0\{linkID=1040>main\}\cf3\lang1033\f1\fs20 
\par 
\par 
\par }
1020
Scribble1020
ZipFileName
Property;ZipFileName;


properties:000390
Done


TZipMaster_ZipFileName;ZipFileName;ZipFileName_Property
FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red128\green128\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.ZipFileName\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb35\cf0 ZipFileName contains the Zip archive filename.
\par \pard\sb115\sa115\b property\b0   ZipFileName: \b String\b0 ;
\par \pard\sa195\b\fs24 Description:
\par \pard\sa235\b0\fs20 Pathname of a Zip archive file.  If the file doesn't already exist, you will only be able to use the \cf2\strike Add\strike0\{linkID=1090\}\cf0  method.  It is recommended to use a fully qualified pathname in this property, unless your program can always ensure that a known directory will be the "current" directory.
\par \pard\fi-845\li845\tx845\cf4\b NOTE:\cf0\b0\tab Some filenames are illegal (operating system issue) like Con, Com1, Com2, LPT1-LPT9.
\par \pard\tx845 
\par \pard\fi-845\li845\tx845\cf4\b NOTE:\cf0\b0\tab When you assign a value to this property, the contents of the zipfile will be read into \cf2\strike ZipContents\strike0\{linkID=930>main\}\cf0 .
\par 
\par }
1030
Scribble1030
ZipFileSize
Property;ZipFileSize;


properties:000380
Done


TZipMaster_ZipFileSize;ZipFileSize;ZipFileSize_Property
FALSE
10
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\froman\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.ZipFileSize\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb35\cf0 ZipFileSize contains the size of entire Zip file (if it\f1 '\f0 s a spanned set, then size of the last chunk).
\par \pard\sb115\sa115\b property\b0  ZipFileSize: Integer;
\par \pard\sa195\b\fs24 Description:
\par \pard\sa115\b0\fs20 ZipFileSize is valid after a zip file's contents have been read successfully (which happens when you assign something to \cf2\strike ZipFileName\strike0\{linkID=1020\}\cf0 ).
\par 
\par }
1040
Scribble1040
ZipSOC
Property;ZipSOC;


BROWSE0002:0032
Done


TZipMaster_ZipSOC;ZipSOC;ZipSOC_Property
FALSE
10
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fnil\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.ZipSOC\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf0\f1\fs24\tab\cf2\ul See also:\cf3\ulnone\{linkID=1050\}\cf0  \cf4\f0\fs20 
\par \pard\sb35\tx355\cf0 ZipSOC contains the location measured from the start of the zip file of the Start-Of-Central-Dir.
\par \pard\sb115\sa115\tx355\b property\b0  ZipSOC: Integer;
\par \pard\sa195\tx355\b\fs24 Description:
\par \pard\sa115\tx355\b0\fs20 ZipSOC is valid after a zip file's contents have been read successfully (which happens when you assign something to \cf2\strike ZipFileName\strike0\{linkID=1020\}\cf0 ).
\par 
\par }
1050
Scribble1050
ZipSOC see also




Writing



FALSE
6
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Times New Roman;}{\f1\fnil Arial;}}
{\colortbl ;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\strike\f0\fs24 ZipEOC\cf2\strike0\{linkID=1000>main\}\cf3\lang1033\f1\fs20 
\par 
\par 
\par }
1060
Scribble1060
ZipStream
Property;ZipStream;


BROWSE0002:0033
Done


TZipMaster_ZipStream;ZipStream;ZipStream_Property
FALSE
15
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fnil\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;\red128\green128\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.ZipStream\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf0\f1\fs24\tab\cf2\ul See also:\cf3\ulnone\{linkID=1070\}\cf4\f0\fs20 
\par \pard\sb35\tx355\cf0 ZipStream is a TMemoryStream descendant used for all zip streaming activities.
\par \pard\sb115\sa115\tx355\b property\b0  ZipStream: TZipStream;
\par \pard\sa195\tx355\b\fs24 Description:
\par \pard\tx355\b0\fs20 TZipStream is a descendant of \cf2\strike TMemoryStream\strike0\{link=!AL(`TMemoryStream',1,`',`main')\}\cf0  that is automatically created and finally destroyed for you. You are not allowed to delete this stream but you can use all other stream methods a.o. Clear it after use to preserve memory.
\par It is used for all ZipMasters methods on data streams.
\par 
\par For convenience the SetPointer method of TCustomMemoryStream is made public in this descendant and as such ready to use.
\par 
\par \pard\fi-845\li845\sa115\tx845\cf5\b NOTE:\cf0\b0\tab Although ZipStream.Memory is read-only, the data it is pointing to can be read and written.
\par 
\par }
1070
Scribble1070
ZipStream see also




Writing



FALSE
10
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Times New Roman;}{\f1\fnil Arial;}}
{\colortbl ;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\strike\f0\fs24 ExtractFileToStream\cf2\strike0\{linkID=1260>main\}
\par \cf1\strike ExtractStreamToStream\cf2\strike0\{linkID=1280>main\}
\par \cf1\strike AddStreamToFile\cf2\strike0\{linkID=1110>main\}
\par \cf1\strike AddStreamToStream\cf2\strike0\{linkID=1120>main\}
\par \cf3\lang1033\f1\fs20 
\par 
\par 
\par }
1080
Scribble1080
ZipVers
Property;ZipVers;


BROWSE0002:0034
Done


TZipMaster_ZipVers;ZipVers;ZipVers_Property
FALSE
10
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.ZipVers\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb35\cf0 ZipVers gives the version number of the Zip DLL.
\par \pard\sb115\sa115\b property\b0  ZipVers: Integer;
\par \pard\sa195\b\fs24 Description:
\par \pard\b0\fs20 The version number of ZIPDLL.DLL. For example, 1\f1 7\f0 0 = version 1.\f1 7\f0 0.
\par 
\par }
1090
Scribble1090
Add
Add;Methods;


BROWSE0003:0001
Done


Add;Add_Method;TZipMaster_Add
FALSE
17
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fnil\fcharset0 Times New Roman;}{\f2\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.Add\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf0\f1\fs24\tab\cf2\ul See also:\cf3\ulnone\{linkID=1100\}\cf0 
\par \pard\sb35 The Add method adds the specified files t\f0\fs20 o the archive.
\par \pard\sb115\sa115\tx355\b\f2 function\b0\f0  Add\f2 : integer\f0 ;
\par \cf2\strike\f2 changed\cf3\strike0\{linkID=110\}\cf0\f0 
\par \pard\sa195\tx355\b\fs24 Description:
\par \pard\tx355\b0\fs20 Adds all files specified in the \cf2\strike FSpecArgs\strike0\{linkID=480\}\cf0  property into the archive specified by the \cf2\strike ZipFileName\strike0\{linkID=1020\}\cf0  property.
\par Files specified by the \cf2\strike AddStoreSuffixes\strike0\{linkID=320\}\cf0  set, that are already compressed, will not be compressed again, but will be stored "as is" in the archive. This applies normally to .ARC, .ARJ, .GIF, .LZH, .PNG, .TAZ, .TGZ, .Z, .ZIP and .ZOO files. Note that .JPG files WILL be compressed, since they can still be squeezed down in size by a notable margin.
\par It is also possible to use \cf2\ul relative paths\ulnone\{linkID=1130\}\cf0  but your own program has to perform a few steps.
\par 
\par \f2 Now checks Busy.
\par Returns ErrCode or BUSY_ERROR
\par \f0 
\par 
\par }
1100
Scribble1100
Add see also




Writing



FALSE
8
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Times New Roman;}{\f1\fnil Arial;}}
{\colortbl ;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\strike\f0\fs24 AddOptions\cf2\strike0\{linkID=310>main\}\cf0 
\par \cf1\strike AddStoreSuffixes\cf2\strike0\{linkID=320>main\}\cf0 
\par \cf1\strike Relative_Paths_With_ZipMaster\cf2\strike0\{linkID=1130>main\}\cf3\lang1033\f1\fs20 
\par 
\par 
\par }
1110
Scribble1110
AddStreamToFile
AddStreamToFile;Methods;


BROWSE0003:0002
Done


AddStreamToFile;AddStreamToFile_Method;TZipMaster_AddStreamToFile
FALSE
33
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\froman\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red255\green0\blue0;\red255\green0\blue255;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.AddStreamToFile\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb35\cf0 The AddStreamToFile method adds the specified stream to the zip archive.
\par \pard\sb115\sa115\b Procedure\b0  AddStreamToFile( Filename: \b String\b0  = ''; FileDate: DWord = 0; FileAttr: DWord = 0 );
\par \pard\sa195\b\fs24 Description:
\par \pard\b0\fs20 Adds stream data, which should be in \cf2\strike ZipStream\strike0\{linkID=1060\}\cf0 , to the zip archive\cf2\strike ZipFileName\strike0\{linkID=1020\}\cf0  under the filename given in the parameter FileName. Also a FileDate (DOS filedate and time) and some FileAttributes can be set.
\par 
\par \pard\fi-135\li135\tx135 -\tab If NO FileName is passed as parameter then the first in the list of \cf2\strike FSpecArgs\strike0\{linkID=480\}\cf0  will be taken as FileName. Wildcards are not allowed!
\par 
\par -\tab If NO FileDate is passed as parameter, the local system date and time will be used.
\par 
\par -\tab FileAttr can be one or a logical combination of the following types:
\par \tab FILE_ATTRIBUTE_ARCHIVE, FILE_ATTRIBUTE_HIDDEN, FILE_ATTRIBUTE_READONLY, FILE_ATTRIBUTE_SYSTEM.
\par \tab If NO FileAttr is passed as parameter, it will be set to 0.
\par \pard\tx135 
\par \pard\fi-1125\li1125\sa115\tx1125\i Example:\cf4\tab // Add something as data to the ZipStream...
\par \pard\fi-565\li565\tx565\cf0\tab ZipMaster1.ZipStream.LoadFromFile( \f1 '\f0 L:\\SomeFile.dat\f1 '\f0  );
\par \cf4\tab // *** Other possibilities ***
\par \pard\fi-565\li565\tx565\tx6235\cf5\tab // ZipMaster1.ZipStream.LoadFromStream( aStream );\cf0\tab\cf4 // Or use data from another stream.\cf5 
\par \tab // ZipMaster1.ZipStream.Write( aTextbuffer, NumberOfBytes );\cf0\tab\cf4 // Or data from a character buffer.\cf5 
\par \pard\fi-565\li565\tx565\cf0\tab ZipMaster1.AddStreamToFile( \f1 '\f0 MyFilenameToAdd.dat\f1 '\f0  );
\par \cf4\tab // *** Another possibility ***
\par \cf5\tab // ZipMaster1.FSpecArgs.Clear;
\par \tab // ZipMaster1.FSpecArgs.Append( \f1 '\f0 MyFilenameToAdd.dat\f1 '\f0  );
\par \tab // ZipMaster1.AddStreamToFile;
\par \cf4\tab // *** Another possibility ***
\par \cf5\tab // ZipMaster1.AddStreamToFile( \f1 '\f0 MyFilenameToAdd.dat\f1 '\f0 , 0, FILE_ATTRIBUTE_ARCHIVE );
\par \cf4\tab // *** Another possibility ***
\par \cf5\tab // ZipMaster1.AddStreamToFile( \f1 '\f0 MyFilenameToAdd.dat\f1 '\f0 , TDateTime( \f1 '\f0 6-4-00 14:32\f1 '\f0  ).FileDate );
\par 
\par }
1120
Scribble1120
AddStreamToStream
AddStreamToStream;Methods;


BROWSE0003:0003
Done


AddStreamToStream;AddStreamToStream_Method;TZipMaster_AddStreamToStream
FALSE
42
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fnil\fcharset0 Times New Roman;}{\f2\froman\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red255\green0\blue0;\red255\green0\blue255;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.AddStreamToStream\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb35\cf0 The AddStreamToStream method adds memory stream data to the ZipStream as packed data.
\par \pard\sb115\sa115\b Function\b0   AddStreamToStream\f1\fs24 ( InStream: TMemoryStream ): TZi\f0\fs20 pStream;
\par \pard\sa195\b\fs24 Description:
\par \pard\b0\fs20 Adds the data from a memory stream to the \cf2\strike ZipStream\strike0\{linkID=1060\}\cf0 , so no files are involved in this action.
\par 
\par The size of the output stream is set to 6 bytes more than the actual output size because:
\par \pard\fi-135\li135\tx135 -\tab The first two bytes are used as a flag, STORED = 0 or DEFLATED = 8.
\par \pard\tx135\b\i Type
\par \b0\i0\tab pFlag = ^\i Smallint;
\par \tab pCRC = ^Cardinal;
\par \b Var
\par \b0\tab Flag: SmallInt;
\par \tab CRC: Cardinal;
\par \tab Flag := (pFlag ( ZipMaster1.ZipStream.Memory ))^;
\par \pard\fi-135\li135\tx135\i0 -\tab The next four bytes are set to the calculated CRC value.
\par \i\tab CRC := (pCRC( pChar( ZipMaster1.ZipStream.Memory ) + 2))^;
\par \i0 
\par \tab The start of the stream (Position) is set to the actual data start, i.e. 6 bytes from the start of the stream.
\par \pard\tx135 
\par \pard\fi-565\li565\tx135\i Example:
\par \pard\tx135\b Var
\par \pard\fi-565\li565\tx565\tx845\b0\tab MyData: TMemoryStream;
\par 
\par \pard\fi-845\li845\tx275\tx845\tab\tab MyData.Create;
\par 
\par \cf4\tab\tab // Add some text as data...
\par \cf0\tab\tab MyData.LoadFromFile( \f2 '\f0 L:\\SomeFile.dat\f2 '\f0  );
\par \pard\fi-845\li845\tx275\tx845\tx5525\tab\tab\cf5 // MyData.LoadFromStream( aStream );\cf0\tab\cf4 // Or use data from another stream.\cf0 
\par \tab\tab\cf5 // MyData.Write( aTextbuffer, NumberOfBytes );\cf0\tab\cf4 // Or data from a character buffer.\cf0 
\par \pard\fi-845\li845\tx275\tx845\tab\tab ZipMaster1.AddStreamToStream( MyData );
\par \cf4\tab\tab // *** Another possibility ***
\par \cf5\tab\tab // Var MyOutData: TZipStream;
\par \cf0\tab\tab\cf5 // MyOutData := ZipMaster1.AddStreamToStream( MyData );
\par \pard\fi-565\li565\tx565\tx845\cf0\tab MyData.Free;
\par 
\par \cf4\b\tab // The Output can be found in the ZipMaster1.ZipStream property.
\par 
\par }
1130
Scribble1130
Using relative paths with ZipMaster
Relative paths with ZipMaster;



Done


Relative_Paths_With_ZipMaster
FALSE
15
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red0\green0\blue255;\red128\green128\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 How to Use and Store Relative Paths\cf0\{keepn\} 
\par \pard\fi-275\li275\tx275\fs20 1)\tab Set the AddOptions to AddRecurseDirs and AddDirNames:
\par \b0\i\tab with ZipMaster1 do
\par \pard\fi-275\li275\sa55\tx275\tx565\tab\tab AddOptions := AddOptions + [AddRecurseDirs, AddDirNames];
\par \pard\fi-275\li275\tx275\b\i0 2)\tab Add a file specification like *.* or *.pas or something like this:
\par \pard\fi-275\li275\sa55\tx275\b0\tab ZipMaster1.FSpecArgs.Append( '*.*' );
\par \pard\fi-275\li275\tx275\b 3)\tab Set the RootDir property to the desired base directory, Drive and Directory where the relative path should start.\b0 
\par \pard\fi-275\li275\sa55\tx275\i\tab ZipMaster1.RootDir :=\i0 '\i C:\\aBaseDir\\AnotherBaseDir\i0 '\i ;
\par \pard\fi-275\li275\tx275\b\i0 4)\tab Now do an Add, and you should have the desired result. The Drive ID and Dirname of your base directory will not be stored in the archive.
\par \b0\i\tab ZipMaster1.Add;
\par \pard\fi-845\li845\sb115\tx845\cf2\b\i0 NOTE:\cf3\tab\cf0\b0 The reason that demo1 saves whole pathnames is because it's GUI design intentionally stores complete pathnames in the FSpecArgs.
\par 
\par }
1140
Scribble1140
AppendSlash
AppendSlash;Methods;


BROWSE0003:0004
Done


AppendSlash;AppendSlash_Method;TZipMaster_AppendSlash
FALSE
10
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\froman\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.AppendSlash\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb35\cf0 The AppendSlash method adds, if not already present, a slash \f1 '\f0\\\f1 '\f0  to the specified path.
\par \pard\sb115\sa115\b Function\b0  AppendSlash( DirPath: \b String\b0  ): \b String\b0 ;
\par \pard\sa195\b\fs24 Description:
\par \pard\b0\fs20 Adds a backward slash to a path and returns the changed path.
\par 
\par }
1150
Scribble1150
ConvertSFX
ConvertSFX;Methods;


BROWSE0003:0005
Done


ConvertSFX;ConvertSFX_Method;TZipMaster_ConvertSFX
FALSE
22
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fnil\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;\red255\green0\blue255;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.ConvertSFX\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf0\f1\fs24\tab\cf2\ul See also:\cf3\ulnone\{linkID=1160\}\cf0\tab\cf2\ul\f0\fs18 Note on passwords:\ulnone\{linkID=1380\}\cf4\fs20 
\par \pard\sb35\tx355\cf0 ConvertSFX  converts the Zip archive to a self-extracting executable.
\par \pard\sb115\sa115\tx355\b Function\b0  ConvertSFX: Integer;
\par \pard\sa195\tx355\b\fs24 Description:
\par \pard\tx355\b0\fs20 Convert Zip archive to self-extracting .EXE. The resulting .EXE is a Win32 program. Uses the same base name and path already used by the Zipfile - only the file extension is changed to "EXE". This is accomplished by pre-pending the SFX code in  front of the Zip file, and then changing its extension.
\par 
\par This function returns:   
\par \pard\fi-705\li705\tqr\tx565\tqr\tx705\cf4\tab 0\tab On success.
\par \tab -1\tab Error in creation of destination.
\par \tab -2\tab Read or write error during copy. (Could be: Not enough space on disk)
\par \tab -3\tab Error in open of source.
\par \tab -9\tab general failure during copy.\cf0 
\par \cf4\tab -10\tab Icon not found in ZipSFX.bin.
\par \tab -11\tab Memory or general error while setting icon.
\par \tab -12\tab Error in size of the supplied icon.\cf0 
\par \pard\tqr\tx565\tqr\tx705 
\par \pard\fi-1695\li1695\tx1695\cf5\b IMPORTANT:\tab\cf0\b0 Before using ConvertSFX, you may want to first set the \cf2\strike SFXPath\strike0\{linkID=770\}\cf0  property to the full pathname of the SFX code: ZIPSFX.BIN. If you don't set this property, ZipMaster will automatically look for this file in the Current directory, the application directory, the Windows System and Windows directories and if present the directory specified by the \cf2\strike DLLDirectory\strike0\{linkID=400\}\cf0  property.
\par 
\par }
1160
Scribble1160
ConvertSFX see also




Writing



FALSE
13
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Times New Roman;}{\f1\fnil Arial;}}
{\colortbl ;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\strike\f0\fs24 ConvertZIP\cf2\strike0\{linkID=1170>main\}\cf0 
\par \cf1\strike SFXCaption\cf2\strike0\{linkID=690>main\}\cf0 
\par \cf1\strike SFXCommandLine\cf2\strike0\{linkID=700>main\}\cf0 
\par \cf1\strike SFXDefaultDir\cf2\strike0\{linkID=710>main\}\cf0 
\par \cf1\strike SFXIcon\cf2\strike0\{linkID=720>main\}\cf0 
\par \cf1\strike SFXMessage\cf2\strike0\{linkID=730>main\}\cf0 
\par \cf1\strike SFXOptions\cf2\strike0\{linkID=750>main\}\cf0 
\par \cf1\strike SFXOverWriteMode\cf2\strike0\{linkID=760>main\}\cf0 
\par \cf1\strike TZipSFX\cf2\strike0\{linkID=1890>main\}\cf3\lang1033\f1\fs20 
\par 
\par }
1170
Scribble1170
ConvertZIP
ConvertZIP;Methods;


BROWSE0003:0006
Done


ConvertZIP;ConvertZIP_Method;TZipMaster_ConvertZIP
FALSE
22
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fnil\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;\red255\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.ConvertZIP\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf0\f1\fs24\tab\cf2\ul See also:\cf3\ulnone\{linkID=1180\}\cf0\tab\cf2\ul\f0\fs18 Note on passwords:\ulnone\{linkID=1380\}\cf4\fs20 
\par \pard\sb35\tx355\cf0 ConvertZIP converts the specified executable into a Zip archive.
\par \pard\sb115\sa115\tx355\b Function\b0  ConvertZIP: Integer;
\par \pard\sa195\tx355\b\fs24 Description:
\par \pard\tx355\b0\fs20 Converts a self-extracting .exe file into a Zip archive.  This is accomplished by removing the SFX code from the beginning of a file and then changing its extension.
\par 
\par This function returns:   
\par \pard\fi-705\li705\tqr\tx565\tqr\tx705\cf4\tab 0\tab On success.
\par \tab -1\tab Error in creation of destination.
\par \tab -2\tab Read or write error during copy. (Could be: Not enough space on disk)
\par \tab -3\tab Error in open of source.
\par \tab -9\tab General failure during copy.
\par \tab -10\tab Memory error.\cf0 
\par \pard\tqr\tx565\tqr\tx705 
\par \pard\fi-1555\li1555\tx1555\cf5\b WARNING:\tab\cf0\b0 The use of ConvertZIP can NOT be guaranteed to work with all self-extracting archive formats.  It will work on MS-DOS self-extracting zip archives, and on those made by WinZip (product of Nikko Mak Computing), but some self-extracting formats are not even based on Zip compression.
\par \pard\tx1555 
\par For example, the freeware "ASetup" program uses the .LZH  compression format.  In fact, most setup programs use compression formats that aren't Zip compatible. If you try to use ConvertZIP on an archive that doesn't conform to the Zip standard, you will get errors. If fact, you can't even list the contents of an .EXE archive if it's not a standard Zip format.
\par 
\par }
1180
Scribble1180
ConvertZip see also




Writing



FALSE
14
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Times New Roman;}{\f1\fnil Arial;}}
{\colortbl ;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\strike\f0\fs24 ConvertSFX\cf2\strike0\{linkID=1150>main\}\cf0 
\par \cf1\strike SFXCaption\cf2\strike0\{linkID=690>main\}\cf0 
\par \cf1\strike SFXCommandLine\cf2\strike0\{linkID=700>main\}\cf0 
\par \cf1\strike SFXDefaultDir\cf2\strike0\{linkID=710>main\}\cf0 
\par \cf1\strike SFXIcon\cf2\strike0\{linkID=720>main\}\cf0 
\par \cf1\strike SFXMessage\cf2\strike0\{linkID=730>main\}\cf0 
\par \cf1\strike SFXOptions\cf2\strike0\{linkID=750>main\}\cf0 
\par \cf1\strike SFXOverWriteMode\cf2\strike0\{linkID=760>main\}\cf0 
\par \cf1\strike TZipSFX\cf2\strike0\{linkID=1890>main\}\cf3\lang1033\f1\fs20 
\par 
\par 
\par }
1190
Scribble1190
CopyFile
CopyFile;Methods;


browse0003:0007
Done


CopyFile;CopyFile_Method;TZipMaster_CopyFile
FALSE
27
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fswiss\fcharset0 Arial;}{\f2\froman\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red255\green0\blue0;\red128\green0\blue0;\red128\green128\blue0;\red255\green0\blue255;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.CopyFile\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb35\cf0 With CopyFile you can copy a file.
\par \cf4\b\f1 Renamed to \strike Copy_File\cf5\strike0\{linkID=*1200\}\cf4 !\cf0\b0\f0 
\par \pard\sb115\sa115\b Function\b0  CopyFile( \b Const\b0  InFileName, OutFileName: \b String\b0  ): Integer;
\par \pard\sa195\b\fs24 Description:
\par \pard\cf3\b0\fs20 This copies any file to any other file. Useful in many application programs, so it was included here as a method.  This returns \cf0\f1 0 on \cf3\f0 success, or else one of these errors:
\par 
\par \pard\fi-705\li705\tqr\tx565\tqr\tx705\tab -1\tab Error in creation of destination.
\par \tab -2\tab Read or write error during copy.
\par \tab -3\tab Error in open of source.
\par \tab -4\tab Error setting date/time of destination.
\par \tab -9\tab General failure during copy.
\par \pard\li425\tqr\tx565\tqr\tx705 
\par \pard\fi-845\li845\tx845\cf6\b NOTE:\tab\cf3\b0 a \f2 '\f0 -4\f2 '\f0  error is non-fatal.  The copied file will still be correct, except that the datetime stamp will be wrong.
\par \pard\tx845 
\par Can be used to make a backup copy of the ZipFile before an Add operation.
\par Example:
\par \pard\li425\tx845 ret := CopyFile( ZipFileName, \f2 '\f0 C:\\TMPZIP.TMP\f2 '\f0  );
\par if  ret < 0  then
\par    ShowMessage( \f2 '\f0 Error no. \f2 '\f0  + IntToStr( ret ) + \f2 '\f0  in making backup\f2 '\f0  );
\par \pard\tx845\cf0 
\par \pard\fi-1695\li1695\tx1695\cf7\b IMPORTANT:\cf0\b0\tab The destination must include a filename ( You can't copy a file to C:\\ ).  Also, wildcards are not allowed in either source or destination.
\par 
\par }
1200
Scribble1200
Copy_File
CopyFile;Methods;


browse0003:0007
Done


CopyFile;CopyFile_Method;TZipMaster_CopyFile;Copy_File
FALSE
26
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fswiss\fcharset0 Arial;}{\f2\froman\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red128\green128\blue0;\red255\green0\blue255;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.Copy\f1 _\f0 File\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb35\cf0 With Copy\f1 _\f0 File you can copy a file.
\par \pard\sb115\sa115\b Function\b0  Copy\f1 _\f0 File( \b Const\b0  InFileName, OutFileName: \b String\b0  ): Integer;
\par \pard\sa195\b\fs24 Description:
\par \pard\cf3\b0\fs20 This copies any file to any other file. Useful in many application programs, so it was included here as a method.  This returns \cf0\f1 0 on \cf3\f0 success, or else one of these errors:
\par 
\par \pard\fi-705\li705\tqr\tx565\tqr\tx705\tab -1\tab Error in creation of destination.
\par \tab -2\tab Read or write error during copy.
\par \tab -3\tab Error in open of source.
\par \tab -4\tab Error setting date/time of destination.
\par \tab -9\tab General failure during copy.
\par \pard\li425\tqr\tx565\tqr\tx705 
\par \pard\fi-845\li845\tx845\cf4\b NOTE:\tab\cf3\b0 a \f2 '\f0 -4\f2 '\f0  error is non-fatal.  The copied file will still be correct, except that the datetime stamp will be wrong.
\par \pard\tx845 
\par Can be used to make a backup copy of the ZipFile before an Add operation.
\par Example:
\par \pard\li425\tx845 ret := Copy\f1 _\f0 File( ZipFileName, \f2 '\f0 C:\\TMPZIP.TMP\f2 '\f0  );
\par if  ret < 0  then
\par    ShowMessage( \f2 '\f0 Error no. \f2 '\f0  + IntToStr( ret ) + \f2 '\f0  in making backup\f2 '\f0  );
\par \pard\tx845\cf0 
\par \pard\fi-1695\li1695\tx1695\cf5\b IMPORTANT:\cf0\b0\tab The destination must include a filename ( You can't copy a file to C:\\ ).  Also, wildcards are not allowed in either source or destination.
\par 
\par }
1210
Scribble1210
CopyZippedFiles
CopyZippedFiles;Methods;


BROWSE0003:0008
Done


CopyZippedFiles;CopyZippedFiles_Method;TZipMaster_CopyZippedFiles
FALSE
49
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fnil\fcharset0 Times New Roman;}{\f2\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;\red0\green0\blue128;\red128\green128\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.CopyZippedFiles\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf0\f1\fs24\tab\cf2\ul See also:\cf3\ulnone\{linkID=1220\}\cf4\f0\fs20 
\par \pard\sb35\tx355\cf0 With CopyZippedFiles you can copy one or more zipped files from one zip archive to another.
\par \pard\sb115\sa115\tx355\b Function\b0  CopyZippedFiles( DestZipMaster: TZipMaster; DeleteFromSource: boolean; OverwriteDest: OvrOpts ): Integer;
\par \pard\sa195\tx355\b\fs24 Description:
\par \pard\tx6745\cf4\b0\fs20 CopyZippedFiles copies zipped entries from the source zip archive to a destination zip archive\cf0  without, the possibly time consuming need, of extracting and re-zipping again. \cf4 The file(s) to be copied must be specified in \cf2\strike FSpecArgs\strike0\{linkID=480\}\cf4  from the source archive before calling this function.
\par \cf0 
\par \b DestZipMaster\cf4\b0  is the ZipMaster component you are going to use as the destination zip archive.
\par (The source zip archive is the one you are calling this function from.\cf0 )
\par \cf4 With \b DeleteFromSource\b0  you specify if the source file(s) must be deleted after a successful copy.
\par \cf0\b OverWriteDest\b0  can take one of the following values:
\par \pard\sb115\sa115\tx1985\b\fs24 Value\tab Meaning
\par \pard\fi-1985\li1985\tx1985\b0\fs20 OvrConfirm\tab Ask the user if the destination may be overwritten when a source file is found inside the destination or perform the \cf2\strike OnCopyZipOverwrite\strike0\{linkID=1530\}\cf0  event when assigned.
\par OvrAlways\tab Always overwrite existing files in the destination
\par \pard\fi-1985\li1985\sa195\tx1985 OvrNever\tab Never overwrite - skip those files, afterwards these files can be found in FSpecArgs from the source.
\par \pard\sa55\tx1985\cf4 The function returns \cf0\f2 0 on \cf4\f0 success, or else one of these errors:
\par \pard\fi-705\li705\tqr\tx565\tqr\tx705\tab -6\tab Still busy with a previous method call.
\par \tab -7\tab CopyZippedFiles errors. \cf0  See also: \cf2\strike Error and warning messages from 1000 and up\strike0\{linkID=1860\}\cf0 
\par \cf4\tab -8\tab Memory allocation error.
\par \tab -9\tab General unknown CopyZippedFiles error.
\par 
\par \pard\fi-395\li565\sa55\tx565\cf5\b Short example of how this function could be called without the use of the OnCopyOverwrite event:
\par \pard\fi-845\li845\tx845\tx1415\tx1695\cf0\b0\i\tab with ZipMaster1 do
\par \tab begin
\par \tab\tab ZipFileName := \i0 'SourceZip.zip'\i ;
\par \tab\tab FSpecArgs.Clear;
\par \tab\tab FSpecArgs.Add( \i0 '\i C:\\AutoExec.bat\i0 '\i  );
\par \tab\tab FSpecArgs.Add( \i0 '\i C:\\Config.sys\i0 '\i  );
\par \tab\tab Add;
\par \tab\tab FSpecArgs.Add(\i0  '\i AutoExec.ba\i0 t'\i  );
\par \tab\tab FSpecArgs.Add( \i0 '\i Config.sys\i0 '\i  );
\par \tab\tab with ZipMaster2 do
\par \tab\tab begin
\par \tab\tab\tab ZipFileName := \i0 '\i DestinationZip.zip\i0 '\i ;
\par \tab\tab\tab FSpecArgs.Clear;
\par \tab\tab\tab FSpecArgs.Add( \i0 '\i C:\\AutoExec.bat\i0 '\i  );
\par \tab\tab\tab Add;
\par \tab\tab\tab HowToDelete := htdAllowUndo;
\par \pard\fi-845\li845\tx845\tab\tab\tab Result := ZipMaster1.CopyZippedFiles( ZipMaster2, \b True\b0 , OvrConfirm );
\par \pard\fi-845\li845\tx845\tx1415\tx1695\tab\tab end;
\par \tab end;
\par \pard\sb55\tx845\tx1415\tx1695\i0 When the Result is 0 (Ok) then the two files are removed from SourceZip.zip and were copied into DestinationZip.zip. The Original destination archive (DestinationZip.zip) is placed into the recycle bin. File(s) that are not copied because you answered NO on the overwrite question, or in case OvrNever was specified, can be found in the FSpecArgs list from the source (ZipMaster1) afterwards.
\par \pard\tx845\tx1415\tx1695 
\par \pard\fi-985\li985\sa55\tx985\cf6\b NOTE 1:\tab\cf4\b0 Source and destination zip archive need to be different!
\par \pard\fi-985\li985\tx985\cf6\b NOTE 2:\tab\cf4\b0 This function uses the \cf2\strike TempDir\strike0\{linkID=790\}\cf4  property to make a temporary destination file. When your destination archive is not on the same drive as where TempDir is pointing to, there will be extra copying involved which could take a lot of time!
\par 
\par }
1220
Scribble1220
CopyZippedFiles see also




Writing



FALSE
6
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Times New Roman;}{\f1\fnil Arial;}}
{\colortbl ;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\strike\f0\fs24 OnCopyZipOverwrite\cf2\strike0\{linkID=1530>main\}\cf3\lang1033\f1\fs20 
\par 
\par 
\par }
1230
Scribble1230
Delete
Delete;Methods;


BROWSE0003:0009
Done


Delete;Delete_Method;TZipMaster_Delete
FALSE
10
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.Delete\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb35\cf0 With the Delete method you can delete specified files from the Zip archive.
\par \pard\sb115\sa115\b Procedure\b0  Delete;
\par \pard\sa195\b\fs24 Description:
\par \pard\tx6745\cf3\b0\fs20 Deletes all files specified in the \cf2\strike FSpecArgs\strike0\{linkID=480\}\cf3  property from the archive specified by the \cf2\strike ZipFileName\strike0\{linkID=1020\}\cf3  property.\cf0 
\par 
\par }
1240
Scribble1240
EraseFile
EraseFile;Methods;


BROWSE0003:000a
Done


EraseFile;EraseFile_Method;TZipMaster_EraseFile
FALSE
19
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\froman\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.EraseFile\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb35\cf0 With the EraseFile function you can choose how to erase the specified file from disk.
\par \pard\sb115\sa115\b Function\b0  EraseFile( \b Const\b0  FileToErase: \b String\b0 ; How: DeleteOpts ): Integer;
\par \pard\sa195\b\fs24 Description:
\par \pard\tx6745\cf3\b0\fs20 EraseFile is like DeleteFile, but depending on the value of \f1 '\f0 How\f1 '\f0  the specified file will be deleted completely or will be put into the recycle bin. When just a filename is specified the drive and directory will be taken from the current drive and directory.
\par \cf0 
\par How can take one of the following values:
\par \pard\sb115\sa115\tx1985\b\fs24 Value\tab Meaning
\par \pard\tx1985\b0\fs20 htdFinal\tab Perform a DeleteFile. (The default)
\par htdAllowUndo\tab Move the old file into the recycle bin.\cf3 
\par \pard\tx6745 
\par EraseFile is also used internally by the component functions ConvertZip, ConvertSFX, CopyFile, CopyZippedFiles and ReadSpan but then uses the property \cf2\strike HowToDelete\strike0\{linkID=530\}\cf3  as How value.
\par 
\par The return value will be the return value of SHFileOperation ( 0 if Ok else not zero ) or \f1 -\f0 1 in case of memory error.\cf0 
\par 
\par }
1250
Scribble1250
Extract
Extract;Methods;


BROWSE0003:000b
Done


Extract;Extract_Method;TZipMaster_Extract
FALSE
17
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.Extract\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb35\cf0 With the Extract method you can extract specified files from a Zip archive.
\par \pard\sb115\sa115\b\f1 function\b0\f0  Extract\f1 : integer\f0 ;
\par \cf2\strike\f1 changed \cf4\strike0\{linkID=110\}\cf0\f0 
\par \pard\sa195\b\fs24 Description:
\par \pard\cf3\b0\fs20 Extracts all files specified in the \cf2\strike FSpecArgs\strike0\{linkID=480\}\cf3  property from the archive specified by the \cf2\strike ZipFileName\strike0\{linkID=1020\}\cf3  property. If you don't specify any FSpecArgs, then all files will be extracted.
\par 
\par The Extract method can also test the integrity of files in an archive.
\par 
\par If you set the ExtrTest option of \cf2\strike ExtrOptions\strike0\{linkID=470\}\cf3 , then ALL files in the archive will be tested. This will cause them to be extracted, but not saved to the hard disk. Their CRC will be verified, and results will go to the \cf2\strike SuccessCnt\strike0\{linkID=780\}\cf3  property, and the \cf2\strike OnMessage\strike0\{linkID=1610\}\cf3  event handler.
\par 
\par \f1 Now checks that is not Busy - returns ErrCode or BUSY_ERROR \cf0\f0 
\par 
\par }
1260
Scribble1260
ExtractFileToStream
ExtractFileToStream;Methods;


BROWSE0003:000c
Done


ExtractFileToStream;ExtractFileToStream_Method;TZipMaster_ExtractFileToStream
FALSE
12
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fnil\fcharset0 Times New Roman;}{\f2\froman\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.ExtractFileToStream\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\tab\ul\f1\fs24 See also:\cf3\ulnone\{linkID=1270\}\cf0  \cf4\f0\fs20 
\par \pard\sb35\tx355\cf0 With the ExtractFileToStream method you can extract a specified file from a Zip archive into a stream.
\par \pard\sb115\sa115\tx355\b Function\b0  ExtractFileToStream( Filename: String ): \cf2\strike TZipStream\strike0\{linkID=1060\}\cf0 ;
\par \pard\sa195\tx355\b\fs24 Description:
\par \pard\tx355\cf4\b0\fs20 Extracts if specified file \f2 '\f0 Filename\f2 '\f0  or else the first file specified in the \cf2\strike FSpecArgs\strike0\{linkID=480\}\cf4  property from the archive specified by the \cf2\strike ZipFileName\strike0\{linkID=1020\}\cf4  property
\par \cf0 
\par After this method returns the stream position is at the begin of the stream.
\par 
\par }
1270
Scribble1270
ExtractFileToStream see also




Writing



FALSE
10
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Times New Roman;}{\f1\fnil Arial;}}
{\colortbl ;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\strike\f0\fs24 ExtractFileToStream \cf2\strike0\{linkID=1260>main\}
\par \cf1\strike AddStreamToFile\cf2\strike0\{linkID=1110>main\}
\par \cf1\strike AddStreamToStream\cf2\strike0\{linkID=1120>main\}
\par \cf1\strike ZipStream\cf2\strike0\{linkID=1060>main\}
\par \cf3\lang1033\f1\fs20 
\par 
\par 
\par }
1280
Scribble1280
ExtractStreamToStream
ExtractStreamToStream;Methods;


BROWSE0003:000d
Done


ExtractStreamToStream;ExtractStreamToStream_Method;TZipMaster_ExtractStreamToStream
FALSE
49
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fnil\fcharset0 Times New Roman;}{\f2\froman\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;\red255\green0\blue0;\red255\green0\blue255;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.ExtractStreamToStream\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\tab\ul\f1\fs24 See also: \cf3\ulnone\{linkID=1290\}\cf4\f0\fs20 
\par \pard\sb35\tx355\cf0 With the ExtractStreamToStream method you can extract a specified stream from another stream.
\par \pard\sb115\sa115\b Function\b0   ExtractStreamToStream( InStream:\f1\fs24  TMemoryStream; OutSize: LongWord = 32768 ):
\par \pard\sa195\tx355\b\f0 Description:
\par \pard\tx355\cf4\b0\fs20 Extracts the specified InStream into an output stream (\cf2\strike ZipStream\strike0\{linkID=1060\}\cf4 ).
\par Since the uncompressed size is not stored it is possible to specify the output size yourself in OutSize.
\par If OutSize is not given a start size of 32768 bytes is used and increased when needed in steps of 32768 bytes this will take extra time because with each increment the memory already in use need to be copied to a new location.
\par \cf0 
\par The first 6 bytes of the input stream are reserved:
\par \pard\fi-135\li135\tx135 
\par -\tab The first two bytes are used as a flag, STORED = 0 or DEFLATED = 8.
\par \pard\tx135\b\i Type
\par \b0\i0\tab pFlag = ^\i Smallint;
\par \tab pCRC = ^Cardinal;
\par \b Var
\par \b0\tab Flag: SmallInt;
\par \tab CRC: Cardinal;
\par \pard\fi-135\li135\tx135\tab Flag := 8;
\par \tab (pFlag( ZipMaster1.ZipStream.Memory ))^ := Flag;
\par \i0 -\tab The next four bytes should be set to the calculated CRC value, if this value is wrong an \cf2\strike OnCRC32Error\strike0\{linkID=1550\}\cf0  event will follow.
\par \i\tab CRC := xxx;
\par \tab (pCRC( pChar( ZipMaster1.ZipStream.Memory ) + 2))^ := CRC;
\par \i0 
\par \pard\tx135 After this method returns the stream position is at the begin of the stream.
\par 
\par \pard\fi-565\li565\tx565\tx845\i Example:
\par \b Var
\par \b0\tab MyData: TMemoryStream;
\par \b Begin
\par \b0\tab MyData.Create;
\par 
\par \cf5\tab // Add some text as data...
\par \cf6\tab // MyData.LoadFromFile( \f2 '\f0 SomeTextFile.txt\f2 '\f0  );
\par \cf0\tab MyData.LoadFromStream( ZipMaster1.ZipStream );
\par \cf6\tab // MyData.Write( aTextbuffer, NumberOfBytes );
\par \cf0\tab ZipMaster1.ExtractStreamToStream( MyData );
\par \cf5\tab // *** Another possibility ***
\par \cf6\tab // Var MyOutData: TZipStream;
\par \tab // MyOutData := ZipMaster1.ExtractStreamToStream( MyData );
\par \cf0\tab MyData.Free;
\par 
\par \cf5\tab // The Output can be found in the ZipMaster1.ZipStream property.
\par \cf0\tab MsgForm.RichEdit1.Lines.LoadFromStream( ZipMaster1.ZipStream );
\par \tab MsgForm.Show;
\par 
\par }
1290
Scribble1290
ExtractStreamToStream see also




Writing



FALSE
11
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Times New Roman;}{\f1\fnil Arial;}}
{\colortbl ;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\strike\f0\fs24 ExtractFileToStream  \cf2\strike0\{linkID=1260>main\}
\par \cf1\strike AddStreamToFile\cf2\strike0\{linkID=1110>main\}
\par \cf1\strike AddStreamToStream\cf2\strike0\{linkID=1120>main\}
\par \cf1\strike ZipStream\cf2\strike0\{linkID=1060>main\}
\par \cf3\lang1033\f1\fs20 
\par 
\par 
\par 
\par }
1300
Scribble1300
GetAddPassword
GetAddPassword;Methods;


browse0003:000e
Done


GetAddPassword;GetAddPassword_Method;TZipMaster_GetAddPassword
FALSE
15
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fnil\fcharset0 Times New Roman;}{\f2\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.GetAddPassword\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf0\f1\fs24\tab\cf2\ul See also:\cf3\ulnone\{linkID=1310\}\cf0\tab\cf2\ul\f0\fs18 Note on passwords:\ulnone\{linkID=1380\}\cf4\fs20 
\par \pard\sb35\tx355\cf0 The GetAddPassword method will ask the user for a password used while adding files.
\par \pard\sb115\sa115\tx355\b Function\b0  GetAddPassword: \b String\b0 ;
\par \b\f2 Function \b0 GetAddPassword(\b var \b0 Response: \cf2\strike TPasswordButton\cf3\strike0\{linkID=1360\}\cf0 ): \b String\b0 ;\f0 
\par \pard\sa195\tx355\b\fs24 Description:
\par \pard\tx355\b0\fs20 Prompt user for a password. The password will be asked twice - the second time to verify it.  If both of them match, it will be saved in the \cf2\strike Password\strike0\{linkID=650\}\cf0  property and it will also be returned as result, or else the Password property will not change and the result is an empty string.
\par 
\par The use of this method is not required. If you want to make your own password prompt dialog box, you can just put the password into the password property yourself. Also, you can take the easiest route by leaving the password property blank, and letting the component prompt the user for the password.
\par 
\par \f2 The new overloaded version also gives the user's response.
\par \f0 
\par }
1310
Scribble1310
GetAddPassword see also




Writing



FALSE
5
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Times New Roman;}{\f1\fnil Arial;}}
{\colortbl ;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\strike\f0\fs24 GetExtrPassword\cf2\strike0\{linkID=1320>main\}\cf0 
\par \cf1\strike GetPassword\cf2\strike0\{linkID=1340>main\}\cf3\lang1033\f1\fs20 
\par }
1320
Scribble1320
GetExtrPassword
GetExtrPassword;Methods;


browse0003:000f
Done


GetExtrPassword;GetExtrPassword_Method;TZipMaster_GetExtrPassword
FALSE
17
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fnil\fcharset0 Times New Roman;}{\f2\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.GetExtrPassword\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf0\f1\fs24\tab\cf2\ul See also: \cf3\ulnone\{linkID=1330\}\cf0\tab\cf2\ul\f0\fs18 Note on passwords:\ulnone\{linkID=1380\}\cf4\fs20 
\par \pard\sb35\tx355\cf0 The GetExtrPassword method will ask the user for a password used while extracting files.
\par \pard\sb115\sa115\tx355\b Function\b0  GetExtrPassword: \b String\b0 ;
\par \b\f2 Function \b0 GetExtrPassword(\b var \b0 Response: \cf2\strike TPasswordButton\cf3\strike0\{linkID=1360\}\cf0 ): \b String\b0 ;
\par \pard\sa195\tx355\b\f0\fs24 
\par Description:
\par \pard\tx355\b0\fs20 Prompt user for a password.  The password will only be asked once. It will be saved in the \cf2\strike Password\strike0\{linkID=650\}\cf0  property and it will also be returned as result.
\par 
\par The use of this method is not required. If you want to make your own password prompt dialog box, you can just put the password into the password property yourself. Also, you can take the easiest route by leaving the password property blank, and letting the component prompt the user for the password.
\par 
\par \f2 The new overloaded version also gives the user's response.
\par \f0 
\par 
\par }
1330
Scribble1330
GetExtrPassword see also




Writing



FALSE
7
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Times New Roman;}{\f1\fnil Arial;}}
{\colortbl ;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\strike\f0\fs24 GetAddPassword\cf2\strike0\{linkID=1300>main\}\cf0 
\par \cf1\strike GetPassword\cf2\strike0\{linkID=1340>main\}\cf3\lang1033\f1\fs20 
\par 
\par 
\par }
1340
Scribble1340
GetPassword
GetPassword;Methods;


BROWSE0003:0010
Done


GetPassword;GetPassword_Method;TZipMaster_GetPassword
FALSE
21
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fnil\fcharset0 Times New Roman;}{\f2\froman\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.GetPassword\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\tab\ul\f1\fs24 See also: \cf3\ulnone\{linkID=1350\}\cf2\f0\fs20\tab\ul\fs18 Note on passwords:\ulnone\{linkID=1380\}\cf4\fs20 
\par \pard\sb35\tx355\cf0 The GetPassword method will ask the user for a password.
\par \pard\sb115\sa115\tx355\b Function\b0  GetPassword( DialogCaption, MsgTxt ; pwb: TPasswordButtons: \b String\b0 , \b var\b0  ResultStr: \b String\b0  ) : TPasswordButton;
\par \pard\sa195\tx355\b\fs24 Description:
\par \pard\tx355\b0\fs20 Prompt the user for a password. The password will only be asked once. It will \b not\b0  automatically be saved in the \cf2\strike Password\strike0\{linkID=650\}\cf0  property.
\par You can set the caption and message text of this password dialog yourself or get the language dependend text from the resource file like:
\par \pard\li275\sb55\sa55\tx275\i ZipMaster1.GetPassword( LoadStr( PW_Caption ), LoadStr( PW_MessageEnter ) + \f2 '\f0 : for file \f2 '\f0  + ForFile, NewPassword );
\par \i0 or
\par \i ZipMaster1.GetPassword( LoadStr( PW_Caption ), LoadStr( PW_MessageVerify ), NewPassword );
\par \pard\tx275\i0 pwButtons is a set of buttons indicating the buttons that will be shown in the password dialog.
\par Possible values are: pwbOk, pwbCancel, pwbCancelAll and pwbAbort. Default and always present is: pwbOk.
\par 
\par The return value of this method is set to the button pressed and ResultStr is set to the password the user entered.
\par The button text on this dialog is taken from the chosen resource file and as such language dependent.
\par 
\par You can use this method in the \cf2\strike OnPasswordError\strike0\{linkID=1650\}\cf0  event to get a new or different password from the user.
\par 
\par }
1350
Scribble1350
GetPassword see also




Writing



FALSE
7
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Times New Roman;}{\f1\fnil Arial;}}
{\colortbl ;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\strike\f0\fs24 GetExtrPassword\cf2\strike0\{linkID=1320>main\}\cf0 
\par \cf1\strike GetAddPassword\cf2\strike0\{linkID=1300>main\}\cf3\lang1033\f1\fs20 
\par 
\par 
\par }
1360
Scribble1360
TPasswordButton




Writing


TZipMaster_TPasswordButton
FALSE
15
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Arial;}{\f1\fswiss Arial;}{\f2\fnil Arial;}{\f3\froman\fcharset0 Times New Roman;}{\f4\fnil\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\fs32 TPasswordButton\cf0\f1\fs28\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \lang1033\f2 
\par \lang3081\b\fs22 Type\b0\f0\fs20 
\par \pard\sb100\sa100   \cf0\f3\fs24 TPasswordButton\f4  = ( pwbOk , pwb\f3 Cancel , pwbCancelAll , pwbAbort ) ; 
\par \pard\cf3\lang1033\f2\fs20 
\par \lang3081\b\fs22 Related Unit\b0\f0\fs20 
\par   ZipPassDlg
\par 
\par \b\f2\fs22 Description\b0\f0\fs20 
\par 
\par \lang1033\f2 
\par }
1370
Scribble1370
TPasswordButtons




Writing



FALSE
14
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fnil\fcharset0 Arial;}{\f1\fswiss Arial;}{\f2\fnil Arial;}{\f3\fnil\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\fs32 TPasswordButtons\cf0\f1\fs28\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}
\par \cf1\b\f0\fs32 
\par \cf3\f2\fs22 Related Unit\cf0\b0\f3\fs24 
\par   ZipPassDlg
\par \b\f0 
\par \cf3\f2\fs22 Type\cf0\f0\fs20 
\par   \b0 TPasswordButtons = set of \cf2\strike TPasswordButton\cf4\strike0\{linkID=1360\}\cf0 ;
\par \cf1\b\fs32 
\par \cf3\f2\fs22 Description\cf0\f0\fs24 
\par   \b0 buttons used for Password dialog\cf1\b\fs32 
\par }
1380
Scribble1380
Password Notes
Password Notes;Passwords;



Done



FALSE
20
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green0\blue0;\red0\green128\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster Password Notes\cf2\{keepn\} 
\par \cf0\b0\fs20 The "\cf3\strike GetAddPassword\strike0\{linkID=1300\}\cf0  " and "\cf3\strike  GetExtrPassword\strike0\{linkID=1320\}\cf0  " methods are optional. You have 4 different ways of getting a user's password:
\par 
\par \pard\fi-275\li565\sa195\tx565\b 1.\b0\tab Call the "GetAddPassword" and/or the "GetExtrPassword" methods, just before add or extract.
\par \pard\fi-275\li565\tx565\b 2.\b0\tab Use your own code to set the "Password" property.  It's your choice how you obtain the password.
\par \pard\fi-275\li845\tx845 -\tab This is useful if the password comes from a file or table.
\par \pard\fi-275\li845\sa195\tx845 -\tab It's also good for letting you enforce constrains on the password - you can require it to be over 6 chars, require it to have at least one special char, etc.  Of course, you'd only want to enforce constraints on "Add" operations.  A word of caution: many users don't like password constraints, so give them the option to turn them off.
\par \pard\fi-275\li565\sa195\tx565\b 3.\b0\tab Don't set one at all, and let the component prompt the user. It's easy, and it works.
\par \b 4.\b0\tab Set the password in the \cf3\strike OnPasswordError\strike0\{linkID=1650\}\cf0  event. This is also the most flexible way of doing it.
\par \pard\tx565 Passwords can not be longer than 80 characters. A zero-length password is the same as no password at all.
\par 
\par To "zero out" the password, set it's property to an empty string. If it is zeroed out, but the \cf3\strike AddEncrypt\strike0\{linkID=310\}\cf0  option is set, then the user will be prompted for a new password by the component. So, if you don't want a password used, make sure you turn off "AddEncrypt", and you zero-out the password. 
\par 
\par If you set a password for an Extract, but it is incorrect, then the \cf3\strike OnPasswordError\strike0\{linkID=1650\}\cf0  event will be triggered \cf3\strike PasswordReqCount\strike0\{linkID=650\}\cf0  times if you still do not supply a correct password Extraction will not take place.
\par 
\par To Force the DLL to AVOID decrypting an encrypted file, you must set the password property to an empty string and set to \cf3\strike PasswordReqCount\strike0\{linkID=650\}\cf0  to zero.  If Adding, make sure AddEncrypt is NOT set.
\par 
\par }
1390
Scribble1390
List
List;Methods;


BROWSE0003:0011
Done


List;List_Method;TZipMaster_List
FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.List\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb35\cf0 The List method will read the Zip archive and refresh the contents list.
\par \pard\sb115\sa115\b\f1 Function\b0\f0  List\f1  : Integer;
\par \cf2\strike Changed \cf4\strike0\{linkID=110\}\cf0 v1.72\f0 
\par \pard\sa195\b\fs24 Description:
\par \pard\cf3\b0\fs20 Refreshes the contents of the archive into the \cf2\strike ZipContents\strike0\{linkID=930\}\cf3  TList property.  This is a manual "refresh" of the "Table of Contents".  This occurs automatically whenever a filename is assigned to ZipFileName.\cf0 
\par 
\par \f1 Now if called while on operation is in progress it returns BUSY_ERROR
\par \f0 
\par }
1400
Scribble1400
Load_Unz_Dll
Load_Unz_Dll;Methods;


BROWSE0003:0012
Done


Load_Unz_Dll;Load_Unz_Dll_Method;TZipMaster_Load_Unz_Dll
FALSE
13
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\froman\fcharset0 Times New Roman;}{\f2\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red255\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.Load_Unz_Dll\cf0\{keepn\} 
\par \pard\tx355\cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf1\fs16\tab\tab\cf2\ul\fs18 Note  about the DLL\f1 '\f0 s:\ulnone\{linkID=410\}\cf3\fs20 
\par \pard\sb35\tx355\cf0 The Load_Unz_Dll method loads the UNZDLL.DLL into memory, if it is not already loaded.
\par \pard\sb115\sa115\tx355\b\f2 Function\b0\f0  Load_Unz_Dll\f2 : Integer\f0 ;
\par \pard\sa195\tx355\b\fs24 Description:
\par \cf4\f2 Changed\cf0  \b0\fs20 - now returns the UNZDLL version\f0 
\par \pard\tx355 For compatibility with older programs, and because I'm a nice guy, I'll handle the loads and unloads automatically if your program doesn't do it.  This can, however, incur a performance penalty because it will reload the needed DLL for each operation.
\par 
\par Advanced developers will want to carefully consider their load and unload strategy so they minimize the number of loads, and keep the DLL\f1 '\f0 s out of memory when they're not needed. There is a traditional speed vs. memory trade-off.
\par 
\par }
1410
Scribble1410
Load_Zip_Dll
Load_Zip_Dll;Methods;


BROWSE0003:0013
Done


Load_Zip_Dll;Load_Zip_Dll_Method;TZipMaster_Load_Zip_Dll
FALSE
13
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\froman\fcharset0 Times New Roman;}{\f2\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red255\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.Load_Zip_Dll\cf0\{keepn\} 
\par \pard\tx355\cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf1\fs16\tab\tab\cf2\ul\fs18 Note  about the DLL\f1 '\f0 s:\ulnone\{linkID=410\}\cf3\fs20 
\par \pard\sb35\tx355\cf0 The Load_Zip_Dll method loads the ZIPDLL.DLL into memory, if it is not already loaded.
\par \pard\sb115\sa115\tx355\b\f2 Function\b0\f0  Load_Zip_Dll\f2 : Integer\f0 ;
\par \pard\sa195\tx355\b\fs24 Description:
\par \cf4\f2 Changed\cf0  \b0 - \fs20 now returns ZIPDLL version\f0 
\par \pard\tx355 For compatibility with older programs, and because I'm a nice guy, I'll handle the loads and unloads automatically if your program doesn't do it.  This can, however, incur a performance penalty because it will reload the needed DLL for each operation.
\par 
\par Advanced developers will want to carefully consider their load and unload strategy so they minimize the number of loads, and keep the DLL\f1 '\f0 s out of memory when they're not needed. There is a traditional speed vs. memory trade-off.
\par 
\par }
1420
Scribble1420
MakeTempFileName
MakeTempFileName;Methods;


BROWSE0003:0014
Done


MakeTempFileName;MakeTempFileName_Method;TZipMaster_MakeTempFileName
FALSE
12
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\froman\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.MakeTempFileName\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb35\cf0 The MakeTempFileName method constructs a filename of the form \f1 '\f0 C:\\....\\zipxxxx.zip\f1 '\f0  where xxxx is a unique number.
\par \pard\sb115\sa115\b Function\b0  MakeTempFileName( Prefix, Extension: \b String\b0  ): \b String\b0 ;
\par \pard\sa195\b\fs24 Description:
\par \pard\b0\fs20 Prefix is per default: \f1 '\f0 zip\f1 '\f0  = and Extension is \f1 '\f0 .zip\f1 '\f0 .
\par MakeTempFileName constructs a temporarily filename, that on the moment of construction does not have an equivalent on disk. The actual file created on disk will be removed before returning the filename.
\par If the \cf2\strike TempDir\strike0\{linkID=790\}\cf0  is defined then this path will be used to construct the filename else the TMP or TEMP environment variable will be used, if both TMP or TEMP are not defined then the current drive and directory will used as path.
\par 
\par }
1430
Scribble1430
ReadSpan
Methods;Multi Volume Zip Parts;ReadSpan;


BROWSE0003:0015
Done


ReadSpan;ReadSpan_Method;TZipMaster_ReadSpan
FALSE
21
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fnil\fcharset0 Times New Roman;}{\f2\froman\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.ReadSpan\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\tab\ul\f1\fs24 See also: \cf3\ulnone\{linkID=1440\}\cf4\f0\fs20 
\par \pard\sb35\tx355\cf0 The ReadSpan method reads a spanned zip archive file and writes it back as one zip file.
\par \pard\sb115\sa115\tx355\b Function\b0  ReadSpan( \b Const\b0  InFileName: \b String\b0 , \b var\b0  OutFilePath: \b String\b0  ): Integer;
\par \pard\sa195\tx355\b\fs24 Description:
\par \pard\tx355\b0\fs20 With ReadSpan it is possible to read a spanned archive from disk and reassemble it as one zip file.
\par \pard\sa15\tx355 The \f2 '\f0 InFileName\f2 '\f0  parameter can be either:
\par \pard\tx355 - The name of the zipfile on (floppy) disk.
\par - A file part on harddisk and should look like InFileNameXXX.zip where XXX is a number.
\par \pard\sb115\tx355 if \f2 '\f0 OutFilePath\f2 '\f0  does not contain a filename there will be one created for you in the form: Zipxxxx.zip. The exact name will be
\par \pard\tx355 returned to you in the same parameter.
\par 
\par The return value will be one the following:
\par \pard\fi-565\li565\tqr\tx425\tqr\tx565\tab 0\tab All Ok.
\par \tab -7\tab All known ReadSpan errors. See also: \cf2\strike Error and warning messages from 1000 and up\strike0\{linkID=1860\}\cf0 
\par \tab -8\tab Memory allocation error. ( GE_NoMem )
\par \tab -9\tab General unknown ReadSpan error. ( DS_ErrorUnknown )
\par 
\par }
1440
Scribble1440
ReadSpan see also




Writing



FALSE
6
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Times New Roman;}{\f1\fnil Arial;}}
{\colortbl ;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\strike\f0\fs24 WriteSpan\cf2\strike0\{linkID=1500>main\}\cf3\lang1033\f1\fs20 
\par 
\par 
\par }
1450
Scribble1450
Rename
Methods;Rename;


BROWSE0003:0016
Done


Rename;Rename_Method;TZipMaster_Rename
FALSE
52
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fnil\fcharset0 Times New Roman;}{\f2\froman\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red255\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.Rename\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb35\cf0 With the Rename method you can rename a filename and/or path to a different one.
\par \pard\sb115\sa115\b Function\b0  Rename( RenameLis\f1\fs24 t: TList; \f0\fs20 DateTime: Integer ): Integer;
\par \pard\sa195\b\fs24 Description:
\par \pard\b0\fs20 With Rename it is possible to change the filename(s) and/or path(\f2 '\f0 s) to other name(s) and/or path(\f2 '\f0 s).
\par -The \f2 '\f0 RenameList\f2 '\f0  parameter is\f1\fs24  a TList\f0\fs20  filled with ZipRename records:
\par \pard\tx275\tab\b Type\b0  ZipRenameRec = \b record\b0 
\par \pard\tx565\tx1835\tx2835\tab Source:\tab\b String\b0 ;\tab\cf4 // The Source filename/path as present in the ziparchive.
\par \cf0\tab Dest:\tab\b String\b0 ;\tab\cf4 // The Destination filename/path, this will be the new name.\cf0 
\par \tab DateTime:\tab Integer;\tab\cf4 // A new Date/Time for this specific destination or 0.\cf0 
\par \pard\tx275\tab\b End\b0 ;
\par \tab pZipRenameRec = ^ZipRenameRec;
\par 
\par \i Example:
\par \pard\fi-275\li275\tx275\b\tab Var
\par \pard\fi-275\li275\tx275\tx565\tx2545\b0\tab\tab ZipRenameList:\tab TList;
\par \tab\tab RenRec:\tab pZipRenameRec;
\par \pard\fi-275\li275\tx275\b\tab Begin
\par \pard\fi-565\li565\tx565\tx2545\b0\tab ZipRenameList\tab := TList.Create( );
\par \tab New( RenRec );
\par \tab RenRec^.Source\tab := SourceName;
\par \tab RenRec^.Dest\tab := DestName;
\par \tab RenRec^.DateTime\tab := DateTimeToFileDate( StrToDateTime( \f2 '\f0 12-21-1998 21:06:12\f2 '\f0  ) );
\par \pard\fi-565\li565\tx565\tab ZipRenameList.Add( RenRec );
\par 
\par \tab ZipMaster1.Rename( ZipRenameList, 0 );
\par \tab Dispose( RenRec );
\par \tab ZipRenameList.Free( );
\par \pard\fi-275\li275\tx275\b\tab End\b0 ;
\par \pard\tx275\i0 
\par When you specify a new DateTime then this has precedence over the global DateTime parameter.
\par Source and Dest can be a partial filename or path, and as such multiple entries in the archive could be renamed with a single entry in the RenameList.
\par 
\par \pard\fi-1555\li1555\tx1555\cf4\b WARNING:\tab\cf0\b0 There is virtual no check on the destination specified.
\par \tab This means that if you are not careful you can get multiple names or even wrong names that can\f2 '\f0 t be extracted anymore.
\par \pard\tx1555 
\par -The DateTime parameter can be used to change the Date and Time of every entry in the zip archive.
\par If you do not want to change the Date/Time field set this parameter to 0.
\par \i Example:
\par \pard\fi-565\li565\tx565\tab DateTime := DateTimeToFileDate( StrToDateTime( \f2 '\f0 12-21-1998 21:05:10\f2 '\f0  ) );
\par \pard\tx565\i0 
\par The return value will be one the following:
\par \pard\fi-565\li565\tqr\tx425\tqr\tx565\tab 0\tab All Ok.
\par \tab -7\tab All known Rename errors. See also: \cf2\strike Error and warning messages from 1000 and up\strike0\{linkID=1860\}\cf0 
\par \tab -8\tab Memory allocation error. ( GE_NoMem )
\par \tab -9\tab General unknown Rename error. ( DS_ErrorUnknown )
\par \tab -10\tab Destination should also be a filename when the source is a filename.
\par 
\par }
1460
Scribble1460
ShowZipMessage
Methods;ShowZipMessage;


BROWSE0003:0017
Done


ShowZipMessage;ShowZipMessage_Method;TZipMaster_ShowZipMessage
FALSE
13
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fnil\fcharset0 Times New Roman;}{\f2\froman\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.ShowZipMessage\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf0\f1\fs24\tab\cf2\ul See also:\cf3\ulnone\{linkID=1470\}\cf4\f0\fs20 
\par \pard\sb35\tx355\cf0 The ShowZipMessage method reads a message identified by Ident from the program resource table and displays it.
\par \pard\sb115\sa115\tx355\b Procedure\b0  ShowZipMessage( \b Const \b0 Ident: Integer, \b Const\b0  UserStr: \b String\b0  );
\par \pard\sa195\tx355\b\fs24 Description:
\par \pard\tx355\b0\fs20 All component messages, errors and warnings are as of version 1.5 contained in a resource message table. To make it easier to also use them in your own program this function is included.
\par It reads the message with identifier \f2 '\f0 Ident\f2 '\f0  from the resource table, appends the optional \f2 '\f0 UserStr\f2 '\f0  to it and displays the message.
\par If the identifier is not present, for example because you did not include the resource file in your project, the message displayed will be: \f2 "\f0 ZipMsg.res probably not linked to the executable. Missing String ID is: xxxx\f2 "\f0 
\par To resolve this you must put the statement \{\-$R YourPath\\ZipMsgxx.res\}; in your main unit file. Where xx is your language ID. (Available at the moment: US English, NL Dutch.)
\par 
\par }
1470
Scribble1470
ShowZipMessage see also




Writing



FALSE
7
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Times New Roman;}{\f1\fnil Arial;}}
{\colortbl ;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\strike\f0\fs24 Message\cf2\strike0\{linkID=600>main\}\cf0 
\par \cf1\strike OnMessage\cf2\strike0\{linkID=1610>main\}\cf3\lang1033\f1\fs20 
\par 
\par 
\par }
1480
Scribble1480
Unload_Unz_Dll
Methods;Unload_Unz_Dll;


BROWSE0003:0018
Done


TZipMaster_Unload_Unz_Dll;Unload_Unz_Dll;Unload_Unz_Dll_Method
FALSE
12
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\froman\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.Unload_Unz_Dll\cf0\{keepn\} 
\par \pard\tx355\cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf1\fs16\tab\tab\cf2\ul\fs18 Note  about the DLL\f1 '\f0 s:\ulnone\{linkID=410\}\cf3\fs20 
\par \pard\sb35\tx355\cf0 The UnLoad_Unz_Dll() method unloads the UNZDLL.DLL from memory.
\par \pard\sb115\sa115\tx355\b Procedure\b0  Unload_Unz_Dll;
\par \pard\sa195\tx355\b\fs24 Description:
\par \pard\tx355\b0\fs20 For compatibility with older programs, and because I'm a nice guy, I'll handle the loads and unloads automatically if your program doesn't do it.  This can, however, incur a performance penalty because it will reload the needed DLL for each operation.
\par 
\par Advanced developers will want to carefully consider their load and unload strategy so they minimize the number of loads, and keep the DLL\f1 '\f0 s out of memory when they're not needed. There is a traditional speed vs. memory trade-off.
\par 
\par }
1490
Scribble1490
Unload_Zip_Dll
Methods;Unload_Zip_Dll;


BROWSE0003:0019
Done


TZipMaster_Unload_Zip_Dll;Unload_Zip_Dll;Unload_Zip_Dll_Method
FALSE
12
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\froman\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.Unload_Zip_Dll\cf0\{keepn\} 
\par \pard\tx355\cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\fs18\tab\tab\ul Note  about the DLL\f1 '\f0 s:\ulnone\{linkID=410\}\cf3\fs20 
\par \pard\sb35\tx355\cf0 The UnLoad_Zip_Dll() method unloads the ZIPDLL.DLL from memory.
\par \pard\sb115\sa115\tx355\b Procedure\b0  Unload_Zip_Dll;
\par \pard\sa195\tx355\b\fs24 Description:
\par \pard\tx355\b0\fs20 For compatibility with older programs, and because I'm a nice guy, I'll handle the loads and unloads automatically if your program doesn't do it.  This can, however, incur a performance penalty because it will reload the needed DLL for each operation.
\par 
\par Advanced developers will want to carefully consider their load and unload strategy so they minimize the number of loads, and keep the DLL\f1 '\f0 s out of memory when they're not needed. There is a traditional speed vs. memory trade-off.
\par 
\par }
1500
Scribble1500
WriteSpan
Methods;Multi Volume Zip Parts;WriteSpan;


BROWSE0003:001a
Done


TZipMaster_WriteSpan;WriteSpan;WriteSpan_Method
FALSE
22
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fnil\fcharset0 Times New Roman;}{\f2\froman\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;\red128\green128\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.WriteSpan\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf0\f1\fs24\tab\cf2\ul See also: \cf3\ulnone\{linkID=1510\}\cf0 
\par \pard\sb35\tx355\f0\fs20 The WriteSpan method can be used to copy an existing zip archive file to one or more disks as a spanned archive.
\par \pard\sb115\sa115\tx355\b Function\b0  WriteSpan( \b Const\b0  InFileName, OutFileName: \b String\b0  ): Integer;
\par \pard\sa195\tx355\b\fs24 Description:
\par \pard\tx355\b0\fs20 With WriteSpan it is possible to make a spanned archive on (floppy) disk from a standard zip file.
\par InFileName is the name of the zipfile that must be converted.
\par OutFileName is the drive, path(optional) and file name of the destination file.
\par \pard\sb115\tx355 
\par \pard\fi-845\li845\tx845\cf4\b NOTE:\cf0\b0\tab If \f2 '\f0 OutFileName\f2 '\f0  is on a fixed disk the input file will be split into parts with size \cf2\strike MaxVolumeSize\strike0\{linkID=620\}\cf0\fs16  \fs20 A file part on harddisk will look like: OutFileNameXXX.zip where XXX is a number.
\par It is possible to copy the files \cf2\ul to diskette\ulnone\{linkID=1520\}\cf0  when the filesize is <= diskette size.
\par or to \cf2\strike reassemble them\cf3\strike0\{linkTarget=ReasMult>main\}\cf0  without diskettes after sending them over the internet for use with pkzip or winzip.
\par \pard\tx845 
\par The return value will be one the following:
\par \pard\fi-565\li565\tqr\tx425\tqr\tx565\tab 0\tab All Ok.
\par \tab  -7\tab All known WriteSpan errors. See also: \cf2\strike Error and warning messages from 1000 and up\strike0\{linkID=1860\}\cf0 
\par \tab -8\tab Memory allocation error. ( GE_NoMem )
\par \tab -9\tab General unknown WriteSpan error. ( DS_ErrorUnknown )
\par 
\par }
1510
Scribble1510
WriteSpan see also




Writing



FALSE
11
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Times New Roman;}{\f1\fnil Arial;}}
{\colortbl ;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\strike\f0\fs24 ReadSpan\cf2\strike0\{linkID=1430>main\}\cf0 
\par \cf1\strike MaxVolumeSize\cf2\strike0\{linkID=620>main\}\cf0 
\par \cf1\strike KeepFreeOnDisk1\cf2\strike0\{linkID=560>main\}\cf0 
\par \cf1\strike MinFreeVolumeSize \cf2\strike0\{linkID=630>main\}\cf0 
\par \cf1\strike Handling of Multi Volume Zip parts\cf2\strike0\{linkID=1520>main\}\cf0 
\par \cf3\lang1033\f1\fs20 
\par 
\par 
\par }
1520
Scribble1520
Handling of Multi Volume Zip parts
Multi Volume Zip Parts;



Done



FALSE
23
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\froman\fcharset0 Times New Roman;}}
{\colortbl ;\red128\green0\blue0;\red0\green0\blue255;\red128\green128\blue0;}
\viewkind4\uc1\pard\lang3081\f0\fs24 A)\tab How to copy each part to diskette afterwards:
\par \pard\fi-275\li275\tx275\b\fs20 1)\tab Make the MV archive on harddisk. Your filenames will be, for example:
\par \b0\i 'Test001.zip', 'Test002.zip', 'Test003.zip'
\par \b\i0 2)\tab Copy each of them to it's own diskette.
\par 3)\tab Rename each file on diskette to 'Test.zip'
\par 4)\tab Set the label of the diskettes to 'PKBACK# 001', 'PKBACK# 002' and 'PKBACK# 003'
\par ( Note the space between # and the first digit! )
\par 5)\tab Start reading from the last diskette.
\par \pard\cf1\b0\fs24\{target=ReasMult\}\cf2 B)\tab How to reassemble the pieces at the client side after sending the files over the internet, without using diskettes.
\par \pard\fi-275\li275\tx275\cf0\b\fs20 1)\tab Start a DOS window and "CD" to the directory with Test???.zip
\par 2)\tab Concatenate them with: 
\par \b0\i "Copy /B Test001.zip+Test002.zip+Test003.zip Test.zip" or shorter:  \f1 "\f0 Copy /B Test???.zip Test.zip\f1 "\f0 
\par \b\i0 (Do not enter the quotes.)
\par 3)\tab Fix the internal directory structure with: PKZipFix Test.zip
\par \cf3 Note:\cf0\b0  PKZipFix.EXE comes with pkzip v2.04g.
\par \b 4)\tab Rename the resulting file 'PKfixed.zip' to 'Test.zip' (This is now a normal zip file and should be 4 bytes smaller than the sum of the parts.
\par \b0 
\par \pard\fi-845\li845\sa55\tx845\cf3\b NOTE1:\cf0\b0\tab There is no time penalty making the archive directly on diskettes because the ZipMaster and ZipBuilder components internally use a temporary file on harddisk.
\par \pard\fi-845\li845\tx845\cf3\b NOTE2:\cf0\b0\tab Harddisk spanning is not supported by PKZip and WinZip, so if you want to use files created this way with these programs you will have to use one of the above mentioned methods.
\par 
\par }
1530
Scribble1530
OnCopyZipOverwrite
Events;OnCopyZipOverwrite;


events:000230
Done


OnCopyZipOverwrite;OnCopyZipOverwrite_Event;TZipMaster_OnCopyZipOverwrite
FALSE
12
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fnil\fcharset0 Times New Roman;}{\f2\froman\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.OnCopyZipOverwrite\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\tab\ul\f1\fs24 See also:\cf3\ulnone\{linkID=1540\}\cf4\f0\fs20 
\par \pard\sb35\tx165\tx425\cf0 The OnCopyZipOverwrite event occurs when the function CopyZippedFiles needs to know if a file may be overwritten.
\par \pard\sb115\b Type\b0   TCopyZipOverwriteEvent = \b Procedure\b0 ( Sender:\f1\fs24  TObject;\f0\fs20  ForFile: \b String\b0 ; \b var\b0  DoOverwrite: Boolean ) \b of object\b0 ;
\par \pard\sb115\sa115\tx165\tx425\b property\b0  OnCopyZipOverwrite: TCopyZipOverwriteEvent;
\par \pard\sa195\tx165\tx425\b\fs24 Description:
\par \pard\tx165\tx425\b0\fs20 Occurs when during the execution of the function \cf2\strike CopyZippedFiles\strike0\{linkID=1210\}\cf0  it is necessary to know if a file in the destination archive may be overwritten. It is possible that the event does NOT occur because you have let the function CopyZippedFiles know that it is always or never Ok to overwrite.
\par You can choose to overwrite the file \f2 '\f0 ForFile\f2 '\f0  by setting DoOverwrite to \b True\b0 . The default for DoOverwrite is \b False\b0 .
\par 
\par }
1540
Scribble1540
OnCopyZipOverwrite see also




Writing



FALSE
6
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Times New Roman;}{\f1\fnil Arial;}}
{\colortbl ;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\strike\f0\fs24 CopyZippedFiles\cf2\strike0\{linkID=1210>main\}\cf3\lang1033\f1\fs20 
\par 
\par 
\par }
1550
Scribble1550
OnCRC32Error
Events;OnCRC32Error;


events:000220
Done


OnCRC32Error;OnCRC32Error_Event;TZipMaster_OnCRC32Error
FALSE
13
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fnil\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.OnCRC32Error\cf0\{keepn\} 
\par \pard\tx165\tx425\cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb35\tx165\tx425\cf0 OnCRC32Error event occurs when a CRC error is found while extracting.
\par \pard\sb115\b Type \b0 TCRC32ErrorEvent = \b Procedure\b0 ( Sender: \f1\fs24 TObject\f0\fs20 ; ForFile: \b String\b0 ; FoundCRC, ExpectedCRC: LongWord; \b var\b0  DoExtract: Boolean ) \b of object\b0 ; 
\par \pard\sb115\sa115\tx165\tx425\b property\b0  OnCRC32Error: TCRC32ErrorEvent;
\par \pard\sa195\tx165\tx425\b\fs24 Description:
\par \pard\tx165\tx425\b0\fs20 Occurs when during an \cf2\strike Extract\strike0\{linkID=1250\}\cf0  a CRC error is found in the file ForFile.
\par FoundCRC is the calculated CRC and ExpectedCRC is the CRC as stored in the zip archive these two values are for your information only.
\par You can choose to skip the extraction of the file by setting DoExtract to False. The default for DoExtract is True because that was the case in previous versions of ZipMaster where you could not choose.
\par 
\par }
1560
Scribble1560
OnDirUpdate
Events;OnDirUpdate;


events:000210
Done


OnDirUpdate;OnDirUpdate_Event;TZipMaster_OnDirUpdate
FALSE
10
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.OnDirUpdate\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb35\cf0 OnDirUpdate event occurs when ZipMaster has refreshed the contents list.
\par \pard\sb115\sa115\b property\b0  OnDirUpdate: \cf2\strike TNotifyEvent\strike0\{link=!AL(`TNotifyEvent_Type')\}\cf0 ;
\par \pard\sa195\b\fs24 Description:
\par \pard\b0\fs20 Occurs immediately after ZipMaster refreshes it's \cf2\strike ZipContents\strike0\{linkID=930\}\cf0  TList. This is your queue to update the screen with the new contents.
\par 
\par }
1570
Scribble1570
OnExtractOverwrite
Events;OnExtractOverwrite;


events:000200
Done


OnExtractOverwrite;OnExtractOverwrite_Event;TZipMaster_OnExtractOverwrite
FALSE
35
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fnil\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red255\green0\blue0;\red0\green0\blue128;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.OnExtractOverwrite\cf0\{keepn\} 
\par \pard\tx165\tx425\cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb35\sa55\tx165\tx425\cf0 OnExtractOverwrite event occurs when during an Extract a file could be overwritten.
\par \pard\sb115\b Type\b0  TExtractOverwriteEvent = \b procedure\b0 ( Sender:\f1\fs24  TObject;\f0\fs20  ForFile: \b String\b0 ; IsOlder: Boolean; \b var\b0  DoOverwrite: Boolean; DirIndex Integer ) \b of object\b0 ;
\par \pard\sb115\sa115\tx165\tx425\b property\b0  OnExtractOverwrite: TExtractOverwriteEvent;
\par \pard\sa195\tx165\tx425\b\fs24 Description:
\par \pard\tx165\tx425\b0\fs20 ForFile the name of the file that will be overwritten.
\par IsOlder indicates if the existing file, on disk, is older.
\par DoOverwrite can be set to \b True\b0  when you want the file to be overwritten.\cf3 
\par \cf0 DirIndex is the index of ForFile inside the \cf2\strike ZipContents\strike0\{linkID=930\}\cf0  list. With this you have full access to all available archive file information for this file.\cf3 
\par 
\par \i Example:
\par \pard\tx275\cf0\b Var
\par \pard\tx275\tx1125\b0\tab q:\tab String;
\par \tab res:\tab Integer;
\par \tab DefBtn:\tab Cardinal;
\par \pard\tx275\b Begin
\par \b0\tab\b If\b0  \b NOT\b0  IsOlder \b Then\b0   \cf4  // Only when existing file is newer(or equal) we will ask what to do.\cf0 
\par \tab\b Begin
\par \b0\tab q := '\cf5 Do you want to overwrite the file:\cf0 '#13#10 + ForFile;
\par \pard\tx275\tx565\tab\b If\b0  DoOverwrite = True \b Then\b0 
\par \tab\tab DefBtn := MB_DEFBUTTON1
\par \tab\b Else
\par \b0\tab\tab DefBtn := MB_DEFBUTTON2;
\par \pard\tx275\tab res := MessageBox( Self.Handle, pChar( q ), 'Confirm', MB_YESNO \b or\b0  MB_ICONQUESTION \b or\b0  DefBtn );
\par \pard\tx275\tx565\tab\b If\b0  res = ID_YES \b Then\b0 
\par \tab\tab DoOverwrite := True
\par \tab\b Else
\par \b0\tab\tab DoOverwrite := False;
\par \pard\tx275\tab\b End
\par End\b0 ;
\par 
\par }
1580
Scribble1580
OnExtractSkipped
Events;OnExtractSkipped;


events:000190
Done


OnExtractSkipped;OnExtractSkipped_Event;TZipMaster_OnExtractSkipped
FALSE
12
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fnil\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.OnExtractSkipped\cf0\{keepn\} 
\par \pard\tx165\tx425\cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb35\sa55\tx165\tx425\cf0 OnExtractSkipped event occurs when a file is skipped during the \cf2\strike Extract\strike0\{linkID=1250\}\cf0  process.
\par \pard\sb115\b Type\b0  TExtractSkippedEvent   = \b procedure\b0 ( Sender: \f1\fs24 TObject\f0\fs20 ; ForFile: \b String\b0 ; SkipType: UnZipSkipTypes; ExtError: Integer ) \b of object\b0 ;
\par \pard\sb115\sa115\tx165\tx425\b property\b0  OnExtractSkipped: TExtractSkippedEvent;
\par \pard\sa195\tx165\tx425\b\fs24 Description:
\par \pard\tx165\tx425\b0\fs20 UnZipSkipTypes = ( stOnFreshen, stNoOverwrite, stFileExists, stBadPassword, stNoEncryptionDLL,
\par             stCompressionUnknown, stUnknownZipHost, stZipFileFormatWrong, stGeneralExtractError );
\par 
\par }
1590
Scribble1590
OnFileComment
Events;OnFileComment;


events:000180
Done


OnFileComment;OnFileComment_Event;TZipMaster_OnFileComment
FALSE
18
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fnil\fcharset0 Times New Roman;}{\f2\froman\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.OnFileComment\cf0\{keepn\} 
\par \pard\tx165\tx425\cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb35\sa55\tx165\tx425\cf0 OnFileComment event occurs when writing the central directory of the zip archive for every file in the archive.
\par \pard\sb115\b Type\b0  TFileCommentEvent = \b procedure\b0 ( Sender:\f1\fs24  TObject;\f0\fs20  ForFile: \b String\b0 , \b var\b0  FileComment: \b String\b0 , \b var\b0  IsChanged: Boolean ) \b of object\b0 ; 
\par \pard\sb115\sa115\tx165\tx425\b property\b0  OnFileComment: TFileCommentEvent;
\par \pard\sa195\tx165\tx425\b\fs24 Description:
\par \pard\tx165\tx425\b0\fs20 ForFile is the filename for which the filecomment could be set.
\par FileComment is set to the first 255 characters of the old filecomment when present and can be set to a new comment, with a maximum of 511 characters, for the file, remember filecomments are not zipped and are stored as given.
\par IsChanged must be set to \b True\b0  when you want the filecomment to be really set, default it is \b False\b0 .
\par 
\par \i Example:
\par \pard\tx275\b Begin
\par \b0 IsChanged := InputQuery( \f2 '\f0 Give new file comment\f2 '\f0 , \f2 '\f0 FileName: \f2 '\f0  + ForFile, FileComment );\i0 
\par \b\i End\b0 ;
\par 
\par }
1600
Scribble1600
OnGetNextDisk
Events;OnGetNextDisk;


events:000170
Done


OnGetNextDisk;OnGetNextDisk_Event;TZipMaster_OnGetNextDisk
FALSE
33
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fnil\fcharset0 Times New Roman;}{\f2\froman\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red255\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.OnGetNextDisk\cf0\{keepn\} 
\par \pard\tx165\tx425\cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb35\sa55\tx165\tx425\cf0 OnGetNextDisk event occurs when a disk is needed during disk spanning.
\par \pard\sb115\b Type\b0  TGetNextDiskEvent = \b procedure\b0 ( Sender: \f1\fs24 TObject;\f0\fs20  DiskSeqNo, DiskTotal: Integer; Drive: \b String\b0 , \b var\b0  Cancel: Boolean ) \b of object\b0 ; 
\par \pard\sb115\sa115\tx165\tx425\b property\b0  OnGetNextDisk: TGetNextDiskEvent;
\par \pard\sa195\tx165\tx425\b\fs24 Description:
\par \pard\tx165\tx425\b0\fs20 DiskSeqNo the sequence number of the disk needed or is zero when it concerns a diskspan read action.
\par DiskTotal the total number of needed disks. This is an estimate based on some known values or it is zero when the number could not be calculated.
\par Drive the drive name, e.g. \f2 '\f0 A:\f2 '\f0 .
\par Cancel, can be set to \b True\b0  to cancel the spanning operation, default \b False\b0 .
\par 
\par \i Example:
\par \pard\tx275\b Var
\par \pard\tx845\b0 MsgStr:\tab String;
\par Res:\tab Integer;
\par \pard\tx275\b Begin
\par \cf4\b0 // Only while reading
\par \cf0\b If\b0  DiskSeqNo = 0 \b Then\b0 
\par \tab MsgStr := LoadStr( DS_InsertDisk );
\par 
\par \pard\tx275\tx1985\b If\b0  DiskTotal = 0 \b Then\b0\tab\cf4 // Total disks is not known\cf0 
\par \pard\tx275\tab MsgStr := Format( LoadStr( DS_InsertAVolume ), [ DiskSeqNo ] )
\par \b Else
\par \b0\tab MsgStr := Format( LoadStr( DS_InsertVolume ), [ DiskSeqNo, DiskTotal ] );
\par MsgStr := MsgStr + Format( LoadStr( DS_InDrive ), [ Drive ] );
\par 
\par Res := MessageBox( ZipMaster1.Handle, pChar( MsgStr ), \f2 '\f0 Confirm\f2 '\f0 , MB_YESNOCANCEL \b or\b0  MB_DEFBUTTON2 \b or\b0  MB_ICONWARNING );
\par \b If\b0  Res <> IDYES \b Then\b0  Cancel := \b True\b0 ;
\par \b End\b0 ;
\par 
\par }
1610
Scribble1610
OnMessage
Events;OnMessage;


events:000160
Done


OnMessage;OnMessage_Event;TZipMaster_OnMessage
FALSE
11
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fnil\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.OnMessage\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\tab\ul\f1\fs24 See also:\cf3\ulnone\{linkID=1620\}\cf0 
\par \pard\sb35 OnMessage event occurs when\f0\fs20  a DLL or the component sends a message to your program.
\par \pard\sb115\b Type\b0  TMessageEvent = \b procedure\b0 ( Sender: \f1\fs24 TObject; \f0\fs20 ErrCode: Integer; Message: \b String\b0  ) \b of object\b0 ; 
\par \pard\sb115\sa115\tx355\b property\b0  OnMessage: TMsgEvent;
\par \pard\sb115\sa195\tx355\b\fs24 Description:
\par \pard\tx355\b0\fs20 The \cf2\strike Message\strike0\{linkID=600\}\cf0  property passed by this event will contain the message. If an error code accompanies the message, it will be in the \cf2\strike ErrCode\strike0\{linkID=420\}\cf0  property. The \cf2\strike Verbose\strike0\{linkID=890\}\cf0  and \cf2\strike Trace\strike0\{linkID=810\}\cf0  properties have a direct influence on how many OnMessage events you will get.
\par 
\par }
1620
Scribble1620
OnMessage see also




Writing



FALSE
7
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Times New Roman;}{\f1\fnil Arial;}}
{\colortbl ;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\strike\f0\fs24 Message\cf2\strike0\{linkID=600>main\}\cf0 
\par \cf1\strike ErrCode\cf2\strike0\{linkID=420>main\}\cf3\lang1033\f1\fs20 
\par 
\par 
\par }
1630
Scribble1630
OnNewName
Events;OnNewName;


events:000150
Done


OnNewName;OnNewName_Event;TZipMaster_OnNewName
FALSE
12
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fnil\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.OnNewName\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf0\f1\fs24\tab\cf2\ul See also:\cf3\ulnone\{linkID=1640\}\cf0  \cf4\f0\fs20 
\par \pard\sb35\tx165\tx425\cf0 OnNewName event occurs when reading the Zip's archive directory for every file entry.
\par \pard\sb115\b Type \b0 TNewNameEvent = \b Procedure\b0 ( Sender: \f1\fs24 TObject; \f0\fs20 SeqNo: Integer; ZipEntry: ZipDirEntry ) \b of object\b0 ; 
\par \pard\sb115\sa115\tx165\tx425\b property\b0  OnNewName: TNewNameEvent;
\par \pard\sb115\sa195\tx165\tx425\b\fs24 Description:
\par \pard\b0\fs20 The event OnNewName occurs when reading the Zip's archive directory and gives you the opportunity to fill in for example a \f1\fs24 TListView\f0\fs20 . In previous versions you had to wait for the \cf2\strike OnDirUpdate\strike0\{linkID=1560\}\cf0  event.
\par SeqNo is a number from 1 to the number of entries in the zipfile and can be used to reset a ListView when the value is 1 and as sequence number in a \f1\fs24 TStringGrid.
\par \pard\tx165\tx425\f0\fs20 
\par }
1640
Scribble1640
OnNewName see also




Writing



FALSE
7
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Times New Roman;}{\f1\fnil Arial;}}
{\colortbl ;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\strike\f0\fs24 DirEntry\cf2\strike0\{linkID=210>main\}\cf0 
\par \cf1\strike ZipDirEntry\cf2\strike0\{linkID=940>main\}\cf3\lang1033\f1\fs20 
\par 
\par 
\par }
1650
Scribble1650
OnPasswordError
Events;OnPasswordError;


events:000140
Done


OnPasswordError_Event;PasswordError;TZipMaster_OnPasswordError
FALSE
19
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fnil\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;\red128\green128\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.OnPasswordError\cf0\{keepn\} 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf0\f1\fs24\tab\cf2\ul See also: \cf3\ulnone\{linkID=1660\}\cf2\f0\fs20\tab\ul\fs18 Note on passwords:\ulnone\{linkID=1380\}\cf4\fs20 
\par \pard\sb35\tx355\cf0 OnPasswordError event occurs when a DLL needs a password for encryping or decrypting.
\par \pard\sb115\b Type\b0  TPasswordErrorEvent = \b Procedure\b0 ( Sender: \f1\fs24 TObject; \f0\fs20 IsZipAction: Boolean; \b var\b0  NewPassword: \b String\b0 ; ForFile: \b String\b0 ; \b var\b0  RepeatCount: LongWord ; var Action: TPasswordButton ) \b of object\b0 ;
\par \pard\sb115\tx355\b Type\b0  TPasswordButton  = ( pwbOk, pwbCancel, pwbCancelAll, pwbAbort );
\par \pard\sb115\sa115\tx355\b property\b0  OnPasswordError: TPasswordError;
\par \pard\sb115\sa195\tx355\b\fs24 Description:
\par \pard\tx355\b0\fs20 Occurs when adding or extracting and a password is needed but not set by the Password property and also when extracting and the given password is incorrect.
\par IsZipAction is set to \b true\b0  when the error is originating from the Zip DLL i.e. an \cf2\strike Add\strike0\{linkID=1090\}\cf0  action else it is from the UnZip DLL. (an \cf2\strike Extract\strike0\{linkID=1250\}\cf0  action)
\par The ForFile parameter will give the path+file for which the password is needed.
\par RepeatCount is at first set to the \cf2\strike PasswordReqCount\strike0\{linkID=670\}\cf0  number and decremented on each event call.
\par When needed you can modify RepeatCount and set it to value from 0 to 15 this will not influence PasswordReqCount.
\par Action is the action to take when returning from this event, possible actions are: pwbOk, pwbCancel, pwbCancelAll or pwbAbort. Default is pwbOk.
\par 
\par \cf5\b NOTE:\cf0\b0\tab This event will be called at most 15 times per file even when you try to increase RepeatCount multiple times.
\par 
\par }
1660
Scribble1660
OnPasswordError see also




Writing



FALSE
8
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Times New Roman;}{\f1\fnil Arial;}}
{\colortbl ;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\strike\f0\fs24 GetExtrPassword\cf2\strike0\{linkID=1320>main\}\cf0 
\par \cf1\strike GetAddPassword\cf2\strike0\{linkID=1300>main\}\cf3\lang1033\f1\fs20 
\par 
\par 
\par 
\par }
1670
Scribble1670
OnProgress
Events;OnProgress;


events:000130
Done


OnProgress;OnProgress_Event;TZipMaster_OnProgress
FALSE
21
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fswiss\fcharset0 Arial;}{\f2\froman\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.OnProgress\cf0\{keepn\} 
\par \pard\tx355\cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\tab\strike Example:\strike0\{linkID=1680>example\}\cf3 
\par \pard\sb35\tx355\cf0 OnProgress event o\cf3 ccurs during compression and decompression of a Zip archive and while disk (un)spanning.\cf0 
\par \pard\sb115\b Type\b0  TProgressEvent = \b Procedure\b0 ( Sender\f1 : TObject\f0 ; ProgrType: ProgressType; Filename: \b String\b0 ; FileSize: \lang1033\f1 cardinal\lang3081\f0  ) \b of object\b0 ;
\par \pard\sb115\sa115\tx355\b property\b0  OnProgress: TProgressEvent;
\par \pard\sb115\sa195\tx355\b\fs24 Description:
\par \pard\sa195\tx355\cf3\b0\fs20 Intended for "status bar" or "progress bar" updates.  Criteria for this event:\cf0 
\par \pard\sa35\tx355\cf3 ProgressType is defined as one of the types below:\cf0 
\par \pard\fi-2545\li2835\tx565\tx2835 TotalSize2Process\tab At the start of processing a (batch of) file(s) with the Add, Extract or Test method this gives the total uncompressed file size which will be processed by the given method. This can be used to show a progress bar for the entire job. This size is also available in the \cf2\strike TotalSizeToProcess\strike0\{linkID=800\}\cf0  property.\f1  \cf4 Changed 1.72 \cf0 - If Filename is not empty it contains the operation name (Clearing Archive Bit etc)\f0 
\par TotalFiles2Process\tab At the start of processing a (batch of) file(s) with the Add, Extract or Test method you will get the total number of files which will be processed by the given method.
\par NewFile\tab Starting to process a new file. (gives you  the filename and total uncompressed filesize for the given file.)
\par ProgressUpdate\tab Every xxxK bytes while processing a file. The actual progress \f2 '\f0 xxx\f2 '\f0  is given in FileSize.
\par For Zip compression this will be 64K, n times 32K, and the remaining file bytes.
\par For Unzip uncompression this will be: n times 32K and the remaining file bytes.
\par For Zip (un)spanning actions it will be 8K.
\par EndOfBatch\tab Completed processing on a (batch of) file(s).
\par \pard\sb115\tx565\tx2835 (See Demo1 to learn how to use this event.)
\par 
\par }
1680
Scribble1680





Done



FALSE
5
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red0\green0\blue255;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs24 To see the code in action look at demo 1.\cf0 
\par 
\par }
1690
Scribble1690
OnProgressDetails
OnProgressDetails;


events:000120
Writing



FALSE
14
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Arial;}{\f1\fswiss Arial;}{\f2\fnil Arial;}}
{\colortbl ;\red0\green0\blue255;\red128\green0\blue0;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\fs32 TZipMaster.OnProgressDetails\cf2\{keepn\}\cf0\f1\fs28 
\par \cf3\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\tab\cf4\lang1033\f2 
\par 
\par \lang3081\b\f0\fs24 Type\lang1033\b0\f2\fs20 
\par   TProgressDetailsEvent = procedure(Sender: TObject; details: \cf3\strike TProgressDetails\cf2\strike0\{linkID=1700>main\}\cf4 ) of object;
\par 
\par \b property \b0 OnProgressDetails: TProgressDetailsEvent\lang3081\f0 ;
\par 
\par Description
\par    Provides access to full progress details
\par \lang1033\f2 
\par }
1700
Scribble1700
ProgressDetails
OnProgressDetails;


events:000110
Writing



FALSE
30
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Arial;}{\f1\fnil Arial;}}
{\colortbl ;\red0\green0\blue255;\red128\green0\blue0;\red0\green0\blue0;\red0\green128\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\fs32 TProgressDetails\cf2\{keepn\}\cf1  \cf3\lang1033\b0\f1\fs20 
\par \lang3081\f0  \lang1033\f1 
\par \b type\b0 
\par   TProgressDetails = \b class\b0 (\b TObject\b0 )\lang3081\f0  \lang1033\f1 
\par   public
\par     destructor Destroy; override;
\par     property ItemPerCent: Integer\lang3081\f0 ;\lang1033\f1 
\par     property TotalPerCent: Integer\lang3081\f0 ;\lang1033\f1 
\par     property Order: \cf4\strike ProgressType \cf2\strike0\{linkID=1710>main\}\cf3\lang3081\f0 ;\lang1033\f1 
\par     property TotalCount: Integer;
\par     property BytesWritten: Int64;
\par     property TotalSize: Int64;
\par     property TotalPosition: Int64;
\par     property ItemSize: Cardinal;
\par     property ItemPosition: Cardinal;
\par     property ItemName: String;
\par     property ItemNumber: Integer;
\par   end;
\par      
\par \lang3081\b\f0\fs24 Description\b0\fs20 
\par    Encapsulates all progress details for the \cf4\strike OnProgressDetails \cf2\strike0\{linkID=1690>main\}\cf3 event
\par 
\par    ItemPosition, TotalPosition and ItemPerCent, TotalPerCent calculations are handled internally
\par 
\par    BytesWritten is only available during 'Add' or 'Delete' operations
\par 
\par \lang1033\f1 
\par }
1710
Scribble1710
ProgressType




Writing



FALSE
25
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Arial;}{\f1\fnil\fcharset0 Times New Roman;}{\f2\fnil Arial;}}
{\colortbl ;\red0\green0\blue255;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\fs32 ProgressType\cf2\{keepn\}\cf1 
\par 
\par \cf0\fs24 type\b0\f1 
\par   ProgressType = (NewFile, ProgressUpdate, EndOfBatch, TotalFiles2Process,
\par     TotalSize2Process, NewExtra, ExtraUpdate);
\par 
\par \cf3\b\f0\fs20 Defined in\b0  ZipProg.pas
\par \lang1033\f2 
\par \lang3081\b\f0\fs24 Desciption\lang1033\b0\f2\fs20 
\par \lang3081\f0    enumerates the types of 'progress'
\par 
\par \cf0\f1\fs24     NewFile, \tab\tab starting on new file
\par     ProgressUpdate, \tab reports progress in file
\par     EndOfBatch, \tab finished all operations
\par     TotalFiles2Process,\tab reports Total files to process
\par     TotalSize2Process, \tab reports Total uncompressed size of files
\par     NewExtra, \tab\tab starting new 'extra' item
\par     ExtraUpdate\tab\tab advancing through 'extra' item
\par 
\par    'extra' items are operations that may take some time eg. reading central directory or resetting archive bits
\par 
\par \cf3\lang1033\f2\fs20 
\par }
1720
Scribble1720
OnSetNewName
Events;OnSetNewName;


events:000100
Done


OnSetNewName;OnSetNewName_Event;TZipMaster_OnSetNewName
FALSE
14
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fnil\fcharset0 Times New Roman;}{\f2\froman\fcharset0 Times New Roman;}{\f3\fswiss\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red255\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\f0\fs28 TZipMaster.OnSetNewName\cf0\b\{keepn\} 
\par \pard\tx165\tx425\cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb35\tx165\tx425\cf0 OnSetNewName event occurs when adding files to an archive and gives you a chance to change the path and or file name.
\par \pard\sb115\b Type \b0 TSetNewNameEvent = \b Procedure\b0 ( Sender:\f1\fs24  TObject; \b\f0\fs20 var\b0  OldFileName: \b String\b0 ; \b var\b0  IsChanged: Boolean ) \b of object\b0 ; 
\par \pard\sb115\sa115\tx165\tx425\b property\b0  OnSetNewName: TSetNewName;
\par \pard\sb115\sa195\tx165\tx425\b\fs24 Description:
\par \pard\tx165\tx425\b0\fs20 Occurs when adding files to the archive, the file to be added is OldFileName and can be changed to any path filename combination of your own choice. when you change \f2 '\f0 OldFileName\f2 '\f0  you must also set IsChanged to \b True\b0 .
\par 
\par \pard\fi-1555\li1555\tx1555\cf4\b WARNING:\tab\cf0\b0 There is virtual\f3 ly\f0  no check on the path\\filename you specify.
\par \tab This means that if you are not careful you can get multiple names or even wrong names that can\f2 '\f0 t be extracted anymore.
\par 
\par }
1730
Scribble1730
OnSetAddName
Events;OnSetAddName;OnSetNewName;


events:000090
Done


OnSetNewName;OnSetNewName_Event;TZipMaster_OnSetNewName
FALSE
16
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fswiss\fcharset0 Arial;}{\f2\fnil\fcharset0 Times New Roman;}{\f3\froman\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red128\green0\blue0;\red255\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\f0\fs28 TZipMaster.OnSetAddName\{keepn\} \cf0\b 
\par \pard\tx165\tx425\cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb35\tx165\tx425\cf0 OnSet\f1 Add\f0 Name event occurs when adding files to an archive and gives you a chance to change the path and\f1 /\f0 or file name.
\par \pard\sb115\b Type \b0 TSet\f1 Add\f0 NameEvent = \b Procedure\b0 ( S\f2\fs24 ender: TObject;\f0\fs20  \b var\b0  FileName: \b String\b0 ; \f1 const ExtName: string; \b\f0 var\b0  IsChanged: Boolean ) \b of object\b0 ; 
\par \pard\sb115\sa115\tx165\tx425\b property\b0  OnSet\f1 Add\f0 Name: TSet\f1 Add\f0 Name\f1 Event\f0 ;
\par \f1 This replaces the \cf2\strike OnSetNewName\cf4\strike0\{linkID=1720\}\cf0  event.\f0 
\par \pard\sb115\sa195\tx165\tx425\b\fs24 Description:
\par \pard\tx165\tx425\b0\fs20 Occurs\f1  only\f0  when adding files to the archive, the file to be added is FileName and can be changed to any path filename combination of your own choice. when you change \f3 '\f0 FileName\f3 '\f0  you must also set IsChanged to \b True\b0 .
\par \f1 ExtName is the full path and name of file being added.\f0 
\par 
\par \pard\fi-1555\li1555\tx1555\cf5\b WARNING:\tab\cf0\b0 There is virtual\f1 ly\f0  no check on the path\\filename you specify.
\par \tab This means that if you are not careful you can get multiple names or even wrong names that can\f3 '\f0 t be extracted anymore.
\par 
\par }
1740
Scribble1740
OnSetExtName
Events;OnSetExtName;OnSetNewName;


events:000080
Done


OnSetNewName;OnSetNewName_Event;TZipMaster_OnSetNewName
FALSE
15
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fswiss\fcharset0 Arial;}{\f2\fnil\fcharset0 Times New Roman;}{\f3\froman\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red128\green0\blue0;\red255\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\f0\fs28 TZipMaster.OnSetExtName\{keepn\} \cf0\b 
\par \pard\tx165\tx425\cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb35\tx165\tx425\cf0 OnSet\f1 Add\f0 Name event occurs when adding files to an archive and gives you a chance to change the path and\f1 /\f0 or file name.
\par \pard\sb115\b Type \b0 TSet\f1 Add\f0 NameEvent = \b Procedure\b0 ( Sende\f2\fs24 r: TObject; \b\f0\fs20 var\b0  FileName: \b String\b0 ;\f1  \b\f0 var\b0  IsChanged: Boolean ) \b of object\b0 ; 
\par \pard\sb115\sa115\tx165\tx425\b property\b0  OnSet\f1 Ext\f0 Name: TSet\f1 Ext\f0 Name\f1 Event\f0 ;
\par \f1 This replaces the \cf2\strike OnSetNewName\cf4\strike0\{linkID=1720\}\cf0  event.\f0 
\par \pard\sb115\sa195\tx165\tx425\b\fs24 Description:
\par \pard\tx165\tx425\b0\fs20 Occurs\f1  only\f0  when \f1 extract\f0 ing files \f1 from\f0  the archive, the file to be \f1 extract\f0 ed is FileName and can be changed to any path filename combination of your own choice. \f1 W\f0 hen you change \f3 '\f0 FileName\f3 '\f0  you must also set IsChanged to \b True\b0 .\f1  \f0 
\par 
\par \pard\fi-1555\li1555\tx1555\cf5\b WARNING:\tab\cf0\b0 There is virtual\f1 ly\f0  no check on the path\\filename you specify.
\par \tab This means that if you are not careful you can get multiple names or even \f1 invalid\f0  names that can\f3 '\f0 t be extracted anymore.
\par 
\par }
1750
Scribble1750
OnTick
Events;OnTick;


events:000070
Writing


Events;OnTick
FALSE
19
{\rtf1\ansi\ansicpg1252\deff0\deflang3081{\fonttbl{\f0\fnil\fcharset0 Arial;}{\f1\fswiss Arial;}{\f2\fnil Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\b\fs32 TZipMaster.OnTick\{keepn\}\cf0\f1\fs28 
\par \pard\tx165\tx425\cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\cf1\b\f0\fs32  \cf0\b0\fs20 activity indicator
\par 
\par Type TTickEvent = Procedure(Sender: TObject) Of Object; 
\par 
\par Property OnTick: TTickEvent
\par 
\par \b\fs32 Description\b0\fs20 
\par 
\par    \tab Use OnTick + \cf2\strike OnSetNewName \cf4\strike0\{linkID=1720\}\cf0 to indicate activity before compression starts during \cf2\strike Add\cf4\strike0\{linkID=1090\}\cf0 
\par 
\par \cf1\b\fs32 
\par \cf3\b0\f2\fs20 
\par 
\par 
\par }
1760
Scribble1760
OnZipStr



events:000060
Writing



FALSE
38
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Arial;}{\f1\fswiss Arial;}{\f2\fnil Arial;}}
{\colortbl ;\red0\green0\blue255;\red128\green0\blue0;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\fs32 TZipMaster.\lang1033 OnZipStr\cf2\{keepn\}\cf0\lang3081\f1\fs28 
\par \pard\tx165\tx425\cf3\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf4 
\par \pard\cf1\b\f0\fs32  \cf0\b0\fs20 return string for ID
\par 
\par \b Type\b0\tab 
\par     TZipStrEvent = procedure(ID: integer; var Str: String) of object;
\par 
\par \b Defined in\b0  ZipStrs.pas
\par 
\par Property OnZipStr: TOnZipStr;
\par 
\par \b\fs32 Description\b0\fs20 
\par     Use it to supply the required string for a ID.
\par 
\par  An (inefficient) Example
\par procedure TForm1.ZipMaster1ZipStr(Sender: TObject; ID: Integer;  var Str: String);
\par Var
\par \tab Buff : String ;
\par \tab L : Integer ;
\par \tab hDll : integer;
\par begin
\par \tab hDll := LoadLibrary(pChar('eng_zm.dll'));
\par \tab if hDll<>0 then
\par \tab begin
\par \tab\tab buff:='';
\par \tab\tab L := 255;
\par \tab\tab SetLength(Buff, L+1) ;
\par \tab\tab LoadString(hDll, ID, PChar(Buff), L);
\par \tab\tab Str := String( PChar( Buff ) ) ;
\par \tab\tab FreeLibrary(hDll);
\par \tab end;
\par end;
\par 
\par \cf4\lang1033\f2 
\par 
\par }
1770
Scribble1770
OnZipDialog



events:000050
Writing



FALSE
38
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Arial;}{\f1\fswiss Arial;}{\f2\fnil Arial;}}
{\colortbl ;\red0\green0\blue255;\red128\green0\blue0;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\fs32 TZipMaster.\lang1033 OnZipDialog\cf2\{keepn\}\cf0\lang3081\f1\fs28 
\par \pard\tx165\tx425\cf3\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf4 
\par \pard\cf1\b\f0\fs32  \cf4\b0\fs20    called before displaying message dialogs to allow custom handling of messages\cf0 
\par 
\par \b Type\b0 
\par   TZipDialogEvent = procedure(Sender: TObject; const title: String;
\par          var msg: String; var Result: Integer; btns: TMsgDlgButtons) of object;  
\par 
\par Property OnZipDialog: TOnZipDialogEvent;
\par 
\par \b\fs32 Arguments
\par   \b0\fs20  Sender: TObject; 
\par     const title: String; -  Desired Caption
\par     var msg: String; 
\par \tab\tab  - IN message text, 
\par \tab\tab    OUT (zmtPassword only) password
\par     var Result: Integer; 
\par \tab\tab - IN HighWord=message dialog type (see below) 
\par \tab\tab       LowWord=\cf3\strike Help context\cf2\strike0\{linkID=1780>main\}\cf0 
\par  \tab\tab - OUT ModalResult (unchanged if not handled)
\par     btns: TMsgDlgButtons - required buttons
\par 
\par   Defined in ZipDlg.pas
\par // High word = $10 or TMsgDlgType, low word = context
\par const
\par   zmtWarning  = $100000;
\par   zmtError    = $110000;
\par   zmtInformation = $120000;
\par   zmtConfirmation = $130000;
\par   zmtPassword = $140000;
\par 
\par \b\fs32 Description
\par   \b0\fs20 used to show messages or request passwords
\par    If \cf3\strike Verbose \cf2\strike0\{linkID=890>main\}\cf0 is true the context number will be show in the title.\b\fs32 
\par   \cf4\lang1033\b0\f2\fs20 
\par }
1780
Scribble1780
DialogContext




Writing



FALSE
43
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Arial;}{\f1\fnil Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\fs32 DialogContext\cf2\lang1033\b0\f1\fs20 
\par 
\par \lang3081\f0  Defined in ZipCtx.pas
\par 
\par const
\par   DHCBase = 10000;
\par 
\par   DHC_ZipMessage = DHCBase;
\par      Show (error?) message
\par   DHC_ExMessage = DHCBase + 1;
\par      Show Exception message
\par   DHC_Password = DHCBase + 2; // just GetPassword default password
\par      Request password
\par   DHC_ExtrPwrd = DHCBase + 3;
\par      Request Extract password
\par   DHC_AddPwrd1 = DHCBase + 4;
\par      Request first Add password
\par   DHC_AddPwrd2 = DHCBase + 5;
\par      Confirm Add password
\par   DHC_WrtSpnDel = DHCBase + 6;
\par      Confirm delete 
\par   DHC_ExSFX2EXE = DHCBase + 7;
\par      ?
\par   DHC_ExSFX2Zip = DHCBase + 8;
\par      ?
\par   DHC_SpanNxtW = DHCBase + 9;
\par      Request next disk for writing
\par   DHC_SpanNxtR = DHCBase + 10;  
\par      Request next disk for reading
\par   DHC_SpanOvr = DHCBase + 11;
\par      Confirm before overwriting old part
\par   DHC_SpanNoOut = DHCBase + 12;
\par      Complain no output file
\par   DHC_SpanSpace = DHCBase + 13;
\par      Complain not enough space
\par   DHC_CpyZipOvr = DHCBase + 14;
\par      Confirm overwrite in CopyZippedFile
\par   DHC_FormErase = DHCBase + 15;
\par      Confirm format floppy
\par \lang1033\f1 
\par }
1790
Scribble1790
OnTotalProgress
OnTotalProgress;TTotalProgressEvent;


events:000040
Writing


TotalProgress;Progress;TZipMaster_OnTotalProgress
FALSE
30
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Arial;}{\f1\fswiss Arial;}{\f2\fnil\fcharset0 Times New Roman;}{\f3\fnil Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\b\fs32 TZipMaster.OnTotalProgress\{keepn\}\cf0\lang3081\f1\fs28 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf0\f2\fs24\tab\cf2\ul See also:\cf3\ulnone\{linkID=1800\}\cf4\f1\fs20 
\par \cf1\b\f0\fs32  \cf0\b0\fs20 to show progress of operations such as Add or Extract
\par 
\par \b Type\b0\tab 
\par     TTotalProgressEvent = procedure(Sender: TObject; TotalSize, PerCent: integer) of object;
\par 
\par \b Property \b0 
\par \tab OnTotalProgress: TTotalProgressEvent;
\par 
\par \b\fs32 Description\b0\fs20 
\par     Use it to show progress on a ProgressBar or similar indicator.
\par       The 'End of Batch' condition is marked by PerCent = -1
\par 
\par Example
\par 
\par procedure TForm1.ZipMaster1TotalProgress(Sender: TObject; TotalSize,  PerCent: integer);
\par begin
\par //    if PerCent>=0 then\tab\tab // leave at 100%
\par \tab ProgressBar2.Position := PerCent;
\par end;
\par 
\par 
\par \cf1\lang1033\b\fs32 
\par \cf4\b0\f3\fs20 
\par 
\par 
\par }
1800
Scribble1800
OnTotalProgress see only




Writing



FALSE
7
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Times New Roman;}{\f1\fnil Arial;}}
{\colortbl ;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\strike\f0\fs24 OnProgressDetails\cf2\strike0\{linkID=1690>main\}\cf0 
\par \cf1\strike OnItemProgress\cf2\strike0\{linkID=1810>main\}\cf3\lang1033\f1\fs20 
\par 
\par 
\par }
1810
Scribble1810
OnItemProgress
OnItemProgress;TItemProgressEvent;


events:000030
Writing


OnItemProgress;Progress;TZipMaster_OnItemProgress
FALSE
31
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Arial;}{\f1\fswiss Arial;}{\f2\fnil\fcharset0 Times New Roman;}{\f3\fnil Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\b\fs32 TZipMaster.OnItemProgress\{keepn\}\cf0\lang3081\f1\fs28 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\tab\ul\f2\fs24 See also: \cf3\ulnone\{linkID=1910\}\cf4\f1\fs20 
\par \cf1\b\f0\fs32  \cf0\b0\fs20 return string for ID
\par 
\par \b Type\b0\tab 
\par     TOnItemProgressEvent = procedure(Sender: TObject; Item: string;
\par \tab\tab TotalSize:cardinal; PerCent: integer) of object;
\par 
\par Property OnItemProgress: TOnItemProgressEvent ;
\par 
\par \b\fs32 Description\b0\fs20 
\par     Use it to show progress for each item on a ProgressBar or similar indicator.
\par       The 'End of Batch' condition is marked by PerCent = -1
\par 
\par 
\par Example
\par \lang1033 
\par procedure TForm1.ZipMaster1ItemProgress(Sender: TObject; Item: string;
\par \tab\tab TotalSize:cardinal; PerCent: integer);
\par begin
\par \tab if PerCent = 0 then\tab // reduces flashing
\par \tab\tab Label1.Caption := Item;
\par \tab ProgressBar1.Position := PerCent;
\par end;
\par \cf1\b\fs32 
\par \cf4\b0\f3\fs20 
\par 
\par 
\par }
1820
Scribble1820
OnItemProgress see also




Writing



FALSE
9
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Times New Roman;}{\f1\fnil Arial;}}
{\colortbl ;\red0\green128\blue0;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\strike\f0\fs24 OnProgressDetails\cf2\strike0\{linkID=1690>main\}\cf0 
\par \cf1\strike OnTotalProgress \cf2\strike0\{linkID=1790>main\}\cf3\lang1033\f1\fs20 
\par 
\par 
\par 
\par 
\par }
1830
Scribble1830
OnStatusDisk
Events;OnStatusDisk;


events:000020
Done


OnStatusDisk;OnStatusDisk_Event;TZipMaster_OnStatusDisk
FALSE
27
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fnil\fcharset0 Times New Roman;}{\f2\froman\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster.OnStatusDisk\cf0\{keepn\} 
\par \pard\tx165\tx425\cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \pard\sb35\tx165\tx425\cf0 OnStatusDisk event occurs when spanning disks and trying to overwrite an existing file.
\par \pard\sb115\b Type \b0 TStatusDiskEvent = \b Procedure\b0 ( S\f1\fs24 ender: TObject; \f0\fs20 PreviousDisk: Integer; PreviousFile: \b String\b0 ; Status: TZipDiskStatus; \b var\b0  Action: TZipDiskAction ) \b of object\b0 ; 
\par \pard\sb115\sa115\tx165\tx425\b property\b0  OnStatusDisk: TStatusDiskEvent;
\par \pard\sb115\sa195\tx165\tx425\b\fs24 Description:
\par \pard\tx165\tx425\b0\fs20 PreviousDisk is when applicable the disknumber of the previous disk which could be overwritten.
\par PreviousFile contains the filename of the zip archive.
\par 
\par TZipDiskStatus is a set and can take one or more of the following values:
\par \pard\fi-1985\li1985\sb115\sa115\tx1985\b\fs24 Value\tab Meaning
\par \pard\fi-1985\li1985\tx1985\b0\fs20 zdsEmpty\tab The disk is empty and ready to use.
\par zdsHasFiles\tab The disk is not empty and contains one or more file(s).
\par zdsPreviousDisk\tab It\f2 '\f0 s possibly a previous disk from the backup set.
\par zdsSameFileName\tab The disk contains a file with the same filename as the zip archive.
\par zdsNotEnoughSpace\tab There is not enough space on the disk taken into account \cf2\strike KeepFreeOnDisk1\strike0\{linkID=560\}\cf0 , \cf2\strike MaxVolumeSize\strike0\{linkID=620\}\cf0  and \cf2\strike MinFreeVolumeSize\strike0\{linkID=630\}\cf0 .
\par \pard\tx425\fs18 
\par \fs20 TZipDiskAction should be set to one of the following values:
\par \pard\fi-1985\li1985\sb115\sa115\tx1985\b\fs24 Value\tab Meaning
\par \pard\fi-1985\li1985\tx1985\b0\fs20 zdaOkl\tab Continue diskspanning (the default).
\par zdaErase\tab Erase the disk first.
\par zdaReject\tab Try again.
\par zdaCancel\tab Cancel the diskspanning operation.
\par 
\par }
1840
Scribble1840





Done



FALSE
5
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red0\green128\blue0;}
\viewkind4\uc1\pard\lang3081\f0\fs24\{keepn\}rd The file specification is the technical description of files to include in the Zip archive. DOS wild cards may be used in the file specification. The \cf1\strike FSpecArgs\strike0\fs20\{linkID=480\}\cf0  property stores the file specification for the TZipMaster component.
\par 
\par }
1850
Scribble1850





Done



FALSE
5
{\rtf1\ansi\deff0{\fonttbl{\f0\fswiss Arial;}}
{\colortbl ;\red0\green128\blue0;}
\viewkind4\uc1\pard\lang3081\f0\fs24\{keepn\}rd The file specification is the technical description of files to exclude from the Zip or Delete action. DOS wild cards may be used in this file specification. The \cf1\strike FSpecArgsExcl\strike0\fs20\{linkID=490\}\cf0  property stores the file specification for the TZipMaster component.
\par 
\par }
1860
Scribble1860
TZipMaster error and warning messages
ZipError messages;ZipWarning messages;



Done


TZipMaster_Message_List
FALSE
233
{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fswiss Arial;}{\f1\fswiss\fprq2\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red128\green0\blue0;\red0\green128\blue0;\red0\green0\blue0;\red0\green128\blue128;\red128\green128\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\f0\fs28 TZipMaster error, warning and general messages\cf2\{keepn\}\cf1 
\par \cf3\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf4 
\par \pard\nowidctlpar\fi-3119\li3119\tx3119\f1 
\par \pard\fi-3119\li3119\cf0 
\par \tab\cf5\ul General messages\cf0\ulnone 
\par 10101  GE_FatalZip  \tab\tab\b Fatal Error in ZipDLL.DLL: abort exception
\par \b0\tab\tab Internal error while executing code in ZipDll.dll, this should not happen.
\par 10102  GE_NoZipSpecified  \tab\b Error - no zip file specified!
\par \cf3\b0\strike\tab\tab ZipFileName\strike0\{linkID=1020\}\cf0  is not specified or the specified file does not exist.
\par 10103  GE_NoMem  \tab\tab\b Requested memory not available\b0 
\par 10104  GE_WrongPassword  \tab\b Error - passwords do NOT match\b0\\n\b Password ignored\b0 
\par 10105  GE_CopyFile  \tab\tab\b Copying:
\par \b0 10106  GE_Except \b\tab\tab Exception in Event handler 
\par \b0 10107  GE_Reentered\b\tab\tab Was busy, Instructions may have been lost! 
\par \b0 10108  GE_Busy\tab\b\tab Busy, Please wait 
\par \b0 10109  GE_Inactive\b\tab\tab not Active 
\par \b0 10110  GE_RangeError\tab\b\tab Index (\b0 %d\b ) outside range 1..\b0 %d\b  
\par \b0 10111  GE_TempZip\b\tab\tab Temporary zipfile: \b0 %s\b   
\par \b0 10112  GE_WasBusy\b\tab\tab Busy  
\par \b0 10113  GE_EventEx\b\tab\tab Exception in Event                  
\par \b0 10118  GE_DLLAbort\b\tab\tab DLL Error - Aborting 
\par \b0 10119  GE_DLLBusy\b\tab\tab DLL Error - Busy 
\par \b0 10120  GE_DLLCancel\b\tab\tab DLL Error - User Cancelled  
\par \b0 10121  GE_DLLMem\b  \tab\tab DLL Error - Not enough memory 
\par \b0 10122  GE_DLLStruct\b\tab\tab DLL Error - Invalid structure ;
\par \b0 10123  GE_DLLEvent\b\tab\tab DLL Error - Exception in handler  
\par \b0 10124  GE_DLLCritical\b\tab\tab critical DLL Error \b0 %d\b  
\par \b0 10125  GE_Unknown\b\tab\tab Unknown error \b0 %d\b   
\par 
\par \b0\tab\cf5\ul Rename messages\cf0\ulnone 
\par 10140  RN_ZipSFXData  \tab\b Error while copying the SFX header\b0 
\par 10141  RN_NoRenOnSpan  \tab\b Rename is not implemented for a spanned zip file\b0 
\par 10142  RN_ProcessFile\tab\tab\b Processing:\b0 
\par 10143  RN_RenameTo\tab\tab\b renamed to:
\par \b0 10144  RN_InvalidDateTime \tab\b Invalid date/time argument for file: 
\par 
\par \b0\tab\cf5\ul Password messages\cf0\ulnone 
\par 10150  PW_UnatAddPWMiss\tab\b Error - no add password given
\par \b0\tab\tab You tried to use the function \cf3\strike GetAddPassword\strike0\{linkID=1300\}\cf0  while the property \cf3\strike Unattended\strike0\{linkID=830\}\cf0  was set to True.
\par 10151  PW_UnatExtPWMiss\tab\b Error - no extract password given\b0 
\par \tab\tab You tried to use the function \cf3\strike GetExtrPassword\strike0\{linkID=1320\}\cf0  while the property \cf3\strike Unattended\strike0\{linkID=830\}\cf0  was set to True.
\par 10152  PW_Ok\tab\ul\b O\ulnone k\b0 
\par 10153  PW_Cancel\tab\tab\ul\b C\ulnone ancel\b0 
\par 10154  PW_Caption\tab\tab\b Password\b0 
\par 10155  PW_MessageEnter\tab\b Enter password\b0 
\par 10156  PW_MessageConfirm\tab\b Confirm password\b0 
\par 10157  PW_CancelAll\tab\tab\b Cancel all\b0 
\par 10158  PW_Abort\tab\tab\b Abort\b0 
\par 10159  PW_ForFile\tab  \tab\b For file: 
\par 
\par \b0\tab\cf5\ul Change file details\cf0\ulnone 
\par 10180  CF_SourceIsDest\tab\b Source archive is the same as the destination archive!\b0 
\par 10181  CF_OverwriteYN\tab\tab\b Overwrite file '\b0 %s\b ' in '\b0 %s\b ' ?\b0 
\par 10182  CF_CopyFailed\tab\tab\b Copying a file from '\b0 %s\b ' to '\b0 %s\b ' failed\b0 
\par 10183  CF_SourceNotFound\tab\b File '\b0 %s\b ' is not present in '\b0 %s\b '!\b0 
\par 10184  CF_SFXCopyError\tab\b Error while copying the SFX data\b0 
\par 10185  CF_DestFileNoOpen\tab\b Destination zip archive could not be opened!
\par \b0 10186  CF_NoCopyOnSpan\b\tab Copy Zipped Files is not implemented for a spanned zip file
\par \b0 
\par \tab\cf5\ul List problems\cf0\ulnone 
\par 10201  LI_ReadZipError\tab\tab\b Seek error reading Zip archive!\b0 
\par 10202  LI_ErrorUnknown\tab\tab\b Unknown error in List() function\b0\\n
\par \tab Internal error while executing code in List function of TZipMaster, this should not occur.
\par 10203  LI_WrongZipStruct\tab\b Warning - Error in zip structure!\b0 
\par \tab The start of the central directory in the zip file is not where it should be!
\par If this archive should be read by other zip programs it is advisable to re-zip the contents.
\par It has probably to do with a conversion problem (bug) in earlier ZipMaster versions.
\par 10204  LI_GarbageAtEOF\tab\b Warning - Garbage at the end of the zipfile!
\par 
\par \b0\tab\cf5\ul general errors\cf0\ulnone 
\par 10301  AD_NothingToZip\tab\tab\b Error - no files to zip!\b0 
\par 10302  AD_UnattPassword\tab\b Unattended action not posible without a password
\par \b0\tab\tab You tried to perform an unattended Add without giving a password first.
\par 10303  AD_NoFreshenUpdate\tab\b AddFreshen or AddUpdate not posible on a spanned archive
\par \b0\tab\tab The property AddOptions contains AddFreshen or AddUpdate which is not an allowed action on a spanned archive, not even if this archive is on only one disk.
\par 10304  AD_AutoSFXWrong\tab\b Error \b0 %.1d\b  occurred during Auto SFX creation
\par \b0\tab\tab This error number is one of the errors as returned by the \cf3\strike ConvertSFX\strike0\{linkID=1150\}\cf0  method. \b 
\par \b0 10306  AD_InIsOutStream\tab\b Input stream may not be set to the output stream
\par \b0\tab\tab The input stream is the same as the output stream which is not permitted.
\par 10307  AD_InvalidName\tab\tab\b Wildcards are not allowed in Filename or file specification
\par \b0\tab\tab You tried to specify a filename with '*' and/or '?' characters in it.
\par 10308  AD_NoDestDir\tab\tab\b Destination directory '\b0 '%s\b '' must exist!\b0  
\par 
\par \tab\cf5\ul Delete messages\cf0\ulnone 
\par 10401  DL_NothingToDel\tab\tab\b Error - no files selected for deletion
\par \b0 10402  DL_NoDelOnSpan\b\tab Delete Files from an archive not implemented for a spanned zip file\tab 
\par 
\par \b0\tab\cf5\ul Extract messages\cf0\ulnone 
\par 10501  EX_FatalUnZip\tab\tab\b Fatal Error in UnzDLL.DLL: abort exception
\par \b0\tab\tab Internal error while executing code in UnzDll.dll, this should not happen.
\par 10502  EX_UnAttPassword\tab\b Warning - Unattended Extract: possible not all files extracted
\par \b0\tab\tab You were trying to perform an unattended Extract without giving a password first.
\par   If there are encrypted files in the archive they will not be extracted. 
\par 10504  EX_NoExtrDir\tab\tab\b Extract directory ''\b0 %s'\b ' must exist
\par 
\par \b0\tab\cf5\ul Loading DLLs\cf0\ulnone 
\par 10650 LD_NoDll\tab\tab\tab\b Failed to load \b0 %s
\par \tab\tab Windows could not load the named DLL - most likely could not find it or it is already in use
\par 10651 LD_BadDll\tab\tab\b Unable to load\b0  %s\b  - It is old or corrupt
\par \tab\tab\b0 The named DLL could not be loaded because it either too old or invalid\b 
\par \b0 See also: \cf3\strike DLLDirectory\strike0\{linkID=400\}\cf0 
\par 10652  LD_DllLoaded\tab\tab\b Loaded\b0   \b 
\par \b0\tab\tab The named DLL was found and loaded into memory 
\par 10653  LD_DllUnloaded \tab\tab\b Unloaded\b0 
\par \tab\tab The named DLL was unloaded
\par 
\par \tab\cf5\ul SFX messages\cf0\ulnone 
\par 10801  SF_StringTooLong\tab\b Error - On or more of the 4 property strings mentioned below exceeds 255 characters!
\par \b0\tab\tab The text length of one or more of the properties \cf3\strike SFXCaption\strike0\{linkID=690\}\cf0 , \cf3\strike SFXDefaultDir\strike0\{linkID=710\}\cf0 , \cf3\strike SFXCommandLine\strike0\{linkID=700\}\cf0  and\cf3\strike  SFXMessage\strike0\{linkID=730\}\cf0  exceeds 255 characters.
\par 10802  SF_NoZipSFXBin\tab\tab\b Error - DZSFX.BIN not found!
\par \b0\tab\tab The file 'DZSFX.bin' was not found on the search path and thus can not be used to make a self extracting zip archive.
\par See also: \cf3\strike SFXPath\strike0\{linkID=770\}\cf0 
\par 10803  SF_InputIsNoZip\tab\tab\b Error: input file is not a zip file
\par \b0\tab\tab It is only allowed to convert zip archive (with the extension .zip) to an executable.
\par 10804  SF_NoSFXSupport\tab\b Error: Not built with SFX support
\par \b0 10805  SF_MsgTooLong \b\tab SFX Message string exceeds 255 characters! 
\par \b0 10806  SF_DefPathTooLong \b\tab SFX Default path exceeds 255 characters! 
\par \b0 10807  SF_DlgTitleTooLong \b\tab SFX Dialog title exceeds 255 characters! 
\par \b0 10808  SF_CmdLineTooLong\b   \tab SFX Command line exceeds 255 characters! 
\par \b0 10809  SF_FBkPathTooLong\b   \tab SFX Fallback path exceeds 255 characters! 
\par 
\par \b0 10901  CZ_NoExeSpecified\tab\b Error - no .EXE file specified
\par \cf3\b0\strike\tab\tab ZipFileName\strike0\{linkID=1020\}\cf0  is not specified. You have to set this property to an existing filename with .EXE extension.
\par 10902  CZ_InputNotExe\tab\tab\b Error: input file is not an .EXE file
\par \cf3\b0\strike\tab\tab ZipFileName\strike0\{linkID=1020\}\cf0  does not specify a self extracting archive (with .EXE extension).
\par 10903  CZ_SFXTypeUnknown\tab\b Error determining the type of SFX archive
\par \b0\tab\tab The size of the self extracting part of this SFX archive could not be determined.
\par 
\par \tab\cf5\ul general messages\cf0\ulnone 
\par 11001  DS_NoInFile\tab\tab\b Input file does not exist\b0 
\par 11002  DS_FileOpen\tab\tab\b Zip file could not be opened\b0 
\par 11003  DS_NotaDrive\tab\tab\b Not a valid drive: \b0 %s\b 
\par \b0\tab\tab The drive letter of the input or output file must be in the range from A to Z.
\par 11004  DS_DriveNoMount\tab\b Drive \b0 %s\b  is NOT defined
\par \b0\tab\tab The drive is not available or drive information could not be obtained.
\par 11005  DS_NoVolume\tab\tab\b Volume label could not be set\b0 
\par 11006  DS_NoMem\tab\tab\b Not enough memory to display MsgBox\b0 
\par 11007  DS_Canceled\tab\tab\b User canceled operation\b0 
\par 11008  DS_FailedSeek\tab\tab\b Seek error in input file\b0 
\par 11009  DS_NoOutFile\tab\tab\b Creation of output file failed
\par \b0\tab\tab Your drive could be write protected.
\par 11010  DS_NoWrite\tab\tab\b Write error in output file\b0 
\par 11011  DS_EOCBadRead\tab\b Error while reading the End Of Central Directory\b0 
\par 11012  DS_LOHBadRead\tab\b Error while reading a local header\b0 
\par 11013  DS_CEHBadRead\tab\b Error while reading a central header\b0 
\par 11014  DS_LOHWrongSig\tab\b A local header signature is wrong\b0 
\par 11015  DS_CEHWrongSig\tab\b A central header signature is wrong\b0 
\par 11016  DS_LONameLen\tab\tab\b Error while reading a local file name\b0 
\par 11017  DS_CENameLen\tab\tab\b Error while reading a central file name\b0 
\par 11018  DS_LOExtraLen\tab\tab\b Error while reading a local extra field\b0 
\par 11019  DS_CEExtraLen\tab\tab\b Error while reading a central extra field\b0 
\par 11020  DS_DataDesc\tab\tab\b Error while reading/writing a data descriptor area\b0 
\par 11021  DS_ZipData\tab\tab\b Error while reading zipped data\b0 
\par 11022  DS_CECommentLen\tab\b Error while reading a file comment\b0 
\par 11023  DS_EOArchComLen\tab\b Error while reading the archive comment\b0 
\par 11024  DS_ErrorUnknown\tab\b Unknown error in function ReadSpan(), WriteSpan(), Rename() or CopyZippedFiles()
\par \b0\tab Please report this as a bug preferable with the circumstances under which this occurred.
\par 11025  DS_NoUnattSpan\tab\b Unattended disk spanning not implemented
\par \b0\tab if you want disk spanning (i.e. the \cf3\strike AddDiskSpan\strike0\{linkID=310\}\cf0  or \cf3\strike AddDiskSpanErase\strike0\{linkID=310\}\cf0  option is set) the program must ask you for the next disk and continue when it's put into the drive. Asking questions is not allowed when you also have set the '\cf3\strike Unattended\strike0\{linkID=830\}\cf0 ' property to\b  \b0 true.\b 
\par \b0 11026  DS_EntryLost\tab\tab\b A local header not found in internal structure\b0 
\par 11027  DS_NoTempFile\tab\tab\b Temporary file could not be created\b0 
\par 11028  DS_LOHBadWrite\tab\b Error while writing a local header\b0 
\par 11029  DS_CEHBadWrite\tab\b Error while writing a central header\b0 
\par 11030  DS_EOCBadWrite\tab\b Error while writing the End Of Central Directory\b0 
\par 11031  DS_ExtWrongSig\tab\b Error while reading a Extended Local signature\b0 
\par 11032  DS_NoDiskSpace\tab\b This disk has not enough free space available\b0 
\par 11033  DS_InsertDisk\tab\tab\b Please insert last disk
\par \b0 11034  DS_InsertVolume\tab\b Please insert disk volume \b0 %.1d\b  of \b0 %.1d\b 
\par \b0 11035  DS_InDrive\tab\tab\b in drive: \b0 %s\b 
\par \b0 11036  DS_NoValidZip \tab\tab\b This archive is not a valid Zip archive\b0 
\par 11037  DS_FirstInSet \tab\tab\b This is the first disk in a backup set,\b0\\n\b  please insert the last disk of this set\b0 
\par 11038  DS_NotLastInSet\tab  \tab\b This is the \b0 %d\b th disk in a backup set,\b0\\n\b  please insert the last disk of this set\b0 
\par 11039  DS_AskDeleteFile\tab\b There is already a file \b0 %s\\n\b  Do you want to overwrite this file\b0 
\par 11040  DS_AskPrevFile\tab\tab\b ATTENTION: This is previous disk no \b0 %d\b !!!\b0\\n\b  Are you sure you want to overwrite the contents
\par \b0 11041  DS_NoSFXSpan\tab\tab\b Error - Self extracting archives(.exe) can not be spanned
\par \b0 11042  DS_CEHBadCopy\tab\b Error while copying a filename of a CEH structure
\par \b0 11043  DS_EOCBadSeek\tab\b Seek error while skipping a EOC structure
\par \b0 11044  DS_EOCBadCopy\tab\b Error while copying the zip archive comment
\par \b0 11045  DS_FirstFileOnHD\tab\b This is the first file in a backup set,\b0\\n\b  please choose the last file of this set
\par \b0 11046  DS_InsertAVolume\tab\b Please insert disk volume \b0 %.1d
\par 11047  DS_CopyCentral\tab\tab\b Central directory \b0 
\par 11048  DS_NoDiskSpan\tab\tab\b DiskSpanning not supported\b0  
\par 11049  DS_UnknownError\tab\b Unknown Error\b0  
\par 11050  DS_NoRenamePart\tab\b Last part left as : \b0 %s 
\par 11051  DS_FileTooBig\tab\tab\b File larger than 4GB\b0  
\par 11052  DS_MethodUnknown\tab\b Unknown Compression Method\b0 
\par 11101  FM_Erase \tab\tab\b Erase\b0  %s 
\par 11102  FM_Confirm\tab\tab\b Confirm\b0  
\par 
\par \tab\cf5\ul Extra data\cf0\ulnone 
\par 11201  ED_SizeTooLarge \tab\b Size of FileExtraData is larger than available array\b0  
\par 
\par \tab\cf5\ul Change details messages\cf0\ulnone 
\par 11301  CD_NoCDOnSpan \tab\b ChangeFileDetails is not implemented for a spanned zip file\b0  
\par 11302  CD_NoEventHndlr \tab\b No Event Handler found to Change File Details\b0  
\par 11303  CD_LOExtraLen \tab\tab\b Error while writing a local extra field\b0  
\par 11304  CD_CEExtraLen \tab\tab\b Error while writing a central extra field\b0  
\par 11305  CD_CEComLen \tab\tab\b Error while writing a file comment\b0  
\par 11306  CD_FileName \tab\tab\b No FileName in changed file details\b0  
\par 11307  CD_CEHDataSize \tab\b The combined length of CEH + FileName + FileComment + ExtraData exceeds 65535\b0  
\par 11308  CD_Changing \tab\tab\b Changing details of:\b0   
\par 11309  CD_DuplFileName \tab\b Duplicate Filename: \b0 %s 
\par 11310  CD_NoProtected \tab\b Cannot change details of Excrypted file\b0  
\par 11311  CD_InvalidFileName\tab\b Invalid Filename: '\b0 '%s' 
\par 11312  CD_NoChangeDir \tab\b Cannot change path\b0  
\par 11313  CD_FileSpecSkip \tab\b Filespec ''\b0 %s\b '' skipped\b0  
\par 
\par \tab\cf5\ul Additional 'progress' messages\cf0\ulnone 
\par 11401 PR_Archive \tab\tab\b *Resetting Archive bit\b0  
\par 11402 PR_CopyZipFile \tab\tab\b *Copying Zip File\b0  
\par 11403 PR_SFX    \tab\tab\b *SFX\b0  
\par 11405 PR_Finish  \tab\tab\b *Finalising\b0  
\par 11406 PR_Copying \tab\tab\b *Copying\b0  
\par 11407 PR_CentrlDir \tab\tab\b *Central Directory\b0  
\par 11408 PR_Checking\tab\tab\b *Checking\b0  
\par 11409 PR_Loading\tab\tab\b *Loading Directory\b0  
\par 
\par \tab\cf5\ul Write zip messages\cf0\ulnone 
\par 11500 WZ_DropDirOnly \tab\tab\b Dropping \b0 %d \b empty directory entries\b0  
\par 11501 WZ_NothingToWrite\tab\b Nothing to write\b0   
\par 
\par \tab\cf5\ul Trace messages\cf0\ulnone 
\par 11600 TM_Erasing \tab\tab\b EraseFloppy - Removing \b0 %s     
\par 11601 TM_Deleting \tab\tab\b EraseFloppy - Deleting \b0 %s    
\par 11602 TM_GetNewDisk \tab\tab\b Trace : GetNewDisk Opening: \b0 %s    
\par 
\par \cf6\b NOTE:\cf0\b0\tab Normally you will not see the error/warning numbers, this will only happen when you forget to link with ZipMsgxx.RES.
\par 
\par \pard\nowidctlpar\fi-3119\li3119\tx851\cf4 
\par \pard 
\par }
1870
Scribble1870
Report
Callback;Functions;



Writing



FALSE
18
{\rtf1\ansi\ansicpg1252\deff0\deflang3081{\fonttbl{\f0\fnil\fcharset0 Arial;}{\f1\fswiss Arial;}{\f2\fnil Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\b\fs32 TZipMaster.Report\{keepn\} \cf0\f1\fs28 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \f2 
\par \f0 this \b PROTECTED \b0 function supples feedback from the dlls and vcl routines.
\par \f2 
\par \b\f0 Function \b0 CallBack(ActionCode, ErrorCode: integer; NameOrMsg: pChar; FileSize: cardinal; ZRec: PZCallBackStruct): integer;
\par 
\par Description
\par \tab Sends Action information to Events. 
\par \tab After the event it calls \cf2\strike OnCheckTerminate \cf4\strike0\{linkID=1880\}\cf3 or ProcessMessages.
\par \tab It returns the Cancel flag;
\par 
\par \f2 
\par 
\par 
\par }
1880
Scribble1880
OnCheckTerminate
Events;OnCheckTerminate;


events:000010
Writing



FALSE
26
{\rtf1\ansi\ansicpg1252\deff0\deflang3081{\fonttbl{\f0\fnil\fcharset0 Arial;}{\f1\fswiss Arial;}{\f2\fnil Courier New;}{\f3\fnil\fcharset0 Courier New;}{\f4\fnil Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\b\fs32 TZipMaster.OnCheckTerminate\{keepn\} \cf0\f1\fs28 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \f0  used for Multi-threaded applications
\par 
\par \b Type\b0 
\par     TCheckTerminateEvent = Procedure(Sender: TObject; Var abort: boolean) Of Object;
\par 
\par \b property \b0 OnCheckTerminate: TCheckTerminateEvent;
\par 
\par \b\fs24 Description
\par \tab\b0\fs20 Stops \cf2\strike Report \cf4\strike0\{linkID=1870\}\cf3 from calling ProcessMessages (not allowed outside main thread).
\par \tab Allows checking for Terminate
\par \cf0\f2 
\par \f3 eg.\f2 
\par \b procedure\b0  ZipThread.\f3 CheckTerminate\f2 ( Sender: TObject; \b Var\b0  abort: boolean);
\par \b begin\b0 
\par     \b if\b0  Terminate \b then\b0 
\par         abort := true;
\par \b end\b0 ;
\par \cf3\f4 
\par 
\par 
\par 
\par }
1885
Scribble1885
OnAfterCallback




Writing



FALSE
12
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Arial;}{\f1\fswiss Arial;}{\f2\fnil Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green128\blue0;\red0\green0\blue0;\red128\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\fs32 TZipMaster.OnAfterCallback\{keepn\} \cf0\f1\fs28 
\par \cf2\b0\strike\fs20 TZipMaster\strike0\{linkID=10>main\}\cf3 
\par \f0  used for Multi-threaded applications
\par 
\par Replaced by \cf2\strike OnCheckTerminate\cf4\strike0\{linkID=1880\}\cf3 
\par 
\par \lang1033\f2 
\par 
\par 
\par }
1890
Scribble1890
TZipSFX




Writing



FALSE
10
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Arial;}{\f1\fnil Arial;}}
{\colortbl ;\red128\green0\blue0;\red0\green0\blue255;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\b\fs32\{bmc ZIPSFX.BMP\}\cf2 TZipSFX\cf1\{keepn\}\cf2 
\par \cf3\b0\f1\fs20 
\par \f0 the TZipSFX component is used to create and convert self extracting zip archives.
\par 
\par (C)2003 markus stephany, delphizip@mirkes.de, all rights reserved.
\par  \f1 
\par \f0 For help please refer to the ZipSFX help file \b\fs24 dzsfx.chm\f1\fs28 
\par }
1900
Scribble1900
PathConcat
Utility functions;


utilites:000010
Writing



FALSE
9
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Arial;}{\f1\fnil Arial;}}
{\colortbl ;\red0\green0\blue255;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\fs32 PathConcat\cf2\lang1033\b0\f1\fs20\{keepn\}\cf3 
\par 
\par function PathConcat(const path, extra: String): String;\lang3081\f0  \lang1033\f1 
\par 
\par \lang3081\f0 Defined in ZipUtils.pas\lang1033\f1 
\par 
\par }
1910
Scribble1910
FileNameMatch
Utility functions;


utilites:000020
Writing



FALSE
9
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Arial;}{\f1\fnil Arial;}}
{\colortbl ;\red0\green0\blue255;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\fs32 FileNameMatch\cf2\lang1033\b0\f1\fs20\{keepn\}\cf3 
\par \lang3081\f0  \lang1033\f1 
\par function FileNameMatch(const pat: String; const str: String): Boolean;\lang3081\f0  \lang1033\f1 
\par 
\par \lang3081\f0 Defined in ZipUtils.pas\lang1033\f1 
\par 
\par }
1920
Scribble1920
ForceDirectory
Utility functions;


utilites:000030
Writing



FALSE
9
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Arial;}{\f1\fnil Arial;}}
{\colortbl ;\red0\green0\blue255;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\fs32 ForceDirectory\cf2\lang1033\b0\f1\fs20\{keepn\}\cf3 
\par \lang3081\f0  \lang1033\f1 
\par function ForceDirectory(const Dir: String): Boolean;\lang3081\f0  \lang1033\f1 
\par 
\par \lang3081\f0 Defined in ZipUtils.pas\lang1033\f1 
\par 
\par }
1930
Scribble1930
SetSlash
Utility functions;


utilites:000040
Writing



FALSE
16
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Arial;}{\f1\fnil Arial;}}
{\colortbl ;\red0\green0\blue255;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\fs32 SetSlash\cf2\lang1033\b0\f1\fs20\{keepn\}\cf3 
\par \lang3081\f0  
\par \b type\b0 
\par   TPathSlashDirection = (psdExternal, psdInternal);
\par \lang1033\f1 
\par \b function \b0 SetSlash(const path: String; dir: TPathSlashDirection): String;\lang3081\f0  \lang1033\f1 
\par 
\par \lang3081\b\f0 Defined in\b0  ZipUtils.pas\lang1033\f1 
\par 
\par \lang3081\b\f0 Description\b0 
\par   psdExternal is standard Windows backslash '\\'
\par   psdInternal is Unix slash '/' which is required in stored filenames.
\par \lang1033\f1 
\par }
1940
Scribble1940
DelimitPath
Utility functions;


utilites:000050
Writing



FALSE
8
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Arial;}{\f1\fnil Arial;}}
{\colortbl ;\red0\green0\blue255;\red128\green0\blue0;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\lang3081\b\fs32 DelimitPath\cf2\lang1033\b0\f1\fs20\{keepn\}\cf3 
\par \lang3081\f0  \lang1033\f1 
\par function DelimitPath(const path: String; sep: Boolean): String;\lang3081\f0  \lang1033\f1 
\par 
\par \lang3081\f0 Defined in ZipUtils.pas\lang1033\f1 
\par }
1950
Scribble1950
DirExists
Utility functions;


utilites:000060
Writing



FALSE
11
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil Arial;}{\f1\fnil\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\b\f0\fs32 DirExists\{keepn\}\cf2\b0\fs20 
\par \lang3081\f1  \lang1033\f0 
\par function DirExists(const Fname: String): Boolean;\lang3081\f1  \lang1033\f0 
\par 
\par \lang3081\f1 Defined in ZipUtils.pas\lang1033\f0 
\par 
\par 
\par 
\par }
1960
Scribble1960
IsWild
Utility functions;


utilites:000070
Writing



FALSE
11
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil Arial;}{\f1\fnil\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\b\f0\fs32 IsWild\{keepn\}\cf2\b0\fs20 
\par \lang3081\f1  \lang1033\f0 
\par function IsWild(const fspec: String): Boolean;\lang3081\f1  \lang1033\f0 
\par 
\par \lang3081\f1 Defined in ZipUtils.pas\lang1033\f0 
\par 
\par 
\par 
\par }
1970
Scribble1970
EraseFile
Utility functions;


utilites:000080
Writing



FALSE
11
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil Arial;}{\f1\fnil\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\b\f0\fs32 EraseFile\{keepn\}\cf2\b0\fs20 
\par \lang3081\f1  \lang1033\f0 
\par function EraseFile(const Fname: String; Final: Boolean): Integer;\lang3081\f1  \lang1033\f0 
\par 
\par \lang3081\f1 Defined in ZipUtils.pas\lang1033\f0 
\par 
\par 
\par 
\par }
1980
Scribble1980
QueryZip
QueryZip;Utility functions;


utilites:000090
Writing



FALSE
35
{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil Arial;}{\f1\fnil\fcharset0 Arial;}}
{\colortbl ;\red0\green0\blue255;\red0\green0\blue0;}
\viewkind4\uc1\pard\cf1\b\f0\fs32 QueryZip\{keepn\}\cf2\b0\fs20 
\par \lang3081\f1  \lang1033\f0 
\par function QueryZip(const Fname: String): Integer;\lang3081\f1  
\par \lang1033\f0 
\par \lang3081\f1 Defined in ZipUtils.pas\lang1033\f0 
\par 
\par 
\par  \b\fs24 Return value\b0\fs20 :
\par \f1   \f0  Bit Mapped result (if > 0)
\par \f1     \f0  bits 0..3 = S L P D     - start of file
\par  \f1         \f0 S 1 = EXE file
\par \f1         \f0  L 2 = Local Header
\par \f1         \f0  P 4 = first part of split archive
\par \f1         \f0  D 8 = Central Header
\par \f1     \f0 bit 4 = Correct comment length (clear if junk at end of file)
\par  \f1    \f0 bits  5..7 = Loc Cen End\f1    - structures found\f0 
\par \f1         \f0 End 128 = end of central found (must be set for any chance at archive)
\par \f1         \f0 Cen 64 = linked Central Directory start (should be set unless split directory)
\par \f1         \f0 Loc 32 = Local Header linked to first Central (should be set unless split file)
\par 
\par \f1    error values\f0 
\par \f1       \f0  -7  = Open, read or seek error
\par \f1       \f0  -9  = exception error
\par 
\par  Good file results    All cases 16 less if comment length (or file length) is wrong
\par \f1    \f0  Zip = 128+64+32+16+2 = 242
\par \f1    \f0  SFX = 128+64+32+16+1 = 241
\par \f1    \f0  Last Part Span = 128+16 (144 - only EOC)
\par         \f1                    \f0 = 128+16+8 (152 - split directory)
\par        \f1                    \f0  = 128+64+16 (208 - split file)
\par 
\par 
\par }
3
main="TZipMaster Help",(425,350,578,616),0,(255,255,255),(255,255,255),0
pme="Properties, Methods and Events.",(211,350,212,616),0,(255,255,226),(255,255,0),0
example="Example",(425,100,578,300),0,(255,255,226),(255,255,0),0
0
0
135
1 TZipMaster component
2 General information =Scribble10
2 Error and warning messages=Scribble1860
2 Copyright, Contact information, Bug reports and more
3 Contact information=TZipMaster_Contact
3 Bug reports and other information=Scribble30
3 Distribution Policy and Copyright=TZipMaster_Copyright
3 Licence=Scribble70
3 Thanks=TZipMaster_Thanks
2 Changes
3 Version 1.78=Scribble80
3 Version 1.77=Scribble90
3 Version 1.76=Scribble90
3 Version 1.73=Scribble100
3 Version 1.72=Scribble110
2 Properties
3 Properties=Scribble150
3 AddCompLevel =Scribble280
3 AddOptions =Scribble310
3 AddStoreSuffixes=Scribble320
3 Cancel =Scribble340
3 CodePage=Scribble350
3 ConfirmErase=Scribble370
3 Count =Scribble380
3 DirEntry=Scribble210
3 DLLDirectory =Scribble400
3 ErrCode =Scribble420
3 ExtAddStoreSuffixes=Scribble330
3 ExtrBaseDir =Scribble450
3 ExtrOptions =Scribble470
3 FSpecArgs =Scribble480
3 FSpecArgsExcl=Scribble490
3 FullErrCode=Scribble500
3 Handle =Scribble520
3 HowToDelete=Scribble530
3 IsSpanned=Scribble540
3 KeepFreeOnDisk1=Scribble560
3 KeepFreeOnAllDisks=Scribble580
3 MaxVolumeSize=Scribble620
3 Message =Scribble600
3 MinFreeVolumeSize=Scribble630
3 NotMainThread=Scribble640
3 Password =Scribble650
3 PasswordReqCount=Scribble670
3 RootDir=Scribble680
3 SFXCaption =Scribble690
3 SFXCommandLine =Scribble700
3 SFXDefaultDir =Scribble710
3 SFXIcon=Scribble720
3 SFXMessage=Scribble730
3 SFXOffset=Scribble740
3 SFXOptions =Scribble750
3 SFXOverWriteMode =Scribble760
3 SFXPath =Scribble770
3 SFXSlave=Scribble160
3 SuccessCnt =Scribble780
3 TempDir=Scribble790
3 TotalSizeToProcess=Scribble800
3 Trace =Scribble810
3 Unattended=Scribble830
3 UnzBusy =Scribble850
3 UnzVers =Scribble860
3 Verbose =Scribble890
3 ZipBusy =Scribble910
3 ZipComment=Scribble920
3 ZipContents =Scribble930
3 ZipEOC=Scribble1000
3 ZipFileName=Scribble1020
3 ZipFileSize=Scribble1030
3 ZipSOC=Scribble1040
3 ZipStream=Scribble1060
3 ZipVers =Scribble1080
2 Methods
3 Methods=Scribble230
3 Add =Scribble1090
3 AddStreamToFile=Scribble1110
3 AddStreamToStream=Scribble1120
3 AppendSlash=Scribble1140
3 Busy=Scribble130
3 ConvertSFX =Scribble1150
3 ConvertZIP =Scribble1170
3 Copy_File=Scribble1200
3 CopyZippedFiles=Scribble1210
3 Delete =Scribble1230
3 EraseFile=Scribble1240
3 Extract =Scribble1250
3 ExtractFileToStream=Scribble1260
3 ExtractStreamToStream=Scribble1280
3 FullVersionString=Scribble250
3 GetAddPassword =Scribble1300
3 GetExtrPassword =Scribble1320
3 GetPassword=Scribble1340
3 List =Scribble1390
3 Load_Unz_Dll =Scribble1400
3 Load_Zip_Dll =Scribble1410
3 PathConcat=Scribble240
3 ReadSpan=Scribble1430
3 Rename=Scribble1450
3 ShowZipMessage=Scribble1460
3 Unload_Unz_Dll =Scribble1480
3 Unload_Zip_Dll =Scribble1490
3 WriteSpan=Scribble1500
2 Events
3 Events=Scribble270
3 OnAfterCallback=Scribble1885
3 OnCheckTerminate=Scribble1880
3 OnCopyZipOverwrite=Scribble1530
3 OnCRC32Error=Scribble1550
3 OnDirUpdate =Scribble1560
3 OnExtractOverwrite=Scribble1570
3 OnExtractSkipped=Scribble1580
3 OnFileComment=Scribble1590
3 OnGetNextDisk=Scribble1600
3 OnItemProgress=Scribble1810
3 OnMessage =Scribble1610
3 OnNewName=Scribble1630
3 OnPasswordError=Scribble1650
3 OnProgress =Scribble1670
3 OnProgressDetails=Scribble1690
3 OnSetNewName=Scribble1720
3 OnSetAddName=Scribble1730
3 OnSetExtName=Scribble1740
3 OnTick=Scribble1750
3 OnTotalProgress=Scribble1790
3 OnStatusDisk=Scribble1830
3 OnZipDialog=Scribble1770
3 OnZipStr=Scribble1760
2 Utility Functions
3 DelimitPath=Scribble1940>main
3 DirExists=Scribble1950>main
3 FilenameMatch=Scribble1910>main
3 IsWild=Scribble1960>main
3 PathConcat=Scribble1900>main
3 QueryZip=Scribble1980>main
3 SetSlash=Scribble1930>main
11

0
Arial
0
10
1
....
0
0
0
0
0
0
*InternetLink
16711680
Courier New
0
10
1
....
0
0
0
0
0
0
*ParagraphTitle
-2147483640
Arial
0
11
1
B...
0
0
0
0
0
0
*PopupLink
-2147483640
Arial
0
8
1
....
0
0
0
0
0
0
*PopupTopicTitle
16711680
Arial
0
10
1
B...
0
0
0
0
0
0
*SourceCode
-2147483640
Courier New
0
10
1
....
0
0
0
0
0
0
*TopicText
0
Arial
0
10
1
....
0
0
0
0
0
0
*TopicTitle
16711680
Arial
0
16
1
B...
0
0
0
0
0
0
<new macro>
0
Arial
0
10
1
....
0
0
0
0
0
0
Description
-2147483640
Arial
0
16
0
B...
0
0
0
0
0
0
Plain Text
-16777208
Times New Roman
0
12
0
....
0
0
0
0
0
0
