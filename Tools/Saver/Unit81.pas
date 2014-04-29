unit Unit81;

interface

uses
  Windows, Messages, SysUtils, {Variants,} Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ZipMstr, StdCtrls, ExtCtrls, ZipWrkr, Menus, Spin;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    btnClose: TButton;
    cbChanges: TCheckBox;
    Label1: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    cbDemos: TCheckBox;
    cbDllSrc: TCheckBox;
    cbSFX: TCheckBox;
    cbHelp: TCheckBox;
    cbGrid: TCheckBox;
    cbLanguage: TCheckBox;
    ProgressBar1: TProgressBar;
    cbHelpSrc: TCheckBox;
    cbAll: TCheckBox;
    cbTools: TCheckBox;
    cbDlls: TCheckBox;
    Zip1: TZipMaster;
    cbText: TCheckBox;
    btnBuild: TButton;
    cbClean: TCheckBox;
    cbFull: TCheckBox;
    SpinEdit1: TSpinEdit;
    DateTimePicker1: TDateTimePicker;
    btnAll: TButton;
    btnNone: TButton;
    cbVCL: TCheckBox;
    Label2: TLabel;
    procedure btnCloseClick(Sender: TObject);
    procedure Zip1Message(Sender: TObject; ErrCode: Integer; Message: String);
    procedure ZipMaster1Progress(Sender: TObject; TotalSize: Integer; PerCent: Integer);
    procedure Zip1TotalProgress(Sender: TObject; TotalSize, PerCent: Integer);
    procedure ZipMaster1DirUpdate(Sender: TObject);
    procedure btnBuildClick(Sender: TObject);
    procedure btnAllClick(Sender: TObject);
    procedure btnNoneClick(Sender: TObject);
    procedure cbChangesClick(Sender: TObject);
  private
    { Private declarations }
    fRoot: String;
    procedure CheckAll(state: Boolean);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    { Public declarations }
    procedure Show(const s: String);
  end;

var
  Form1: TForm1;

implementation

uses ZipUtils;

{$R *.dfm}

{$R '..\dll\ResDlls.res'}

const
  EmptyText = 'click to select file';

procedure TForm1.btnCloseClick(Sender: TObject);
begin 
  Close;
end;

procedure TForm1.Zip1Message(Sender: TObject; ErrCode: Integer; Message: String);
begin
  if ErrCode = 0 then
    Memo1.Lines.Add(  Message )
  else
    Memo1.Lines.Add('err:' + IntToStr(ErrCode) + ' "' + Message + '"');
end;

procedure TForm1.ZipMaster1Progress(Sender: TObject; TotalSize: Integer;
  PerCent: Integer);
begin
  ProgressBar1.Position := PerCent;
end;

constructor TForm1.Create(AOwner: TComponent);
begin
  inherited;
  //  Edit1.Text := EmptyText;
  Zip1.OnMessage := Zip1Message;
  Zip1.OnTotalProgress := ZipMaster1Progress;
  ChDir(GetCurrentDir + '\..\..');
  fRoot := GetCurrentDir + '\';
end;

destructor TForm1.Destroy;
begin
  inherited;
end;

procedure TForm1.Zip1TotalProgress(Sender: TObject; TotalSize, PerCent: Integer);
begin
  ProgressBar1.Position := PerCent;
end;

procedure TForm1.ZipMaster1DirUpdate(Sender: TObject);
const
  spc = '                                ';
var
  i, d:    Integer;
  f, s, u: String;
begin
  for i := 0 to pred(Zip1.Count) do
  begin
    f := Zip1[i].FileName;
    d := Zip1[i].DateTime;
    u := ' ';
    if FileExists(fRoot + f) then
    begin
      if (FileAge(fRoot + f) > (d + 4)) then
        u := '+';  // need to update
    end
    else
      u := '-'; // removed
    if Length(spc) > Length(f) then
      s := copy(spc, Length(f), 80);
    Memo1.Lines.Add(format('%s %s %s%s',
      [f, s, u, DateTimeToStr(FileDateToDateTime(d))]));
  end;
end;

procedure TForm1.btnBuildClick(Sender: TObject);
var
  //  readme: String;
  fAge:    TDateTime;
  //  fname:   String;
  bname:   String;
  dname:   String;
  uSuffix: String;

  procedure _Common;
  begin
    if cbText.Checked then
      Zip1.FSpecArgs.Add('|*.txt')
    else
      Zip1.FSpecArgs.Add('|License.txt');

    Zip1.FSpecArgsExcl.Add('*.*~*');
    Zip1.FSpecArgsExcl.Add('*.bak');
