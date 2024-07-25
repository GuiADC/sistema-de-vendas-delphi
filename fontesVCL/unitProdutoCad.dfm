object frmProdutoCad: TfrmProdutoCad
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmProdutoCad'
  ClientHeight = 392
  ClientWidth = 496
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object lblTitulo: TLabel
    AlignWithMargins = True
    Left = 12
    Top = 12
    Width = 153
    Height = 32
    Margins.Left = 0
    Margins.Top = 20
    Margins.Right = 10
    Margins.Bottom = 10
    Caption = 'Novo Produto'
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
    Width = 74
    Height = 21
    Margins.Left = 0
    Margins.Top = 20
    Margins.Right = 10
    Margins.Bottom = 10
    Caption = 'Descri'#231#227'o'
    Font.Charset = ANSI_CHARSET
    Font.Color = 16477014
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    AlignWithMargins = True
    Left = 16
    Top = 149
    Width = 40
    Height = 21
    Margins.Left = 0
    Margins.Top = 20
    Margins.Right = 10
    Margins.Bottom = 10
    Caption = 'Valor'
    Font.Charset = ANSI_CHARSET
    Font.Color = 16477014
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 361
    Top = 302
    Width = 110
    Height = 37
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
      Height = 37
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
      ExplicitLeft = -8
      ExplicitHeight = 36
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 236
    Top = 302
    Width = 110
    Height = 37
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
      Height = 37
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
      ExplicitLeft = 2
    end
  end
  object edtNome: TEdit
    AlignWithMargins = True
    Left = 16
    Top = 100
    Width = 455
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
  object edtEndereco: TEdit
    AlignWithMargins = True
    Left = 16
    Top = 183
    Width = 281
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
    NumbersOnly = True
    ParentFont = False
    TabOrder = 3
  end
  object tabClienteCad: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 446
    Top = 40
  end
end
