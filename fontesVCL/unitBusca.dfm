object frmBusca: TfrmBusca
  Left = 0
  Top = 0
  Cursor = crHandPoint
  BorderStyle = bsNone
  Caption = 'Pesquisa'
  ClientHeight = 441
  ClientWidth = 813
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
    Left = 10
    Top = 0
    Width = 803
    Height = 32
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    Caption = 'Pesquisa'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 16477528
    Font.Height = -24
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitWidth = 93
  end
  object Panel4: TPanel
    AlignWithMargins = True
    Left = 10
    Top = 32
    Width = 793
    Height = 65
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 10
    Margins.Bottom = 0
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 697
    object Panel7: TPanel
      AlignWithMargins = True
      Left = 683
      Top = 10
      Width = 110
      Height = 45
      Margins.Left = 0
      Margins.Top = 10
      Margins.Right = 0
      Margins.Bottom = 10
      Align = alRight
      BevelOuter = bvNone
      Color = 16477014
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      ExplicitLeft = 587
      object btnFiltrar: TSpeedButton
        Left = 0
        Top = 0
        Width = 110
        Height = 45
        Cursor = crHandPoint
        Align = alClient
        Caption = 'Filtrar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = btnFiltrarClick
        ExplicitLeft = 3
        ExplicitTop = 4
      end
    end
    object edtBuscar: TEdit
      AlignWithMargins = True
      Left = 0
      Top = 10
      Width = 683
      Height = 45
      Margins.Left = 0
      Margins.Top = 10
      Margins.Right = 0
      Margins.Bottom = 10
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      ExplicitWidth = 587
      ExplicitHeight = 33
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 385
    Width = 813
    Height = 56
    Align = alBottom
    TabOrder = 1
    ExplicitWidth = 717
    DesignSize = (
      813
      56)
    object Panel2: TPanel
      AlignWithMargins = True
      Left = 697
      Top = 7
      Width = 110
      Height = 37
      Margins.Left = 10
      Margins.Top = 20
      Margins.Right = 10
      Margins.Bottom = 20
      Anchors = [akTop, akRight]
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
      ExplicitLeft = 601
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
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = btnCancelarClick
        ExplicitLeft = 1
      end
    end
    object Panel3: TPanel
      AlignWithMargins = True
      Left = 579
      Top = 7
      Width = 110
      Height = 37
      Margins.Left = 10
      Margins.Top = 20
      Margins.Right = 10
      Margins.Bottom = 20
      Anchors = [akTop, akRight]
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
      ExplicitLeft = 483
      object btnSelecionar: TSpeedButton
        Left = 0
        Top = 0
        Width = 110
        Height = 37
        Cursor = crHandPoint
        Align = alClient
        Caption = 'Selecionar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = btnSelecionarClick
        ExplicitLeft = -1
      end
    end
  end
  object grid: TDBGrid
    Left = 0
    Top = 97
    Width = 813
    Height = 288
    Align = alClient
    Color = clWhite
    DataSource = dsBusca
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = 'Segoe UI Semibold'
    TitleFont.Style = [fsBold]
    OnDblClick = gridDblClick
  end
  object tabBusca: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 296
    Top = 184
  end
  object dsBusca: TDataSource
    DataSet = tabBusca
    Left = 456
    Top = 200
  end
end
