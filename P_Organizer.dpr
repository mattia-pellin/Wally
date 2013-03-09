program P_Organizer;

uses
  Vcl.Forms,
  U_Organizer in 'U_Organizer.pas' {F_Organizer},
  U_Customer in 'U_Customer.pas' {F_Customer},
  U_Functions in 'U_Functions.pas',
  U_Classes in 'U_Classes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TF_Organizer, F_Organizer);
  Application.CreateForm(TF_Customer, F_Customer);
  Application.Run;
end.
