unit UnitConsultaRotas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, System.JSON, System.Net.HttpClient,
  UnitDMRotas;

type
  TFormConsultaRotas = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    ComboBox1: TComboBox;
     Splitter1: TSplitter;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox1DropDown(Sender: TObject);
  private
    { Private declarations }
    procedure FormatGridColumns;
  public
    { Public declarations }
  end;

var
  FormConsultaRotas: TFormConsultaRotas;

implementation

{$R *.dfm}

procedure TFormConsultaRotas.Button1Click(Sender: TObject);
begin
  // Chama o método LoadRotas do form dmRotas
  dmRotas.LoadRotas('2');  // Exemplo, passando o ID 2 para a API

  // Formatar as colunas do DBGrid
  FormatGridColumns;
end;

procedure TFormConsultaRotas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // Limpa o DataSet
  with dmRotas.FDMemTable1 do
  begin
    Close;
    FieldDefs.Clear;
    Fields.Clear;
  end;

  // Desconecta do DataSource e do Grid
  DBGrid1.DataSource := nil;
  dmRotas.DataSource1.DataSet := nil;

  // Libera o form da memória
  Action := caFree;
end;

procedure TFormConsultaRotas.FormCreate(Sender: TObject);
begin
  // Cria o formulário dmRotas, se ainda não existir
  if not Assigned(dmRotas) then
    dmRotas := TdmRotas.Create(Self);

  // Conecta o DBGrid ao DataSource do dmRotas
  if Assigned(dmRotas.DataSource1) then
    DBGrid1.DataSource := dmRotas.DataSource1;
end;

procedure TFormConsultaRotas.ComboBox1DropDown(Sender: TObject);
begin
   dmRotas.LoadLinhas(1, ComboBox1);  // Carrega as linhas da empresa 1 ao abrir o dropdown
end;

procedure TFormConsultaRotas.FormatGridColumns;
begin
  // Formatação das colunas do DBGrid
  if DBGrid1.Columns.Count >= 4 then
  begin
    DBGrid1.Columns[0].Title.Caption := 'Nome da Rota';
    DBGrid1.Columns[1].Title.Caption := 'Descrição';
    DBGrid1.Columns[2].Title.Caption := 'Nome da Linha';
    DBGrid1.Columns[3].Title.Caption := 'Valor';

    // Largura das colunas
    DBGrid1.Columns[0].Width := 100;
    DBGrid1.Columns[1].Width := 80;
    DBGrid1.Columns[2].Width := 130;
    DBGrid1.Columns[3].Width := 50;
  end;
end;

end.

