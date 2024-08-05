inherited frmProduto: TfrmProduto
  Caption = 'frmProduto'
  OnShow = FormShow
  TextHeight = 15
  inherited pHeader: TPanel
    inherited Label1: TLabel
      Width = 119
      Caption = 'Produtos'
      ExplicitWidth = 119
    end
    inherited Panel1: TPanel
      inherited btnExcluir: TSpeedButton
        OnClick = btnExcluirClick
      end
    end
    inherited Panel2: TPanel
      inherited btnInserir: TSpeedButton
        OnClick = btnInserirClick
      end
    end
    inherited Panel3: TPanel
      inherited btnEditar: TSpeedButton
        OnClick = btnEditarClick
      end
    end
    inherited Panel4: TPanel
      Left = 129
      Width = 293
      ExplicitLeft = 129
      ExplicitWidth = 293
      inherited Panel7: TPanel
        Left = 173
        ExplicitLeft = 173
      end
      inherited edtBuscar: TEdit
        Width = 173
        ExplicitWidth = 173
      end
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
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
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