//    Zip1.FSpecArgsExcl.Add('*.bin');
    Zip1.FSpecArgsExcl.Add('*.dsk');
    Zip1.FSpecArgsExcl.Add('*.gid');
    Zip1.FSpecArgsExcl.Add('*.map');
    Zip1.FSpecArgsExcl.Add('*.old');
    Zip1.FSpecArgsExcl.Add('*.tds');
    Zip1.FSpecArgsExcl.Add('*.dcu');
    Zip1.FSpecArgsExcl.Add('|*.zip');
    Zip1.FSpecArgsExcl.Add('*.x');
    Zip1.FSpecArgsExcl.Add('*.zzz');
    Zip1.FSpecArgsExcl.Add('*temp*.*');
    Zip1.FSpecArgsExcl.Add('*temp*.*');
    Zip1.FSpecArgsExcl.Add('*test*.*');
    Zip1.FSpecArgsExcl.Add('c*.txt');
    Zip1.FSpecArgsExcl.Add('* copy of*.*');
    Zip1.FSpecArgsExcl.Add('demo*\*.exe');
    Zip1.FSpecArgsExcl.Add('dll\*.exe');
    Zip1.FSpecArgsExcl.Add('vcl\*.exe');
  end;

  procedure _VCL;
  begin                          
    Zip1.FSpecArgs.Add('sfx\*.bin');
    Zip1.FSpecArgs.Add('vcl\*.pas');
    Zip1.FSpecArgs.Add('vcl\*.dcr');
    Zip1.FSpecArgs.Add('vcl\*.inc');
    Zip1.FSpecArgs.Add('vcl\*.res');
    Zip1.FSpecArgs.Add('vcl\*.rc');
    Zip1.FSpecArgs.Add('vcl\*.h');
    Zip1.FSpecArgs.Add('packages\zip*.pas');
    Zip1.FSpecArgs.Add('packages\zmstr*.dpk');
    Zip1.FSpecArgs.Add('packages\zmstr*.bdsproj');
    Zip1.FSpecArgs.Add('packages\zmstr*.bdsproj.local');
    Zip1.FSpecArgs.Add('packages\zmstr*.res');
  end;
  
  procedure _Grid;
  begin
    Zip1.FSpecArgs.Add('grid\*.pas');
    Zip1.FSpecArgs.Add('grid\*.dcr');
    Zip1.FSpecArgs.Add('grid\*.res');
    Zip1.FSpecArgs.Add('grid\*.dfm');
    Zip1.FSpecArgs.Add('packages\zm_grid*.dpk');
    Zip1.FSpecArgs.Add('packages\zm_grid*.res');
    Zip1.FSpecArgs.Add('packages\sortgridreg.pas');
  end;

  procedure _Demos;
  begin
    Zip1.FSpecArgsExcl.Add('Demo?\*.ddp');
    Zip1.FSpecArgsExcl.Add('Demo?\*.dsk');
    Zip1.FSpecArgsExcl.Add('Demo?\*.exe');
    Zip1.FSpecArgsExcl.Add('Demo?\*.dcu');
    Zip1.FSpecArgsExcl.Add('Demo?\*.cfg');
    Zip1.FSpecArgsExcl.Add('Demo?\*.dof');  
    Zip1.FSpecArgsExcl.Add('Demo10\*.zip');
    Zip1.FSpecArgs.Add('Demo1\*.*');
    Zip1.FSpecArgs.Add('Demo2\*.*');
    Zip1.FSpecArgs.Add('Demo3\*.*');
    Zip1.FSpecArgs.Add('Demo4\*.*');
    Zip1.FSpecArgs.Add('Demo5\*.*');
    Zip1.FSpecArgs.Add('Demo6\*.*');
    Zip1.FSpecArgs.Add('Demo7\*.*');
    //    Zip1.FSpecArgs.Add('Demo8\*.*');
    Zip1.FSpecArgs.Add('Demo9\*.*');   
    Zip1.FSpecArgs.Add('Demo10\*.*');
    Zip1.FSpecArgs.Add('Demosfx\*.*');
    _Grid;
    //    cbGrid.Checked := True;
  end;

  procedure _Dlls;
  begin
    Zip1.FSpecArgs.Add('|dll\*.dll');
    Zip1.FSpecArgs.Add('|dll\*.res');
  end;

  procedure _Tools;
  begin
    Zip1.FSpecArgs.Add('Tools\*.*');
  end;

  procedure _DLLSrc;
  begin
    Zip1.FSpecArgs.Add('dll\ZipDll\*.*');
    Zip1.FSpecArgs.Add('dll\UnzDll\*.*');
  end;

  procedure _Help;
  begin
    Zip1.FSpecArgs.Add('Help\*.hlp');
    Zip1.FSpecArgs.Add('Help\*.cnt');
    Zip1.FSpecArgs.Add('Help\*.chm');
    //    Zip1.FSpecArgsExcl.Add('help\Web*.*');
  end;

  procedure _HelpSrc;
  begin
    Zip1.FSpecArgs.Add('HelpSrc\zipmaster.*');
    Zip1.FSpecArgs.Add('HelpSrc\*.zmf');
    Zip1.FSpecArgs.Add('HelpSrc\*.bmp');
  end;

  procedure _Language;
  begin
    Zip1.FSpecArgs.Add('Lang\*.*');
    Zip1.FSpecArgsExcl.Add('Lang\*.zip');
  end;

  procedure _SFX;
  begin
    Zip1.FSpecArgs.Add('SFX\*.bin');
  end;

  function DoBuild: Integer;
  begin
    Zip1.Add;
    Result := Zip1.ErrCode;
    Memo1.Lines.Add(IntToStr(Zip1.SuccessCnt) + ' files added');
    if Zip1.ErrCode <> 0 then
      Memo1.Lines.Add(Format('Error %d (%X) "%s"', [Zip1.ErrCode,
        Zip1.FullErrCode, Zip1.Message]));
    Memo1.Lines.Add(IntToStr(Zip1.SuccessCnt) + ' files');
    Memo1.Lines.Add('size = ' + IntToStr(Zip1.ZipFileSize));
  end;

  procedure Prepare(const fn: String; changes: Boolean = False);
  var
    f, m: String;
  begin
    f := dname + fn + '.zip';
    if cbClean.Checked and FileExists(f) then
    begin
      Show('Deleting ' + f);
      DeleteFile(f);
    end;
    Memo1.Lines.Add('Building  ' + f);
    Zip1.Clear;
    Zip1.ZipFileName := f;
    Zip1.RootDir := fRoot;
