inherited frmPedido: TfrmPedido
  ClientHeight = 501
  ClientWidth = 978
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  ExplicitWidth = 978
  ExplicitHeight = 501
  TextHeight = 15
  inherited pHeader: TPanel
    Width = 978
    ExplicitWidth = 1994
    inherited Label1: TLabel
      Width = 103
      Caption = 'Pedidos'
      ExplicitWidth = 103
    end
    inherited Panel1: TPanel
      Left = 873
      ExplicitLeft = 1889
      inherited btnExcluir: TSpeedButton
        OnClick = btnExcluirClick
      end
    end
    inherited Panel2: TPanel
      Left = 528
      ExplicitLeft = 1544
      inherited btnInserir: TSpeedButton
        OnClick = btnInserirClick
      end
    end
    inherited Panel3: TPanel
      Left = 758
      ExplicitLeft = 1774
      inherited btnEditar: TSpeedButton
        OnClick = btnEditarClick
        ExplicitLeft = -7
        ExplicitWidth = 110
        ExplicitHeight = 40
      end
    end
    inherited Panel4: TPanel
      Left = 113
      Width = 240
      ExplicitLeft = 113
      ExplicitWidth = 1256
      inherited Panel7: TPanel
        Left = 135
        ExplicitLeft = 1151
        inherited btnBuscar: TSpeedButton
          OnClick = btnBuscarClick
        end
      end
      inherited edtBuscar: TEdit
        Width = 135
        ExplicitWidth = 1151
      end
    end
    inherited Panel5: TPanel
      Left = 413
      Visible = False
      ExplicitLeft = 1429
      ExplicitTop = 27
      ExplicitHeight = 33
    end
    inherited Panel6: TPanel
      Left = 643
      ExplicitLeft = 1659
    end
  end
  object gridPedidos: TDBGrid [1]
    Left = 0
    Top = 80
    Width = 978
    Height = 421
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    BorderStyle = bsNone
    DataSource = dsPedido
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = gridPedidosDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'id_pedido'
        Title.Caption = 'id. pedido'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Segoe UI Semibold'
        Title.Font.Style = [fsBold]
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Title.Caption = 'Cliente'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Segoe UI Semibold'
        Title.Font.Style = [fsBold]
        Width = 245
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cidade'
        Title.Caption = 'Cidade'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Segoe UI Semibold'
        Title.Font.Style = [fsBold]
        Width = 176
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'usuario'
        Title.Caption = 'Usu'#225'rio Cad.'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Segoe UI Semibold'
        Title.Font.Style = [fsBold]
        Width = 134
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'dt_pedido'
        Title.Alignment = taCenter
        Title.Caption = 'Dt. pedido'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Segoe UI Semibold'
        Title.Font.Style = [fsBold]
        Width = 132
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vl_total'
        Title.Alignment = taRightJustify
        Title.Caption = 'Vl. Total'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Segoe UI Semibold'
        Title.Font.Style = [fsBold]
        Width = 170
        Visible = True
      end>
  end
  inherited frxReport1: TfrxReport
    ReportOptions.CreateDate = 45531.021695034700000000
    ReportOptions.LastChange = 45532.744041759300000000
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = clGray
      end
      item
        Name = 'Header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Group header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = 16053492
      end
      item
        Name = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
      end
      item
        Name = 'Group footer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Header line'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftBottom]
        Frame.Width = 2.000000000000000000
      end>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 718.110717773437500000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clGray
          HAlign = haCenter
          Memo.UTF8W = (
            'Lista de pedidos')
          ParentFont = False
          Style = 'Title'
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 68.031540000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Width = 718.110236220472000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          ParentFont = False
          Style = 'Header line'
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 646.148854620000000000
          Width = 70.198316940000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'valor total')
          ParentFont = False
          Style = 'Header'
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 1.889763780000000000
          Width = 257.006029980000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'nome')
          ParentFont = False
          Style = 'Header'
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 411.644171540000000000
          Width = 61.867432550000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'cidade')
          ParentFont = False
          Style = 'Header'
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 295.937007874016000000
          Width = 66.960722120000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'usuario')
          ParentFont = False
          Style = 'Header'
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 491.149420560000000000
          Top = 1.000000000000000000
          Width = 88.408834050000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'data pedido')
          ParentFont = False
          Style = 'Header'
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 151.181200000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 490.928950560000000000
          Top = 0.779530000000000000
          Width = 69.511184050000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'dt_pedido'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."dt_pedido"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 566.929133858268000000
          Top = 0.779530000000000000
          Width = 149.568446940000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'vl_total'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."vl_total"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 1.779530000000000000
          Width = 249.446969980000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'nome'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."nome"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 411.644171540000000000
          Top = 3.779530000000000000
          Width = 61.867432550000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'cidade'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."cidade"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 295.873694100000000000
          Top = 3.779530000000000000
          Width = 66.960722120000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'usuario'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."usuario"]')
          ParentFont = False
          Style = 'Data'
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 230.551330000000000000
        Width = 718.110700000000000000
        object Memo19: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 718.110717773437500000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Top = 1.000000000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          Frame.Typ = []
          Memo.UTF8W = (
            '[Date] [Time]')
        end
        object Memo21: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 642.520117773437500000
          Top = 1.000000000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Page [Page#]')
        end
      end
    end
  end
  object dsPedido: TDataSource [3]
    DataSet = tabPedido
    Left = 824
    Top = 276
  end
  object tabPedido: TFDMemTable [4]
    Active = True
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
        Size = 200
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
    Left = 616
    Top = 280
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
      Size = 200
    end
    object tabPedidocidade: TStringField
      FieldName = 'cidade'
    end
    object tabPedidousuario: TStringField
      FieldName = 'usuario'
    end
  end
  inherited frxDBDataset1: TfrxDBDataset
    DataSet = tabPedido
    Left = 328
    Top = 256
    FieldDefs = <
      item
        FieldName = 'id_pedido'
      end
      item
        FieldName = 'id_usuario'
      end
      item
        FieldName = 'id_cliente'
      end
      item
        FieldName = 'dt_pedido'
        FieldType = fftDateTime
      end
      item
        FieldName = 'vl_total'
      end
      item
        FieldName = 'nome'
        FieldType = fftString
        Size = 200
      end
      item
        FieldName = 'cidade'
        FieldType = fftString
        Size = 20
      end
      item
        FieldName = 'usuario'
        FieldType = fftString
        Size = 20
      end>
  end
end
