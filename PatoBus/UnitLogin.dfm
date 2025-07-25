object FormLogin: TFormLogin
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Login'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object Panel1: TPanel
    Left = 248
    Top = 0
    Width = 376
    Height = 441
    Cursor = crArrow
    Align = alRight
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object LblUsuario: TLabel
      Left = 168
      Top = 85
      Width = 45
      Height = 17
      Caption = 'Usu'#225'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object LblSenha: TLabel
      Left = 184
      Top = 282
      Width = 32
      Height = 15
      Caption = 'Senha'
    end
    object EditSenha: TEdit
      Left = 184
      Top = 298
      Width = 121
      Height = 23
      TabOrder = 0
      Text = 'Edit1'
    end
    object Panel3: TPanel
      Left = 56
      Top = 108
      Width = 297
      Height = 25
      Caption = 'Panel3'
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
    end
    object BtnLogin: TBitBtn
      Left = 0
      Top = 416
      Width = 376
      Height = 25
      Align = alBottom
      Caption = 'Entrar'
      TabOrder = 2
      OnClick = BtnLoginClick
      ExplicitLeft = 160
      ExplicitTop = 352
      ExplicitWidth = 75
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 273
    Height = 441
    Align = alLeft
    BevelOuter = bvNone
    Caption = 'imagem'
    TabOrder = 1
  end
end
