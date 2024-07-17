object frmDefaultCadastro: TfrmDefaultCadastro
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Cadastro'
  ClientHeight = 370
  ClientWidth = 498
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  TextHeight = 15
  object lblTitulo: TLabel
    AlignWithMargins = True
    Left = 16
    Top = 20
    Width = 126
    Height = 32
    Margins.Left = 0
    Margins.Top = 20
    Margins.Right = 10
    Margins.Bottom = 10
    Caption = 'Novo liente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 16477014
    Font.Height = -24
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    AlignWithMargins = True
    Left = 16
    Top = 66
    Width = 47
    Height = 21
    Margins.Left = 0
    Margins.Top = 20
    Margins.Right = 10
    Margins.Bottom = 10
    Caption = 'Nome'
    Font.Charset = ANSI_CHARSET
    Font.Color = 16477014
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 363
    Top = 311
    Width = 110
    Height = 36
    Margins.Left = 10
    Margins.Top = 20
    Margins.Right = 10
    Margins.Bottom = 20
    BevelOuter = bvNone
    Color = 14869218
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGrayText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object btnCancelar: TSpeedButton
      Left = 0
      Top = 0
      Width = 110
      Height = 36
      Cursor = crHandPoint
      Align = alClient
      Caption = 'Cancelar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5585461
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = btnCancelarClick
      ExplicitLeft = -8
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 217
    Top = 311
    Width = 110
    Height = 36
    Margins.Left = 10
    Margins.Top = 20
    Margins.Right = 10
    Margins.Bottom = 20
    BevelOuter = bvNone
    Color = 16477528
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGrayText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
    object btnSalvar: TSpeedButton
      Left = 0
      Top = 0
      Width = 110
      Height = 36
      Cursor = crHandPoint
      Align = alClient
      Caption = 'Salvar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = -88
      ExplicitTop = -8
    end
  end
  object Edit1: TEdit
    AlignWithMargins = True
    Left = 16
    Top = 100
    Width = 458
    Height = 33
    Margins.Left = 0
    Margins.Top = 20
    Margins.Right = 0
    Margins.Bottom = 20
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
end
