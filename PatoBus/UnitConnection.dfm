object FormConnection: TFormConnection
  Left = 0
  Top = 0
  Caption = 'Connection'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=patobus'
      'User_Name=root'
      'DriverID=MySQL')
    Left = 360
    Top = 160
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 
      'C:\Users\marco\Desktop\projetos\ifrn\projetointegrador2\PatoBusD' +
      'esktop\PatoBus\Win64\Debug\libmysql.dll'
    Left = 240
    Top = 288
  end
end
