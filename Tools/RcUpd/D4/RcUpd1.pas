//---------------------------------------------------------------------------
// RcUpd.exe utility to update, format and modify ZipMsgXX.rc files
//
// Version 1.0  2004-07-31 First release.
//         (BCB5)
//         2.0  2004-08-03 Rewritten Update procedure
//         (BCB5)          Format option revised and corrected some rare aleatory line formats
//                         Added button 'All' : Update and saves all ZipMsgXX.rc in selected folder
//         3.0  2004-08-28 Added possibility do check codes in ZipMsg.h
//         (BCB5)
//         4.0  2004-09-14 Added ini file to save program config
//         (BCB5 & D4)     Check for repeated codes
//                         Added button 'Print'
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
//         5.0  2004-11-03 Changed edit panel from StringList to RichEdit this allows
//         (BCB5)          show new codes in red.
//         (D4 coming)     Changed tabs by spaces when formating lines because different editors
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
// Programmed using Delphi 4 (ported from version 4.0 write using BCB5)
// Xavier Mor-Mur    xmormur@telepolis.com
//
// You can modify the program freely, only is required you mention its origin
// when submitting include source files and let me know those changes.
//
// Surely program can be write better, a lot, but I think is a good start

unit RcUpd1;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Buttons, ExtCtrls, Printers, IniFiles, ComCtrls;

