unit UnitConsultaUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Buttons,UnitDMEmpresa,UnitDMUsuarios,UnitDMUsuarios2;

type
  TFormConsultaUsuario = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Button2: TButton;
    DBNavigator1: TDBNavigator;
    DBLookupComboBox1: TDBLookupComboBox;
    ComboBox1: TComboBox;
    Label3: TLabel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormConsultaUsuario: TFormConsultaUsuario;

implementation

{$R *.dfm}

procedure TFormConsultaUsuario.Button1Click(Sender: TObject);
begin
  DMUsuarios2.InitQUsuario;
end;

procedure TFormConsultaUsuario.Button2Click(Sender: TObject);
var
  Usuario, senha:  string;
  id_empresa: Integer;
  itemSelecionado,role: string;
begin

    // Captura os dados dos campos
    Usuario := Trim(Edit1.Text);
    senha := Trim(Edit2.Text);

    Role:= ComboBox1.Text;



    // Extrai o ID da linha a partir do ComboBox (esperando "1 - Nome da Linha")
    itemSelecionado := DBLookupComboBox1.Text;
    if itemSelecionado = '' then
      raise Exception.Create('Selecione uma linha.');

    id_empresa := DBLookupComboBox1.KeyValue;
    if id_empresa = -1 then
      raise Exception.Create('ID da empresa inválido.');

    // Chama o método PostRota (empresa com id fixo = 1)
   ShowMessage(DMUsuarios2.SalvarUsuario(Usuario, senha ,Role,id_empresa));

    // Atualiza a grid após salvar
    DMUsuarios2.InitQUsuario;



    // Limpa os campos do formulário
    Edit1.Clear;
    Edit2.Clear;

end;

procedure TFormConsultaUsuario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DMEmpresa.QEmpresaCombobox.close;
   DMUsuarios2.QUsuario.close;
end;

procedure TFormConsultaUsuario.FormShow(Sender: TObject);
begin
  DMEmpresa.InitQEmpresaCombobox;
end;

end.
