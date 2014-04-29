unit MakeRes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,
  Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    btnMakeBin: TButton;
    Button2: TButton;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edDll: TEdit;
    edFiles: TEdit;
    btnHelp: TButton;
    procedure btnMakeBinClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
  private
    fDllPath: String;
    fRCPath: String;
    function GetUnzBuild: Integer;
    function GetZipBuild: Integer;
    { Private declarations }
    function GetBuild(Zip: Boolean): Integer;
    function GetDllPath: String;
    function GetRCPath: String;
  public
    property DllPath: String read GetDllPath;// write fDllPath;
    property RCPath: String read GetRCPath;// write fRCPath;
    property UnzBuild: Integer read GetUnzBuild;
    property ZipBuild: Integer read GetZipBuild;
  protected
    function CompStreams(strm1, strm2: TStream): Integer;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses ZipMsg, ShellApi, CLZ77, ELZ77, ZipUtils;

{$R *.dfm}

procedure TForm1.btnMakeBinClick(Sender: TObject);
var
  fs, fo: TFileStream;
  fm: TMemoryStream;
  i: Cardinal; 
  r: Integer;
  UVer, ZVer: Integer;
  RCFile: TextFile;
  ZName, UName: String;
begin
  UVer := UnzBuild;
  Memo1.Lines.Add(Format('UnzDll = %d.%d.%d.%d',
    [UVer div 10000, (UVer mod 10000) div 100,
    (UVer mod 100) div 10, UVer mod 10]));
  if UVer < 17800 then
  begin
    Memo1.Lines.Add('UnzDll is too old!');
    exit;
  end;
  ZVer := ZipBuild;
  Memo1.Lines.Add(Format('ZipDll = %d.%d.%d.%d',
    [ZVer div 10000, (ZVer mod 10000) div 100,
    (ZVer mod 100) div 10, ZVer mod 10]));
  if ZVer < 17800 then
  begin
    Memo1.Lines.Add('ZipDll is too old!');
    exit;
  end;
  AssignFile(RCFile, PathConcat(RCPath, 'resdlls.rc'));
  Rewrite(RCFile);
  Writeln(RCFile, '/* ResDlls.rc              */');
  Writeln(RCFile, '/*  machine generated      */');
  Writeln(RCFile, '/*   Do NOT edit           */');
  Writeln(RCFile, '/* ZipMaster 1.78.2.2      */');
  Writeln(RCFile, '/* Copyright (c) 2005      */');
  Writeln(RCFile);
  Writeln(RCFile, '#define  RDLL_Zip  11605');
  Writeln(RCFile, '#define  RDLL_Unz  11606');
  Writeln(RCFile, '#define  RDLL_ZVer 11607');
  Writeln(RCFile, '#define  RDLL_UVer 11608');
  Writeln(RCFile);
  Writeln(RCFile,
    'RDLL_Zip BinFile LOADONCALL MOVEABLE DISCARDABLE "zipdll.bin"');
  Writeln(RCFile);
  Writeln(RCFile,
    'RDLL_Unz BinFile LOADONCALL MOVEABLE DISCARDABLE "unzdll.bin"');
  Writeln(RCFile);
  Writeln(RCFile, 'STRINGTABLE {');
  Writeln(RCFile, '	RDLL_ZVer, "', ZVer, '"');
  Writeln(RCFile, '	RDLL_UVer, "', UVer, '"');
  Writeln(RCFile, '}');
  CloseFile(RCFile);
  fs := NIL;
  fo := NIL;
  fm := NIL;
  ZName := '';
  UName := '';
  r := 0;
  try
    fs := TFileStream.Create(PathConcat(DllPath, 'ZipDll.dll'),
      fmOpenRead);
    Memo1.Lines.Add('ZipDll.dll = ' +
      DateTimeToStr(FileDateToDateTime(FileGetDate(fs.Handle))));
    Memo1.Lines.Add('ZipDll.dll ' + IntToStr(fs.size));
    ZName := PathConcat(RCPath, 'zipdll.bin');
    fo := TFileStream.Create(ZName, fmCreate);
    i := 2;
    fo.Write(i, 2);
    i := ZVer;
    fo.Write(i, 4);
    R := LZ77Compress(fo, fs);
    Memo1.Lines.Add('ZipDll.bin ' + IntToStr(fo.size));
    if r = 0 then
    begin
      fo.Position := 6;
      fm := TMemoryStream.Create;
      r := LZ77Extract(fm, fo);
      if r = 0 then
      begin
        r := CompStreams(fm, fs);
        if r <> 0 then
          Memo1.Lines.Add('file changed - does not match')
        else
          Memo1.Lines.Add('verifed');
      end
      else
        Memo1.Lines.Add('Could not expand file');
    end;
  finally
    FreeAndNil(Fs);
    FreeAndNil(fo);
    FreeAndNil(fm);
  end;
  if r <> 0 then
  begin
    if (ZName <> '') and FileExists(ZName) then
      DeleteFile(ZName);
    Memo1.Lines.Add('bad ZipDll.bin removed');
    exit;
  end;
  try
    fs := TFileStream.Create(PathConcat(DllPath, 'UnzDll.dll'),
      fmOpenRead);
    Memo1.Lines.Add('UnzDll.dll = ' +
      DateTimeToStr(FileDateToDateTime(FileGetDate(fs.Handle))));
    Memo1.Lines.Add('UnzDll.dll ' + IntToStr(fs.size));
    UName := PathConcat(RCPath, 'Unzdll.bin');
    fo := TFileStream.Create(UName, fmCreate);
    i := 2;
    fo.Write(i, 2);
    i := ZVer;
    fo.Write(i, 4);
    R := LZ77Compress(fo, fs);
    Memo1.Lines.Add('UnzDll.bin ' + IntToStr(fo.size)); 
    if r = 0 then
    begin
      fo.Position := 6;
      fm := TMemoryStream.Create;
      r := LZ77Extract(fm, fo);
      if r = 0 then
      begin
        r := CompStreams(fm, fs);
        if r <> 0 then
          Memo1.Lines.Add('file changed - does not match')
        else
          Memo1.Lines.Add('verifed');
      end
      else
        Memo1.Lines.Add('Could not expand file');
    end;
  finally
    fs.Free;
    fo.Free;
  end;
  if r <> 0 then
  begin
    if (UName <> '') and FileExists(UName) then
      DeleteFile(UName);
    Memo1.Lines.Add('bad UnzDll.bin removed');
  end
  else
    Memo1.Lines.Add('Finished ok');
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  SEInfo: TShellExecuteInfo;
  ExitCode: DWORD;
  Params: String;
  function HasFiles: Boolean;
  begin
    Result := false;
    if not FileExists(PathConcat(RCPath, 'ResDlls.rc')) then
      exit;                                    
    if not FileExists(PathConcat(RCPath, 'ZipDll.bin')) then
      exit;
    Result := FileExists(PathConcat(RCPath, 'UnzDll.bin'));
  end;
