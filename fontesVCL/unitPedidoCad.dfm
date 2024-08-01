object frmPedidoCad: TfrmPedidoCad
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Pedido'
  ClientHeight = 475
  ClientWidth = 714
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
    Width = 140
    Height = 32
    Margins.Left = 0
    Margins.Top = 20
    Margins.Right = 10
    Margins.Bottom = 10
    Caption = 'Novo pedido'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 16477528
    Font.Height = -24
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    AlignWithMargins = True
    Left = 16
    Top = 66
    Width = 54
    Height = 21
    Margins.Left = 0
    Margins.Top = 20
    Margins.Right = 10
    Margins.Bottom = 10
    Caption = 'Cliente'
    Font.Charset = ANSI_CHARSET
    Font.Color = 16477528
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    AlignWithMargins = True
    Left = 160
    Top = 66
    Width = 47
    Height = 21
    Margins.Left = 0
    Margins.Top = 20
    Margins.Right = 10
    Margins.Bottom = 10
    Caption = 'Nome'
    Font.Charset = ANSI_CHARSET
    Font.Color = 16477528
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    AlignWithMargins = True
    Left = 504
    Top = 66
    Width = 80
    Height = 21
    Margins.Left = 0
    Margins.Top = 20
    Margins.Right = 10
    Margins.Bottom = 10
    Caption = 'Dt. pedido'
    Font.Charset = ANSI_CHARSET
    Font.Color = 16477528
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblTotal: TLabel
    AlignWithMargins = True
    Left = 574
    Top = 365
    Width = 117
    Height = 25
    Margins.Left = 0
    Margins.Top = 20
    Margins.Right = 10
    Margins.Bottom = 10
    Alignment = taRightJustify
    Caption = 'Total: R$ 0,00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 16477528
    Font.Height = -19
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
  end
  object Label4: TLabel
    AlignWithMargins = True
    Left = 24
    Top = 143
    Width = 77
    Height = 25
    Margins.Left = 0
    Margins.Top = 20
    Margins.Right = 10
    Margins.Bottom = 10
    Caption = 'Produtos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 16477528
    Font.Height = -19
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 580
    Top = 414
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
      OnClick = btnCancelarClick
      ExplicitLeft = 8
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 455
    Top = 414
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
      OnClick = btnSalvarClick
      ExplicitLeft = 2
    end
  end
  object edtCliente: TEdit
    AlignWithMargins = True
    Left = 160
    Top = 100
    Width = 314
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
  object edtIdCliente: TEdit
    AlignWithMargins = True
    Left = 16
    Top = 100
    Width = 113
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
  object dtPedido: TDateTimePicker
    Left = 504
    Top = 100
    Width = 186
    Height = 33
    Date = 45502.000000000000000000
    Time = 0.885813090280862500
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object gridItens: TDBGrid
    Left = 8
    Top = 172
    Width = 666
    Height = 153
    BorderStyle = bsNone
    DataSource = dsItens
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'id_item'
        Title.Caption = 'Id. produto'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI Semibold'
        Title.Font.Style = [fsBold]
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'id_produto'
        Title.Caption = 'Id. produto'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI Semibold'
        Title.Font.Style = [fsBold]
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Caption = 'Descri'#231#227'o'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI Semibold'
        Title.Font.Style = [fsBold]
        Width = 303
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qtd'
        Title.Caption = 'Qtd.'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI Semibold'
        Title.Font.Style = [fsBold]
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vl_unitario'
        Title.Caption = 'Vl. Unit'#225'rio'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI Semibold'
        Title.Font.Style = [fsBold]
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vl_total'
        Title.Caption = 'Vl. Total'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI Semibold'
        Title.Font.Style = [fsBold]
        Width = 101
        Visible = True
      end>
  end
  object pItem: TPanel
    Left = 0
    Top = 8
    Width = 706
    Height = 467
    Color = clWhite
    ParentBackground = False
    TabOrder = 6
    Visible = False
    object Label5: TLabel
      AlignWithMargins = True
      Left = 24
      Top = 28
      Width = 88
      Height = 32
      Margins.Left = 0
      Margins.Top = 20
      Margins.Right = 10
      Margins.Bottom = 10
      Caption = 'Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 16477528
      Font.Height = -24
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      AlignWithMargins = True
      Left = 14
      Top = 138
      Width = 70
      Height = 17
      Margins.Left = 0
      Margins.Top = 20
      Margins.Right = 10
      Margins.Bottom = 10
      Caption = 'Id. Produto'
      Font.Charset = ANSI_CHARSET
      Font.Color = 16477528
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      AlignWithMargins = True
      Left = 103
      Top = 138
      Width = 59
      Height = 17
      Margins.Left = 0
      Margins.Top = 20
      Margins.Right = 10
      Margins.Bottom = 10
      Caption = 'Descri'#231#227'o'
      Font.Charset = ANSI_CHARSET
      Font.Color = 16477528
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      AlignWithMargins = True
      Left = 402
      Top = 138
      Width = 27
      Height = 17
      Margins.Left = 0
      Margins.Top = 20
      Margins.Right = 10
      Margins.Bottom = 10
      Caption = 'Qtd.'
      Font.Charset = ANSI_CHARSET
      Font.Color = 16477528
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      AlignWithMargins = True
      Left = 487
      Top = 138
      Width = 71
      Height = 17
      Margins.Left = 0
      Margins.Top = 20
      Margins.Right = 10
      Margins.Bottom = 10
      Caption = 'Vl. Unit'#225'rio'
      Font.Charset = ANSI_CHARSET
      Font.Color = 16477528
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      AlignWithMargins = True
      Left = 567
      Top = 138
      Width = 52
      Height = 17
      Margins.Left = 0
      Margins.Top = 20
      Margins.Right = 10
      Margins.Bottom = 10
      Caption = 'Vl. Total'
      Font.Charset = ANSI_CHARSET
      Font.Color = 16477528
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Panel4: TPanel
      AlignWithMargins = True
      Left = 405
      Top = 272
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
      object btnCancelarItem: TSpeedButton
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
        OnClick = btnCancelarItemClick
        ExplicitLeft = 8
      end
    end
    object Panel5: TPanel
      AlignWithMargins = True
      Left = 260
      Top = 272
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
      object btnSalvarItem: TSpeedButton
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
        OnClick = btnSalvarItemClick
        ExplicitLeft = 2
      end
    end
    object DBEdit1: TDBEdit
      Left = 14
      Top = 165
      Width = 72
      Height = 29
      DataField = 'id_produto'
      DataSource = dsItens
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object DBEdit2: TDBEdit
      Left = 101
      Top = 165
      Width = 275
      Height = 29
      DataField = 'descricao'
      DataSource = dsItens
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object DBEdit3: TDBEdit
      Left = 395
      Top = 165
      Width = 72
      Height = 29
      DataField = 'qtd'
      DataSource = dsItens
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object DBEdit4: TDBEdit
      Left = 481
      Top = 165
      Width = 72
      Height = 29
      DataField = 'vl_unitario'
      DataSource = dsItens
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object DBEdit5: TDBEdit
      Left = 564
      Top = 165
      Width = 72
      Height = 29
      DataField = 'vl_total'
      DataSource = dsItens
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
  end
  object Panel6: TPanel
    AlignWithMargins = True
    Left = 26
    Top = 365
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
    object btnNovo: TSpeedButton
      Left = 0
      Top = 0
      Width = 110
      Height = 37
      Cursor = crHandPoint
      Align = alClient
      Caption = 'Inserir item'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = btnNovoClick
      ExplicitLeft = 2
    end
  end
  object Panel3: TPanel
    AlignWithMargins = True
    Left = 151
    Top = 365
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
    TabOrder = 8
    object btnEditar: TSpeedButton
      Left = 0
      Top = 0
      Width = 110
      Height = 37
      Cursor = crHandPoint
      Align = alClient
      Caption = 'Editar item'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = btnEditarClick
      ExplicitLeft = 2
    end
  end
  object Panel7: TPanel
    AlignWithMargins = True
    Left = 273
    Top = 365
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
    TabOrder = 9
    object btnExcluir: TSpeedButton
      Left = 0
      Top = 0
      Width = 110
      Height = 37
      Cursor = crHandPoint
      Align = alClient
      Caption = 'Excluir item'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = btnExcluirClick
      ExplicitLeft = 2
    end
  end
  object tabPedido: TFDMemTable
    FieldDefs = <
      item
        Name = 'id_pedido'
        DataType = ftInteger
      end
      item
        Name = 'id_usuario'
        DataType = ftInteger
      end
      item
        Name = 'id_cliente'
        DataType = ftInteger
      end
      item
        Name = 'dt_pedido'
        DataType = ftDate
      end
      item
        Name = 'vl_total'
        DataType = ftCurrency
        Precision = 19
      end
      item
        Name = 'nome'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'cidade'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'usuario'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 420
    Top = 32
    object tabPedidoid_pedido: TIntegerField
      FieldName = 'id_pedido'
    end
    object tabPedidoid_usuario: TIntegerField
      FieldName = 'id_usuario'
    end
    object tabPedidoid_cliente: TIntegerField
      FieldName = 'id_cliente'
    end
    object tabPedidodt_pedido: TDateField
      FieldName = 'dt_pedido'
    end
    object tabPedidovl_total: TCurrencyField
      FieldName = 'vl_total'
    end
    object tabPedidonome: TStringField
      FieldName = 'nome'
    end
    object tabPedidocidade: TStringField
      FieldName = 'cidade'
    end
    object tabPedidousuario: TStringField
      FieldName = 'usuario'
    end
  end
  object tabItens: TFDMemTable
    FieldDefs = <
      item
        Name = 'id_item'
        DataType = ftInteger
      end
      item
        Name = 'id_produto'
        DataType = ftInteger
      end
      item
        Name = 'descricao'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'qtd'
        DataType = ftInteger
      end
      item
        Name = 'vl_unitario'
        DataType = ftCurrency
        Precision = 19
      end
      item
        Name = 'vl_total'
        DataType = ftCurrency
        Precision = 19
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 68
    Top = 264
    object tabItensid_item: TIntegerField
      FieldName = 'id_item'
    end
    object tabItensid_produto: TIntegerField
      FieldName = 'id_produto'
    end
    object tabItensdescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object tabItensqtd: TIntegerField
      FieldName = 'qtd'
    end
    object tabItensvl_unitario: TCurrencyField
      FieldName = 'vl_unitario'
    end
    object tabItensvl_total: TCurrencyField
      FieldName = 'vl_total'
    end
  end
  object dsItens: TDataSource
    DataSet = tabItens
    Left = 136
    Top = 267
  end
end
