unit UnitConsultaLinha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, System.JSON, System.Net.HttpClient,
  UnitDMLinhas;

type
  TFormConsultaLinha = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Splitter1: TSplitter;
    Button1: TButton;
    Edit1: TEdit;  //nome
    Edit2: TEdit;   //descricao
    Edit3: TEdit;   //valor
    Edit4: TEdit;   //pontos
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    ComboBox1: TComboBox;
  private

  public
  end;

var
  FormConsultaLinha: TFormConsultaLinha;

implementation

{$R *.dfm}

uses UnitDMRotas;




end.

