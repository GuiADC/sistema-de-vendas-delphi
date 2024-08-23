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
      ExplicitLeft = 757
      ExplicitTop = 25
      ExplicitHeight = 30
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
      ExplicitLeft = 527
      ExplicitTop = 25
      ExplicitHeight = 30
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
      ExplicitLeft = 642
      ExplicitTop = 25
      ExplicitHeight = 30
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
      ExplicitWidth = 316
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
        ExplicitLeft = 256
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
        ExplicitWidth = 196
        ExplicitHeight = 33
      end
    end
    object Panel5: TPanel
      AlignWithMargins = True
      Left = 297
      Top = 20
      Width = 95
      Height = 45
      Margins.Left = 10
      Margins.Top = 20
      Margins.Right = 10
      Margins.Bottom = 15
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
      ExplicitLeft = 412
      ExplicitHeight = 40
      object cmbTipoPesquisa: TComboBox
        Left = 0
        Top = 0
        Width = 95
        Height = 40
        Align = alClient
        Style = csOwnerDrawFixed
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 34
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
      ExplicitLeft = 32767
      object SpeedButton1: TSpeedButton
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
end
