//---------------------------------------------------------------------------
// RcUpd.exe utility to update, format and modify ZipMsgXX.rc files
//
// Version 1.0  2004-07-31
//         (BCB5)
//         2.0  2004-08-03 Rewritten Update procedure
//         (BCB5)          Format option revised and corrected some rare aleatory line formats
//                         Added button "All" : Update and saves all ZipMsgXX.rc in selected folder
//         3.0  2004-08-28 Added possibility do check codes in ZipMsg.h
//         (BCB5)
//         4.0  2004-09-14 Added ini file to save program config
//         (BCB5 & D4)     Check for repeated codes
//                         Added button "Print"
//                         Parameter /d is only for developers of ZipDLL.dll and UnzDLL.dll
//         4.1  2004-09-23 Corrected some spelling errors (many thanks to Roger Aelbrecht)
//         (BCB5 & D4)     If RcUpd.ini don't exist will be created from RcUpd_US.INI if found at
//                         same diretory, othewise internal configuration will be used.
//                         (many thanks to Roger Aelbrecht for that suggestion)
//                         Print option modified: now can select printer if more than one)
//         5.0  2004-11-03 Changed edit panel from StringList to RichEdit this allows
//         (BCB5)          show new codes in red.
//         (D4 on way)     Changed tabs by spaces when formating lines because different editors
//                         expands tabs to 7, 8 or to specified size.
//                         Some changes to do more eficient code (suggested by Roger Aelbrecht)
//         5.1  2004-11-06 Removed unnecessary variables, modified declaration funtions.
//         (BCB5 & D4)     This changes doesn't any effect on how program (v5.0) works.
//         5.2  2004-11-15 Added tabpage control to have permanent acces to US source file.
//         (BCB5 & D4)     Changed TStringList to TRichEdit to allow color control on changes.
//         5.3  2004-11-23 Corrected a bug update opcion which cause an exception if line contains
//         (BCB5 & D4)     only spaces. Also corrected UpdateAll for D4 which update only one file.
//                         Buttons are disabled while doing work (suggested by Roger Aelbrecht)
//                         When tab for US file is active only print and help buttons are enabled
//                         Print button will print text on current active page.
//                         New lines are shown in red, changed in blue, all other in black.
//                         If pressed button to update all files edit control will be remain
//                         blanc while runinig. While running is displayed the number of files
//                         updated and name of file currently updating on title bar.
//                         Reduced acces to disk, now files are read only one time.
//
// Programmed using BCB++ 5.0 SP1 (version 4 ported to Delphi 4)
// Xavier Mor-Mur    xmormur@telepolis.com
//
// You can modify the program freely, only is required you mention its origin
// when submitting include source files and let me know those changes.
//
// Surely program can be write better, a lot, but I think is a good start
//
#include <vcl.h>
#include "IniFiles.hpp"
#include <Printers.hpp>
#pragma hdrstop

