program SFXDemo2;

uses
  Forms,
  demo2_1 in 'demo2_1.pas' {Form1},
  demo2_2 in 'demo2_2.pas' {dlgConvertToSFX};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
