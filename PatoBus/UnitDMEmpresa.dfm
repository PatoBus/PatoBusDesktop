object DMEmpresa: TDMEmpresa
  Left = 0
  Top = 0
  Caption = 'DMEmpresa'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object QEmpresaCombobox: TFDQuery
    Connection = FormConnection.FDConnection1
    SQL.Strings = (
      'select * from empresa ')
    Left = 376
    Top = 192
    object QEmpresaComboboxid_empresa: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'id_empresa'
      Origin = 'id_empresa'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object QEmpresaComboboxcnpj: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cnpj'
      Origin = 'cnpj'
      Size = 255
    end
    object QEmpresaComboboxnome_empresa: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome_empresa'
      Origin = 'nome_empresa'
      Size = 255
    end
  end
  object DSEmpresaCombobox: TDataSource
    DataSet = QEmpresaCombobox
    Left = 376
    Top = 272
  end
  object QUsuario: TFDQuery
    Connection = FormConnection.FDConnection1
    SQL.Strings = (
      'select * from Usuario'
      'inner join empresa on usuario.id_empresa = empresa.id_empresa')
    Left = 88
    Top = 72
    object QUsuarioid: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object QUsuariousuario: TStringField
      FieldName = 'usuario'
      Origin = 'usuario'
      Required = True
      Size = 255
    end
    object QUsuariosenha: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'senha'
      Origin = 'senha'
      Size = 255
    end
    object QUsuarioadm: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'adm'
      Origin = 'adm'
    end
    object QUsuarioid_empresa: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'id_empresa'
      Origin = 'id_empresa'
    end
    object QUsuarioid_empresa_1: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'id_empresa_1'
      Origin = 'id_empresa'
      ProviderFlags = []
      ReadOnly = True
    end
    object QUsuariocnpj: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cnpj'
      Origin = 'cnpj'
      ProviderFlags = []
      ReadOnly = True
      Size = 255
    end
    object QUsuarionome_empresa: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome_empresa'
      Origin = 'nome_empresa'
      ProviderFlags = []
      ReadOnly = True
      Size = 255
    end
  end
  object DSUsuario: TDataSource
    DataSet = QUsuario
    Left = 88
    Top = 136
  end
end
