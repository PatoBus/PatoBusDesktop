unit UnitDMLinhas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.Net.URLClient,
  System.Net.HttpClient, System.Net.HttpClientComponent, System.JSON;

type
  TDMlinhas = class(TForm)
    NetHTTPClient1: TNetHTTPClient;
    FDMemTable1: TFDMemTable;
    DataSource1: TDataSource;
  private
    procedure PopulateMemTableWithData(const JSONArray: TJSONArray);
  public
    procedure LoadLinhasComHorario;
  end;

var
  DMlinhas: TDMlinhas;

implementation

{$R *.dfm}

procedure TDMlinhas.PopulateMemTableWithData(const JSONArray: TJSONArray);
var
  i: Integer;
  JSONValue: TJSONValue;
  Item, Linha, Empresa, Horario: TJSONObject;
begin
  with FDMemTable1 do
  begin
    Active := False;
    Close;
    FieldDefs.Clear;
    Fields.Clear;
    IndexDefs.Clear;

    // Definição de todos os campos necessários
    FieldDefs.Add('id', ftInteger);
    FieldDefs.Add('id_linha', ftInteger);
    FieldDefs.Add('linha_nome', ftString, 100);
    FieldDefs.Add('linha_valor', ftFloat);
    FieldDefs.Add('id_empresa', ftInteger);
    FieldDefs.Add('empresa_nome', ftString, 100);
    FieldDefs.Add('empresa_cnpj', ftString, 20);
    FieldDefs.Add('id_horario', ftInteger);
    FieldDefs.Add('hora', ftString, 10);  // Ou ftTime se preferir

    CreateDataSet;
    Open;
  end;

  // Percorre o JSON de trás para frente para mostrar os dados mais recentes no topo
  for i := JSONArray.Count - 1 downto 0 do
  begin
    JSONValue := JSONArray.Items[i];
    Item := JSONValue as TJSONObject;
    Linha := Item.GetValue<TJSONObject>('linha');
    Empresa := Linha.GetValue<TJSONObject>('empresa');
    Horario := Item.GetValue<TJSONObject>('horario');

    with FDMemTable1 do
    begin
      Append;
      FieldByName('id').AsInteger := Item.GetValue<Integer>('id');
      FieldByName('id_linha').AsInteger := Linha.GetValue<Integer>('idLinha');
      FieldByName('linha_nome').AsString := Linha.GetValue<string>('nome');
      FieldByName('linha_valor').AsFloat := Linha.GetValue<Double>('valor');
      FieldByName('id_empresa').AsInteger := Empresa.GetValue<Integer>('idEmpresa');
      FieldByName('empresa_nome').AsString := Empresa.GetValue<string>('nome');
      FieldByName('empresa_cnpj').AsString := Empresa.GetValue<string>('cnpj');
      FieldByName('id_horario').AsInteger := Horario.GetValue<Integer>('id');
      FieldByName('hora').AsString := Horario.GetValue<string>('hora');
      Post;
    end;
  end;
end;

procedure TdmLinhas.LoadLinhasComHorario;
var
  Response: IHTTPResponse;
  JSONArray: TJSONArray;
  JsonStr: string;
begin
  try
    // Chama a API para obter os dados
    Response := NetHTTPClient1.Get('http://localhost:8081/linhas-horarios/empresa/1');

    // Pega o conteúdo da resposta como string
    JsonStr := Response.ContentAsString;
    ShowMessage(JsonStr)                                                            ;

    // Converte a resposta para JSON
    JSONArray := TJSONObject.ParseJSONValue(JsonStr) as TJSONArray;

    if not Assigned(JSONArray) then
      raise Exception.Create('Resposta JSON inválida.');

    // Popula o FDMemTable com os dados do JSON
    PopulateMemTableWithData(JSONArray);

    JSONArray.Free;

  except
    on E: Exception do
      ShowMessage('Erro ao carregar linhas com horário: ' + E.Message);
  end;
end;

end.