begin
  if not HasFiles then
  begin
    btnMakeBinClick(Sender);
    if not HasFiles then
    begin
      Memo1.Lines.Add('Failed to make Bin files - Aborted');
      exit;
    end;
  end;
     FillChar(SEInfo, SizeOf(SEInfo), 0);
    SEInfo.cbSize := SizeOf(TShellExecuteInfo);
    with SEInfo do
    begin
      fMask := SEE_MASK_NOCLOSEPROCESS;
      Wnd := Application.Handle;
      lpFile := PChar('BRCC32.exe');
      // ParamString can contain the application parameters.
      Params := '-32 -r ' +
        ' -fo ' + PathConcat(DllPath,'ResDlls.res') + '  ' +
        PathConcat(RCPath, 'ResDlls.rc');
      lpParameters := PChar(Params);
      //'-32 -r -fo ..\dll\ResDlls.res ResDlls.rc');
{
StartInString specifies the
name of the working directory.
If ommited, the current directory is used.
}
      //  lpDirectory := PChar(StartInString);
      nShow := {SW_SHOWNORMAL;} SW_HIDE;
      // avoid flashing of dos box
    end;
    if ShellExecuteEx(@SEInfo) then
    begin
      repeat
        Application.ProcessMessages;
        GetExitCodeProcess(SEInfo.hProcess, ExitCode);
      until (ExitCode <> STILL_ACTIVE) or Application.Terminated;
      Memo1.Lines.Add('+++ BRC32 terminated +++');
    end
    else
      ShowMessage('Error starting BRC32!');
