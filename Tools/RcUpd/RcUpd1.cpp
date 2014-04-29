//---------------------------------------------------------------------------
// RcUpd.exe utility to update, format and modify ZipMsgXX.rc files
// Version 1.0  2004-07-31
//         2.0  2004-08-03 Rewriten Update procedure
//                         Format option revisaed and corrected some rare aleatory line formats
//                         Added button "All" : Update and saves all ZipMsgXX.rc in selected folder
// Programed using BCB++ 5.0 SP1
// Xavier Mor-Mur    xmormur@telepolis.com
//
// You can modify the program freely, only is required you mention its origin
// when submiting include source files and let me know those changes.
//
// Surely program can be write better, a lot, but I think is a good start
// 
#include <vcl.h>
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
   US_RC = new TStringList();
   XX_RC = new TStringList();
   HelpText = EditRC->Lines->Text;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::RcLoadClick(TObject *Sender)
{
   RC_Info->Caption = "";
   US_RC->Clear();
   XX_RC->Clear();
   US_File = "";
   US_File = "";
   RcUpdate->Enabled = false;
   RcSave->Enabled = false;
   Form1->Caption = "Update ZipMsgXX.rc from ZipMsgUS.rc";
   EditRC->Lines->Text = HelpText;
   Msg->Caption = "No file selected";
   Msg->Color = clMaroon;
   if(OpenRC->Execute()) {
      XX_File = OpenRC->FileName;
      RC_Info->Caption = XX_File;
      US_File = ExtractFilePath(XX_File) + "ZipMsgUS.rc";
      if(!FileExists(US_File)) {
         Msg->Caption = "ZipMsgUS.rc not found !";
         Msg->Color = clRed;
         return;
      }
      US_RC->LoadFromFile(US_File);
      if(!FileExists(XX_File)) {
         XX_RC->Assign(US_RC);
         RC_Info->Caption = XX_File + "  (not found, created using ZipMsgUS.rc)";
      } else
         XX_RC->LoadFromFile(XX_File);
      Form1->Caption = "Update " + ExtractFileName(XX_File) + " from ZipMsgUS.rc";
      EditRC->Lines->Assign(XX_RC);
      RcUpdate->Enabled = true;
      RcSave->Enabled = true;
      Msg->Caption = ExtractFileName(XX_File) + " Loaded";
      Msg->Color = clLime;
   }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::RcUpdateClick(TObject *Sender)
{
   AnsiString s1, s2;
   int x, u, n, i;

   // Reassing XX_RC to prevent any changes prior Update button is pressed
   XX_RC->Assign(EditRC->Lines);

   // remove all lines which nor are string codes
   CleanStrinList(US_RC);
   CleanStrinList(XX_RC);
   RemoveStrCodesNotInSrc();
   CheckStrCodesCommented();
   AddNewStrCodes();
   UpdateXXInUSStructure();
   UpdateUSStructureInXX();
   FormatXX();

   // update internal varibles to prevent press "Update RC" twice,...
   US_RC->LoadFromFile(US_File);
   EditRC->Lines->Assign(XX_RC);
   Msg->Caption = ExtractFileName(XX_File) + " Updated";
   Msg->Color = clGreen;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::RcSaveClick(TObject *Sender)
{
   EditRC->Lines->SaveToFile(XX_File);
   Msg->Caption = ExtractFileName(XX_File) + " Saved";
   Msg->Color = clBlue;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::RcAllClick(TObject *Sender)
{
   int Attr, n = 0;
   TSearchRec sr;
   RC_Info->Caption = "";
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
   if(OpenRC->Execute()) {
      RC_Path = ExtractFilePath(OpenRC->FileName);
      US_File = RC_Path + "ZipMsgUS.rc";
      if(!FileExists(US_File)) {
         Msg->Caption = "ZipMsgUS.rc not found !";
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
               Msg->Caption = IntToStr(n) + "  files  updated";
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
   Msg->Caption = IntToStr(n) + "  files  updated";
}
//---------------------------------------------------------------------------
void __fastcall TForm1::EditRCChange(TObject *Sender)
{
   Msg->Caption = ExtractFileName(XX_File) + " Modified";
   Msg->Color = clTeal;
}
//---------------------------------------------------------------------------
// Given a RC list removes all lines except which are string codes
void TForm1::CleanStrinList(TStringList *sl)
{
   int n = 0;
   bool b = false;
   // remove all lines except those whith string codes
   while(n < sl->Count) {
      if(!b || Trim(sl->Strings[n]) == "" || Trim(sl->Strings[n]) == "}") {
         if(StrPos(sl->Strings[n].c_str(), "STRINGTABLE")) b = true;
         sl->Delete(n);
         continue;
      }
      sl->Strings[n] = Trim(sl->Strings[n]);
      ++n;
   }
}
//---------------------------------------------------------------------------
// Returns string code if found in a string
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
  while(y < s.Length())
     if(isalnum(s[y]) || s[y] == '_')
        ++y;
     else
        break;

  // return string code
  return s.SubString(x, y - x);
}
//---------------------------------------------------------------------------
// This funtion removes all string codes (lines) in XX not found in US
void TForm1::RemoveStrCodesNotInSrc()
{
   int x = 0;
   int u;
   AnsiString s1, s2;
   while(x < XX_RC->Count) {
      s2 = GetRcCode(XX_RC->Strings[x]);
      if(s2 != "") {
         for(u = 0; u < US_RC->Count; ++u) {
            s1 = GetRcCode(US_RC->Strings[u]);
            if(s1 == s2) break;
         }
         if(s1 != s2) {
            XX_RC->Delete(x);
            continue;
         }
      }
      ++x;
   }
}
//---------------------------------------------------------------------------
// Check current string codes in XX if are or not commented in US
void TForm1::CheckStrCodesCommented()
{
   int x = 0;
   int u;
   AnsiString s1, s2;
   for(u = 0; u < US_RC->Count; ++u) {
      s1 = GetRcCode(US_RC->Strings[u]);
      if(IsCommented) {
         for(x = 0; x < XX_RC->Count; ++x) {
            s2 = GetRcCode(XX_RC->Strings[x]);
            if(s1 != s2) continue;
            if(!IsCommented)
               XX_RC->Strings[x] = US_RC->Strings[u].SubString(1, US_RC->Strings[u].Pos(s1) - 1) +
                                   XX_RC->Strings[x];
            break;
         }
      } else {
         for(x = 0; x < XX_RC->Count; ++x) {
            s2 = GetRcCode(XX_RC->Strings[x]);
            if(s1 != s2) continue;
            if(IsCommented)
               XX_RC->Strings[x] = XX_RC->Strings[x].SubString(XX_RC->Strings[u].Pos(s2),
                                   XX_RC->Strings[x].Length());
            break;
         }
      }
   }
}
//---------------------------------------------------------------------------
// Add new string codes in US to XX (also if are commented)
void TForm1::AddNewStrCodes()
{
   int x, u;
   AnsiString s1, s2;
   for(u = 0; u < US_RC->Count; ++u) {
      s1 = GetRcCode(US_RC->Strings[u]);
      if(s1 == "") continue;
      for(x = 0; x < XX_RC->Count; ++x) {
         s2 = GetRcCode(XX_RC->Strings[x]);
         if(s1 == s2) break;
      }
      if(x >= XX_RC->Count)
         XX_RC->Append(US_RC->Strings[u]);
   }
}
//---------------------------------------------------------------------------
// Save current translated strings in XX to US structure
void TForm1::UpdateXXInUSStructure()
{
   int x, u;
   AnsiString s1, s2;
   US_RC->LoadFromFile(US_File);
   for(u = 0; u < US_RC->Count; ++u) {
      s1 = GetRcCode(US_RC->Strings[u]);
      if(s1 == "") continue;
      for(x = 0; x < XX_RC->Count; ++x) {
         s2 = GetRcCode(XX_RC->Strings[x]);
         if(s1 == s2)
            US_RC->Strings[u] = XX_RC->Strings[x];
      }
   }
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

