object DMlinhas: TDMlinhas
  Left = 0
  Top = 0
  Caption = 'DMlinhas'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object DSLinhasComBoBox: TDataSource
    DataSet = QLinhasComboBox
    Left = 496
    Top = 248
  end
  object QLinhasComboBox: TFDQuery
    Connection = FormConnection.FDConnection1
    SQL.Strings = (
      'Select * from Linha where id_empresa=1')
    Left = 496
    Top = 168
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=patobus'
      'User_Name=root'
      'DriverID=MySQL')
    Connected = True
    Left = 232
    Top = 8
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 
      'C:\Users\marco\Desktop\projetos\ifrn\projetointegrador2\PatoBusD' +
      'esktop\PatoBus\Win64\Debug\libmysql.dll'
    Left = 112
    Top = 136
  end
end
