program PatoBus;

uses
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Controls,
  UnitLogin in 'UnitLogin.pas' {FormLogin},
  UnitMain in 'UnitMain.pas' {FormMain},
  UnitConsultaLinha in 'UnitConsultaLinha.pas' {FormConsultaLinha},
  Vcl.Themes,
  Vcl.Styles,
  UnitDMLinhas in 'UnitDMLinhas.pas' {DMlinhas},
  UnitDMRotas in 'UnitDMRotas.pas' {DMRotas},
  UnitDMParadas in 'UnitDMParadas.pas' {Form3},
  UnitDMUsuarios in 'UnitDMUsuarios.pas' {Form4},
  UnitConsultaRotas in 'UnitConsultaRotas.pas' {FormConsultaRotas};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  FormLogin := TFormLogin.Create(nil);
  try
    if FormLogin.ShowModal = mrOk then
    begin
      Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormConsultaLinha, FormConsultaLinha);
  Application.CreateForm(TDMlinhas, DMlinhas);
  Application.CreateForm(TDMRotas, DMRotas);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TFormConsultaRotas, FormConsultaRotas);
  Application.Run;
    end
    else
      Application.Terminate;
  finally
    FormLogin.Free;
  end;
end.

