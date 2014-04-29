program Demo9;

uses
  Forms,
  Main9_1 in 'Main9_1.pas' {Form1},
  ZThrd in 'ZThrd.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

