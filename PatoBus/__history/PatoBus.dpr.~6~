program PatoBus;

uses
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Controls,
  UnitLogin in 'UnitLogin.pas' {FormLogin},
  UnitMain in 'UnitMain.pas' {FormMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  FormLogin := TFormLogin.Create(nil);
  try
    if FormLogin.ShowModal = mrOk then
    begin
      Application.CreateForm(TFormMain, FormMain);
      Application.Run;
    end
    else
      Application.Terminate;
  finally
    FormLogin.Free;
  end;
end.

