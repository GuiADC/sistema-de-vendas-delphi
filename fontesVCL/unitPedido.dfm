inherited frmPedido: TfrmPedido
  ClientWidth = 1010
  OnShow = FormShow
  ExplicitWidth = 1010
  TextHeight = 15
  inherited pHeader: TPanel
    Width = 1010
    ExplicitWidth = 1010
    inherited Label1: TLabel
      Width = 103
      Height = 50
      Caption = 'Pedidos'
      ExplicitWidth = 103
    end
    inherited Panel1: TPanel
      Left = 890
      ExplicitLeft = 890
      inherited btnExcluir: TSpeedButton
        OnClick = btnExcluirClick
      end
    end
    inherited Panel2: TPanel
      Left = 630
      ExplicitLeft = 630
      inherited btnInserir: TSpeedButton
        OnClick = btnInserirClick
      end
    end
    inherited Panel3: TPanel
      Left = 760
      ExplicitLeft = 760
      inherited btnEditar: TSpeedButton
        OnClick = btnEditarClick
      end
    end
    inherited Panel4: TPanel
      Left = 113
      Width = 457
      ExplicitLeft = 113
      ExplicitWidth = 457
      inherited Panel7: TPanel
        Left = 337
        ExplicitLeft = 337
        inherited btnBuscar: TSpeedButton
          OnClick = btnBuscarClick
        end
      end
      inherited edtBuscar: TEdit
        Width = 337
        ExplicitWidth = 337
      end
    end
  end
  object gridPedidos: TDBGrid
    Left = 0
    Top = 80
    Width = 1010
    Height = 400
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
    OnTitleClick = gridPedidosTitleClick
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
        ReadOnly = False
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
  object dsPedido: TDataSource
    DataSet = tabPedido
    Left = 824
    Top = 276
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
end
