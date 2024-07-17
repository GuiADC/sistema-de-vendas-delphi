inherited frmCliente: TfrmCliente
  Caption = 'frmCliente'
  ClientHeight = 613
  ClientWidth = 912
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
      end
      inherited Edit1: TEdit
        Width = 238
        ExplicitWidth = 238
      end
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 80
    Width = 912
    Height = 533
    Align = alClient
    BorderStyle = bsNone
    DataSource = DataSource1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
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
        FieldName = 'Cliente'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Empresa'
        Visible = True
      end>
  end
  object FDMemTable1: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'Cliente'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Empresa'
        DataType = ftString
        Size = 255
      end>
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
    Left = 344
    Top = 168
    Content = {
      414442531000000069010000FF00010001FF02FF03040016000000460044004D
      0065006D005400610062006C0065003100050016000000460044004D0065006D
      005400610062006C0065003100060000000000070000080032000000090000FF
      0AFF0B04000E00000043006C00690065006E007400650005000E00000043006C
      00690065006E00740065000C00010000000E000D000F00FF0000001000011100
      0112000113000114000115000116000E00000043006C00690065006E00740065
      001700FF000000FEFF0B04000E00000045006D00700072006500730061000500
      0E00000045006D00700072006500730061000C00020000000E000D000F00FF00
      000010000111000112000113000114000115000116000E00000045006D007000
      72006500730061001700FF000000FEFEFF18FEFF19FEFF1AFF1B1C0000000000
      FF1D000003000000617364010003000000617364FEFEFEFEFEFF1EFEFF1F2000
      0A000000FF21FEFEFE0E004D0061006E0061006700650072001E005500700064
      0061007400650073005200650067006900730074007200790012005400610062
      006C0065004C006900730074000A005400610062006C00650008004E0061006D
      006500140053006F0075007200630065004E0061006D0065000A005400610062
      0049004400240045006E0066006F0072006300650043006F006E007300740072
      00610069006E00740073001E004D0069006E0069006D0075006D004300610070
      0061006300690074007900180043006800650063006B004E006F0074004E0075
      006C006C00140043006F006C0075006D006E004C006900730074000C0043006F
      006C0075006D006E00100053006F007500720063006500490044001800640074
      0041006E007300690053007400720069006E0067001000440061007400610054
      007900700065000800530069007A006500140053006500610072006300680061
      0062006C006500120041006C006C006F0077004E0075006C006C000800420061
      007300650014004F0041006C006C006F0077004E0075006C006C0012004F0049
      006E0055007000640061007400650010004F0049006E00570068006500720065
      001A004F0072006900670069006E0043006F006C004E0061006D006500140053
      006F007500720063006500530069007A0065001C0043006F006E007300740072
      00610069006E0074004C00690073007400100056006900650077004C00690073
      0074000E0052006F0077004C00690073007400060052006F0077000A0052006F
      0077004900440010004F0072006900670069006E0061006C001800520065006C
      006100740069006F006E004C006900730074001C005500700064006100740065
      0073004A006F00750072006E0061006C001200530061007600650050006F0069
      006E0074000E004300680061006E00670065007300}
    object FDMemTable1Nome: TStringField
      DisplayWidth = 23
      FieldName = 'Cliente'
      Size = 255
    end
    object FDMemTable1Empresa: TStringField
      DisplayWidth = 19
      FieldName = 'Empresa'
      Size = 255
    end
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 536
    Top = 160
  end
end
