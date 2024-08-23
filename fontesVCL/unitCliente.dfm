inherited frmCliente: TfrmCliente
  Caption = 'frmCliente'
  ClientHeight = 613
  ClientWidth = 912
  OnClose = nil
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  ExplicitWidth = 912
  ExplicitHeight = 613
  TextHeight = 15
  inherited pHeader: TPanel
    Width = 912
    ExplicitWidth = 912
    inherited Label1: TLabel
      Width = 104
      Caption = 'Clientes'
      ExplicitWidth = 104
    end
    inherited Panel1: TPanel
      Left = 692
      ExplicitLeft = 692
      ExplicitTop = 20
      ExplicitHeight = 40
      inherited btnExcluir: TSpeedButton
        OnClick = btnExcluirClick
      end
    end
    inherited Panel2: TPanel
      Left = 462
      ExplicitLeft = 462
      ExplicitTop = 20
      ExplicitHeight = 40
      inherited btnInserir: TSpeedButton
        OnClick = btnInserirClick
      end
    end
    inherited Panel3: TPanel
      Left = 577
      ExplicitLeft = 577
      ExplicitTop = 20
      ExplicitHeight = 40
      inherited btnEditar: TSpeedButton
        OnClick = btnEditarClick
      end
    end
    inherited Panel4: TPanel
      Left = 114
      Width = 154
      ExplicitLeft = 114
      ExplicitWidth = 173
      inherited Panel7: TPanel
        Left = 49
        ExplicitLeft = 68
        inherited btnBuscar: TSpeedButton
          Font.Height = -19
          OnClick = btnBuscarClick
        end
      end
      inherited edtBuscar: TEdit
        Width = 49
        ExplicitWidth = 68
      end
    end
    inherited Panel5: TPanel
      Left = 328
      Width = 114
      Height = 50
      Margins.Bottom = 10
      ExplicitLeft = 328
      ExplicitWidth = 114
      ExplicitHeight = 50
      inherited cmbTipoPesquisa: TComboBox
        Width = 114
        Height = 44
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Font.Height = -25
        ItemHeight = 38
        Text = ' Ativo '
        OnChange = cmbTipoPesquisaChange
        OnDrawItem = nil
        Items.Strings = (
          ' Ativo '
          ' Excluido')
        ExplicitTop = -8
        ExplicitWidth = 114
        ExplicitHeight = 44
      end
    end
    inherited Panel6: TPanel
      Left = 807
      ExplicitLeft = 807
      inherited SpeedButton1: TSpeedButton
        OnClick = SpeedButton1Click
      end
    end
  end
  object gridClientes: TDBGrid
    Left = 0
    Top = 80
    Width = 912
    Height = 533
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 10
    Margins.Bottom = 0
    Align = alClient
    BorderStyle = bsNone
    Color = 5585461
    DataSource = dsCliente
    FixedColor = 5585461
    Font.Charset = ANSI_CHARSET
    Font.Color = 5585461
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ImeName = 'Portuguese (Brazilian ABNT)'
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = gridClientesDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'id_cliente'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Segoe UI Semibold'
        Title.Font.Style = [fsBold]
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Segoe UI Semibold'
        Title.Font.Style = [fsBold]
        Width = 271
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'endereco'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Segoe UI Semibold'
        Title.Font.Style = [fsBold]
        Width = 149
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'complemento'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Segoe UI Semibold'
        Title.Font.Style = [fsBold]
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bairro'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Segoe UI Semibold'
        Title.Font.Style = [fsBold]
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cidade'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Segoe UI Semibold'
        Title.Font.Style = [fsBold]
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'uf'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Segoe UI Semibold'
        Title.Font.Style = [fsBold]
        Width = 283
        Visible = True
      end>
  end
  object tabCliente: TFDMemTable
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
    Left = 544
    Top = 120
  end
  object dsCliente: TDataSource
    DataSet = tabCliente
    Left = 632
    Top = 120
  end
end
