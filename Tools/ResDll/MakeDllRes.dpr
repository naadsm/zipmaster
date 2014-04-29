program MakeDllRes;



uses
  Forms,
  MakeRes in 'MakeRes.pas' {Form1},
  CLZ77 in 'CLZ77.pas',
  ELZ77 in 'ELZ77.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

