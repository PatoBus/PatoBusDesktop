unit UnitDMRotas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Net.URLClient,
  System.Net.HttpClient, System.Net.HttpClientComponent, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, System.JSON;

type
  TdmRotas = class(TForm)
    NetHTTPClient1: TNetHTTPClient;
    FDMemTable1: TFDMemTable;
    DataSource1: TDataSource;
  private
    { Private declarations }
    procedure PopulateMemTableWithData(const JSONArray: TJSONArray);
  public
    { Public declarations }
    procedure LoadRotas(const id: String);
  end;

var
  dmRotas: TdmRotas;

implementation

{$R *.dfm}

{ TdmRotas }

procedure TdmRotas.PopulateMemTableWithData(const JSONArray: TJSONArray);
var
  JSONValue: TJSONValue;
  Item, Linha, Empresa: TJSONObject;
begin
  // Recriação segura do FDMemTable1
  with FDMemTable1 do
  begin
    Active := False;
    Close;
    FieldDefs.Clear;
    Fields.Clear;
    IndexDefs.Clear;

    FieldDefs.Add('rota_nome', ftString, 100);
    FieldDefs.Add('rota_descricao', ftString, 255);
    FieldDefs.Add('linha_nome', ftString, 100);
    FieldDefs.Add('linha_valor', ftFloat);
    CreateDataSet;
    Open;
  end;

  // Preencher os dados
  for JSONValue in JSONArray do
  begin
    Item := JSONValue as TJSONObject;
    Linha := Item.GetValue<TJSONObject>('linha');
    Empresa := Linha.GetValue<TJSONObject>('empresa');

    with FDMemTable1 do
    begin
      Append;

      FieldByName('rota_nome').AsString := Item.GetValue<string>('nome');
      FieldByName('rota_descricao').AsString := Item.GetValue<string>('descricao');
      FieldByName('linha_nome').AsString := Linha.GetValue<string>('nome');
      FieldByName('linha_valor').AsFloat := Linha.GetValue<Double>('valor');
    end;
  end;
end;

procedure TdmRotas.LoadRotas(const id: String);
var
  Response: IHTTPResponse;
  JSONArray: TJSONArray;
begin
  try
    // Chama a API para obter as rotas
    Response := NetHTTPClient1.Get('http://localhost:8081/rotas/empresa/' + id);

    // Converte a resposta para JSON
    JSONArray := TJSONObject.ParseJSONValue(Response.ContentAsString) as TJSONArray;

    if not Assigned(JSONArray) then
      raise Exception.Create('Resposta JSON inválida.');

    // Popula o FDMemTable com os dados obtidos
    PopulateMemTableWithData(JSONArray);

    JSONArray.Free;

  except
    on E: Exception do
      ShowMessage('Erro ao consultar dados: ' + E.Message);
  end;
end;

end.

