inherited frmCliente: TfrmCliente
  Caption = 'frmCliente'
  ClientHeight = 613
  ClientWidth = 912
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
      Left = 792
      ExplicitLeft = 792
    end
    inherited Panel2: TPanel
      Left = 532
      ExplicitLeft = 532
      inherited btnInserir: TSpeedButton
        OnClick = btnInserirClick
      end
    end
    inherited Panel3: TPanel
      Left = 662
      ExplicitLeft = 662
    end
    inherited Panel4: TPanel
      Left = 114
      Width = 358
      ExplicitLeft = 114
      ExplicitWidth = 358
      inherited Panel7: TPanel
        Left = 238
        ExplicitLeft = 238
        inherited btnBuscar: TSpeedButton
          OnClick = btnBuscarClick
        end
      end
      inherited edtBuscar: TEdit
        Width = 238
        ExplicitTop = 17
        ExplicitWidth = 238
        ExplicitHeight = 40
      end
    end
  end
  object gridClientes: TDBGrid
    Left = 0
    Top = 80
    Width = 912
    Height = 533
    Align = alClient
    BorderStyle = bsNone
    Color = 5585461
    DataSource = dsCliente
    FixedColor = 5585461
    Font.Charset = ANSI_CHARSET
    Font.Color = 5585461
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ImeName = 'Portuguese (Brazilian ABNT)'
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
        FieldName = 'id_cliente'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'endereco'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'complemento'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bairro'
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cidade'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'uf'
        Width = 93
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
