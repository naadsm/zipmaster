program RcUpd;

uses
  Forms,
  RcUpd1 in 'RcUpd1.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'RcUpd';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
