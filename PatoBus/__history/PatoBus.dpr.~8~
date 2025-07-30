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
  UnitDMLinhas in 'UnitDMLinhas.pas' {Form1},
  UnitDMRotas in 'UnitDMRotas.pas' {Form2},
  UnitDMParadas in 'UnitDMParadas.pas' {Form3},
  UnitDMUsuarios in 'UnitDMUsuarios.pas' {Form4};

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
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.Run;
    end
    else
      Application.Terminate;
  finally
    FormLogin.Free;
  end;
end.

