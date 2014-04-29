//---------------------------------------------------------------------------
// RcUpd.exe utility to update, format and modify ZipMsgXX.rc files
// Version 1.0  2004-07-31
//         2.0  2004-08-03 Rewritten Update procedure
//                         Format option revised and corrected some rare aleatory line formats
//                         Added button "All" : Update and saves all ZipMsgXX.rc in selected folder
//         3.0  2004-08-28 Added possibility do check codes in ZipMsg.h
//         4.0  2004-09-14 Added ini file to save program config
//                         Check for repeated codes
//                         Added button "Print" : Print to default printer
// Programmed using BCB++ 5.0 SP1
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
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
   : TForm(Owner)
{
   AnsiString s;
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
   if(!FileExists(IniFile)) return;

   TIniFile *pIniFile = new TIniFile(IniFile);

   EditRC->Clear();
   while(true) {
      s = "Help_" + IntToStr(n);
      s = pIniFile->ReadString("Config", s, "<EMPTY>");
      if(s == "<EMPTY>") break;
      EditRC->Lines->Append(s);
      ++n;
   }
   if(Trim(EditRC->Lines->Text) != "")
      HelpText = EditRC->Lines->Text;
   else
      EditRC->Lines->Text = HelpText;

   s = Trim(pIniFile->ReadString("Config", "Title", ""));
   if(s == "") s = Form1->Caption;
   Msg_Title = s;
   Form1->Caption = Msg_Title;

   s = Trim(pIniFile->ReadString("Config", "Load.hint", ""));
   if(s != "") RcLoad->Hint = s;

   s = Trim(pIniFile->ReadString("Config", "Load.img", ""));
   if(s != "") LoadImage(RcLoad, s);

   s = Trim(pIniFile->ReadString("Config", "Update.hint", ""));
   if(s != "") RcUpdate->Hint = s;

   s = Trim(pIniFile->ReadString("Config", "Update.img", ""));
   if(s != "") LoadImage(RcUpdate, s);

   s = Trim(pIniFile->ReadString("Config", "Save.hint", ""));
   if(s != "") RcSave->Hint = s;

   s = Trim(pIniFile->ReadString("Config", "Save.img", ""));
   if(s != "") LoadImage(RcSave, s);

   s = Trim(pIniFile->ReadString("Config", "All.hint", ""));
   if(s != "") RcAll->Hint = s;

   s = Trim(pIniFile->ReadString("Config", "All.img", ""));
   if(s != "") LoadImage(RcAll, s);

   s = Trim(pIniFile->ReadString("Config", "Print.hint", ""));
   if(s != "") RcPrint->Hint = s;

   s = Trim(pIniFile->ReadString("Config", "Print.img", ""));
   if(s != "") LoadImage(RcPrint, s);

   s = Trim(pIniFile->ReadString("Config", "Help.hint", ""));
   if(s != "") Help->Hint = s;

   s = Trim(pIniFile->ReadString("Config", "Help.img", ""));
   if(s != "") LoadImage(Help, s);

   s = pIniFile->ReadString("Config", "OpenRC", "");
   if(Trim(s) != "") OpenRC->Title = s;

   if(ZipMsg->Visible) {
      s = pIniFile->ReadString("Config", "CheckZipMsg.h", "");
      if(Trim(s) != "") ZipMsg->Caption = s + " ZipMsg.h";
   }

   s = pIniFile->ReadString("Config", "NoFileSel", "");
   if(Trim(s) == "") s = "No File Selected";
   Msg_NoFileSel = s;

   s = pIniFile->ReadString("Config", "NotFound", "");
   if(Trim(s) == "") s = " not found !";
   Msg_NotFound = s;

   s = pIniFile->ReadString("Config", "XXNotFound", "");
   if(Trim(s) == "") s = " : not found, created using";
   Msg_XXNotFound = s + " ZipMsgUS.rc";

   s = pIniFile->ReadString("Config", "Created", "");
   if(Trim(s) == "") s = " Created";
   Msg_Created = s;

   s = pIniFile->ReadString("Config", "Loaded", "");
   if(Trim(s) == "") s = " Loaded";
   Msg_Loaded = s;

   s = pIniFile->ReadString("Config", "Updated", "");
   if(Trim(s) == "") s = " Updated";
   Msg_Updated = s;

   s = pIniFile->ReadString("Config", "Modified", "");
   if(Trim(s) == "") s = " Modified";
   Msg_Modified = s;

   s = pIniFile->ReadString("Config", "Saved", "");
   if(Trim(s) == "") s = " Saved";
   Msg_Saved = s;

   s = pIniFile->ReadString("Config", "Msg_1", "");
   if(Trim(s) == "") s = "  files  updated";
   Msg_1 = s;

   s = pIniFile->ReadString("Config", "Msg_2", "");
   if(Trim(s) == "") s = " // not in";
   Msg_2 = s + " ZipMsg.h";

   s = pIniFile->ReadString("Config", "Msg_3", "");
   if(Trim(s) == "") s = " // commented in";
   Msg_3 = s + " ZipMsg.h";

   s = pIniFile->ReadString("Config", "Msg_4", "");
   if(Trim(s) == "") s = " // uncommented in";
   Msg_4 = s + " ZipMsg.h";

   s = pIniFile->ReadString("Config", "Msg_5", "");
   if(Trim(s) == "") s = " // new in";
   Msg_5 = s + " ZipMsg.h";

   RC_Path = pIniFile->ReadString("RcUpd", "RC_Path", "");
   XX_File = pIniFile->ReadString("RcUpd", "XX_File", "");
   bZipMsg = true;
   ZipMsg->Checked = pIniFile->ReadBool("RcUpd", "Check.ZipMsg", false);
   if(ZipMsg->Checked) {
      H_File = pIniFile->ReadString("RcUpd", "ZipMsg.h", "");
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
   if(FileExists(XX_File)) {
      XX_RC->LoadFromFile(XX_File);
      EditRC->Lines->Assign(XX_RC);
      Msg->Color = clLime;
      Msg->Caption = ExtractFileName(XX_File) + Msg_Loaded;
   } else
      Msg->Caption = Msg_NoFileSel;
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
   int i;
   if(!FileExists(IniFile)) return;
   TIniFile *pIniFile = new TIniFile(IniFile);
   if(pIniFile->ReadBool("RcUpd", "Maximized", false))
     WindowState = wsMaximized;
   else {
      i = pIniFile->ReadInteger("RcUpd", "Left", 0);
      if(i >= 0) Form1->Left = i;
      i = pIniFile->ReadInteger("RcUpd", "Top", 0);
      if(i >= 0) Form1->Top = i;
      i = pIniFile->ReadInteger("RcUpd", "Width", 0);
      if(i >= 0) Form1->Width = i;
      i = pIniFile->ReadInteger("RcUpd", "Height", 0);
      if(i >= 0) Form1->Height = i;
   }
   delete pIniFile;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::FormClose(TObject *Sender, TCloseAction &Action)
{
   int l, t, w, h;
   TIniFile *pIniFile = new TIniFile(IniFile);
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
   pIniFile->WriteInteger("RcUpd", "Left", l);
   pIniFile->WriteInteger("RcUpd", "Top", t);
   pIniFile->WriteInteger("RcUpd", "Width", w);
   pIniFile->WriteInteger("RcUpd", "Height", h);
   pIniFile->WriteBool("RcUpd", "Maximized", (WindowState == wsMaximized) ? true : false);
   if(ZipMsg->Visible)
      pIniFile->WriteBool("RcUpd", "Check.ZipMsg", ZipMsg->Checked);
   pIniFile->WriteString("RcUpd", "ZipMsg.h", ExtractFilePath(H_File));
   delete pIniFile;
   ModalResult = mrOk;
}
//---------------------------------------------------------------------------
// Select and load rc file
void __fastcall TForm1::RcLoadClick(TObject *Sender)
{
   US_RC->Clear();
   XX_RC->Clear();
   Z_MSG->Clear();
   US_File = "";
   US_File = "";
   RcUpdate->Enabled = false;
   RcSave->Enabled = false;
   EditRC->Lines->Text = HelpText;
   Msg->Caption = Msg_NoFileSel;
   Msg->Color = clMaroon;
   Form1->Caption = Msg_Title;
   if(OpenRC->Execute()) {
      XX_File = OpenRC->FileName;
      RC_Path = ExtractFilePath(XX_File);
      Form1->Caption = ExtractFileName(XX_File);
      US_File = ExtractFilePath(XX_File) + "ZipMsgUS.rc";
      if(!FileExists(US_File)) {
         Msg->Caption = "ZipMsgUS.rc" + Msg_NotFound;
         Msg->Color = clRed;
         return;
      }
      US_RC->LoadFromFile(US_File);
      if(!FileExists(XX_File)) {
         XX_RC->Assign(US_RC);
         Form1->Caption = ExtractFileName(XX_File) + Msg_XXNotFound;
         Msg->Caption = ExtractFileName(XX_File) + Msg_Created;
      } else {
         XX_RC->LoadFromFile(XX_File);
         Msg->Caption = ExtractFileName(XX_File) + Msg_Loaded;
      }
      Msg->Color = clLime;
      EditRC->Lines->Assign(XX_RC);
      RcUpdate->Enabled = true;
      RcSave->Enabled = true;
      TIniFile *pIniFile = new TIniFile(IniFile);
      pIniFile->WriteString("RcUpd", "RC_Path", RC_Path);
      pIniFile->WriteString("RcUpd", "XX_File", ExtractFileName(XX_File));
      delete pIniFile;
   }
}
//---------------------------------------------------------------------------
// Update loaded rc file
void __fastcall TForm1::RcUpdateClick(TObject *Sender)
{
   AnsiString s1, s2;
   int x, u, n, i;

   RcLoad->Enabled = false;
   RcUpdate->Enabled = false;
   RcSave->Enabled = false;
   RcAll->Enabled = false;
   ZipMsg->Enabled = false;

   // Reassign XX_RC to prevent any changes prior Update button is pressed
   XX_RC->Assign(EditRC->Lines);

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
   UpdateUSStructureInXX();
   CheckForCodesOutOfGroup(XX_RC);
   FormatXX();

   // update internal variables to prevent press "Update RC" twice,...
   US_RC->LoadFromFile(US_File);

   // Assign edit control updated rc file
   EditRC->Lines->Assign(XX_RC);
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
   EditRC->Lines->SaveToFile(XX_File);
   Msg->Caption = ExtractFileName(XX_File) + Msg_Saved;
   Msg->Color = clBlue;
}
//---------------------------------------------------------------------------
// Auto update all rc files in selected directory
void __fastcall TForm1::RcAllClick(TObject *Sender)
{
   int Attr, n = 0;
   TSearchRec sr;
   US_RC->Clear();
   XX_RC->Clear();
   US_File = "";
   US_File = "";
   RcLoad->Enabled = false;
   RcUpdate->Enabled = false;
   RcSave->Enabled = false;
   RcAll->Enabled = false;
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
      US_RC->LoadFromFile(US_File);
      XX_File = RC_Path + "ZipMsg*.rc";
      Attr |= faArchive | faAnyFile;
      if(FindFirst(XX_File, Attr, sr) == 0)
         do {
            if((sr.Attr & Attr) == sr.Attr) {
               XX_File = RC_Path + sr.Name;
               EditRC->Lines->LoadFromFile(XX_File);
               RcUpdateClick(Sender);
               RcSaveClick(Sender);
               ++n;
               Msg->Caption = IntToStr(n) + Msg_1;
               Msg->Refresh();
            }
         } while (FindNext(sr) == 0);
      FindClose(sr);
   }
   US_RC->Clear();
   XX_RC->Clear();
   US_File = "";
   US_File = "";
   EditRC->Lines->Text = HelpText;
   RcLoad->Enabled = true;
   RcAll->Enabled = true;
   Msg->Caption = IntToStr(n) + Msg_1;
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
   if(!EditRC->Focused()) return;
   Msg->Caption = ExtractFileName(XX_File) + Msg_Modified;
   Msg->Color = clTeal;
}
//---------------------------------------------------------------------------
// Return string code if found in a string
AnsiString TForm1::GetRcCode(AnsiString s)
{
  int x, y;
  // find start string code
  // skip comment start characters (//RC_XXXXX , // RC_XXXXX , ...)
  x = 1;
  while(x <= s.Length())
     if(isalnum(s[x]) || s[x] == '_')
        break;
     else
        ++x;

  // save if line is commented or not
  if(x > 1)
     IsCommented = true;
  else
     IsCommented = false;

  // find end string code
  y = x;
  while(y <= s.Length())
     if(isalnum(s[y]) || s[y] == '_')
        ++y;
     else
        break;

  // return string code
  return s.SubString(x, y - x);
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
               if((b && IsCommented) || (!b && !IsCommented)) {
                  sl->Delete(m); // both (un)commented remove second
                  continue;
               }
               if(b) {
                  sl->Delete(n); // first commented : removed
                  break;
               } else
                  sl->Delete(m); // second commented : removed
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
   int u;
   AnsiString Src, Trj;
   while(x < slTrj->Count) {
      Trj = GetRcCode(slTrj->Strings[x]);
      if(Trj != "") {
         for(u = 0; u < slSrc->Count; ++u) {
            Src = GetRcCode(slSrc->Strings[u]);
            if(Src == Trj) break;
         }
         if(Src != Trj) {
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
   int x = 0;
   int u;
   AnsiString Src, Trj, s1 = "", s2 = "";
   if(bZipMsg) {
      s1 = Msg_3;
      s2 = Msg_4;
   }
   for(u = 0; u < slSrc->Count; ++u) {
      Src = GetRcCode(slSrc->Strings[u]);
      if(IsCommented) {
         for(x = 0; x < slTrj->Count; ++x) {
            Trj = GetRcCode(slTrj->Strings[x]);
            if(Src != Trj) continue;
            if(!IsCommented)
               slTrj->Strings[x] = slSrc->Strings[u].SubString(1, slSrc->Strings[u].Pos(Src) - 1) +
                                   slTrj->Strings[x] + s1;
            break;
         }
      } else {
         for(x = 0; x < slTrj->Count; ++x) {
            Trj = GetRcCode(slTrj->Strings[x]);
            if(Src != Trj) continue;
            if(IsCommented)
               slTrj->Strings[x] = slTrj->Strings[x].SubString(slTrj->Strings[u].Pos(Trj),
                                   slTrj->Strings[x].Length()) + s2;
            break;
         }
      }
   }
}
//---------------------------------------------------------------------------
// Add new string codes in Source to Target (also if are commented)
void TForm1::AddNewStrCodes(TStringList *slSrc, TStringList *slTrj)
{
   int x, u;
   AnsiString Src, Trj, s = "";
   if(bZipMsg)
      s = Msg_5;
   for(u = 0; u < slSrc->Count; ++u) {
      Src = GetRcCode(slSrc->Strings[u]);
      if(Src == "") continue;
      for(x = 0; x < slTrj->Count; ++x) {
         Trj = GetRcCode(slTrj->Strings[x]);
         if(Src == Trj) break;
      }
      if(Src == Trj) continue;
      if(x >= slTrj->Count)
         slTrj->Append(slSrc->Strings[u] + s);
   }
}
//---------------------------------------------------------------------------
// Save current translated strings in XX to US structure
void TForm1::UpdateXXInUSStructure()
{
   int x, u;
   AnsiString Src, Trj;
   US_RC->LoadFromFile(US_File);
   CheckForRepitedCodes(US_RC);
   for(x = 0; x < XX_RC->Count; ++x) {
      Trj = GetRcCode(XX_RC->Strings[x]);
      if(Trj == "") continue;
      for(u = 0; u < US_RC->Count; ++u) {
         Src = GetRcCode(US_RC->Strings[u]);
         if(Src != Trj)
            continue;
         US_RC->Strings[u] = XX_RC->Strings[x];
         break;
      }
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
   XX_RC->Assign(EditRC->Lines);
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
void TForm1::FormatXX()
{
   int x, u, n, i;
   AnsiString s1, s2;

   // find max length of string codes names
   for(x = 0, u = 0; x < XX_RC->Count; ++x) {
      s1 = GetRcCode(XX_RC->Strings[x]);
      if(u < s1.Length()) u = s1.Length();
   }

   // determine how far goes strings text
   n = (u / 8) * 8;
   if(n <= u) n += 8;

   // skip heading
   for(x = 0; x < US_RC->Count; ++x)
      if(StrPos(XX_RC->Strings[x].c_str(), "STRINGTABLE")) break;

   // reformat lines to get a good look
   for(++x; x < XX_RC->Count; ++x) {
      s1 = GetRcCode(XX_RC->Strings[x]);
      if(s1 == "") continue;
      u = XX_RC->Strings[x].Pos(s1) + s1.Length() - 1;
      s1 = XX_RC->Strings[x].SubString(1, u);
      s2 = XX_RC->Strings[x].SubString(u, XX_RC->Strings[x].Length());
      while(s2[1] != '"') s2.Delete(1,1);
      u = s1.Length() + 1;
      for(i = 0; u < n; ++i, u += 8) ;
      s1 = Trim(s1+ "," + AnsiString::StringOfChar(9, i) + s2);
      if(s1.AnsiLastChar()[0] != ';') s1 = s1 + ";";
      XX_RC->Strings[x] = s1;
   }
}
//---------------------------------------------------------------------------
// Load ZipMsg.h convert lines to format of .rc file
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
   AnsiString s1, s2;

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
   if(FileExists(s))
      try {
         tbb->Glyph->LoadFromFile(s);
      }
      catch(...) {
      }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::HelpClick(TObject *Sender)
{
   EditRC->Lines->Text = HelpText;
   XX_RC->Clear();
   US_RC->Clear();
   RcUpdate->Enabled = false;
   RcSave->Enabled = false;
   Msg->Caption = Msg_NoFileSel;
   TIniFile *pIniFile = new TIniFile(IniFile);
   pIniFile->WriteString("RcUpd", "XX_File", "");
   delete pIniFile;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::RcPrintClick(TObject *Sender)
{
   if(PrintDialog1->Execute()) {
      TRichEdit *tre = new TRichEdit(Form1);
      tre->Parent = Form1;
      tre->Lines->Assign(EditRC->Lines);
      tre->Print(XX_File);
      delete tre;
   }
}
//---------------------------------------------------------------------------

