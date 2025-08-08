unit UnitDMRotas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.JSON, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.Net.HttpClient,
  System.Net.HttpClientComponent, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.Net.URLClient, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,UnitConnection, FireDAC.Stan.Async, FireDAC.DApt;


type
  TdmRotas = class(TForm)
    DataSource1: TDataSource;
    QRotas: TFDQuery;
    QRotaspontos: TMemoField;
    QRotasnome_linha: TStringField;
    QRotasvalor: TBCDField;
    QRotasdescricao: TMemoField;
    QRotasnome_rota: TStringField;
    QInsertRotas: TFDQuery;
  private
    { Private declarations }

  public
    { Public declarations }
    procedure initQRota;
    function  SalvarRota(Descricao, nome_rota ,pontos: string;id_linha,id_empresa:integer):string;

  end;

var
  dmRotas: TdmRotas;

implementation

{$R *.dfm}

{ TdmRotas }
procedure TDMrotas.initQRota;
begin
  QRotas.close;
  QRotas.Open;
end;
function TDMRotas.SalvarRota(Descricao, nome_rota ,pontos: string;id_linha,id_empresa:integer):string;
begin
  QInsertRotas.SQL.Text :=
    'INSERT INTO rota (descricao, nome_rota, pontos, id_linha, id_empresa) ' +
    'VALUES (:Descricao, :NomeRota, :Pontos, :IdLinha, :IdEmpresa)';

  QInsertRotas.ParamByName('Descricao').AsString := Descricao;
  QInsertRotas.ParamByName('NomeRota').AsString := nome_rota;
  QInsertRotas.ParamByName('Pontos').AsString := Pontos;
  QInsertRotas.ParamByName('IdLinha').AsInteger := Id_Linha;
  QInsertRotas.ParamByName('IdEmpresa').AsInteger := Id_Empresa;

  QInsertRotas.ExecSQL;

  result := 'Rota: ' + nome_rota + 'criada com sucesso'
end;
end.