type
   TForm1 = class(TForm)
      Panel1: TPanel;
      Panel2: TPanel;
      ZipMsg: TCheckBox;
      Bevel1: TBevel;
      RcLoad: TBitBtn;
      RcUpdate: TBitBtn;
      RcSave: TBitBtn;
      RcAll: TBitBtn;
      RcPrint: TBitBtn;
      Help: TBitBtn;
      OpenZipMsg: TOpenDialog;
      OpenRc: TOpenDialog;
      PrintDialog1: TPrintDialog;
      Msg: TLabel;
      US_Code: TLabel;
      PageControl1: TPageControl;
      TabSheet1: TTabSheet;
      TabSheet2: TTabSheet;
      EditRC: TRichEdit;
      US: TRichEdit;
      procedure RcLoadClick(Sender: TObject);
      procedure RcUpdateClick(Sender: TObject);
      procedure RcSaveClick(Sender: TObject);
      procedure RcAllClick(Sender: TObject);
      procedure RcPrintClick(Sender: TObject);
      procedure HelpClick(Sender: TObject);
      procedure ZipMsgClick(Sender: TObject);
      procedure EditRCChange(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EditRCMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure EditRCKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
   private
      { Private declarations }
      Msg_Title : String;
      Msg_NoFileSel : String;
      Msg_NotFound : String;
      Msg_XXNotFound : String;
      Msg_Created : String;
      Msg_Loaded : String;
      Msg_Updated : String;
      Msg_Modified : String;
      Msg_Saved : String;
      Msg_All : String;
      Msg_Help : String;
      Msg_1 : String;
      Msg_2 : String;
      Msg_3 : String;
      Msg_4 : String;
      Msg_5 : String;
      HelpText : String;
      H_File : String;
      RC_Path : String;
      US_File : String;
      XX_File : String;
      IniFile : String;
      US_RC : TStringList;
      XX_RC : TStringList;
      Z_MSG : TStringList;
      IsCommented : Boolean;
      bZipMsg : Boolean;
      bIniErr : Boolean;
      pIniFile : TIniFile;
      procedure RcLoadFile(F : String);
      procedure EditUpdate;
      function GetRcCode(s : String) : String;
      function FindRcCode(sl : TStringList; s : String) : integer;
      procedure CleanStrinList(sl : TStringList);
      procedure CheckForRepitedCodes(sl : TStringList);
      procedure CheckForCodesOutOfGroup(sl : TStringList);
      procedure RemoveStrCodesNotInSrc(slSrc : TStringList; slTrj : TStringList);
      procedure CheckStrCodesCommented(slSrc : TStringList; slTrj : TStringList);
      procedure AddNewStrCodes(slSrc : TStringList; slTrj : TStringList);
      procedure UpdateXXInUSStructure;
      procedure UpdateUSStructureInXX;
      procedure FormatXX(ts : TStringList);
      procedure PrepareZipMsg;
      function FindEndGrupCode(sl : TStringList; s : String) : Integer;
      function IsAlNum(c : char) : Boolean;
      procedure LoadImage(tbb : TBitBtn; s : String);
      function IniFileRS(Section : String; Key : String; Def : String) : String;
      function IniFileRB(Section : String; Key : String; Def : Boolean) : Boolean;
      function IniFileRI(Section : String; Key : String; Def : Integer) : Integer;
      procedure IniFileWS(Section : String; Key : String; Value : String);
      procedure IniFileWB(Section : String; Key : String; Value : Boolean);
      procedure IniFileWI(Section : String; Key : String; Value : Integer);
   public
      { Public declarations }
      constructor Create(AOwner : TComponent); override;
      destructor Destroy; override;
   end;

var
   Form1: TForm1;

implementation

{$R *.DFM}

//---------------------------------------------------------
// If yor Delphi does not supports IncludeTrailingBackslash
// include apropiate $IFDEF to include for your compiler
//---------------------------------------------------------
{$IFDEF VER80}  {$DEFINE VER_OLD} {$ENDIF}   //Delphi 1.0
{$IFDEF VER90}  {$DEFINE VER_OLD} {$ENDIF}   //Delphi 2.0
{$IFDEF VER100} {$DEFINE VER_OLD} {$ENDIF}   //Delphi 3.0
{$IFDEF VER120} {$DEFINE VER_OLD} {$ENDIF}   //Delphi 4.0
{$IFDEF VER93}  {$DEFINE VER_OLD} {$ENDIF}   //BCB 1.0
{$IFDEF VER110} {$DEFINE VER_OLD} {$ENDIF}   //BCB 3.0
{$IFDEF VER125} {$DEFINE VER_OLD} {$ENDIF}   //BCB 4.0
{$IFDEF VER_OLD}
function IncludeTrailingBackslash(s : String) : String;
var
  n : Integer;
begin
  n := Length(s);
  if n = 0 then
    Result := '\'
  else
    if s[n] = '\' then
      Result := s
    else
      Result := s + '\';
end;
{$ENDIF}
//---------------------------------------------------------------

constructor TForm1.Create(AOwner : TComponent);
var
  s, s1 : String;
  n : Integer;
  fs1, fs2 : TFileStream;
  pCanvas : TControlCanvas;
begin
  inherited Create(AOwner);
  n := 0;
  US_RC := TStringList.Create;
  XX_RC := TStringList.Create;
  Z_MSG := TStringList.Create;

  if AnsiCompareText(ParamStr(1), '/d') = 0 then
  begin
    ZipMsg.Visible := true;
    Msg.Height := Trunc(Msg.Height / 2);
    Msg.Top := ZipMsg.Top + ZipMsg.Height + 1;
  end;

  if Printer.Printers.Count = 0 then RcPrint.Enabled := false;

  HelpText := EditRC.Lines.Text;

  IniFile := ChangeFileExt(ParamStr(0), '.ini');
  if not FileExists(IniFile) then
  begin
    s := ExtractFilePath(IniFile) + 'RcUpd_US.ini';
    if not FileExists(s) then exit;
    fs1 := TFileStream.Create(s, fmOpenRead);
    fs2 := TFileStream.Create(IniFile, fmCreate);
    fs2.CopyFrom(fs1, 0);
    fs1.Free;
    fs2.Free;
  end;
  pIniFile := TIniFile.Create(IniFile);
  EditRC.Clear;
  s1 := 'Config';
  while true do
  begin
    s := IniFileRS(s1, 'Help_' + IntToStr(n), #8);
    if bIniErr then break;
    EditRC.Lines.Append(s);
    inc(n);
  end;
  if Trim(EditRC.Lines.Text) <> '' then
    HelpText := EditRC.Lines.Text
  else
    EditRC.Lines.Text := HelpText;

  Msg_Title := IniFileRS(s1, 'Title', Form1.Caption);
  Form1.Caption := Msg_Title;

  RcLoad.Hint := IniFileRS(s1, 'Load.hint', RcLoad.Hint);
  LoadImage(RcLoad, IniFileRS(s1, 'Load.img', ''));

  RcUpdate.Hint := IniFileRS(s1, 'Update.hint', RcUpdate.Hint);
  LoadImage(RcUpdate, IniFileRS(s1, 'Update.img', ''));

  RcSave.Hint := IniFileRS(s1, 'Save.hint', RcSave.Hint);
  LoadImage(RcSave, IniFileRS(s1, 'Save.img', ''));

  Msg_All := IniFileRS(s1, 'All', 'All');
  RcAll.Hint := IniFileRS(s1, 'All.hint', RcAll.Hint);
  LoadImage(RcAll, IniFileRS(s1, 'All.img', ''));

  RcPrint.Hint := IniFileRS(s1, 'Print.hint', RcPrint.Hint);
  LoadImage(RcPrint, IniFileRS(s1, 'Print.img', ''));

  Msg_Help := IniFileRS(s1, 'Help', 'Help');
  Help.Hint := IniFileRS(s1, 'Help.hint', Help.Hint);
  LoadImage(Help, IniFileRS(s1, 'Help.img', ''));

  OpenRC.Title := IniFileRS(s1, 'OpenRC', OpenRC.Title);

  if ZipMsg.Visible then
  begin
    ZipMsg.Caption := IniFileRS(s1, 'CheckZipMsg.h', ZipMsg.Caption) + ' ZipMsg.h';
    pCanvas := TControlCanvas.Create;
    pCanvas.Control := ZipMsg;
    n := pCanvas.TextWidth(ZipMsg.Caption);
    if (n + 20) > ZipMsg.Width then ZipMsg.Width := n + 20;
  end;

  Msg_NoFileSel := IniFileRS(s1, 'NoFileSel', 'No File Selected');
  Msg_NotFound := IniFileRS(s1, 'NotFound', ' not found !');
  Msg_XXNotFound := IniFileRS(s1, 'XXNotFound', ' : not found, created using') + ' ZipMsgUS.rc';
  Msg_Created := IniFileRS(s1, 'Created', ' Created');
  Msg_Loaded := IniFileRS(s1, 'Loaded', ' Loaded');
  Msg_Updated := IniFileRS(s1, 'Updated', ' Updated');
  Msg_Modified := IniFileRS(s1, 'Modified', ' Modified');
  Msg_Saved := IniFileRS(s1, 'Saved', ' Saved');
  Msg_1 := IniFileRS(s1, 'Msg_1', '  files  updated');
  Msg_2 := IniFileRS(s1, 'Msg_2', ' // not in') + ' ZipMsg.h';
  Msg_3 := IniFileRS(s1, 'Msg_3', ' // commented in') + ' ZipMsg.h';
  Msg_4 := IniFileRS(s1, 'Msg_4', ' // uncommented in') + ' ZipMsg.h';
  Msg_5 := IniFileRS(s1, 'Msg_5', ' // new in') + ' ZipMsg.h';

  s1 := 'RcUpd';
  RC_Path := IniFileRS(s1, 'RC_Path', '');
  XX_File := IniFileRS(s1, 'XX_File', '');
  bZipMsg := true;
  ZipMsg.Checked := IniFileRB(s1, 'Check.ZipMsg', false);
  if ZipMsg.Checked then
  begin
    H_File := IniFileRS(s1, 'ZipMsg.h', '');
    H_File := ExtractFilePath(H_File) + 'ZipMsg.h';
    if not FileExists(H_File) then
    begin
      H_File := '';
      ZipMsg.Checked := false;
    end;
  end;
  bZipMsg := false;
  pIniFile.Free;
  OpenRC.FileName := XX_File;
  OpenRC.InitialDir := RC_Path;
  OpenZipMsg.InitialDir := ExtractFilePath(H_File);
  Position := poDesigned;
  US.Lines.Clear;
  XX_File := IncludeTrailingBackslash(RC_Path) + XX_File;
  if FileExists(XX_File) then
  begin
    TabSheet1.Caption := Copy(ExtractFileName(XX_File), 1, 8);
    XX_RC.LoadFromFile(XX_File);
    US_File := ExtractFilePath(XX_File) + 'ZipMsgUS.rc';
    if not FileExists(US_File) then
    begin
      Msg.Caption := 'ZipMsgUS.rc' + Msg_NotFound;
      Msg.Color := clRed;
    end;
    US_RC.LoadFromFile(US_File);
    FormatXX(US_RC);
    US.Lines.Assign(US_RC);
    EditRC.Lines.Assign(XX_RC);
    RcUpdate.Enabled := true;
    RcSave.Enabled := true;
    Msg.Color := clLime;
    Msg.Caption := ExtractFileName(XX_File) + Msg_Loaded;
  end
  else
  begin
    TabSheet1.Caption := Msg_Help;
    Msg.Caption := Msg_NoFileSel;
  end;
  EditRC.ScrollBars := ssBoth;
end;

destructor TForm1.Destroy;
begin
  US_RC.Free;
  XX_RC.Free;
  Z_MSG.Free;
  inherited Destroy;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  s : String;
begin
  if not FileExists(IniFile) then exit;
  pIniFile := TIniFile.Create(IniFile);
  s := 'RcUpd';
  if pIniFile.ReadBool('RcUpd', 'Maximized', false) then
    WindowState := wsMaximized
  else
  begin
    Form1.Left := IniFileRI(s, 'Left', 0);
    Form1.Top := IniFileRI(s, 'Top', 0);
    Form1.Width := IniFileRI(s, 'Width', 730);
    Form1.Height := IniFileRI(s, 'Height', 550);
  end;
  pIniFile.Free;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  if TabSheet1.Caption <> Msg_Help then EditUpdate;
  EditRC.Modified := false;
  EditRC.SelStart := 0;
  EditRC.SelLength := 0;
  EditRC.SetFocus;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var
  l, t, w, h : Integer;
  s : String;
begin
  s := 'RcUpd';
  pIniFile := TIniFile.Create(IniFile);
  if Form1.Left < 0 then l := 0 else l := Form1.Left;
  if Form1.Top < 0 then t := 0 else t := Form1.Top;
  w := Form1.Width;
  h := Form1.Height;
  if (l + w) > Screen.Width then
  begin
    l := Screen.Width - w;
    if l < 0 then
    begin
      l := 0;
      w := Screen.Width;
    end;
  end;
  if t + h > Screen.Height then
  begin
    t := Screen.Height - h;
    if t < 0 then
    begin
      t := 0;
      h := Screen.Height;
    end;
  end;
  IniFileWI(s, 'Left', l);
  IniFileWI(s, 'Top', t);
  IniFileWI(s, 'Width', w);
  IniFileWI(s, 'Height', h);
  if WindowState = wsMaximized then
    IniFileWB(s, 'Maximized', true)
  else
    IniFileWB(s, 'Maximized', false);
  if ZipMsg.Visible then
    IniFileWB(s, 'Check.ZipMsg', ZipMsg.Checked);
  IniFileWS(s, 'ZipMsg.h', ExtractFilePath(H_File));
  pIniFile.Free;
  ModalResult := mrOk;
end;

// Select and load rc file
procedure TForm1.RcLoadClick(Sender: TObject);
var
  s : String;
begin
  s := 'RcUpd';
  US.Lines.Clear;
  US_RC.Clear;
  XX_RC.Clear;
  Z_MSG.Clear;
  US_File := '';
  XX_File := '';
  RcUpdate.Enabled := false;
  RcSave.Enabled := false;
  TabSheet1.Caption := Msg_Help;
  EditRC.Lines.Text := HelpText;
  Msg.Caption := Msg_NoFileSel;
  Msg.Color := clMaroon;
  Form1.Caption := Msg_Title;
  if OpenRC.Execute then
  begin
    XX_File := OpenRC.FileName;
    RC_Path := ExtractFilePath(XX_File);
    Form1.Caption := ExtractFileName(XX_File);
    US_File := ExtractFilePath(XX_File) + 'ZipMsgUS.rc';
    if not FileExists(US_File) then
    begin
      Msg.Caption := 'ZipMsgUS.rc' + Msg_NotFound;
      Msg.Color := clRed;
      exit;
    end;
    US_RC.LoadFromFile(US_File);
    FormatXX(US_RC);
    US.Lines.Assign(US_RC);
    RcLoadFile(OpenRC.FileName);
    Msg.Color := clLime;
    EditUpdate;
    RcUpdate.Enabled := true;
    RcSave.Enabled := true;
    pIniFile := TIniFile.Create(IniFile);
    IniFileWS(s, 'RC_Path', RC_Path);
    IniFileWS(s, 'XX_File', ExtractFileName(XX_File));
    pIniFile.Free;
  end;
  EditRC.Modified := false;
  EditRC.SelStart := 0;
  EditRC.SelLength := 0;
  EditRC.SetFocus;
end;

// Update loaded rc file
procedure TForm1.RcUpdateClick(Sender: TObject);
var
  xx_old : String;
begin
  RcLoad.Enabled := false;
  RcUpdate.Enabled := false;
  RcSave.Enabled := false;
  RcAll.Enabled := false;
  ZipMsg.Enabled := false;

  // Reassign XX_RC to prevent any changes prior Update button is pressed
  if Sender = RcUpdate then
    XX_RC.Assign(EditRC.Lines);
   xx_old := XX_RC.Text;

  // remove all lines which not are string codes
  CleanStrinList(US_RC);
  CleanStrinList(XX_RC);

  bZipMsg := ZipMsg.Checked;

  // update US_RC file if test ZipMsg.h is checked
  if bZipMsg then
  begin
    PrepareZipMsg;
    CheckForRepitedCodes(Z_MSG);
    RemoveStrCodesNotInSrc(Z_MSG, US_RC);
    CheckStrCodesCommented(Z_MSG, US_RC);
    AddNewStrCodes(Z_MSG, US_RC);
    CheckForRepitedCodes(US_RC);
    bZipMsg := false;
  end;

  // update XX_RC
  CheckForRepitedCodes(US_RC);
  CheckForRepitedCodes(XX_RC);
  RemoveStrCodesNotInSrc(US_RC, XX_RC);
  CheckStrCodesCommented(US_RC, XX_RC);
  AddNewStrCodes(US_RC, XX_RC);
  UpdateXXInUSStructure;
  XX_RC.Text := xx_old;
  UpdateUSStructureInXX;
  CheckForCodesOutOfGroup(XX_RC);
  FormatXX(XX_RC);

  // update internal variables to prevent press 'Update RC' twice,...
  US_RC.Assign(US.Lines);

  // if clicked RcAll button don't update edit panel, don't remove edited controls
  if Sender = RcAll then exit;

  // Updated edit control
  EditUpdate;
  Msg.Caption := ExtractFileName(XX_File) + Msg_Updated;
  Msg.Color := clGreen;

  // Enable buttons and checkbox
  RcLoad.Enabled := true;
  RcUpdate.Enabled := true;
  RcSave.Enabled := true;
  RcAll.Enabled := true;
  ZipMsg.Enabled := true;
end;

// Save current changes in rc file
procedure TForm1.RcSaveClick(Sender: TObject);
begin
  if Sender = RcSave then
  begin
    EditRC.Lines.SaveToFile(XX_File);
    Msg.Caption := ExtractFileName(XX_File) + Msg_Saved;
    Msg.Color := clBlue;
  end
  else
    XX_RC.SaveToFile(XX_File);
end;

// Auto update all rc files in selected directory
procedure TForm1.RcAllClick(Sender: TObject);
var
  Attr, n : Integer;
  sr : TSearchRec;
  s : String;
begin
  s := 'RcUpd';
  if PageControl1.ActivePage <> TabSheet1 then
  begin
    PageControl1.ActivePage := TabSheet1;
    PageControl1Change(Sender);
  end;
  TabSheet1.Caption := Msg_All;
  EditRC.Lines.Clear;
  n := 0;
  US_RC.Clear;
  XX_RC.Clear;
  US_File := '';
  XX_File := '';
  Msg.Caption := '';
  Msg.Color := clPurple;
  Form1.Caption := Msg_Title;
  if OpenRC.Execute then
  begin
    RC_Path := ExtractFilePath(OpenRC.FileName);
    US_File := RC_Path + 'ZipMsgUS.rc';
    if not FileExists(US_File) then
    begin
      Msg.Caption := 'ZipMsgUS.rc' + Msg_NotFound;
      exit;
    end;
    RcLoad.Enabled := false;
    RcUpdate.Enabled := false;
    RcSave.Enabled := false;
    RcAll.Enabled := false;
    RcPrint.Enabled := false;
    Help.Enabled := false;
    US_RC.LoadFromFile(US_File);
    XX_File := RC_Path + 'ZipMsg*.rc';
    Attr := faArchive + faAnyFile;
    if FindFirst(XX_File, Attr, sr) = 0 then
      repeat
        XX_File := RC_Path + sr.Name;
        RcLoadFile(XX_File);
        RcUpdateClick(Sender);
        RcSaveClick(Sender);
        inc(n);
        Msg.Caption := IntToStr(n) + Msg_1;
        Msg.Refresh;
      until FindNext(sr) <> 0;
    FindClose(sr);
    pIniFile := TIniFile.Create(IniFile);
    IniFileWS(s, 'RC_Path', RC_Path);
    pIniFile.Free;
  end;
  US_RC.Clear;
  XX_RC.Clear;
  US_File := '';
  XX_File := '';
  TabSheet1.Caption := Msg_Help;
  EditRC.Lines.Text := HelpText;
  RcLoad.Enabled := true;
  RcAll.Enabled := true;
  RcPrint.Enabled := true;
  Help.Enabled := true;
  Msg.Caption := IntToStr(n) + Msg_1;
end;

procedure TForm1.RcPrintClick(Sender: TObject);
begin
  if PrintDialog1.Execute then
  begin
    if PageControl1.ActivePage = TabSheet1 then
      EditRC.Print(XX_File)
    else
      if US.Lines.Count > 0 then US.Print(US_File);
  end;
end;

procedure TForm1.HelpClick(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet1;
  TabSheet1.Caption := Msg_Help;
  PageControl1Change(Sender);
  EditRC.Lines.Text := HelpText;
  US.Clear;
  US_RC.Clear;
  XX_RC.Clear;
  RcUpdate.Enabled := false;
  RcSave.Enabled := false;
  Msg.Caption := Msg_NoFileSel;
  Msg.Color := clMaroon;
  pIniFile := TIniFile.Create(IniFile);
  IniFileWS('RcUpd', 'XX_File', '');
  pIniFile.Free;
end;

// Load rc file (used by RcLoad & RcAll)
procedure TForm1.RcLoadFile(F : String);
begin
  XX_File := F;
  RC_Path := ExtractFilePath(XX_File);
  Form1.Caption := ExtractFileName(XX_File);
  TabSheet1.Caption := Copy(ExtractFileName(XX_File), 1, 8);
  US_RC.Assign(US.Lines);
  if not FileExists(XX_File) then
  begin
    XX_RC.Assign(US_RC);
    Form1.Caption := ExtractFileName(XX_File) + Msg_XXNotFound;
    Msg.Caption := ExtractFileName(XX_File) + Msg_Created;
  end
  else
  begin
    XX_RC.LoadFromFile(XX_File);
    Msg.Caption := ExtractFileName(XX_File) + Msg_Loaded;
  end;
end;

// Check EditRc for edit controls and change color if required
procedure TForm1.EditUpdate;
var
  i : Integer;
  n : Integer;
  s : String;
  tc : TColor;
begin
  // Assign edit control updated rc file
  EditRC.Lines.Assign(XX_RC);
  for n := 0 to EditRC.Lines.Count - 1 do
  begin
    tc := clRed;
    i := Pos(' //_RcUpd_New_', EditRC.Lines.Strings[n]);
    if i = 0 then
    begin
      i := Pos(' //_RcUpd_Mod_', EditRC.Lines.Strings[n]);
      if i = 0 then continue;
      tc := clBlue;
    end;
    s := EditRC.Lines.Strings[n];
    Delete(s, i, 14);
    EditRC.Lines.Strings[n] := s;
    EditRC.SelStart := Pos(EditRC.Lines.Strings[n], EditRC.Text) - 1;
    EditRC.SelLength := Length(EditRC.Lines.Strings[n]);
    EditRC.SelAttributes.Color := tc;
  end;
  EditRC.SelStart := 0;
  EditRC.SelLength := 0;
  EditRC.SetFocus;
  XX_RC.Assign(EditRC.Lines);
end;

procedure TForm1.ZipMsgClick(Sender: TObject);
begin
  if bZipMsg then exit; // no execute while Form creation
  H_File := '';
  if ZipMsg.Checked then
  begin
    OpenZipMsg.DefaultExt := 'h';
    OpenZipMsg.FileName := 'ZipMsg.h';
    OpenZipMsg.Options := [ofHideReadOnly,ofPathMustExist,ofEnableSizing];
    if OpenZipMsg.Execute then
    begin
      // prevent change of file seleccion
      H_File := ExtractFilePath(OpenZipMsg.FileName) + 'ZipMsg.h';
      if not FileExists(H_File) then
      begin
        Msg.Caption := 'ZipMsg.h' + Msg_NotFound;
        H_File := '';
      end;
    end;
  end;
  if H_File = '' then
    ZipMsg.Checked := false;
end;

procedure TForm1.EditRCChange(Sender: TObject);
begin
  if not EditRC.Focused or EditRC.Modified then exit;
  Msg.Caption := ExtractFileName(XX_File) + Msg_Modified;
  Msg.Color := clTeal;
end;

// On click over edit panel try to show US_RC code line at bottom
procedure TForm1.EditRCMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Key : WORD;
begin
  Key := VK_LBUTTON;
  EditRCKeyUp(Sender, Key, Shift);
end;

// If UP_KEY, DOWN_KEY or LEFT_BUTTON_UP is clicked then try to show
// US_RC code line on help line at window bottom
procedure TForm1.EditRCKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  s : String;
  n: Integer;
  tp : TPoint;
begin
  if (Key <> VK_LBUTTON) and (Key <> VK_UP) and (Key <> VK_DOWN) then exit;
  tp := EditRC.CaretPos;
  s := GetRcCode(EditRC.Lines.Strings[tp.y]);
  n := FindRcCode(US_RC, s);
  if n < 0 then
    US_Code.Caption := ''
  else
    US_Code.Caption := US_RC.Strings[n];
end;

// Control Enable/Disable buttons when tabpage is changed
// Called also when buttons All or Help button are clicked
procedure TForm1.PageControl1Change(Sender: TObject);
begin
  if TabSheet1.Caption = Msg_All then
  begin
    PageControl1.ActivePage := TabSheet1;
    exit;
  end;
  if PageControl1.ActivePage <> TabSheet1 then
  begin
    RcLoad.Enabled := false;
    RcUpdate.Enabled := false;
    RcSave.Enabled := false;
    if US.Lines.Count = 0 then RcPrint.Enabled := false;
  end
  else
  begin
    RcLoad.Enabled := true;
    if US.Lines.Count > 0 then RcUpdate.Enabled := true;
    if EditRC.Lines.Text <> HelpText then RcSave.Enabled := true;
    RcPrint.Enabled := true;
  end;
end;

// Returns line if string code is found otherwise -1
function TForm1.FindRcCode(sl : TStringList; s : String) : Integer;
var
  n : Integer;
begin
  Result := -1;
  if s <> '' then
  begin
    for n := 0 to sl.Count - 1 do
    begin
      if GetRcCode(sl.Strings[n]) = s then break;
    end;
    if n < sl.Count then Result := n;
  end;
end;

// Return string code if found in a string
function TForm1.GetRcCode(s : String) : String;
var
  x, y : Integer;
begin
  Result := '';
  IsCommented := false;
  s := Trim(s);
  if s = '' then exit;
  x := Pos('#define', s);
  if x > 0 then Delete(s, x, 7);

  // find start string code
  // skip comment start characters (//RC_XXXXX , // RC_XXXXX , ...)
  for x := 1 to Length(s) do
    if IsAlNum(s[x]) then Break;

  // save if line is commented or not
  y := Pos('//', s);
  if (y < x) and (y > 0) then
    IsCommented := true;

  // find end string code
  for y := x to Length(s) do
    if not IsAlNum(s[y]) then Break;

  // return string code
  Result := Copy(s, x, y - x);
  if Length(Result) < 3 then
    Result := ''
  else if Result[3] <> '_' then Result := '';
end;

// Remove all lines except that contains string codes
procedure TForm1.CleanStrinList(sl : TStringList);
var
  n : Integer;
  b : Boolean;
  s : String;
begin
  n := 0;
  b := false;
  while n < sl.Count do
  begin
    s := AnsiUpperCase(Trim(sl.Strings[n]));
    if (not b) or (s = '') or (s = '}') then
    begin
      if AnsiPos('STRINGTABLE', s) > 0 then b := true;
      if AnsiPos('}', s) > 0 then b := false;
      sl.Delete(n);
      continue;
    end;
    sl.Strings[n] := Trim(sl.Strings[n]);
    inc(n);
  end;
end;

// Removes all lines which string code is repeated in other one.
// from each pair if one is commented this will removed,
// otherwise second code is removed
procedure TForm1.CheckForRepitedCodes(sl : TStringList);
var
  n, m : Integer;
  b : Boolean;
  s : String;
begin
  n := 0;

  while n < sl.Count do
  begin
    s := GetRcCode(sl.Strings[n]);
    if s <> '' then
    begin
      b := IsCommented;
      m := n + 1;
      while m < sl.Count do
      begin
        if s = GetRcCode(sl.Strings[m]) then
        begin
          if (b and IsCommented) or ( not b and not IsCommented) then
          begin
            sl.Delete(m); // both (un)commented remove second
            continue;
          end;
          if b then
          begin
            sl.Delete(n); // first commented : removed
            break;
          end
          else
            sl.Delete(m); // second commented : removed
          continue;
        end;
        inc(m);
      end;
    end;
    inc(n);
  end;
end;

// Check codes are all grouped.
// Group codes are identified by its 3 first characters ??_
// Starting at end of list codes are checked if are out its group
procedure TForm1.CheckForCodesOutOfGroup(sl : TStringList);
var
  n, m : Integer;
  s : String;
begin
  n := sl.Count - 1;
  while(n > 0) do
  begin
    s := GetRcCode(sl.Strings[n]);
    if s <> '' then
    begin
      m := FindEndGrupCode(sl, s);
      if m < n then
      begin
        s := sl.Strings[n];
        sl.Delete(n);
        sl.Insert(m, s);
        continue;
      end;
    end;
    dec(n);
  end;

  // check for only one white line between group codes
  n := 0;
  m := 0;
  while n < sl.Count do
  begin
    if Trim(sl.Strings[n]) = '' then
      inc(m)
    else
      m := 0;
    if m = 2 then
    begin
      sl.Delete(n);
      m := 1;
      continue;
    end;
    inc(n);
  end;
end;

// Removes all Target lines with string codes not found in Source
procedure TForm1.RemoveStrCodesNotInSrc(slSrc : TStringList; slTrj : TStringList);
var
  x : Integer;
  S : String;
begin
  x := 0;
  while x < slTrj.Count do
  begin
    S := GetRcCode(slTrj.Strings[x]);
    if S <> '' then
    begin
      if FindRcCode(slSrc, S) < 0 then
      begin
        if not bZipMsg then
        begin
          slTrj.Delete(x);
          continue;
        end;
        slTrj.Strings[x] := slTrj.Strings[x] + Msg_2;
      end;
    end;
    inc(x);
  end;
end;

// Check current string codes in Target if are or not commented in Source
procedure TForm1.CheckStrCodesCommented(slSrc : TStringList; slTrj : TStringList);
var
  x, u : Integer;
  s, s1, s2 : String;
begin
  s1 := '';
  s2 := '';
  if bZipMsg then
  begin
    s1 := Msg_3;
    s2 := Msg_4;
  end;
  for u := 0 to slSrc.Count - 1 do
  begin
    S := GetRcCode(slSrc.Strings[u]);
    if IsCommented then
    begin
      x := FindRcCode(slTrj, S);
      if (x >= 0) and not IsCommented then
      begin
        S := Copy(slSrc.Strings[u], 1, AnsiPos(S, slSrc.Strings[u]) - 1);
        slTrj.Strings[x] := S + slTrj.Strings[x] + s1 + ' //_RcUpd_Mod_';
      end;
    end
    else
    begin
      x := FindRcCode(slTrj, S);
      if (x >= 0) and IsCommented then
      begin
        S := Copy(slTrj.Strings[x], AnsiPos(S, slTrj.Strings[u]), Length(slTrj.Strings[x]));
        slTrj.Strings[x] := S + s2 + ' //_RcUpd_Mod_';
      end;
    end;
  end;
end;

// Add new string codes in Source to Target (also if are commented)
procedure TForm1.AddNewStrCodes(slSrc : TStringList; slTrj : TStringList);
var
  n : Integer;
  S, s1 : String;
begin
  s1 := '';
  if bZipMsg then
    s1 := Msg_5;
  for n := 0 to slSrc.Count - 1 do
  begin
    S := GetRcCode(slSrc.Strings[n]);
    if S = '' then continue;
    if FindRcCode(slTrj, S) < 0 then
      slTrj.Append(slSrc.Strings[n] + s1 + ' //_RcUpd_New_');
  end;
end;

// Save current translated strings in XX to US structure
procedure TForm1.UpdateXXInUSStructure;
var
  x, u : Integer;
  S : String;
begin
  US_RC.Assign(US.Lines);
  CheckForRepitedCodes(US_RC);
  for x := 0 to XX_RC.Count - 1 do
  begin
    S := GetRcCode(XX_RC.Strings[x]);
    if S = '' then continue;
    u := FindRcCode(US_RC, S);
    if u >= 0 then
      US_RC.Strings[u] := XX_RC.Strings[x];
  end;
  for u := US_RC.Count - 1 downto 1 do
    if Trim(US_RC.Strings[u]) = '}' then break;
  if u = 0 then
    u := 1
  else
    u := 1;
  if Length(Trim(US_RC.Strings[u - 1])) = 0 then
    US_RC.Insert(u, '');
end;

// Update current structure of US with translated strings to XX
procedure TForm1.UpdateUSStructureInXX;
var
  x, u : Integer;
begin
  // remove all lines except heading
  for x := XX_RC.Count - 1 downto 0 do
  begin
    if AnsiPos('STRINGTABLE', XX_RC.Strings[x]) > 0 then break;
    XX_RC.Delete(x);
  end;

  // Skip US heading
  for u := 0 to US_RC.Count - 1 do
    if AnsiPos('STRINGTABLE', US_RC.Strings[u]) > 0 then break;
  inc(u);

  // Add all updated STRINGTABLE
  while u < US_RC.Count do
  begin
    XX_RC.Append(US_RC.Strings[u]);
    inc(u);
  end;
end;

// Format lines of string codes
procedure TForm1.FormatXX(ts : TStringList);
var
  x, u, n : Integer;
  s1, s2 : String;
begin
  // find max length of string codes names
  n := 0;
  for x := 0 to ts.Count - 1 do
  begin
    u := Length(GetRcCode(ts.Strings[x]));
    if n < u then n := u;
  end;
  inc(n);

  // skip heading
  x := 0;
  while x < ts.Count do
  begin
    if AnsiPos('STRINGTABLE', ts.Strings[x]) > 0 then break;
    inc(x);
  end;

  // reformat lines to get a good look
  for x := x + 1 to ts.Count - 1 do
  begin
    s1 := GetRcCode(ts.Strings[x]);
    if s1 = '' then continue;
    u := Pos(s1, ts.Strings[x]) + Length(s1) - 1;
    s2 := Copy(ts.Strings[x], u + 1, Length(ts.Strings[x]));
    u := Pos('"', s2);
    if u > 1 then Delete(s2, 1, u - 1);
    u := n - Length(s1) + 1;
    s1 := Trim(s1 + ',' + StringOfChar(' ', u) + s2);
    u := LastDelimiter('"', s1);
    if u > 0 then
    begin
      if u < Length(s1) then
        s1[u + 1] := ';'
      else
        s1 := s1 + ';';
    end
    else
      if AnsiLastChar(s1)[0] <> ';' then s1 := s1 + ';';
    if IsCommented then s1 := '//' + s1;
    ts.Strings[x] := s1;
  end;
end;

// Load ZipMsg.h convert lines to format of .rc file
procedure TForm1.PrepareZipMsg;
var
  n, l : Integer;
  s1, s2 : String;
begin
  Z_MSG.LoadFromFile(H_File);

  n := 0;
  while n < Z_MSG.Count do
  begin
    // remove lines which not contain #define
    s1 := Trim(Z_MSG.Strings[n]);
    l := AnsiPos('#define', s1);
    if l = 0 then
    begin
      Z_MSG.Delete(n);
      continue;
    end;

    // remove '#define ' text
    Delete(s1, l, 8);
    s1 := Trim(s1);

    // find end code name
    for l := l to Length(s1) do
      if not IsAlNum(s1[l]) then break;

    // check for base grup : ??_BASE, if true remove from list
    s2 := AnsiUpperCase(GetRcCode(s1));
    if Copy(s2, 3, Length(s2)) = '_BASE' then
    begin
      Z_MSG.Delete(n);
      continue;
    end;

    // if end code name >= end of line then remove line
    if l >= Length(s1) then
    begin
      Z_MSG.Delete(n);
      continue;
    end;

    // force code name and code number gap to be ' '
    s1[l] := ' ';
    inc(l);

    // remove extra white space chars from code name to code number
    while l < Length(s1) do
      if not IsAlNum(s1[l]) then
        Delete(s1, l, 1)
      else
        break;
    s1 := Trim(s1);

    // convert line to rc line format
    // From: CodeName CodeNumber
    //   To: CodeName,"CodeName = CodeNumber";
    // From: //CodeName CodeNumber
    //   To: //CodeName,"CodeName = CodeNumber";
    s2 := Copy(s1, AnsiPos(' ', s1) + 1, Length(s1));
    s1 := Copy(s1, 1, AnsiPos(' ', s1) - 1);
    Z_MSG.Strings[n] := s1 + ',"' + GetRcCode(s1) + ' = ' + s2 + '";';
    inc(n);
  end;
end;

// find line number where to insert new code
function TForm1.FindEndGrupCode(sl : TStringList; s : String) : Integer;
var
  n : Integer;
  s1 : String;
begin
  s1 := Copy(s, 1, 3); // block code identifier

  // find start block identifier
  for n := 0 to sl.Count -1 do
    if s1 = Copy(GetRcCode(sl.Strings[n]), 1, 3) then break;

  // find end block identifier
  for n := n to sl.Count - 1 do
    if s1 <> Copy(GetRcCode(sl.Strings[n]), 1, 3) then break;

  if n >= sl.Count then  // grup block not found, find end string table
    for n := sl.Count - 1 downto 0 do
      if Trim(sl.Strings[n]) = '}' then break;

  Result := n;
end;

// find line number where to insert new code
function TForm1.IsAlNum(c : char) : Boolean;
begin
  Result := false;
  if ((c >= '0') and (c <= '9')) or
     ((c >= 'A') and (c <= 'Z')) or
     ((c >= 'a') and (c <= 'z')) or
     (c = '_') then Result := true;
end;

// Load image from file if exists to bitbutton
procedure TForm1.LoadImage(tbb : TBitBtn; s : String);
begin
  if FileExists(s) then
    try
      tbb.Glyph.LoadFromFile(s);
    except
    end;
end;

// IniFile : Read String
function TForm1.IniFileRS(Section : String; Key : String; Def : String) : String;
begin
  bIniErr := false;
  Result := pIniFile.ReadString(Section, Key, #8);
  if Result <> #8 then exit;
  bIniErr := true;
  Result := Def;
end;

// IniFile : Read Boolean
function TForm1.IniFileRB(Section : String; Key : String; Def : Boolean) : Boolean;
begin
  Result := pIniFile.ReadBool(Section, Key, Def);
end;

// IniFile : Read Integer
function TForm1.IniFileRI(Section : String; Key : String; Def : Integer) : Integer;
begin
  Result := pIniFile.ReadInteger(Section, Key, Def);
  if Result <= 0 then Result := Def;
end;

// IniFile : Write String
procedure TForm1.IniFileWS(Section : String; Key : String; Value : String);
begin
  pIniFile.WriteString(Section, Key, Value);
end;

// IniFile : Write Boolean
procedure TForm1.IniFileWB(Section : String; Key : String; Value : Boolean);
begin
  pIniFile.WriteBool(Section, Key, Value);
end;

// IniFile : Write Integer
procedure TForm1.IniFileWI(Section : String; Key : String; Value : Integer);
begin
  pIniFile.WriteInteger(Section, Key, Value);
end;

end.

