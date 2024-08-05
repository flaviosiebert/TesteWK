object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 361
  Width = 603
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=teste_wk'
      'User_Name=root'
      'DriverID=MySQL')
    LoginPrompt = False
    AfterConnect = FDConnection1AfterConnect
    Left = 32
    Top = 16
  end
  object qryClientes: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from cad_clientes')
    Left = 176
    Top = 16
    object qryClientescodigo: TIntegerField
      FieldName = 'codigo'
      Origin = 'codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryClientesnome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome'
      Origin = 'nome'
      Size = 200
    end
    object qryClientescidade: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cidade'
      Origin = 'cidade'
      Size = 200
    end
    object qryClientesuf: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'uf'
      Origin = 'uf'
      Size = 2
    end
  end
  object qryProdutos: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from cad_produtos')
    Left = 176
    Top = 80
    object qryProdutoscodigo: TIntegerField
      FieldName = 'codigo'
      Origin = 'codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryProdutosdescricao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 200
    end
    object qryProdutospreco_venda: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'preco_venda'
      Origin = 'preco_venda'
      DisplayFormat = 'R$ ##0.00'
      Precision = 12
      Size = 2
    end
  end
  object qryProdutosPedidos: TFDQuery
    IndexFieldNames = 'codigo_produto'
    Connection = FDConnection1
    SQL.Strings = (
      'select * from ped_produtos')
    Left = 176
    Top = 216
    object qryProdutosPedidosnumero_pedido: TIntegerField
      FieldName = 'numero_pedido'
      Origin = 'numero_pedido'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryProdutosPedidoscodigo_produto: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'codigo_produto'
      Origin = 'codigo_produto'
    end
    object qryProdutosPedidosquantidade: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'quantidade'
      Origin = 'quantidade'
    end
    object qryProdutosPedidosvalor_unitario: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'valor_unitario'
      Origin = 'valor_unitario'
      DisplayFormat = 'R$ ##0.00'
      Precision = 12
      Size = 2
    end
    object qryProdutosPedidosvalor_total: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'valor_total'
      Origin = 'valor_total'
      DisplayFormat = 'R$ ##0.00'
      Precision = 12
      Size = 2
    end
  end
  object qryDadosGerais: TFDQuery
    AfterScroll = qryDadosGeraisAfterScroll
    Connection = FDConnection1
    SQL.Strings = (
      'select * from ped_dados_gerais')
    Left = 176
    Top = 152
    object qryDadosGeraisnumero_pedido: TFDAutoIncField
      FieldName = 'numero_pedido'
      Origin = 'numero_pedido'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qryDadosGeraisdata_emissao: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'data_emissao'
      Origin = 'data_emissao'
      EditMask = 'dd/MM/yyyy - HH:nn:SS;1;_'
    end
    object qryDadosGeraiscodigo_cliente: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'codigo_cliente'
      Origin = 'codigo_cliente'
    end
    object qryDadosGeraisvalor_total: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'valor_total'
      Origin = 'valor_total'
      DisplayFormat = 'R$ ##0.00'
      Precision = 12
      Size = 2
    end
  end
  object dtsProdutos: TDataSource
    DataSet = qryProdutos
    Left = 296
    Top = 88
  end
  object dtsClientes: TDataSource
    DataSet = qryClientes
    Left = 296
    Top = 16
  end
  object dtsProdutosPedidos: TDataSource
    DataSet = qryProdutosPedidos
    Left = 296
    Top = 216
  end
  object dtsDadosGerais: TDataSource
    DataSet = qryDadosGerais
    Left = 296
    Top = 152
  end
  object dtstmpProdutosPedidos: TDataSource
    DataSet = tmpProdutosPedidos
    Left = 448
    Top = 192
  end
  object qryAuxiliar1: TFDQuery
    Connection = FDConnection1
    Left = 456
    Top = 24
  end
  object qryAuxiliar2: TFDQuery
    Connection = FDConnection1
    Left = 456
    Top = 72
  end
  object tmpProdutosPedidos: TClientDataSet
    PersistDataPacket.Data = {
      8D0000009619E0BD0100000018000000050000000000030000008D000E636F64
      69676F5F70726F6475746F04000100000000000964657363726963616F010049
      000000010005574944544802000200C8000A7175616E74696461646504000100
      000000000E76616C6F725F756E69746172696F08000400000000000B76616C6F
      725F746F74616C08000400000000000000}
    Active = True
    Aggregates = <>
    FieldOptions.UpdatePersistent = True
    Params = <>
    Left = 456
    Top = 136
    object tmpProdutosPedidoscodigo_produto: TIntegerField
      FieldName = 'codigo_produto'
    end
    object tmpProdutosPedidosdescricao: TStringField
      FieldName = 'descricao'
      Size = 200
    end
    object tmpProdutosPedidosquantidade: TIntegerField
      FieldName = 'quantidade'
    end
    object tmpProdutosPedidosvalor_unitario: TFloatField
      FieldName = 'valor_unitario'
      DisplayFormat = 'R$ ##0.00'
    end
    object tmpProdutosPedidosvalor_total: TFloatField
      FieldName = 'valor_total'
      DisplayFormat = 'R$ ##0.00'
    end
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = tmpProdutosPedidos
    ResolveToDataSet = True
    Left = 464
    Top = 256
  end
  object ImageList1: TImageList
    Left = 152
    Top = 304
    Bitmap = {
      494C010104000800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE947300BD734200B56B
      3100B56B3100B56B3100B5633100AD633100AD633100AD633100AD633100AD63
      3100A5633100A5633100AD6B3900BD8463000000000000000000000000000000
      00000000000000000000000000000000000000000000EFEFF700CEDEE700A5BD
      D60084A5C6006394B500185A9400216394000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C67B5200EFC6AD00E7C6AD00FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700C69C7B00C6947B00AD6B42009C9C9C0073737300525252005252
      5200525252004A4A4A004A4A4A004A4A4A0042424200216B9C003173A500397B
      AD004A84B5004A8CBD00427BAD00216394000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6A1
      8C00C38E6800BE886400BB856100B9835F00B27C5A00B17B5800AE795700AD76
      5600AB755400A9735300A9715100C6A18C00BD6B3900EFCEB500DEA57B00FFF7
      F70063BD8C0063BD8C0063BD8C0063BD8C0063BD8C0063BD8C0063BD8C0063BD
      8C00FFF7F700CE8C6300C69C7B00A563310000000000000000005A5A5A00A5A5
      A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500316BA5007BADD6007BAD
      D60073A5CE006B9CCE00427BAD00216B9C00C6A18C00C38E6800C08B6600BE88
      6400BB856100B9835F00B47E5C00B27C5A00B17B5800AE795700AD765600AB75
      5400A9735300A9715100C6A18C0000000000000000000000000000000000C892
      6C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A9725100BD6B3900EFCEB500DEA57B00FFF7
      F700BDDEC600BDDEC600BDDEC600BDDEC600BDDEC600BDDEC600BDDEC600BDDE
      C600FFF7F700CE946B00CE9C8400A563310000000000000000005A5A5A00A5A5
      A500397342009CA5A500A5A5A500A5A5A500A5A5A5003973AD007BADD6005A9C
      C6005294C6005A94C6004284AD00296B9C00C8926C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A972510000000000000000000000000000000000CC97
      6F0000000000FFFFFD00FEFEFC00FEFEFC00FDFDFA00FDFDFA00FDFDFA00FDFD
      FA00FCFCF700FBFBF60000000000AC755400BD6B3900EFCEB500DEA57B00FFF7
      F70063BD8C0063BD8C0063BD8C0063BD8C0063BD8C0063BD8C0063BD8C0063BD
      8C00FFF7F700CE946B00CEA58400AD6331000000000000000000636363009C9C
      9C003973420039733900A5A5A500A5A5A500A5A5A500397BAD0084B5D600639C
      CE005A9CC6005A9CCE004284AD00296B9C00CA946E000000000000000000FFFF
      FE00FFFFFD00FEFEFD00FEFEFC00FEFEFC00FEFEFC00FEFEFC00FEFEFA00FEFE
      FA00FCFCF90000000000AA73530000000000000000000000000000000000D19C
      730000000000FEFEFC00FEFEFC00FDFDFB00FDFDFA00FDFDF800FBFBF900FBFA
      F700FBFAF600FBF8F40000000000B07A5800BD6B3900EFCEBD00DEA57B00FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700D6946B00D6A58C00AD63310039844200317B3900317B39003173
      31004A9452004A8C4A0039733900A5A5A500A5A5A500427BB5008CB5D6006BA5
      CE00639CCE00639CCE004284B5003173A500CC976F0000000000FFFFFC00FFFF
      FD00FEFEFC00FEFEFC00FEFEFB00FDFDFA00FDFDFA00FDFDFA00FDFDFA00FCFC
      F700FBFBF60000000000AC75540000000000D3B7A600D1A88B00CDA48800D5A0
      760000000000FDFDFB00FDFDFA00FCFCF900FBF9F500FBF8F400FBF7F300FBF5
      F200FAF3EF00F8F2EC0000000000B57E5C00BD6B3900EFD6BD00DEA57B00DEA5
      7B00DEA57B00DEA57B00DEA57B00DEA57B00DE9C7300DE9C7300DE9C7300D69C
      7300D69C7300D69C730000000000AD633100398442008CCE940084C68C0084C6
      8C007BC6840073BD7B004A8C4A0039734200A5A5A5004A84BD008CBDDE006BA5
      CE0063A5CE0063B5DE004A84B5003973AD00D19C730000000000FEFEFC00FEFE
      FC00FEFEFC00FDFDFB00FDFDFB00FDFDFA00FDFDF800FBFBF900FBFAF700FBFA
      F600FBF8F40000000000B07A580000000000D5AB8E000000000000000000D8A2
      790000000000FCFCFA00FCFBF900FBFAF600FBF7F400FBF6F100F8F4EE00F7F2
      EB00F7F0EA00F6ECE80000000000B7815E00BD6B3900EFD6C600E7A57B00E7A5
      7B00DEA57B00DEA57B00DEA57B00DEA57B00DEA57B00DE9C7300DE9C7300DE9C
      7300DE9C7300D69C7300DEAD9400AD633100428C4A008CCE9C007BC684007BC6
      840073BD7B0073BD7B007BC684004A945200527B5A00528CBD0094BDDE0073AD
      D60063B5DE004AD6FF00428CB500397BAD00D49E750000000000FEFEFC00FDFD
      FB00FDFDFC00FDFDFB00FDFDF900FCFCF800FBF9F700FBF9F500FBF8F400FBF7
      F200FBF5F20000000000B27C5A0000000000D8AF900000000000FFFFFD00D9A3
      790000000000FCFBF800FBF9F700FBF7F400F9F5F000F7F3ED00F6EFEA00F5EB
      E700F3EAE400F2E7DE0000000000BA856000BD6B3900EFD6C600E7A57B00E7A5
      7B00E7A57B00DEA57B00DEA57B00DEA57B00DEA57B00DE9C7300DE9C7300DE9C
      7300DE9C7300DE9C7300DEB59C00B563310042944A0094D69C0094CE9C008CCE
      94008CCE940084C68C0052945A00427B4A009C9C9C005A8CC60094C6DE007BB5
      D60073ADD6005AC6EF004A8CB500427BB500D5A0760000000000FDFDFC00FDFD
      FB00FDFDFA00FCFCF900FCFBF700FBF9F500FBF8F400FBF7F300FBF5F200FAF3
      EF00F8F2EC0000000000B57E5C0000000000DCB3930000000000FEFEFD00DBA4
      7A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BD876300BD6B3900F7D6C600E7A57B00C68C
      6300C68C6300C68C6B00CE946B00CE946B00CE946B00C68C6300C68C6300C68C
      6300C68C6300DE9C7300DEBD9C00B563310042944A0042944A00428C4A00398C
      42005AA563005A9C630042844A009C9C9C009C9C9C006394C6009CC6DE0084B5
      DE007BB5D6007BB5D600528CB5004A84B500D8A2790000000000FDFDFA00FCFC
      FA00FCFBF900FBFAF600FBF8F500FBF7F400FBF6F100F8F4EE00F7F2EB00F7F0
      EA00F6ECE80000000000B7815E0000000000DFB6960000000000FDFDFC00DCA7
      7B00DCA77B00DCA77B00DCA77B00DCA77B00DCA77B00DCA77B00DCA77B00DCA7
      7B00DCA77B00DCA77B00DCA77B00C08B6600BD6B3900F7DEC600E7A57B00F7EF
      DE00F7EFDE00F7EFE700FFF7EF00FFF7F700FFF7F700F7EFE700F7E7DE00F7E7
      D600F7E7D600DE9C7300E7BDA500B56B31000000000000000000737373009C9C
      9C00398C42004A8C52009C9C9C009C9C9C009C9C9C006394CE00A5CEE7008CBD
      DE0084B5DE0084B5DE00528CB500528CBD00D9A3790000000000FCFBF900FCFB
      F800FBF9F700FBF7F400FAF7F200F9F5F000F7F3ED00F6EFEA00F5EBE700F3EA
      E400F2E7DE0000000000BA85600000000000E1B8980000000000FDFDFB00DDAD
      8600E8B99200E8B99200E8B99200E8B99200E8B99200E8B99200E8B99200E8B9
      9200E8B99200E8B99200E8B99200C1917000BD6B3900F7DECE00E7A57B00F7EF
      E700F7EFE700C68C6300F7EFE700FFF7F700FFF7F700FFF7EF00F7E7DE00F7E7
      DE00F7E7D600DEA57B00E7C6AD00B56B310000000000000000007B7B7B009C9C
      9C0052945A009C9C9C009C9C9C009C9C9C009C9C9C006B9CCE00A5CEE7008CBD
      DE008CBDDE008CBDDE00528CB5005A8CC600DBA47A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BD87630000000000E2B8980000000000FDFCFA00D9C1
      B300DEB49100DCA67A00DAA47A00D8A27900D49E7500D29D7300CF9A7200CE99
      7000CB966F00C9946C00C79E8000DBC3B600BD734200F7DECE00E7A57B00FFF7
      EF00FFF7EF00C68C6300F7EFE700FFF7EF00FFF7F700FFF7F700F7EFE700F7E7
      DE00F7E7DE00DEA57B00EFD6C600B56B390000000000000000007B7B7B009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C006B9CD600ADCEE700ADCE
      E70094C6DE0094C6DE00528CB5006394C600DCA77B00DCA77B00DCA77B00DCA7
      7B00DCA77B00DCA77B00DCA77B00DCA77B00DCA77B00DCA77B00DCA77B00DCA7
      7B00DCA77B00DCA77B00C08B660000000000E3B9990000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CCA38700000000000000000000000000C6845200F7DECE00E7AD8400FFF7
      F700FFF7F700C68C6300FFF7EF00FFEFE700FFF7EF00FFFFF700FFF7EF00F7EF
      DE00F7E7DE00EFCEBD00EFCEBD00BD7342000000000000000000848484007B7B
      7B007B7B7B007B7B7B00737373007373730073737300739CD6006B9CD60084B5
      DE00ADD6E700ADCEE7005A94B5006B94CE00DDAD8600E8B99200E8B99200E8B9
      9200E8B99200E8B99200E8B99200E8B99200E8B99200E8B99200E8B99200E8B9
      9200E8B99200E8B99200C191700000000000E4BB9A00E4BB9A00E4BB9A00E4BB
      9A00E4BB9A00E4BB9A00E4BB9A00E4BB9A00E4BB9A00E4BB9A00E4BB9A00E4BB
      9A00CFA68900000000000000000000000000D6A58400F7DECE00F7DECE00FFFF
      F700FFFFF700FFF7F700FFF7EF00F7EFE700FFEFEF00FFF7F700FFF7F700FFEF
      EF00F7E7DE00EFCEBD00CE946B00DEC6B5000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000084AD
      DE006B9CD60084B5DE005A94B5006B9CCE00DBC3B600DEB49200DCA77B00DCA6
      7A00DAA47A00D8A27900D5A07600D49E7500D29D7300CF9A7200CE997000CB96
      6F00C9946C00C79E8000DBC3B60000000000E5C0A200EDC9AB00EDC9AB00EDC9
      AB00EDC9AB00EDC9AB00EDC9AB00EDC9AB00EDC9AB00EDC9AB00EDC9AB00EDC9
      AB00D0AB9100000000000000000000000000DEBDA50000000000C68C5A00BD73
      4200BD6B3900BD6B3900BD6B3900BD6B3900BD6B3900BD6B3900BD6B3900BD6B
      3900BD734200C68C6300E7CEBD00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B5CEE7006B9CD600739CD6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E3D1C700E6C5AB00E4BB9900E3B9
      9900E1B89800DEB49500DCB49300DAB19300D9B19100D7AE9000D5AD8E00D4B5
      9D00E3D1C700000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000008000FF80FFFFFFFF00000000FFFFE000
      0000C0000001EFFE0000C0007FFDE8020000C0006005E8020000000040050802
      000200004005680200000000400548020000000040054FFE0000000040054000
      0000C000400540000000C0007FFD40000000C00000017FF70000C00000010007
      0000FFE0000100074000FFF8FFFF000700000000000000000000000000000000
      000000000000}
  end
end
