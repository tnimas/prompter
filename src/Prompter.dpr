program Prompter;

uses
  Forms,
  UnitObrabotka in 'UnitObrabotka.pas' {Form1},
  Unitinfo in 'Unitinfo.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