#include "RcUpd1.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
#define TabSize 8
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
   : TForm(Owner)
{
   AnsiString s, s1;
   int n = 0;

   US_RC = new TStringList();
   XX_RC = new TStringList();
   Z_MSG = new TStringList();

   if(AnsiString(__argv[1]).AnsiCompareIC("/d") == 0) {
      ZipMsg->Visible = true;
      Msg->Height = Msg->Height / 2;
      Msg->Top = ZipMsg->Top + ZipMsg->Height + 1;
   }

   if(Printer()->Printers->Count == 0) RcPrint->Enabled = false;

   HelpText = EditRC->Lines->Text;

   IniFile = ChangeFileExt(AnsiString(__argv[0]), ".ini");
   if(!FileExists(IniFile)) {
      s = ExtractFilePath(IniFile) + "RcUpd_US.ini";
      if(!FileExists(s)) return;
      TFileStream *fs1 = new TFileStream(s, fmOpenRead);
      TFileStream *fs2 = new TFileStream(IniFile, fmCreate);
      fs2->CopyFrom(fs1, 0);
      delete fs1;
      delete fs2;
   }
   pIniFile = new TIniFile(IniFile);
   EditRC->Clear();
   s1 = "Config";
   while(true) {
      s = IniFileRS(s1, "Help_" + IntToStr(n), "\$08");
      if(bIniErr) break;
      EditRC->Lines->Append(s);
      ++n;
   }
   if(Trim(EditRC->Lines->Text) != "")
      HelpText = EditRC->Lines->Text;
   else
      EditRC->Lines->Text = HelpText;

   Msg_Title = IniFileRS(s1, "Title", Form1->Caption);
   Form1->Caption = Msg_Title;

   RcLoad->Hint = IniFileRS(s1, "Load.hint", RcLoad->Hint);
   LoadImage(RcLoad, IniFileRS(s1, "Load.img", ""));

   RcUpdate->Hint = IniFileRS(s1, "Update.hint", RcUpdate->Hint);
   LoadImage(RcUpdate, IniFileRS(s1, "Update.img", ""));

   RcSave->Hint = IniFileRS(s1, "Save.hint", RcSave->Hint);
   LoadImage(RcSave, IniFileRS(s1, "Save.img", ""));

   Msg_All = IniFileRS(s1, "All", "All");
   RcAll->Hint = IniFileRS(s1, "All.hint", RcAll->Hint);
   LoadImage(RcAll, IniFileRS(s1, "All.img", ""));

   RcPrint->Hint = IniFileRS(s1, "Print.hint", RcPrint->Hint);
   LoadImage(RcPrint, IniFileRS(s1, "Print.img", ""));

   Msg_Help = IniFileRS(s1, "Help", "Help");
   Help->Hint = IniFileRS(s1, "Help.hint", Help->Hint);
   LoadImage(Help, IniFileRS(s1, "Help.img", ""));

   OpenRC->Title = IniFileRS(s1, "OpenRC", OpenRC->Title);

   if(ZipMsg->Visible)
   {
      ZipMsg->Caption = IniFileRS(s1, "CheckZipMsg.h", ZipMsg->Caption) + " ZipMsg.h";
      TControlCanvas *pCanvas = new TControlCanvas;
      pCanvas->Control = ZipMsg;
      n = pCanvas->TextWidth(ZipMsg->Caption);
      if((n + 20) > ZipMsg->Width) ZipMsg->Width = n + 20;
   }
   Msg_NoFileSel = IniFileRS(s1, "NoFileSel", "No File Selected");
   Msg_NotFound = IniFileRS(s1, "NotFound", " not found !");
   Msg_XXNotFound = IniFileRS(s1, "XXNotFound", " : not found, created using") + " ZipMsgUS.rc";
   Msg_Created = IniFileRS(s1, "Created", " Created");
   Msg_Loaded = IniFileRS(s1, "Loaded", " Loaded");
   Msg_Updated = IniFileRS(s1, "Updated", " Updated");
   Msg_Modified = IniFileRS(s1, "Modified", " Modified");
   Msg_Saved = IniFileRS(s1, "Saved", " Saved");
   Msg_1 = IniFileRS(s1, "Msg_1", "  files  updated");
   Msg_2 = IniFileRS(s1, "Msg_2", " // not in") + " ZipMsg.h";
   Msg_3 = IniFileRS(s1, "Msg_3", " // commented in") + " ZipMsg.h";
   Msg_4 = IniFileRS(s1, "Msg_4", " // uncommented in") + " ZipMsg.h";
   Msg_5 = IniFileRS(s1, "Msg_5", " // new in") + " ZipMsg.h";

   s1 = "RcUpd";
   RC_Path = IniFileRS(s1, "RC_Path", "");
   XX_File = IniFileRS(s1, "XX_File", "");
   bZipMsg = true;
   ZipMsg->Checked = IniFileRB(s1, "Check.ZipMsg", false);
   if(ZipMsg->Checked) {
      H_File = IniFileRS(s1, "ZipMsg.h", "");
      H_File = ExtractFilePath(H_File) + "ZipMsg.h";
      if(!FileExists(H_File)) {
         H_File = "";
         ZipMsg->Checked = false;
      }
   }
   bZipMsg = false;
   delete pIniFile;
   OpenRC->FileName = XX_File;
   OpenRC->InitialDir = RC_Path;
   OpenZipMsg->InitialDir = ExtractFilePath(H_File);
   Position = poDesigned;
   US->Lines->Clear();
   XX_File = IncludeTrailingBackslash(RC_Path) + XX_File;
   if(FileExists(XX_File)) {
      TabSheet1->Caption = ExtractFileName(XX_File).SubString(1, 8);
      XX_RC->LoadFromFile(XX_File);
      US_File = ExtractFilePath(XX_File) + "ZipMsgUS.rc";
      if(!FileExists(US_File)) {
         Msg->Caption = "ZipMsgUS.rc" + Msg_NotFound;
         Msg->Color = clRed;
      }
      US_RC->LoadFromFile(US_File);
      FormatXX(US_RC);
      US->Lines->Assign(US_RC);
      EditRC->Lines->Assign(XX_RC);
      RcUpdate->Enabled = true;
      RcSave->Enabled = true;
      Msg->Color = clLime;
      Msg->Caption = ExtractFileName(XX_File) + Msg_Loaded;
   } else {
      TabSheet1->Caption = Msg_Help;
      Msg->Caption = Msg_NoFileSel;
   }
   EditRC->ScrollBars = ssBoth;
}
//---------------------------------------------------------------------------
__fastcall TForm1::~TForm1()
{
   delete US_RC;
   delete XX_RC;
   delete Z_MSG;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::FormCreate(TObject *Sender)
{
   AnsiString s = "RcUpd";
   if(!FileExists(IniFile)) return;
   pIniFile = new TIniFile(IniFile);
   if(IniFileRB(s, "Maximized", false))
     WindowState = wsMaximized;
   else {
      Form1->Left = IniFileRI(s, "Left", 0);
      Form1->Top = IniFileRI(s, "Top", 0);
      Form1->Width = IniFileRI(s, "Width", 730);
      Form1->Height = IniFileRI(s, "Height", 550);
   }
   delete pIniFile;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::FormShow(TObject *Sender)
{
   if(TabSheet1->Caption != Msg_Help) EditUpdate();
   EditRC->Modified = false;
   EditRC->SelStart = 0;
   EditRC->SelLength = 0;
   EditRC->SetFocus();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::FormClose(TObject *Sender, TCloseAction &Action)
{
   int l, t, w, h;
   AnsiString s = "RcUpd";
   pIniFile = new TIniFile(IniFile);
   l = (Form1->Left < 0) ? 0 : Form1->Left;
   t = (Form1->Top < 0) ? 0 : Form1->Top;
   w = Form1->Width;
   h = Form1->Height;
   if(l + w > Screen->Width) {
      l = Screen->Width - w;
      if(l < 0) {
         l = 0;
         w = Screen->Width;
      }
   }
   if(t + h > Screen->Height) {
      t = Screen->Height - h;
      if(t < 0) {
         t = 0;
         h = Screen->Height;
      }
   }
   IniFileWI(s, "Left", l);
   IniFileWI(s, "Top", t);
   IniFileWI(s, "Width", w);
   IniFileWI(s, "Height", h);
   IniFileWB(s, "Maximized", (WindowState == wsMaximized) ? true : false);
   if(ZipMsg->Visible)
      IniFileWB(s, "Check.ZipMsg", ZipMsg->Checked);
   IniFileWS(s, "ZipMsg.h", ExtractFilePath(H_File));
   delete pIniFile;
   ModalResult = mrOk;
}
//---------------------------------------------------------------------------
// Select and load rc file
void __fastcall TForm1::RcLoadClick(TObject *Sender)
{
   AnsiString s = "RcUpd";
   US->Lines->Clear();
   US_RC->Clear();
   XX_RC->Clear();
   Z_MSG->Clear();
   US_File = "";
   XX_File = "";
   RcUpdate->Enabled = false;
   RcSave->Enabled = false;
   TabSheet1->Caption = Msg_Help;
   EditRC->Lines->Text = HelpText;
   Msg->Caption = Msg_NoFileSel;
   Msg->Color = clMaroon;
   Form1->Caption = Msg_Title;
   if(OpenRC->Execute()) {
      US_File = ExtractFilePath(OpenRC->FileName) + "ZipMsgUS.rc";
      if(!FileExists(US_File)) {
         Msg->Caption = "ZipMsgUS.rc" + Msg_NotFound;
         Msg->Color = clRed;
         return;
      }
      US_RC->LoadFromFile(US_File);
      FormatXX(US_RC);
      US->Lines->Assign(US_RC);
      RcLoadFile(OpenRC->FileName);
      Msg->Color = clLime;
      EditUpdate();
      RcUpdate->Enabled = true;
      RcSave->Enabled = true;
      pIniFile = new TIniFile(IniFile);
      IniFileWS(s, "RC_Path", RC_Path);
      IniFileWS(s, "XX_File", ExtractFileName(XX_File));
      delete pIniFile;
   }
   EditRC->Modified = false;
   EditRC->SelStart = 0;
   EditRC->SelLength = 0;
   EditRC->SetFocus();
}
//---------------------------------------------------------------------------
// Update loaded rc file
void __fastcall TForm1::RcUpdateClick(TObject *Sender)
{
   AnsiString s, xx_old;

   RcLoad->Enabled = false;
   RcUpdate->Enabled = false;
   RcSave->Enabled = false;
   RcAll->Enabled = false;
   ZipMsg->Enabled = false;

   // Reassign XX_RC to prevent any changes prior Update button is pressed
   if(Sender == RcUpdate)
      XX_RC->Assign(EditRC->Lines);
   xx_old = XX_RC->Text;

   // remove all lines which not are string codes
   CleanStrinList(US_RC);
   CleanStrinList(XX_RC);

   bZipMsg = ZipMsg->Checked;

   // update US_RC file if test ZipMsg.h is checked
   if(bZipMsg) {
      PrepareZipMsg();
      CheckForRepitedCodes(Z_MSG);
      RemoveStrCodesNotInSrc(Z_MSG, US_RC);
      CheckStrCodesCommented(Z_MSG, US_RC);
      AddNewStrCodes(Z_MSG, US_RC);
      CheckForRepitedCodes(US_RC);
      bZipMsg = false;
   }

   // update XX_RC
   CheckForRepitedCodes(US_RC);
   CheckForRepitedCodes(XX_RC);
   RemoveStrCodesNotInSrc(US_RC, XX_RC);
   CheckStrCodesCommented(US_RC, XX_RC);
   AddNewStrCodes(US_RC, XX_RC);
   UpdateXXInUSStructure();
   XX_RC->Text = xx_old;
   UpdateUSStructureInXX();
   CheckForCodesOutOfGroup(XX_RC);
   FormatXX(XX_RC);

   // restore original US_RC to prevent press "Update RC" twice or more times
   US_RC->Assign(US->Lines);

   // if clicked RcAll button don't update edit panel, don't remove edited controls
   if(Sender == RcAll) return;

   // Updated edit control
   EditUpdate();
   Msg->Caption = ExtractFileName(XX_File) + Msg_Updated;
   Msg->Color = clGreen;

   // Enable buttons and checkbox
   RcLoad->Enabled = true;
   RcUpdate->Enabled = true;
   RcSave->Enabled = true;
   RcAll->Enabled = true;
   ZipMsg->Enabled = true;
}
//---------------------------------------------------------------------------
// Save current changes in rc file
void __fastcall TForm1::RcSaveClick(TObject *Sender)
{
   if(Sender == RcSave) {
      EditRC->Modified = false;
      EditRC->Lines->SaveToFile(XX_File);
      Msg->Caption = ExtractFileName(XX_File) + Msg_Saved;
      Msg->Color = clBlue;
   } else
      XX_RC->SaveToFile(XX_File);
}
//---------------------------------------------------------------------------
// Auto update all rc files in selected directory
void __fastcall TForm1::RcAllClick(TObject *Sender)
{
   int Attr, n = 0;
   AnsiString s = "RcUpd";
   TSearchRec sr;
   if(PageControl1->ActivePage != TabSheet1) {
      PageControl1->ActivePage = TabSheet1;
      PageControl1Change(Sender);
   }
   TabSheet1->Caption = Msg_All;
   EditRC->Lines->Clear();
   US_RC->Clear();
   XX_RC->Clear();
   US_File = "";
   XX_File = "";
   Msg->Caption = "";
   Msg->Color = clPurple;
   Form1->Caption = Msg_Title;
   if(OpenRC->Execute()) {
      RC_Path = ExtractFilePath(OpenRC->FileName);
      US_File = RC_Path + "ZipMsgUS.rc";
      if(!FileExists(US_File)) {
         Msg->Caption = "ZipMsgUS.rc" + Msg_NotFound;
         return;
      }
      RcLoad->Enabled = false;
      RcUpdate->Enabled = false;
      RcSave->Enabled = false;
      RcAll->Enabled = false;
      RcPrint->Enabled = false;
      Help->Enabled = false;
      US_RC->LoadFromFile(US_File);
      XX_File = RC_Path + "ZipMsg*.rc";
      Attr = faArchive | faAnyFile;
      if(FindFirst(XX_File, Attr, sr) == 0)
         do {
            if((sr.Attr & Attr) == sr.Attr) {
               XX_File = RC_Path + sr.Name;
               RcLoadFile(XX_File);
               RcUpdateClick(Sender);
               RcSaveClick(Sender);
               ++n;
               Msg->Caption = IntToStr(n) + Msg_1;
               Msg->Refresh();
            }
         } while (FindNext(sr) == 0);
      FindClose(sr);
      pIniFile = new TIniFile(IniFile);
      IniFileWS(s, "RC_Path", RC_Path);
      delete pIniFile;
   }
   US_RC->Clear();
   XX_RC->Clear();
   US_File = "";
   XX_File = "";
   TabSheet1->Caption = Msg_Help;
   EditRC->Lines->Text = HelpText;
   RcLoad->Enabled = true;
   RcAll->Enabled = true;
   RcPrint->Enabled = true;
   Help->Enabled = true;
   Msg->Caption = IntToStr(n) + Msg_1;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::RcPrintClick(TObject *Sender)
{
   if(PrintDialog1->Execute())
      if(PageControl1->ActivePage == TabSheet1)
         EditRC->Print(XX_File);
      else
         if(US->Lines->Count) US->Print(US_File);
}
//---------------------------------------------------------------------------
void __fastcall TForm1::HelpClick(TObject *Sender)
{
   PageControl1->ActivePage = TabSheet1;
   TabSheet1->Caption = Msg_Help;
   PageControl1Change(Sender);
   EditRC->Lines->Text = HelpText;
   US->Clear();;
   US_RC->Clear();
   XX_RC->Clear();
   RcUpdate->Enabled = false;
   RcSave->Enabled = false;
   Msg->Caption = Msg_NoFileSel;
   Msg->Color = clMaroon;
   pIniFile = new TIniFile(IniFile);
   IniFileWS("RcUpd", "XX_File", "");
   delete pIniFile;
}
//---------------------------------------------------------------------------
// Load rc file (used by RcLoad & RcAll)
void TForm1::RcLoadFile(AnsiString F)
{
   XX_File = F;
   RC_Path = ExtractFilePath(XX_File);
   Form1->Caption = ExtractFileName(XX_File);
   TabSheet1->Caption = ExtractFileName(XX_File).SubString(1, 8);
   US_RC->Assign(US->Lines);
   if(!FileExists(XX_File)) {
      XX_RC->Assign(US_RC);
      Form1->Caption = ExtractFileName(XX_File) + Msg_XXNotFound;
      Msg->Caption = ExtractFileName(XX_File) + Msg_Created;
   } else {
      XX_RC->LoadFromFile(XX_File);
      Msg->Caption = ExtractFileName(XX_File) + Msg_Loaded;
   }
}
//---------------------------------------------------------------------------
// Check EditRc for edit controls and change color if required
void TForm1::EditUpdate()
{
   int i, n;
   TColor tc;
   // Assign edit control updated rc file
   EditRC->Lines->Assign(XX_RC);
   for(n = 0; n < EditRC->Lines->Count; ++n) {
      tc = clRed;
      i = EditRC->Lines->Strings[n].Pos(" //_RcUpd_New_");
      if(i == 0) {
         i = EditRC->Lines->Strings[n].Pos(" //_RcUpd_Mod_");
         if(i == 0) continue;
         tc = clBlue;
      }
      EditRC->Lines->Strings[n] = EditRC->Lines->Strings[n].Delete(i, 14);
      EditRC->SelStart = EditRC->Text.Pos(EditRC->Lines->Strings[n]) - 1;
      EditRC->SelLength = EditRC->Lines->Strings[n].Length();
      EditRC->SelAttributes->Color = tc;
   }
   EditRC->SelStart = 0;
   EditRC->SelLength = 0;
   EditRC->SetFocus();
   XX_RC->Assign(EditRC->Lines);
}
//---------------------------------------------------------------------------
void __fastcall TForm1::ZipMsgClick(TObject *Sender)
{
   if(bZipMsg) return; // no execute while Form creation
   H_File = "";
   if(ZipMsg->Checked) {
      OpenZipMsg->DefaultExt = "h";
      OpenZipMsg->FileName = "ZipMsg.h";
      OpenZipMsg->Options = OpenZipMsg->Options >> ofExtensionDifferent;
      if(OpenZipMsg->Execute()) {
         // prevent change of file seleccion
         H_File = ExtractFilePath(OpenZipMsg->FileName) + "ZipMsg.h";
         if(!FileExists(H_File)) {
            Msg->Caption = "ZipMsg.h" + Msg_NotFound;
            H_File = "";
         }
      }
   }
   if(H_File == "")
      ZipMsg->Checked = false;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::EditRCChange(TObject *Sender)
{
   if(!EditRC->Focused() || EditRC->Modified) return;
   Msg->Caption = ExtractFileName(XX_File) + Msg_Modified;
   Msg->Color = clTeal;
}
//---------------------------------------------------------------------------
// On click over edit panel try to show US_RC code line at bottom
void __fastcall TForm1::EditRCMouseUp(TObject *Sender, TMouseButton Button,
      TShiftState Shift, int X, int Y)
{
   WORD Key = VK_LBUTTON;
   EditRCKeyUp(Sender, Key, Shift);
}
//---------------------------------------------------------------------------
// If UP_KEY, DOWN_KEY or LEFT_BUTTON_UP is clicked then try to show
// US_RC code line on help line at window bottom
void __fastcall TForm1::EditRCKeyUp(TObject *Sender, WORD &Key,
      TShiftState Shift)
{
   AnsiString s;
   int n;
   TPoint tp;
   if(Key != VK_LBUTTON && Key != VK_UP && Key != VK_DOWN) return;
   tp = EditRC->CaretPos;
   s = GetRcCode(EditRC->Lines->Strings[tp.y]);
   n = FindRcCode(US_RC, s);
   if(n < 0)
      US_Code->Caption = "";
   else
      US_Code->Caption = US_RC->Strings[n];
}
//---------------------------------------------------------------------------
// Control Enable/Disable buttons when tabpage is changed
// Called also when buttons All or Help button are clicked
void __fastcall TForm1::PageControl1Change(TObject *Sender)
{
   if(TabSheet1->Caption == Msg_All) {
     PageControl1->ActivePage = TabSheet1;
     return;
   }
   if(PageControl1->ActivePage != TabSheet1) {
      RcLoad->Enabled = false;
      RcUpdate->Enabled = false;
      RcSave->Enabled = false;
      if(US->Lines->Count == 0) RcPrint->Enabled = false;
   } else {
      RcLoad->Enabled = true;
      if(US->Lines->Count) RcUpdate->Enabled = true;
      if(EditRC->Lines->Text != HelpText) RcSave->Enabled = true;
      RcPrint->Enabled = true;
   }
}
//---------------------------------------------------------------------------
// Returns line if string code is found otherwise -1
int TForm1::FindRcCode(TStringList *sl, AnsiString s)
{
   int n;
   if(s == "") return -1;
   for(n = 0; n < sl->Count; ++n)
      if(GetRcCode(sl->Strings[n]) == s) break;
   return (n < sl->Count) ? n : -1;
}
//---------------------------------------------------------------------------
// Return string code if found in a string
AnsiString TForm1::GetRcCode(AnsiString s)
{
   int x, y;
   IsCommented = false;

   // find start string code
   // skip comment start characters (//RC_XXXXX , // RC_XXXXX , ...)
   x = 1;
   for(x = 1; x <= s.Length(); ++x)
      if(IsAlNum(s[x])) break;

   // save if line is commented or not
   y = s.Pos("//");
   if(y < x && y > 0)
      IsCommented = true;

   // find end string code
   for(y = x; y < s.Length(); ++y)
      if(!IsAlNum(s[y])) break;

   // return string code
   s = s.SubString(x, y - x);
   if(s.Length() < 3)
      s = "";
   else if(s[3] != '_') s = "";

   // return string code
   return s;
}
//---------------------------------------------------------------------------
// Remove all lines except that contains string codes
void TForm1::CleanStrinList(TStringList *sl)
{
   int n = 0;
   bool b = false;
   AnsiString s;
   while(n < sl->Count) {
      s = AnsiUpperCase(Trim(sl->Strings[n]));
      if(!b || s == "" || s == "}") {
         if(StrPos(s.c_str(), "STRINGTABLE")) b = true;
         if(StrPos(s.c_str(), "}")) b = false;
         sl->Delete(n);
         continue;
      }
      sl->Strings[n] = Trim(sl->Strings[n]);
      ++n;
   }
}
//---------------------------------------------------------------------------
// Removes all lines which string code is repeated in other one.
// from each pair if one is commented this will removed,
// otherwise second code is removed
void TForm1::CheckForRepitedCodes(TStringList *sl)
{
   int n = 0, m;
   bool b;
   AnsiString s;

   while(n < sl->Count) {
      s = GetRcCode(sl->Strings[n]);
      if(s != "") {
         b = IsCommented;
         m = n + 1;
         while(m < sl->Count) {
            if(s == GetRcCode(sl->Strings[m])) {
               if((b && IsCommented) ||
                  (!b && !IsCommented) ||
                  (!b && IsCommented)) {
                  sl->Delete(m); // both (un)commented remove second or second commented
                  continue;
               }
               if(b) {
                  sl->Delete(n); // first commented : removed
                  break;
               }
               continue;
            }
            ++m;
         }
      }
      ++n;
   }
}
//---------------------------------------------------------------------------
// Check codes are all grouped.
// Group codes are identified by its 3 first characters ??_
// Starting at end of list codes are checked if are out its group
void TForm1::CheckForCodesOutOfGroup(TStringList *sl)
{
   int n, m;
   AnsiString s;

   n = sl->Count - 1;
   while(n > 0) {
      s = GetRcCode(sl->Strings[n]);
      if(s != "")  {
         m = FindEndGrupCode(sl, s);
         if(m < n) {
            s = sl->Strings[n];
            sl->Delete(n);
            sl->Insert(m, s);
            continue;
         }
      }
      --n;
   }

   // check for only one white line between group codes
   n = m = 0;
   while(n < sl->Count) {
      if(Trim(sl->Strings[n]) == "")
         ++m;
      else
         m = 0;
      if(m == 2) {
         sl->Delete(n);
         m = 1;
         continue;
      }
      ++n;
   }
}
//---------------------------------------------------------------------------
// Removes all Target lines with string codes not found in Source
void TForm1::RemoveStrCodesNotInSrc(TStringList *slSrc, TStringList *slTrj)
{
   int x = 0;
   AnsiString S;
   while(x < slTrj->Count) {
      S = GetRcCode(slTrj->Strings[x]);
      if(S != "") {
         if(FindRcCode(slSrc, S) < 0) {
            if(!bZipMsg) {
               slTrj->Delete(x);
               continue;
            }
            slTrj->Strings[x] = slTrj->Strings[x] + Msg_2;
         }
      }
      ++x;
   }
}
//---------------------------------------------------------------------------
// Check current string codes in Target if are or not commented in Source
void TForm1::CheckStrCodesCommented(TStringList *slSrc, TStringList *slTrj)
{
   int x, u;
   AnsiString S, s1 = "", s2 = "";
   if(bZipMsg) {
      s1 = Msg_3;
      s2 = Msg_4;
   }
   for(u = 0; u < slSrc->Count; ++u) {
      S = GetRcCode(slSrc->Strings[u]);
      if(IsCommented) {
         x = FindRcCode(slTrj, S);
         if(x >= 0 && !IsCommented)
            slTrj->Strings[x] = slSrc->Strings[u].SubString(1, slSrc->Strings[u].Pos(S) - 1) +
                                slTrj->Strings[x] + s1 + " //_RcUpd_Mod_";
      } else {
         x = FindRcCode(slTrj, S);
         if(x >= 0 && IsCommented)
            slTrj->Strings[x] = slTrj->Strings[x].SubString(slTrj->Strings[u].Pos(S),
                                slTrj->Strings[x].Length()) + s2 + " //_RcUpd_Mod_";
      }
   }
}
//---------------------------------------------------------------------------
// Add new string codes in Source to Target (also if are commented)
void TForm1::AddNewStrCodes(TStringList *slSrc, TStringList *slTrj)
{
   int n;
   AnsiString s, s1 = "";
   if(bZipMsg)
      s1 = Msg_5;
   for(n = 0; n < slSrc->Count; ++n) {
      s = GetRcCode(slSrc->Strings[n]);
      if(s == "") continue;
      if(FindRcCode(slTrj, s) < 0)
         slTrj->Append(slSrc->Strings[n] + s1 + " //_RcUpd_New_");
   }
}
//---------------------------------------------------------------------------
// Save current translated strings in XX to US structure
void TForm1::UpdateXXInUSStructure()
{
   int x, u;
   AnsiString S;
   US_RC->Assign(US->Lines);
   CheckForRepitedCodes(US_RC);
   for(x = 0; x < XX_RC->Count; ++x) {
      S = GetRcCode(XX_RC->Strings[x]);
      if(S == "") continue;
      u = FindRcCode(US_RC, S);
      if(u >= 0)
         US_RC->Strings[u] = XX_RC->Strings[x];
   }
   for(u = US_RC->Count - 1; u > 1; --u)
      if(Trim(US_RC->Strings[u]) == "}") break;
   if(Trim(US_RC->Strings[u - 1]).Length())
      US_RC->Insert(u, "");
}
//---------------------------------------------------------------------------
// Update current structure of US with translated strings to XX
void TForm1::UpdateUSStructureInXX()
{
   int x, u;
   // remove all lines except heading
   for(x = XX_RC->Count - 1; x > 0; --x) {
      if(StrPos(XX_RC->Strings[x].c_str(), "STRINGTABLE")) break;
      XX_RC->Delete(x);
   }

   // Skip US heading
   for(u = 0; u < US_RC->Count; ++u)
      if(StrPos(US_RC->Strings[u].c_str(), "STRINGTABLE")) break;
   ++u;

   // Add all updated STRINGTABLE
   for(; u < US_RC->Count; ++u)
      XX_RC->Append(US_RC->Strings[u]);
}
//---------------------------------------------------------------------------
// Format lines of string codes
void TForm1::FormatXX(TStrings *ts)
{
   int x, u, n;
   AnsiString s1, s2;

   // find max length of string codes names
   for(x = 0, n = 0; x < ts->Count; ++x) {
      s1 = GetRcCode(ts->Strings[x]);
      if(n < s1.Length()) n = s1.Length();
   }
   ++n;

   // skip heading
   for(x = 0; x < ts->Count; ++x)
      if(StrPos(ts->Strings[x].c_str(), "STRINGTABLE")) break;

   // reformat lines to get a good look
   for(++x; x < ts->Count; ++x) {
      s1 = GetRcCode(ts->Strings[x]);
      if(s1 == "") continue;
      u = ts->Strings[x].Pos(s1) + s1.Length() - 1;
      s2 = ts->Strings[x].SubString(u + 1, ts->Strings[x].Length());
      u = s2.Pos("\"");
      if(u > 1) s2.Delete(1, u - 1);
      u = n - s1.Length() + 1;
      s1 = Trim(s1+ "," + AnsiString::StringOfChar(' ', u) + s2);
      u = LastDelimiter("\"",s1);
      if(u > 0)
         if(u < s1.Length())
            s1[u + 1] = ';';
         else
            s1 = s1 + ";";
      else
         if(s1.AnsiLastChar()[0] != ';') s1 = s1 + ";";
      if(IsCommented) s1 = "//" + s1;
      ts->Strings[x] = s1;
   }
}
//---------------------------------------------------------------------------
// Load ZipMsg.h and convert lines to .rc format
void TForm1::PrepareZipMsg()
{
   int n, l;
   AnsiString s1, s2;

   Z_MSG->LoadFromFile(H_File);

   n = 0;
   while(n < Z_MSG->Count) {

      // remove lines which not contain #define
      s1 = Trim(Z_MSG->Strings[n]);
      l = s1.Pos("#define");
      if(l == 0) {
         Z_MSG->Delete(n);
         continue;
      }

      // remove '#define ' text
      s1 = Trim(s1.Delete(l, 8));

      // find end code name
      for(; l < s1.Length(); ++l)
         if(!IsAlNum(s1[l])) break;

      // check for base grup : ??_BASE, if true remove from list
      s2 = AnsiUpperCase(GetRcCode(s1));
      if(s2.SubString(3, s2.Length()) == "_BASE") {
         Z_MSG->Delete(n);
         continue;
      }

      // if end code name >= end of line then remove line
      if(l >= s1.Length()) {
         Z_MSG->Delete(n);
         continue;
      }

      // force code name and code number gap to be ' '
      s1[l] = ' ';
      ++l;

      // remove extra white space chars from code name to code number
      while(l < s1.Length())
         if(!IsAlNum(s1[l]))
            s1.Delete(l, 1);
         else
            break;
      s1 = Trim(s1);

      // convert line to rc line format
      // From: CodeName CodeNumber
      //   To: CodeName,"CodeName = CodeNumber";
      // From: //CodeName CodeNumber
      //   To: //CodeName,"CodeName = CodeNumber";
      s2 = s1.SubString(s1.Pos(" ") + 1, s1.Length());
      s1 = s1.SubString(1, s1.Pos(" ") - 1);
      Z_MSG->Strings[n] = s1 + ",\"" + GetRcCode(s1) + " = " + s2 + "\";";
      ++n;
   }
}
//---------------------------------------------------------------------------
// find line number where to insert new code
int TForm1::FindEndGrupCode(TStringList *sl, AnsiString s)
{
   int n;
   AnsiString s1;

   s1 = s.SubString(1,3); // block code identifier

   // find start block identifier
   for(n = 0; n < sl->Count; ++n)
      if(s1 == GetRcCode(sl->Strings[n]).SubString(1,3)) break;

   // find end block identifier
   for(; n < sl->Count; ++n)
      if(s1 != GetRcCode(sl->Strings[n]).SubString(1,3)) break;

   if(n >= sl->Count)  // grup block not found, find end string table
      for(n = sl->Count - 1; n > 0; --n)
         if(Trim(sl->Strings[n]) == "}") break;

   return n;
}
//---------------------------------------------------------------------------
// find line number where to insert new code
bool TForm1::IsAlNum(char c)
{
   if((c >= '0' && c <= '9') ||
      (c >= 'A' && c <= 'Z') ||
      (c >= 'a' && c <= 'z') ||
      (c == '_')) return true;
   return false;
}
//---------------------------------------------------------------------------
// Load image from file if exists to bitbutton
void TForm1::LoadImage(TBitBtn *tbb, AnsiString s)
{
   if(Trim(s) == "") return;
   if(FileExists(s))
      try {
         tbb->Glyph->LoadFromFile(s);
      }
      catch(...) {
      }
}
//---------------------------------------------------------------------------
// IniFile : Read String
AnsiString TForm1::IniFileRS(AnsiString Section, AnsiString Key, AnsiString Def)
{
   bIniErr = false;
   AnsiString s = pIniFile->ReadString(Section, Key, "\b");
   if(s != "\b") return s;
   bIniErr = true;
   return Def;
}
//---------------------------------------------------------------------------
// IniFile : Read Boolean
bool TForm1::IniFileRB(AnsiString Section, AnsiString Key, bool Def)
{
   return pIniFile->ReadBool(Section, Key, Def);
}
//---------------------------------------------------------------------------
// IniFile : Read Integer
int TForm1::IniFileRI(AnsiString Section, AnsiString Key, int Def)
{
   int i = pIniFile->ReadInteger(Section, Key, Def);
   if(i > 0) return i;
   return Def;
}
//---------------------------------------------------------------------------
// IniFile : Write String
void TForm1::IniFileWS(AnsiString Section, AnsiString Key, AnsiString Value)
{
   pIniFile->WriteString(Section, Key, Value);
}
//---------------------------------------------------------------------------
// IniFile : Write Boolean
void TForm1::IniFileWB(AnsiString Section, AnsiString Key, bool Value)
{
   pIniFile->WriteBool(Section, Key, Value);
}
//---------------------------------------------------------------------------
// IniFile : Write Integer
void TForm1::IniFileWI(AnsiString Section, AnsiString Key, int Value)
{
   pIniFile->WriteInteger(Section, Key, Value);
}
//---------------------------------------------------------------------------