end;

function TForm1.CompStreams(strm1, strm2: TStream): Integer;
const
  BiteSize = 256;
var
  bytesDone, size1, size2: Cardinal;
  buf1, buf2: array[0..BiteSize - 1] of Char;
  bytes, i: Cardinal;
begin
  Result := -1;
  bytesDone := 0;
  size1 := Cardinal(strm1.Size);
  size2 := Cardinal(strm2.Size);
  if Size1 <> size2 then
    exit;
  Strm1.Position := 0;
  Strm2.Position := 0;
  Result := 0;
  while bytesDone < size1 do
  begin
    bytes := strm1.Read(buf1[0], BiteSize);
    if bytes < 1 then
    begin
      Result := -2;
      break;
    end;
    strm2.ReadBuffer(buf2[0], bytes);
    for i := 0 to pred(bytes) do
    begin
      if buf1[i] <> buf2[i] then
      begin
        inc(Result);
//        Memo1.Lines.Add(Format('%6d %4X %2x %2x', [Result,
//          Cardinal((BytesDone + i) and $FFFF),
//          Integer(buf1[i]), Integer(buf2[i])]));
      end;
    end;
    inc(BytesDone, bytes);
  end;
end;

function TForm1.GetUnzBuild: Integer;
begin
  Result := GetBuild(False);
end;

function TForm1.GetZipBuild: Integer;
begin
  Result := GetBuild(True);
end;

function TForm1.GetBuild(Zip: Boolean): Integer;
const
  Names: array [False..True] of String =
    ('UnzDll.Dll', 'ZipDll.dll');
  Funcs: array [False..True] of String =
    ('GetUnzDllPrivVersion', 'GetZipDllPrivVersion');
var
  hndl: HWND;
  PrivFunc:

  function: DWord; STDCALL;
  OldMode: Cardinal;
begin
  Result := 0;
  oldMode := SetErrorMode(SEM_FAILCRITICALERRORS or
    SEM_NOGPFAULTERRORBOX);
  try
    hndl := LoadLibrary(PChar(PathConcat(DllPath, names[zip])));
    if hndl > HInstance_Error then
    begin
      @PrivFunc := GetProcAddress(hndl, PChar(Funcs[Zip]));
      if @PrivFunc <> NIL then
        Result := PrivFunc;
      FreeLibrary(hndl);
    end;
  finally
    SetErrorMode(oldMode);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  fRCPath := '..\..\VCL\';
  fDllPath := '..\..\Dll\';
end;

function TForm1.GetDllPath: String;
begin
  Result := edDll.Text;
  if (Result = '') {or not DirExists(Result)} then
  begin
    Result := '..\..\Dll\';
    edDll.Text := Result;
  end;
end;

function TForm1.GetRCPath: String;
begin
  Result := edFiles.Text;
  if (Result = '') {or not DirExists(Result)} then
  begin
    Result := '..\..\VCL\';
    edFiles.Text := Result;
  end;
end;

procedure TForm1.btnHelpClick(Sender: TObject);
begin
  with Memo1.Lines do
  begin
    Add('To make the files for ResDlls.res (the dlls stored as resources)');
    Add('1. Set Path of Dlls to path of current dlls');
    Add('2. Set Path for Files to where the files should go');
    Add('3. Push "Make Bin Files" to do it');
    Add(' ');
    Add('To compile the resource (.res) file');
    Add(' push "Make Res File"');
    Add('');
    Add('To bind the Dlls to your application as resources');
    Add('1. Make them');
    Add('2. put them with your application source files so the IDE can find them');
    Add('3. Add them to your project');
    Add(' a: Add the ResDlls.rc file using the project manager');
    Add('or');
    Add(' b: Add the following line project source');
    Add('    {$R resdlls.res resdlls.rc}');
    Add('    in most versions of the Delphi you can also add the compiled resources');
    Add('    {$R resdlls.res}');
  end;
end;

end.

