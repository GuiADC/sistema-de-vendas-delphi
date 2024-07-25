object frmClienteCad: TfrmClienteCad
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Cadastro'
  ClientHeight = 392
  ClientWidth = 496
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
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
  object Label2: TLabel
    AlignWithMargins = True
    Left = 16
    Top = 149
    Width = 71
    Height = 21
    Margins.Left = 0
    Margins.Top = 20
    Margins.Right = 10
    Margins.Bottom = 10
    Caption = 'Endere'#231'o'
    Font.Charset = ANSI_CHARSET
    Font.Color = 16477014
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    AlignWithMargins = True
    Left = 321
    Top = 149
    Width = 109
    Height = 21
    Margins.Left = 0
    Margins.Top = 20
    Margins.Right = 10
    Margins.Bottom = 10
    Caption = 'Complemento'
    Font.Charset = ANSI_CHARSET
    Font.Color = 16477014
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    AlignWithMargins = True
    Left = 16
    Top = 230
    Width = 46
    Height = 21
    Margins.Left = 0
    Margins.Top = 20
    Margins.Right = 10
    Margins.Bottom = 10
    Caption = 'Bairro'
    Font.Charset = ANSI_CHARSET
    Font.Color = 16477014
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    AlignWithMargins = True
    Left = 136
    Top = 230
    Width = 53
    Height = 21
    Margins.Left = 0
    Margins.Top = 20
    Margins.Right = 10
    Margins.Bottom = 10
    Caption = 'Cidade'
    Font.Charset = ANSI_CHARSET
    Font.Color = 16477014
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    AlignWithMargins = True
    Left = 377
    Top = 230
    Width = 20
    Height = 21
    Margins.Left = 0
    Margins.Top = 20
    Margins.Right = 10
    Margins.Bottom = 10
    Caption = 'UF'
    Font.Charset = ANSI_CHARSET
    Font.Color = 16477014
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 364
    Top = 333
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
    TabOrder = 6
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
      OnClick = btnCancelarClick
      ExplicitLeft = -8
      ExplicitHeight = 36
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 239
    Top = 333
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
    TabOrder = 7
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
      OnClick = btnSalvarClick
      ExplicitLeft = 2
    end
  end
  object edtNome: TEdit
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
    TabOrder = 0
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
    ParentFont = False
    TabOrder = 1
  end
  object edtComplemento: TEdit
    AlignWithMargins = True
    Left = 321
    Top = 183
    Width = 152
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
  object edtBairro: TEdit
    AlignWithMargins = True
    Left = 16
    Top = 264
    Width = 97
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
    TabOrder = 3
  end
  object edtCidade: TEdit
    AlignWithMargins = True
    Left = 136
    Top = 264
    Width = 224
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
    TabOrder = 4
  end
  object edtUF: TEdit
    AlignWithMargins = True
    Left = 377
    Top = 264
    Width = 97
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
    TabOrder = 5
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
