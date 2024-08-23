inherited frmProduto: TfrmProduto
  Caption = 'frmProduto'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  ExplicitWidth = 862
  TextHeight = 15
  inherited pHeader: TPanel
    inherited Label1: TLabel
      Width = 119
      Caption = 'Produtos'
      ExplicitWidth = 119
    end
    inherited Panel1: TPanel
      ExplicitLeft = 642
      ExplicitTop = 20
      ExplicitHeight = 40
      inherited btnExcluir: TSpeedButton
        OnClick = btnExcluirClick
      end
    end
    inherited Panel2: TPanel
      ExplicitLeft = 412
      ExplicitTop = 20
      ExplicitHeight = 40
      inherited btnInserir: TSpeedButton
        OnClick = btnInserirClick
      end
    end
    inherited Panel3: TPanel
      ExplicitLeft = 527
      ExplicitTop = 20
      ExplicitHeight = 40
      inherited btnEditar: TSpeedButton
        OnClick = btnEditarClick
      end
    end
    inherited Panel4: TPanel
      Left = 129
      Width = 108
      ExplicitLeft = 129
      ExplicitWidth = 108
      inherited Panel7: TPanel
        Left = 3
        ExplicitLeft = 3
      end
      inherited edtBuscar: TEdit
        Width = 3
        ExplicitWidth = 3
      end
    end
    inherited Panel5: TPanel
      Visible = False
      ExplicitLeft = 297
      ExplicitHeight = 45
    end
    inherited Panel6: TPanel
      ExplicitLeft = 757
    end
  end
  object gridProdutos: TDBGrid
    Left = 0
    Top = 80
    Width = 862
    Height = 400
    Align = alClient
    BorderStyle = bsNone
    Color = 5716789
    FixedColor = 5585461
    Font.Charset = ANSI_CHARSET
    Font.Color = 5585461
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ImeName = 'Portuguese (Brazilian ABNT)'
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'id_produto'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Segoe UI Semibold'
        Title.Font.Style = [fsBold]
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Segoe UI Semibold'
        Title.Font.Style = [fsBold]
        Width = 159
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'preco'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Segoe UI Semibold'
        Title.Font.Style = [fsBold]
        Width = 392
        Visible = True
      end>
  end
  object tabProduto: TFDMemTable
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
  object dsProduto: TDataSource
    DataSet = tabProduto
    Left = 632
    Top = 120
  end
end
