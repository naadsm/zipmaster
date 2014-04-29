program SaveZipMaster;

{$R '..\Lang\ZipMsgUS.res'}

uses
  Forms,
  Unit81 in 'Unit81.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

