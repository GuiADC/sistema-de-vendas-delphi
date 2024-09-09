object frmDefault: TfrmDefault
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = 'Pedidos'
  ClientHeight = 480
  ClientWidth = 862
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  WindowState = wsMaximized
  OnClose = FormClose
  TextHeight = 15
  object pHeader: TPanel
    Left = 0
    Top = 0
    Width = 862
    Height = 80
    Align = alTop
    BevelOuter = bvNone
    Color = 16051947
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      AlignWithMargins = True
      Left = 0
      Top = 20
      Width = 96
      Height = 50
      Margins.Left = 0
      Margins.Top = 20
      Margins.Right = 10
      Margins.Bottom = 10
      Align = alLeft
      Caption = 'Default'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
      ExplicitHeight = 40
    end
    object Panel1: TPanel
      AlignWithMargins = True
      Left = 642
      Top = 20
      Width = 95
      Height = 40
      Margins.Left = 10
      Margins.Top = 20
      Margins.Right = 10
      Margins.Bottom = 20
      Align = alRight
      BevelOuter = bvNone
      Color = 6906591
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      object btnExcluir: TSpeedButton
        Left = 0
        Top = 0
        Width = 95
        Height = 40
        Cursor = crHandPoint
        Align = alClient
        Caption = 'Excluir'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 544
        ExplicitWidth = 96
        ExplicitHeight = 52
      end
    end
    object Panel2: TPanel
      AlignWithMargins = True
      Left = 412
      Top = 20
      Width = 95
      Height = 40
      Margins.Left = 10
      Margins.Top = 20
      Margins.Right = 10
      Margins.Bottom = 20
      Align = alRight
      BevelOuter = bvNone
      Color = 3315201
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      object btnInserir: TSpeedButton
        Left = 0
        Top = 0
        Width = 95
        Height = 40
        Cursor = crHandPoint
        Align = alClient
        Caption = 'Inserir'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 7
      end
    end
    object Panel3: TPanel
      AlignWithMargins = True
      Left = 527
      Top = 20
      Width = 95
      Height = 40
      Margins.Left = 10
      Margins.Top = 20
      Margins.Right = 10
      Margins.Bottom = 20
      Align = alRight
      BevelOuter = bvNone
      Color = 505054
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
      object btnEditar: TSpeedButton
        Left = 0
        Top = 0
        Width = 95
        Height = 40
        Cursor = crHandPoint
        Align = alClient
        Caption = 'Editar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 544
        ExplicitWidth = 96
        ExplicitHeight = 52
      end
    end
    object Panel4: TPanel
      AlignWithMargins = True
      Left = 106
      Top = 0
      Width = 131
      Height = 80
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 50
      Margins.Bottom = 0
      Align = alClient
      BevelOuter = bvNone
      Color = 16051947
      ParentBackground = False
      TabOrder = 3
      object Panel7: TPanel
        AlignWithMargins = True
        Left = 26
        Top = 20
        Width = 95
        Height = 40
        Margins.Left = 0
        Margins.Top = 20
        Margins.Right = 10
        Margins.Bottom = 20
        Align = alRight
        BevelOuter = bvNone
        Color = 16477014
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        object btnBuscar: TSpeedButton
          Left = 0
          Top = 0
          Width = 95
          Height = 40
          Cursor = crHandPoint
          Align = alClient
          Caption = 'Pesquisar'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ExplicitLeft = 544
          ExplicitWidth = 96
          ExplicitHeight = 52
        end
      end
      object edtBuscar: TEdit
        AlignWithMargins = True
        Left = 0
        Top = 20
        Width = 26
        Height = 40
        Margins.Left = 0
        Margins.Top = 20
        Margins.Right = 0
        Margins.Bottom = 20
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        ExplicitHeight = 33
      end
    end
    object Panel5: TPanel
      AlignWithMargins = True
      Left = 297
      Top = 27
      Width = 95
      Height = 33
      Margins.Left = 10
      Margins.Top = 27
      Margins.Right = 10
      Margins.Bottom = 20
      Align = alRight
      BevelOuter = bvNone
      Color = 16051947
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 4
      object cmbTipoPesquisa: TComboBox
        Left = 0
        Top = 0
        Width = 95
        Height = 28
        Align = alClient
        Style = csOwnerDrawFixed
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 22
        ItemIndex = 0
        ParentFont = False
        TabOrder = 0
        Text = 'Ativo'
        OnDrawItem = cmbTipoPesquisaDrawItem
        Items.Strings = (
          'Ativo'
          'Excluido')
      end
    end
    object Panel6: TPanel
      AlignWithMargins = True
      Left = 757
      Top = 20
      Width = 95
      Height = 40
      Margins.Left = 10
      Margins.Top = 20
      Margins.Right = 10
      Margins.Bottom = 20
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
      TabOrder = 5
      object btnImprimir: TSpeedButton
        Left = 0
        Top = 0
        Width = 95
        Height = 40
        Cursor = crHandPoint
        Align = alClient
        Caption = 'Imprimir'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = -7
      end
    end
  end
  object pnlPaginate: TPanel
    Left = 0
    Top = 439
    Width = 862
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Padding.Left = 15
    TabOrder = 1
    object btnNext: TSpeedButton
      Left = 824
      Top = 0
      Width = 38
      Height = 41
      Align = alRight
      Caption = '>>'
      Flat = True
    end
    object btnPrevious: TSpeedButton
      Left = 749
      Top = 0
      Width = 39
      Height = 41
      Align = alRight
      Caption = '<<'
      Flat = True
      ExplicitLeft = 757
    end
    object lblPagina: TLabel
      Left = 788
      Top = 0
      Width = 36
      Height = 41
      Align = alRight
      Caption = 'Pagina'
      Layout = tlCenter
      ExplicitHeight = 15
    end
  end
  object frxReport1: TfrxReport
    Version = '2024.2.7'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45532.750449791670000000
    ReportOptions.LastChange = 45532.750449791670000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 280
    Top = 192
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    BCDToCurrency = False
    DataSetOptions = []
    Left = 576
    Top = 192
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    EmbedFontsIfProtected = False
    InteractiveFormsFontSubset = 'A-Z,a-z,0-9,#43-#47 '
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    Creator = 'FastReport'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    Left = 408
    Top = 272
  end
end
