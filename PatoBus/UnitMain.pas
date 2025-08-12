unit UnitMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,UnitLogin, Vcl.Menus, Vcl.ToolWin,UnitConsultaLinha,UnitConsultaRotas,
  UnitConsultaOnibus,UnitConsultaParadas,
  Vcl.ComCtrls, UnitSessao,UnitConsultaUsuario;

type
  TFormMain = class(TForm)
    MainMenu1: TMainMenu;
    TConsultas: TMenuItem;
    TConsultaLinhas: TMenuItem;
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    TConsultaParadas: TMenuItem;
    TConsultaUsuarios: TMenuItem;
    TConsultaRotas: TMenuItem;
    TOnibus: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TConsultaLinhasClick(Sender: TObject);
    procedure TConsultaRotasClick(Sender: TObject);
    procedure TOnibusClick(Sender: TObject);
    procedure TConsultaParadasClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TConsultaUsuariosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

procedure TFormMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Application.Terminate;
end;

procedure TFormMain.FormShow(Sender: TObject);
begin
  TConsultaUsuarios.Visible := SessaoUsuario.Adm;
end;

procedure TFormMain.TConsultaLinhasClick(Sender: TObject);
begin
    if not Assigned(FormConsultaLinha) then
    Application.CreateForm(TFormConsultaLinha, FormConsultaLinha);

    FormConsultaLinha.Show;
end;

procedure TFormMain.TConsultaParadasClick(Sender: TObject);
begin

  if not Assigned(FormConsultaParadas) then
    Application.CreateForm(TFormConsultaRotas, FormConsultaParadas);

    FormConsultaParadas.Show;

end;

procedure TFormMain.TConsultaRotasClick(Sender: TObject);
begin
      if not Assigned(FormConsultaRotas) then
    Application.CreateForm(TFormConsultaRotas, FormConsultaRotas);

    FormConsultaRotas.Show;
end;

procedure TFormMain.TConsultaUsuariosClick(Sender: TObject);
begin
    if not Assigned(FormConsultaUsuario) then
      Application.CreateForm(TFormConsultaRotas, FormConsultaUsuario);

    FormConsultaUsuario.Show;
end;

procedure TFormMain.TOnibusClick(Sender: TObject);
begin
      if not Assigned(FormConsultaOnibus) then
    Application.CreateForm(TFormConsultaRotas, FormConsultaOnibus);

    FormConsultaOnibus.Show;
end;

end.
