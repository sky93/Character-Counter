program SMNsoft_Character_Counter ;

uses
  FMX.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  FMX.ConstrainedForm in 'FMX.ConstrainedForm.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