//zip1.FSpecArgs.Add('>>+');
    m := '';
    Zip1.AddOptions := [AddDirNames, AddRecurseDirs, AddUpdate, AddZipTime];
    if Changes then
    begin
      m := '  Updates since ' + DateTimeToStr(fAge);
      Zip1.AddOptions := Zip1.AddOptions + [AddFromDate];
      Zip1.AddFrom := fAge;
    end;
    Zip1.ZipComment := 'ZipMaster ' + ZIPMASTERVERSION +
      ' build ' + ZIPMASTERBUILD + '  ' + DateToStr(Date) + m;
    _Common;
  end;

  function Build_Base: Integer;
  begin
    BName := Format('%szm%d', [fRoot, ZIPMASTERVER]);
    Prepare(BName, False);
    _VCL;
    Result := DoBuild;
  end;

begin  // btnBuildClick
  BName := Format('%szm%d', [fRoot, ZIPMASTERVER]);
  dname := DelimitPath(fRoot, True) + 'tempZips\';
  ForceDirectory(dname);
  Memo1.Clear;
  Zip1.Clear;
  fAge := 0;
  Zip1.DLLDirectory := DelimitPath(fRoot, True) + 'DLL\';
  Zip1.Verbose := True;
  Zip1.Load_Zip_Dll;
  Zip1.Verbose := False;
  Memo1.Lines.Add('loaded ZipDll version ' + IntToStr(Zip1.Load_Zip_Dll));
  ProgressBar1.Visible := True;
  //  BuildBase;
  if cbFull.Checked then
  begin
    if cbAll.Checked then
    begin
      BName := Format('zipmaster%d', [ZIPMASTERVER]);
      Prepare(BName, False);
      _VCL;
      _Dlls;
      _SFX;
      _Demos;
      _Tools;
      _Help;
      _Helpsrc;
      _Language;
      _Dllsrc;
      DoBuild;
    end;
    BName := Format('zm%d', [ZIPMASTERVER]);
    if cbVCL.Checked then
    begin
      Prepare(BName + 'vcl' + uSuffix, false);
      _VCL;
      _Dlls;
      DoBuild;
    end;
    if cbDlls.Checked then
    begin
      Prepare(Format('dz%ddlls', [ZIPMASTERVER]), False);
      _Dlls;
      DoBuild;
    end;
    if cbGrid.Checked then
    begin
      Prepare(BName + 'grid', False);
      _Grid;
      DoBuild;
    end;
    if cbHelp.Checked then
    begin
      Prepare(BName + 'help', False);
      _Help;
      DoBuild;
    end;
    if cbHelpsrc.Checked then
    begin
      Prepare(BName + 'helpsrc', False);
      _HelpSrc;
      DoBuild;
    end;
    if cbDemos.Checked then
    begin
      Prepare(BName + 'Demos', False);
      _Demos;
      _Grid;
      DoBuild;
    end;
    if cbDllsrc.Checked then
    begin
      Prepare(Format('dz%ddllsrc', [ZIPMASTERVER]), False);
      _Dllsrc;
      DoBuild;
    end;
    if cbTools.Checked then
    begin
      Prepare(BName + 'tools', False);
      _Tools;
      DoBuild;
    end;
    if cbLanguage.Checked then
    begin
      Prepare(BName + 'lang', False);
      _Language;
      DoBuild;
    end;
  end;
  if cbChanges.Checked then
  begin
    fAge    := DateTimePicker1.DateTime;
    uSuffix := '_up' + SpinEdit1.Text;
    if cbAll.Checked then
    begin
      BName := Format('zipmaster%d%s', [ZIPMASTERVER, uSuffix]);
      Prepare(BName, true);
      _VCL;
      _Dlls;
      _Demos;
      _Tools;
      _Help;
      _Helpsrc;
      _Language;
      _Dllsrc;
      DoBuild;
    end;
    BName := Format('zm%d', [ZIPMASTERVER]);
    if cbVCL.Checked then
    begin
      Prepare(BName + 'vcl' + uSuffix, True);
      _VCL;
      _Dlls;
      DoBuild;
    end; 
    if cbDlls.Checked then
    begin
      Prepare(Format('dz%ddlls%s', [ZIPMASTERVER, uSuffix]), true);
      _Dlls;
      DoBuild;
    end;
    if cbGrid.Checked then
    begin
      Prepare(BName + 'grid' + uSuffix, True);
      _Grid;
      DoBuild;
    end;
    if cbHelp.Checked then
    begin
      Prepare(BName + 'help' + uSuffix, True);
      _Help;
      DoBuild;
    end;
    if cbHelpsrc.Checked then
    begin
      Prepare(BName + 'helpsrc' + uSuffix, True);
      _HelpSrc;
      DoBuild;
    end;
    if cbDemos.Checked then
    begin
      Prepare(BName + 'Demos' + uSuffix, True);
      _Demos;
      _Grid;
      DoBuild;
    end;
    if cbDllsrc.Checked then
    begin
      Prepare(Format('dz%ddllsrc%s', [ZIPMASTERVER, uSuffix]), True);
      _Dllsrc;
      DoBuild;
    end;
    if cbTools.Checked then
    begin
      Prepare(BName + 'tools' + uSuffix, True);
      _Tools;
      DoBuild;
    end;
    if cbLanguage.Checked then
    begin
      Prepare(BName + 'lang' + uSuffix, True);
      _Language;
      DoBuild;
    end;
  end;
  // all done
  Zip1.Unload_Zip_Dll;
  ProgressBar1.Visible := False;
end;

procedure TForm1.Show(const s: String);
begin
  Memo1.Lines.Add(s);
end;

procedure TForm1.btnAllClick(Sender: TObject);
begin
  CheckAll(True);
end;

procedure TForm1.btnNoneClick(Sender: TObject);
begin
  CheckAll(False);
end;

procedure TForm1.CheckAll(state: Boolean);
begin
  cbAll.Checked     := state;
  cbVCL.Checked     := state;
  cbDlls.Checked    := state;
  cbDllsrc.Checked  := state;
  cbDemos.Checked   := state;
  cbGrid.Checked    := state;
  cbHelp.Checked    := state;
  cbHelpsrc.Checked := state;
  cbTools.Checked   := state;
  cbSFX.Checked     := state;
  cbLanguage.Checked     := state;
end;

procedure TForm1.cbChangesClick(Sender: TObject);
begin
  Label1.Enabled := cbChanges.Checked;
  Label2.Enabled := cbChanges.Checked;
  SpinEdit1.Enabled := cbChanges.Checked;
  DateTimePicker1.Enabled := cbChanges.Checked;
end;

end.

