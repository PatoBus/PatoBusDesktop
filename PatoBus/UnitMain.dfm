object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = 'PatoBus Painel Admnistrativo'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  WindowState = wsMaximized
  OnClose = FormClose
  TextHeight = 15
  object MainMenu1: TMainMenu
    Left = 480
    Top = 112
    object teste1: TMenuItem
      Caption = 'teste'
      object teste2: TMenuItem
        Caption = 'teste1'
      end
    end
  end
end
