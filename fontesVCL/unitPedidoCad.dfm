object frmPedidoCad: TfrmPedidoCad
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Pedido'
  ClientHeight = 475
  ClientWidth = 778
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
    Left = 80
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
  object imgBusca: TImage
    Left = 383
    Top = 100
    Width = 33
    Height = 33
    Cursor = crHandPoint
    Center = True
    Picture.Data = {
      0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
      00200806000000737A7AF4000000097048597300000B1300000B1301009A9C18
      00000A4F6943435050686F746F73686F70204943432070726F66696C65000078
      DA9D53675453E9163DF7DEF4424B8880944B6F5215082052428B801491262A21
      09104A8821A1D91551C1114545041BC8A088038E8E808C15512C0C8A0AD807E4
      21A28E83A3888ACAFBE17BA36BD6BCF7E6CDFEB5D73EE7ACF39DB3CF07C0080C
      9648335135800CA9421E11E083C7C4C6E1E42E40810A2470001008B3642173FD
      230100F87E3C3C2B22C007BE000178D30B0800C04D9BC0301C87FF0FEA42995C
      01808401C07491384B08801400407A8E42A600404601809D98265300A0040060
      CB6362E300502D0060277FE6D300809DF8997B01005B94211501A09100201365
      884400683B00ACCF568A450058300014664BC43900D82D00304957664800B0B7
      00C0CE100BB200080C00305188852900047B0060C8232378008499001446F257
      3CF12BAE10E72A00007899B23CB9243945815B082D710757572E1E28CE49172B
      14366102619A402EC27999193281340FE0F3CC0000A0911511E083F3FD78CE0E
      AECECE368EB60E5F2DEABF06FF226262E3FEE5CFAB70400000E1747ED1FE2C2F
      B31A803B06806DFEA225EE04685E0BA075F78B66B20F40B500A0E9DA57F370F8
      7E3C3C45A190B9D9D9E5E4E4D84AC4425B61CA577DFE67C25FC057FD6CF97E3C
      FCF7F5E0BEE22481325D814704F8E0C2CCF44CA51CCF92098462DCE68F47FCB7
      0BFFFC1DD322C44962B9582A14E35112718E449A8CF332A52289429229C525D2
      FF64E2DF2CFB033EDF3500B06A3E017B912DA85D6303F64B27105874C0E2F700
      00F2BB6FC1D4280803806883E1CF77FFEF3FFD47A02500806649927100005E44
      242E54CAB33FC708000044A0812AB0411BF4C1182CC0061CC105DCC10BFC6036
      844224C4C24210420A64801C726029AC82422886CDB01D2A602FD4401D34C051
      688693700E2EC255B80E3D700FFA61089EC128BC81090441C808136121DA8801
      628A58238E08179985F821C14804128B2420C9881451224B91354831528A5420
      55481DF23D720239875C46BA913BC8003282FC86BC47319481B2513DD40CB543
      B9A8371A8446A20BD06474319A8F16A09BD072B41A3D8C36A1E7D0AB680FDA8F
      3E43C730C0E8180733C46C302EC6C342B1382C099363CBB122AC0CABC61AB056
      AC03BB89F563CFB17704128145C0093604774220611E4148584C584ED848A820
      1C243411DA093709038451C2272293A84BB426BA11F9C4186232318758482C23
      D6128F132F107B8843C437241289433227B9900249B1A454D212D246D26E5223
      E92CA99B34481A2393C9DA646BB20739942C202BC885E49DE4C3E433E41BE421
      F25B0A9D624071A4F853E22852CA6A4A19E510E534E5066598324155A39A52DD
      A8A15411358F5A42ADA1B652AF5187A81334759A39CD8316494BA5ADA295D31A
      681768F769AFE874BA11DD951E4E97D057D2CBE947E897E803F4770C0D861583
      C7886728199B18071867197718AF984CA619D38B19C754303731EB98E7990F99
      6F55582AB62A7C1591CA0A954A9526951B2A2F54A9AAA6AADEAA0B55F355CB54
      8FA95E537DAE46553353E3A909D496AB55AA9D50EB531B5367A93BA887AA67A8
      6F543FA47E59FD890659C34CC34F43A451A0B15FE3BCC6200B6319B3782C216B
      0DAB86758135C426B1CDD97C762ABB98FD1DBB8B3DAAA9A13943334A3357B352
      F394663F07E39871F89C744E09E728A797F37E8ADE14EF29E2291BA6344CB931
      655C6BAA96979658AB48AB51AB47EBBD36AEEDA79DA6BD45BB59FB810E41C74A
      275C2747678FCE059DE753D953DDA70AA7164D3D3AF5AE2EAA6BA51BA1BB4477
      BF6EA7EE989EBE5E809E4C6FA7DE79BDE7FA1C7D2FFD54FD6DFAA7F5470C5806
      B30C2406DB0CCE183CC535716F3C1D2FC7DBF151435DC34043A561956197E184
      91B9D13CA3D5468D460F8C69C65CE324E36DC66DC6A326062621264B4DEA4DEE
      9A524DB9A629A63B4C3B4CC7CDCCCDA2CDD699359B3D31D732E79BE79BD79BDF
      B7605A785A2CB6A8B6B86549B2E45AA659EEB6BC6E855A3959A558555A5DB346
      AD9DAD25D6BBADBBA711A7B94E934EAB9ED667C3B0F1B6C9B6A9B719B0E5D806
      DBAEB66DB67D6167621767B7C5AEC3EE93BD937DBA7D8DFD3D070D87D90EAB1D
      5A1D7E73B472143A563ADE9ACE9CEE3F7DC5F496E92F6758CF10CFD833E3B613
      CB29C4699D539BD347671767B97383F3888B894B82CB2E973E2E9B1BC6DDC8BD
      E44A74F5715DE17AD2F59D9BB39BC2EDA8DBAFEE36EE69EE87DC9FCC349F299E
      593373D0C3C843E051E5D13F0B9F95306BDFAC7E4F434F8167B5E7232F632F91
      57ADD7B0B7A577AAF761EF173EF63E729FE33EE33C37DE32DE595FCC37C0B7C8
      B7CB4FC36F9E5F85DF437F23FF64FF7AFFD100A78025016703898141815B02FB
      F87A7C21BF8E3F3ADB65F6B2D9ED418CA0B94115418F82AD82E5C1AD2168C8EC
      90AD21F7E798CE91CE690E85507EE8D6D00761E6618BC37E0C2785878557863F
      8E7088581AD131973577D1DC4373DF44FA449644DE9B67314F39AF2D4A352A3E
      AA2E6A3CDA37BA34BA3FC62E6659CCD5589D58496C4B1C392E2AAE366E6CBEDF
      FCEDF387E29DE20BE37B17982FC85D7079A1CEC2F485A716A92E122C3A96404C
      884E3894F041102AA8168C25F21377258E0A79C21DC267222FD136D188D8435C
      2A1E4EF2482A4D7A92EC91BC357924C533A52CE5B98427A990BC4C0D4CDD9B3A
      9E169A76206D323D3ABD31839291907142AA214D93B667EA67E66676CBAC6585
      B2FEC56E8BB72F1E9507C96BB390AC05592D0AB642A6E8545A28D72A07B26765
      5766BFCD89CA3996AB9E2BCDEDCCB3CADB90379CEF9FFFED12C212E192B6A586
      4B572D1D58E6BDAC6A39B23C7179DB0AE315052B865606AC3CB88AB62A6DD54F
      ABED5797AE7EBD267A4D6B815EC1CA82C1B5016BEB0B550AE5857DEBDCD7ED5D
      4F582F59DFB561FA869D1B3E15898AAE14DB1797157FD828DC78E51B876FCABF
      99DC94B4A9ABC4B964CF66D266E9E6DE2D9E5B0E96AA97E6970E6E0DD9DAB40D
      DF56B4EDF5F645DB2F97CD28DBBB83B643B9A3BF3CB8BC65A7C9CECD3B3F54A4
      54F454FA5436EED2DDB561D7F86ED1EE1B7BBCF634ECD5DB5BBCF7FD3EC9BEDB
      5501554DD566D565FB49FBB3F73FAE89AAE9F896FB6D5DAD4E6D71EDC703D203
      FD07230EB6D7B9D4D51DD23D54528FD62BEB470EC71FBEFE9DEF772D0D360D55
      8D9CC6E223704479E4E9F709DFF71E0D3ADA768C7BACE107D31F761D671D2F6A
      429AF29A469B539AFB5B625BBA4FCC3ED1D6EADE7AFC47DB1F0F9C343C59794A
      F354C969DAE982D39367F2CF8C9D959D7D7E2EF9DC60DBA2B67BE763CEDF6A0F
      6FEFBA1074E1D245FF8BE73BBC3BCE5CF2B874F2B2DBE51357B8579AAF3A5F6D
      EA74EA3CFE93D34FC7BB9CBB9AAEB95C6BB9EE7ABDB57B66F7E91B9E37CEDDF4
      BD79F116FFD6D59E393DDDBDF37A6FF7C5F7F5DF16DD7E7227FDCECBBBD97727
      EEADBC4FBC5FF440ED41D943DD87D53F5BFEDCD8EFDC7F6AC077A0F3D1DC47F7
      068583CFFE91F58F0F43058F998FCB860D86EB9E383E3939E23F72FDE9FCA743
      CF64CF269E17FEA2FECBAE17162F7EF8D5EBD7CED198D1A197F29793BF6D7CA5
      FDEAC0EB19AFDBC6C2C61EBEC97833315EF456FBEDC177DC771DEFA3DF0F4FE4
      7C207F28FF68F9B1F553D0A7FB93199393FF040398F3FC63332DDB0000000467
      414D410000B18E7CFB5193000002F04944415478DAD5975D688F511CC7CFBCC4
      8DBCE4258525D976A10C8572212ED876216E94798B6D4634425CB00B42A22956
      DBF2BADA10AEBC8D2B144314565C10F252DE52F27231D1FE3EDF9EDFF234FFE7
      F9FF9FFD1F5B3BF5EDF73FE7FF3BBFF379CE73CEEF3C272B9148B8EE2C593D0E
      60EA8C85A330A3D170F4057D422FEE359FFDF5DF0018743CA61CCD47E392B87C
      454DA81190A6D80018781066372A437DD38C7913AD07E46146000C9E83B98872
      7CCD1FED491FDBEFC1680C9A8326FAFC5A512910273B05C0E0B998DB688835BD
      44DBD11982B605000B602F2AF035AFC1BF2E120081F454777D4F7E1E2D21D08F
      74A694FE15982AD407696116D0F75A14801A915BF5025A10F4D42110CB31F556
      7D8DF288D19A12C056FB13E72D384D7B3E1DBF4719DC17AB16B3DAAA9B895395
      0E809C365AB5984EA73B33B8C51A8A798E06DA2C8C25DE3F0BAE23C0338C6641
      C96564D4A94F02E17F9D9ACD964000CB706FADFD38CE25990C6E310B9DB76D55
      3610F36018C074CC1D6BDF84F3811800B231AFACBA9F985BC200E6396FCBA92C
      C5B93106807ECE4B4A2A0DC45C1606301373C3DAD7E25C1303C008CC07AB5613
      B3220C4089E7A9B5EFC3796B0C00D39C97D454B611734F1880F6BE56BF0EA016
      9CF36300A8C4ECB46A1131AF04025887539845564DBA6D220CDEDB7987561E52
      321B46BC9FA9008A3097AD7A950E85190094628E5835705B273B0B7470CCB2AA
      CEF5439D187C02E696F3B2A076412E71DEA40B3019D38CFAA3DFA88CCEF51106
      D7B17CDFFDFD80A9A4FFAE20FFA0EF81C59806FD6F4D7516E873C8C07AE72B90
      12D8006B56F055F43B1A09C002EA24AB76DEB9AEF20D69915E72DEE27AEFBC2F
      2265BBB9A8D8790BAEBD24EC01DA0CE258240083988D39E1BCCFAE748BDEB9F6
      FB3B7418F5321825B7DA480006A1B5B0CE941DE2AAAD760EED685F70F45DE9BC
      9D100811E95E40402527A56CDD0B9466752F50AA7D80AE27DBE7A920BAE46604
      4489EF75684D4C01E2519701748070DD0260109364FD97969E77398DBBFC019D
      9F74D04DF95D140000000049454E44AE426082}
    OnClick = imgBuscaClick
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
    Left = 80
    Top = 100
    Width = 303
    Height = 33
    Margins.Left = 0
    Margins.Top = 20
    Margins.Right = 0
    Margins.Bottom = 20
    Enabled = False
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
    Width = 54
    Height = 33
    Margins.Left = 0
    Margins.Top = 20
    Margins.Right = 0
    Margins.Bottom = 20
    Enabled = False
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
    Left = 50
    Top = -100
    Width = 778
    Height = 491
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
      Left = 472
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
      Left = 558
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
      Left = 641
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
    object imgBuscaProd: TImage
      Left = 377
      Top = 165
      Width = 33
      Height = 29
      Cursor = crHandPoint
      Center = True
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
        00200806000000737A7AF4000000097048597300000B1300000B1301009A9C18
        00000A4F6943435050686F746F73686F70204943432070726F66696C65000078
        DA9D53675453E9163DF7DEF4424B8880944B6F5215082052428B801491262A21
        09104A8821A1D91551C1114545041BC8A088038E8E808C15512C0C8A0AD807E4
        21A28E83A3888ACAFBE17BA36BD6BCF7E6CDFEB5D73EE7ACF39DB3CF07C0080C
        9648335135800CA9421E11E083C7C4C6E1E42E40810A2470001008B3642173FD
        230100F87E3C3C2B22C007BE000178D30B0800C04D9BC0301C87FF0FEA42995C
        01808401C07491384B08801400407A8E42A600404601809D98265300A0040060
        CB6362E300502D0060277FE6D300809DF8997B01005B94211501A09100201365
        884400683B00ACCF568A450058300014664BC43900D82D00304957664800B0B7
        00C0CE100BB200080C00305188852900047B0060C8232378008499001446F257
        3CF12BAE10E72A00007899B23CB9243945815B082D710757572E1E28CE49172B
        14366102619A402EC27999193281340FE0F3CC0000A0911511E083F3FD78CE0E
        AECECE368EB60E5F2DEABF06FF226262E3FEE5CFAB70400000E1747ED1FE2C2F
        B31A803B06806DFEA225EE04685E0BA075F78B66B20F40B500A0E9DA57F370F8
        7E3C3C45A190B9D9D9E5E4E4D84AC4425B61CA577DFE67C25FC057FD6CF97E3C
        FCF7F5E0BEE22481325D814704F8E0C2CCF44CA51CCF92098462DCE68F47FCB7
        0BFFFC1DD322C44962B9582A14E35112718E449A8CF332A52289429229C525D2
        FF64E2DF2CFB033EDF3500B06A3E017B912DA85D6303F64B27105874C0E2F700
        00F2BB6FC1D4280803806883E1CF77FFEF3FFD47A02500806649927100005E44
        242E54CAB33FC708000044A0812AB0411BF4C1182CC0061CC105DCC10BFC6036
        844224C4C24210420A64801C726029AC82422886CDB01D2A602FD4401D34C051
        688693700E2EC255B80E3D700FFA61089EC128BC81090441C808136121DA8801
        628A58238E08179985F821C14804128B2420C9881451224B91354831528A5420
        55481DF23D720239875C46BA913BC8003282FC86BC47319481B2513DD40CB543
        B9A8371A8446A20BD06474319A8F16A09BD072B41A3D8C36A1E7D0AB680FDA8F
        3E43C730C0E8180733C46C302EC6C342B1382C099363CBB122AC0CABC61AB056
        AC03BB89F563CFB17704128145C0093604774220611E4148584C584ED848A820
        1C243411DA093709038451C2272293A84BB426BA11F9C4186232318758482C23
        D6128F132F107B8843C437241289433227B9900249B1A454D212D246D26E5223
        E92CA99B34481A2393C9DA646BB20739942C202BC885E49DE4C3E433E41BE421
        F25B0A9D624071A4F853E22852CA6A4A19E510E534E5066598324155A39A52DD
        A8A15411358F5A42ADA1B652AF5187A81334759A39CD8316494BA5ADA295D31A
        681768F769AFE874BA11DD951E4E97D057D2CBE947E897E803F4770C0D861583
        C7886728199B18071867197718AF984CA619D38B19C754303731EB98E7990F99
        6F55582AB62A7C1591CA0A954A9526951B2A2F54A9AAA6AADEAA0B55F355CB54
        8FA95E537DAE46553353E3A909D496AB55AA9D50EB531B5367A93BA887AA67A8
        6F543FA47E59FD890659C34CC34F43A451A0B15FE3BCC6200B6319B3782C216B
        0DAB86758135C426B1CDD97C762ABB98FD1DBB8B3DAAA9A13943334A3357B352
        F394663F07E39871F89C744E09E728A797F37E8ADE14EF29E2291BA6344CB931
        655C6BAA96979658AB48AB51AB47EBBD36AEEDA79DA6BD45BB59FB810E41C74A
        275C2747678FCE059DE753D953DDA70AA7164D3D3AF5AE2EAA6BA51BA1BB4477
        BF6EA7EE989EBE5E809E4C6FA7DE79BDE7FA1C7D2FFD54FD6DFAA7F5470C5806
        B30C2406DB0CCE183CC535716F3C1D2FC7DBF151435DC34043A561956197E184
        91B9D13CA3D5468D460F8C69C65CE324E36DC66DC6A326062621264B4DEA4DEE
        9A524DB9A629A63B4C3B4CC7CDCCCDA2CDD699359B3D31D732E79BE79BD79BDF
        B7605A785A2CB6A8B6B86549B2E45AA659EEB6BC6E855A3959A558555A5DB346
        AD9DAD25D6BBADBBA711A7B94E934EAB9ED667C3B0F1B6C9B6A9B719B0E5D806
        DBAEB66DB67D6167621767B7C5AEC3EE93BD937DBA7D8DFD3D070D87D90EAB1D
        5A1D7E73B472143A563ADE9ACE9CEE3F7DC5F496E92F6758CF10CFD833E3B613
        CB29C4699D539BD347671767B97383F3888B894B82CB2E973E2E9B1BC6DDC8BD
        E44A74F5715DE17AD2F59D9BB39BC2EDA8DBAFEE36EE69EE87DC9FCC349F299E
        593373D0C3C843E051E5D13F0B9F95306BDFAC7E4F434F8167B5E7232F632F91
        57ADD7B0B7A577AAF761EF173EF63E729FE33EE33C37DE32DE595FCC37C0B7C8
        B7CB4FC36F9E5F85DF437F23FF64FF7AFFD100A78025016703898141815B02FB
        F87A7C21BF8E3F3ADB65F6B2D9ED418CA0B94115418F82AD82E5C1AD2168C8EC
        90AD21F7E798CE91CE690E85507EE8D6D00761E6618BC37E0C2785878557863F
        8E7088581AD131973577D1DC4373DF44FA449644DE9B67314F39AF2D4A352A3E
        AA2E6A3CDA37BA34BA3FC62E6659CCD5589D58496C4B1C392E2AAE366E6CBEDF
        FCEDF387E29DE20BE37B17982FC85D7079A1CEC2F485A716A92E122C3A96404C
        884E3894F041102AA8168C25F21377258E0A79C21DC267222FD136D188D8435C
        2A1E4EF2482A4D7A92EC91BC357924C533A52CE5B98427A990BC4C0D4CDD9B3A
        9E169A76206D323D3ABD31839291907142AA214D93B667EA67E66676CBAC6585
        B2FEC56E8BB72F1E9507C96BB390AC05592D0AB642A6E8545A28D72A07B26765
        5766BFCD89CA3996AB9E2BCDEDCCB3CADB90379CEF9FFFED12C212E192B6A586
        4B572D1D58E6BDAC6A39B23C7179DB0AE315052B865606AC3CB88AB62A6DD54F
        ABED5797AE7EBD267A4D6B815EC1CA82C1B5016BEB0B550AE5857DEBDCD7ED5D
        4F582F59DFB561FA869D1B3E15898AAE14DB1797157FD828DC78E51B876FCABF
        99DC94B4A9ABC4B964CF66D266E9E6DE2D9E5B0E96AA97E6970E6E0DD9DAB40D
        DF56B4EDF5F645DB2F97CD28DBBB83B643B9A3BF3CB8BC65A7C9CECD3B3F54A4
        54F454FA5436EED2DDB561D7F86ED1EE1B7BBCF634ECD5DB5BBCF7FD3EC9BEDB
        5501554DD566D565FB49FBB3F73FAE89AAE9F896FB6D5DAD4E6D71EDC703D203
        FD07230EB6D7B9D4D51DD23D54528FD62BEB470EC71FBEFE9DEF772D0D360D55
        8D9CC6E223704479E4E9F709DFF71E0D3ADA768C7BACE107D31F761D671D2F6A
        429AF29A469B539AFB5B625BBA4FCC3ED1D6EADE7AFC47DB1F0F9C343C59794A
        F354C969DAE982D39367F2CF8C9D959D7D7E2EF9DC60DBA2B67BE763CEDF6A0F
        6FEFBA1074E1D245FF8BE73BBC3BCE5CF2B874F2B2DBE51357B8579AAF3A5F6D
        EA74EA3CFE93D34FC7BB9CBB9AAEB95C6BB9EE7ABDB57B66F7E91B9E37CEDDF4
        BD79F116FFD6D59E393DDDBDF37A6FF7C5F7F5DF16DD7E7227FDCECBBBD97727
        EEADBC4FBC5FF440ED41D943DD87D53F5BFEDCD8EFDC7F6AC077A0F3D1DC47F7
        068583CFFE91F58F0F43058F998FCB860D86EB9E383E3939E23F72FDE9FCA743
        CF64CF269E17FEA2FECBAE17162F7EF8D5EBD7CED198D1A197F29793BF6D7CA5
        FDEAC0EB19AFDBC6C2C61EBEC97833315EF456FBEDC177DC771DEFA3DF0F4FE4
        7C207F28FF68F9B1F553D0A7FB93199393FF040398F3FC63332DDB0000000467
        414D410000B18E7CFB5193000002F04944415478DAD5975D688F511CC7CFBCC4
        8DBCE4258525D976A10C8572212ED876216E94798B6D4634425CB00B42A22956
        DBF2BADA10AEBC8D2B144314565C10F252DE52F27231D1FE3EDF9EDFF234FFE7
        F9FF9FFD1F5B3BF5EDF73FE7FF3BBFF379CE73CEEF3C272B9148B8EE2C593D0E
        60EA8C85A330A3D170F4057D422FEE359FFDF5DF0018743CA61CCD47E392B87C
        454DA81190A6D80018781066372A437DD38C7913AD07E46146000C9E83B98872
        7CCD1FED491FDBEFC1680C9A8326FAFC5A512910273B05C0E0B998DB688835BD
        44DBD11982B605000B602F2AF035AFC1BF2E120081F454777D4F7E1E2D21D08F
        74A694FE15982AD407696116D0F75A14801A915BF5025A10F4D42110CB31F556
        7D8DF288D19A12C056FB13E72D384D7B3E1DBF4719DC17AB16B3DAAA9B895395
        0E809C365AB5984EA73B33B8C51A8A798E06DA2C8C25DE3F0BAE23C0338C6641
        C96564D4A94F02E17F9D9ACD964000CB706FADFD38CE25990C6E310B9DB76D55
        3610F36018C074CC1D6BDF84F3811800B231AFACBA9F985BC200E6396FCBA92C
        C5B93106807ECE4B4A2A0DC45C1606301373C3DAD7E25C1303C008CC07AB5613
        B3220C4089E7A9B5EFC3796B0C00D39C97D454B611734F1880F6BE56BF0EA016
        9CF36300A8C4ECB46A1131AF04025887539845564DBA6D220CDEDB7987561E52
        321B46BC9FA9008A3097AD7A950E85190094628E5835705B273B0B7470CCB2AA
        CEF5439D187C02E696F3B2A076412E71DEA40B3019D38CFAA3DFA88CCEF51106
        D7B17CDFFDFD80A9A4FFAE20FFA0EF81C59806FD6F4D7516E873C8C07AE72B90
        12D8006B56F055F43B1A09C002EA24AB76DEB9AEF20D69915E72DEE27AEFBC2F
        2265BBB9A8D8790BAEBD24EC01DA0CE258240083988D39E1BCCFAE748BDEB9F6
        FB3B7418F5321825B7DA480006A1B5B0CE941DE2AAAD760EED685F70F45DE9BC
        9D100811E95E40402527A56CDD0B9466752F50AA7D80AE27DBE7A920BAE46604
        4489EF75684D4C01E2519701748070DD0260109364FD97969E77398DBBFC019D
        9F74D04DF95D140000000049454E44AE426082}
      OnClick = imgBuscaProdClick
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
      Enabled = False
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
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object edtQtd: TDBEdit
      Left = 472
      Top = 168
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
      OnExit = edtQtdExit
    end
    object edtUnitario: TDBEdit
      Left = 563
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
      OnExit = edtUnitarioExit
    end
    object edtTotal: TDBEdit
      Left = 641
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
      Size = 200
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
