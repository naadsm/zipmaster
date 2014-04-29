unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ZipMstr, ZipUtils;

type
  TMainForm = class(TForm)
    ZipMaster: TZipMaster;
    Panel1: TPanel;
    Memo1: TMemo;
    AddBtn: TButton;
    ExtBtn: TButton;
    ContentBtn: TButton;
    procedure AddBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ExtBtnClick(Sender: TObject);
    procedure ZipMasterSetAddName(Sender: TObject; var FileName: String;
      const ExtName: String; var IsChanged: Boolean);
    procedure ZipMasterSetExtName(Sender: TObject; var FileName: String;
      var IsChanged: Boolean);
    procedure ZipMasterExtractOverwrite(Sender: TObject; ForFile: String;
      IsOlder: Boolean; var DoOverwrite: Boolean; DirIndex: Integer);
    procedure ContentBtnClick(Sender: TObject);
  private
    { Private declarations }
    SampleZipName: string;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  SampleZipName := ExtractFilePath(Application.ExeName) + 'samples.zip';
end;

procedure TMainForm.AddBtnClick(Sender: TObject);
begin
    // create an archive from all the files in this demo
  // filenames will be changed in the OnsetAddName event
  With ZipMaster Do
  begin
    ZipFileName := SampleZipName;
    AddOptions := [];
    AddOptions := AddOptions + [AddDirNames];
    FSpecArgs.Clear;
    FSpecArgs.Add(ExtractFilePath(Application.ExeName) + '*.*');
    FSpecArgsExcl.Clear;
    FSpecArgsExcl.Add(ExtractFilePath(Application.ExeName) + '*.~*');
    FSpecArgsExcl.Add(ExtractFilePath(Application.ExeName) + '*.zip'); 
    FSpecArgsExcl.Add(ExtractFilePath(Application.ExeName) + '*.exe');
    Add;
  end;
end;

procedure TMainForm.ExtBtnClick(Sender: TObject);
begin
 // extract the files from the archive and ask to overwrite when newer
  // filenames will be changed in the OnsetExtName event
  if not FileExists(SampleZipName) then
  begin
    Memo1.Lines.Add('************ ERROR ***********');
    Memo1.Lines.Add(SampleZipName + ' does not exists- create it first');
    exit;
  end;
  with ZipMaster do
  begin
    ZipFileName := SampleZipName;
    ExtrBaseDir := ExtractFilePath(Application.ExeName);
    ExtrOptions := [];
    ExtrOptions := ExtrOptions + [ExtrDirNames];
    FSpecArgs.Clear;   // extract all files
    Extract;
  end;
end;

procedure TMainForm.ZipMasterSetAddName(Sender: TObject;
  var FileName: String; const ExtName: String; var IsChanged: Boolean);
var
  OrigFileName: string;
  Drive: string;
begin
  // for each file add the drive letter to the filespec in format
  // [?]/filespec  were ? is the drive letter
  Drive := ExtractFileDrive(ExtName);
  // following line is only for showing the result in the demo and is not needed
  OrigFileName := FileName;
  FileName := '[' + Drive[1] + ']\' + FileName;
  IsChanged := true;
    // following line is only for showing the result in the demo and is not needed
  Memo1.Lines.Add(OrigFileName + ' is changed into : ' + FileName);
end;

procedure TMainForm.ZipMasterSetExtName(Sender: TObject;
  var FileName: String; var IsChanged: Boolean);

var
  drive: string;
  OrigFileName: string;
begin
  if (FileName[1] = '[') and (FileName[3] = ']') and (FileName[4] = '\') then
  begin
     // the filename probably starts with a drive spec
    drive := FileName[2] + ':\';
     // following line is only for showing the result in the demo and is not needed
    OrigFileName := FileName;

    FileName := drive + Copy(FileName,5, Length(FileName) - 4);
    IsChanged := true;
      // following line is only for showing the result in the demo and is not needed
    Memo1.Lines.Add(OrigFileName + ' is changed into : ' + FileName);
  end
end;

procedure TMainForm.ZipMasterExtractOverwrite(Sender: TObject;
  ForFile: String; IsOlder: Boolean; var DoOverwrite: Boolean;
  DirIndex: Integer);

var
  q: string;
  DefBtn: Cardinal;
  res: Integer;
begin
  if IsOlder then // Only when existing file is newer(or equal) we will ask what to do.
  begin
    q := 'Do you want to overwrite the file:\n\r' + ForFile;
    if DoOverwrite = true then
      DefBtn :=  MB_DEFBUTTON1
    else
      DefBtn := MB_DEFBUTTON2;
    res := MessageBox(Handle, pChar(q), 'Confirm', MB_YESNO or MB_ICONQUESTION or DefBtn);
    if res = ID_YES then
      DoOverwrite := true
    else
      DoOverwrite := false;
  end
end;

procedure TMainForm.ContentBtnClick(Sender: TObject);
var
  i: Integer;
begin
  if not FileExists(SampleZipName) then
  begin
    Memo1.Lines.Add('************ ERROR ***********');
    Memo1.Lines.Add(SampleZipName + ' does not exists- create it first');
    exit;
  end;
  ZipMaster.ZipFileName := SampleZipName; // to execute list
  Memo1.Lines.Add(' ');
  Memo1.Lines.Add('Content of ' + SampleZipName + ' = ');
  Memo1.Lines.Add(' ');
  for i := 0 to (ZipMaster.Count - 1) do
    Memo1.Lines.Add(ZipMaster.DirEntry[i]^.Filename);
end;

end.
