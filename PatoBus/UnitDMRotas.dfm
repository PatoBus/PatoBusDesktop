object DMRotas: TDMRotas
  Left = 0
  Top = 0
  Caption = 'que'
  ClientHeight = 520
  ClientWidth = 694
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object DataSource1: TDataSource
    DataSet = QRotas
    Left = 416
    Top = 296
  end
  object QRotas: TFDQuery
    BeforeDelete = QRotasBeforeDelete
    Connection = FormConnection.FDConnection1
    SQL.Strings = (
      'select * from rota '
      ' inner join linha on rota.id_linha=linha.id_linha'
      ''
      'where rota.id_empresa = 1')
    Left = 416
    Top = 232
    object QRotaspontos: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'pontos'
      Origin = 'pontos'
      BlobType = ftMemo
    end
    object QRotasnome_linha: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome_linha'
      Origin = 'nome_linha'
      ProviderFlags = []
      ReadOnly = True
      Size = 255
    end
    object QRotasvalor: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'valor'
      Origin = 'valor'
      ProviderFlags = []
      ReadOnly = True
      Precision = 10
      Size = 2
    end
    object QRotasnome_rota: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome_rota'
      Origin = 'nome_rota'
      Size = 255
    end
    object QRotasdescricao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 255
    end
    object QRotasid_rota: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'id_rota'
      Origin = 'id_rota'
      ProviderFlags = [pfInWhere, pfInKey]
    end
  end
  object QInsertRotas: TFDQuery
    Connection = FormConnection.FDConnection1
    Left = 144
    Top = 144
  end
  object QDeleteRotas: TFDQuery
    Connection = FormConnection.FDConnection1
    Left = 424
    Top = 120
  end
end
