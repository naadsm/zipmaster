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
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
   TPanel *Panel1;
   TButton *RcLoad;
   TButton *RcUpdate;
   TButton *RcSave;
   TLabel *RC_Info;
   TLabel *Msg;
   TOpenDialog *OpenRC;
   TMemo *EditRC;
   TButton *RcAll;
   void __fastcall RcLoadClick(TObject *Sender);
   void __fastcall RcUpdateClick(TObject *Sender);
   void __fastcall RcSaveClick(TObject *Sender);
   void __fastcall RcAllClick(TObject *Sender);
   void __fastcall EditRCChange(TObject *Sender);
private:	// User declarations
   AnsiString HelpText;
   AnsiString RC_Path;
   AnsiString US_File;
   AnsiString XX_File;
   TStringList *US_RC;
   TStringList *XX_RC;
   bool IsCommented;
   AnsiString GetRcCode(AnsiString s);
   void CleanStrinList(TStringList *sl);
   void RemoveStrCodesNotInSrc();
   void CheckStrCodesCommented();
   void AddNewStrCodes();
   void UpdateXXInUSStructure();
   void UpdateUSStructureInXX();
   void FormatXX();
public:		// User declarations
   __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
