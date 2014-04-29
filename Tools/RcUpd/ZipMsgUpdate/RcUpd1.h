//---------------------------------------------------------------------------

#ifndef RcUpd1H
#define RcUpd1H
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ExtCtrls.hpp>
#include <Dialogs.hpp>
#include <ComCtrls.hpp>
#include <Buttons.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
   TPanel *Panel1;
   TLabel *Msg;
   TOpenDialog *OpenRC;
   TMemo *EditRC;
   TCheckBox *ZipMsg;
   TBevel *Bevel1;
   TOpenDialog *OpenZipMsg;
   TBitBtn *Help;
   TBitBtn *RcPrint;
   TBitBtn *RcLoad;
   TBitBtn *RcSave;
   TBitBtn *RcUpdate;
   TBitBtn *RcAll;
   TPrintDialog *PrintDialog1;
   void __fastcall RcLoadClick(TObject *Sender);
   void __fastcall RcUpdateClick(TObject *Sender);
   void __fastcall RcSaveClick(TObject *Sender);
   void __fastcall RcAllClick(TObject *Sender);
   void __fastcall EditRCChange(TObject *Sender);
   void __fastcall ZipMsgClick(TObject *Sender);
   void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
   void __fastcall FormCreate(TObject *Sender);
   void __fastcall HelpClick(TObject *Sender);
   void __fastcall RcPrintClick(TObject *Sender);
private:	// User declarations
   AnsiString Msg_Title;
   AnsiString Msg_NoFileSel;
   AnsiString Msg_NotFound;
   AnsiString Msg_XXNotFound;
   AnsiString Msg_Created;
   AnsiString Msg_Loaded;
   AnsiString Msg_Updated;
   AnsiString Msg_Modified;
   AnsiString Msg_Saved;
   AnsiString Msg_1;
   AnsiString Msg_2;
   AnsiString Msg_3;
   AnsiString Msg_4;
   AnsiString Msg_5;
   AnsiString HelpText;
   AnsiString H_File;
   AnsiString RC_Path;
   AnsiString US_File;
   AnsiString XX_File;
   AnsiString IniFile;
   TStringList *US_RC;
   TStringList *XX_RC;
   TStringList *Z_MSG;
   TWindowState WinState;
   bool IsCommented;
   bool bZipMsg;
   AnsiString GetRcCode(AnsiString s);
   void CleanStrinList(TStringList *sl);
   void CheckForRepitedCodes(TStringList *sl);
   void CheckForCodesOutOfGroup(TStringList *sl);
   void RemoveStrCodesNotInSrc(TStringList *slSrc, TStringList *slTrj);
   void CheckStrCodesCommented(TStringList *slSrc, TStringList *slTrj);
   void AddNewStrCodes(TStringList *slSrc, TStringList *slTrj);
   void UpdateXXInUSStructure();
   void UpdateUSStructureInXX();
   void FormatXX();
   void PrepareZipMsg();
   int  FindEndGrupCode(TStringList *sl, AnsiString s);
   bool IsAlNum(char c);
   void LoadImage(TBitBtn *tbb, AnsiString s);
public:		// User declarations
   __fastcall TForm1(TComponent* Owner);
   __fastcall ~TForm1();
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
