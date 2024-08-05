object fPedidos: TfPedidos
  Left = 0
  Top = 0
  Caption = 'Pedido de Vendas'
  ClientHeight = 493
  ClientWidth = 742
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 42
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 0
    object ToolBar1: TToolBar
      Left = 3
      Top = 3
      Width = 736
      Height = 36
      Align = alClient
      ButtonHeight = 36
      ButtonWidth = 75
      Caption = 'ToolBar1'
      Images = DM.ImageList1
      ShowCaptions = True
      TabOrder = 0
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Caption = 'Gravar Pedido'
        ImageIndex = 0
        Style = tbsTextButton
        OnClick = ToolButton1Click
      end
      object ToolButton2: TToolButton
        Left = 75
        Top = 0
        Caption = 'Sair'
        ImageIndex = 1
        OnClick = ToolButton2Click
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 95
    Width = 742
    Height = 97
    Align = alTop
    TabOrder = 1
    ExplicitTop = 160
    object GroupBox2: TGroupBox
      Left = 1
      Top = 1
      Width = 740
      Height = 95
      Align = alClient
      Caption = 'Produtos'
      TabOrder = 0
      ExplicitLeft = 256
      ExplicitTop = 24
      ExplicitWidth = 185
      ExplicitHeight = 105
      object Label1: TLabel
        Left = 13
        Top = 43
        Width = 93
        Height = 13
        Caption = 'C'#243'digo do produto:'
      end
      object Label2: TLabel
        Left = 46
        Top = 67
        Width = 60
        Height = 13
        Caption = 'Quantidade:'
      end
      object Label3: TLabel
        Left = 116
        Top = 21
        Width = 172
        Height = 13
        Caption = 'Digite 0 (zero) para abrir a pesquisa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 200
        Top = 67
        Width = 68
        Height = 13
        Caption = 'Valor Unit'#225'rio:'
      end
      object Label5: TLabel
        Left = 393
        Top = 67
        Width = 55
        Height = 13
        Caption = 'Valor Total:'
      end
      object Label6: TLabel
        Left = 226
        Top = 43
        Width = 42
        Height = 13
        Caption = 'Produto:'
      end
      object edtCodigo: TEdit
        Left = 112
        Top = 39
        Width = 80
        Height = 21
        NumbersOnly = True
        TabOrder = 0
        OnExit = edtCodigoExit
        OnKeyDown = edtCodigoKeyDown
      end
      object edtValor: TNumberBox
        Left = 274
        Top = 63
        Width = 110
        Height = 21
        Alignment = taRightJustify
        Enabled = False
        Mode = nbmCurrency
        TabOrder = 1
        OnExit = edtQtdeExit
        OnKeyDown = edtQtdeKeyDown
      end
      object edtQtde: TNumberBox
        Left = 112
        Top = 63
        Width = 80
        Height = 21
        Alignment = taRightJustify
        Enabled = False
        TabOrder = 2
        OnExit = edtQtdeExit
        OnKeyDown = edtQtdeKeyDown
      end
      object btnInserir: TBitBtn
        Left = 584
        Top = 39
        Width = 100
        Height = 22
        Caption = 'Inserir'
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0EEE08FC0913B8D3F25
          7A292577293B853F8FB991E0EBE0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFB5D9B7318F3542A05287CA9A9BD3AB9BD2AB83C7963D974C307C34B5D0
          B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB5DBBA258F2A6DBE83A8DBB587CC9866
          BC7D64BA7C86CB98A5D9B466B77D247227B5D1B6FFFFFFFFFFFFFFFFFFE1F2E4
          33A14472C287A8DBB260BC775CBA7359B87059B56F58B56F5BB774A5D9B369B8
          7F317F35E1ECE1FFFFFFFFFFFF90D29F4CB064AADDB464C1795FBE7175C585D4
          ECD98ACD9956B66C58B56E5CB774A6DAB4419B4E8EBC90FFFFFFFFFFFF3FB55D
          91D29F8DD49A64C37479C987F2FAF4FFFFFFFDFEFD86CB9657B76D5BB97285CC
          9787C79A3B8B3FFFFFFFFFFFFF27B049A6DCAF70CA7F73CA80F0F9F1FFFFFFEB
          F7EDFFFFFFFBFDFC88CD965BB97167BE7DA0D7AF237F26FFFFFFFFFFFF2EB751
          A7DDB172CC8066C773B0E1B7D2EED663C170B8E3BFFFFFFFFBFDFC8CD09969C1
          7EA1D7AE238426FFFFFFFFFFFF4BC56C95D7A191D79B69C97664C66F61C46E61
          C36F61C26FB9E4C0FFFFFFE3F4E68BD1998BCE9D3C993FFFFFFFFFFFFF9BDFAD
          57BF70AFE1B76DCC7A68C87265C77063C56E62C46E63C471B6E3BE6FC77EACDF
          B548A95E8FC894FFFFFFFFFFFFE5F7E949C5667FCE90AEE1B56DCC7A6ACA7668
          C87268C87468C8756BC979ACDFB476C48933A142E1F1E3FFFFFFFFFFFFFFFFFF
          BFECCB3DC35C7FCE90AFE1B792D89D77CE8377CE8392D89DAEE1B578C88B27A1
          3BB5DFBEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0EDCB4AC86959C27496D7A3A5
          DCAEA5DCAE95D6A150B96A35B355B6E3C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFE5F8E99FE3B055CB723BC05C37BE5A49C36A97DCAAE1F5E7FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        TabOrder = 3
        OnClick = btnInserirClick
      end
      object edtDescricao: TPanel
        Left = 274
        Top = 39
        Width = 287
        Height = 21
        Alignment = taLeftJustify
        BevelKind = bkFlat
        BevelOuter = bvNone
        TabOrder = 4
      end
      object edtValorTotal: TPanel
        Left = 451
        Top = 63
        Width = 110
        Height = 21
        Alignment = taRightJustify
        BevelKind = bkFlat
        BevelOuter = bvNone
        Caption = 'R$0.00'
        TabOrder = 5
      end
      object btnCancelar: TBitBtn
        Left = 584
        Top = 63
        Width = 100
        Height = 22
        Caption = 'Cancelar'
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1313F20000F10000F100
          00F10000EF0000EF0000ED1212EEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF1313F61A20F53C4CF93A49F83847F83545F83443F73242F7141BF11717
          EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1313F81D23F94453FA2429F91212F70F
          0FF60C0CF50909F5161BF53343F7141BF11717EFFFFFFFFFFFFFFFFFFF1313F9
          1F25FA4A58FB4247FBC9C9FD3B3BF91313F71010F63333F7C5C5FD3035F73444
          F7141BF21717EFFFFFFFFFFFFF0000FB4F5DFD3237FBCBCBFEF2F2FFEBEBFE3B
          3BF93939F8EAEAFEF1F1FEC5C5FD181DF63343F70000EFFFFFFFFFFFFF0000FD
          525FFD2828FC4747FCECECFFF2F2FFECECFFECECFEF1F1FFEAEAFE3434F70B0B
          F53545F80000EFFFFFFFFFFFFF0000FD5562FE2C2CFD2929FC4848FCEDEDFFF2
          F2FFF2F2FFECECFE3A3AF91212F70F0FF63848F80000F1FFFFFFFFFFFF0000FD
          5764FE3030FD2D2DFD4B4BFCEDEDFFF2F2FFF2F2FFECECFF3D3DF91616F81313
          F73C4BF80000F1FFFFFFFFFFFF0000FF5A67FE3333FE5050FDEDEDFFF3F3FFED
          EDFFEDEDFFF2F2FFECECFE3E3EFA1717F83F4EF90000F1FFFFFFFFFFFF0000FF
          5B68FF4347FECFCFFFF3F3FFEDEDFF4C4CFC4A4AFCECECFFF2F2FFCACAFE2A2F
          FA4251FA0000F3FFFFFFFFFFFF1414FF262BFF5D6AFF585BFFCFCFFF5252FE2F
          2FFD2C2CFD4B4BFCCCCCFE484CFB4957FB1D23F91414F6FFFFFFFFFFFFFFFFFF
          1414FF262BFF5D6AFF4347FF3434FE3232FE3030FD2D2DFD383CFC4F5DFC1F25
          FA1414F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1414FF262BFF5C69FF5B68FF5A
          67FE5865FE5663FE5461FE2227FC0D0DFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF1313FF0000FF0000FF0000FF0000FD0000FD0000FD1313FDFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        TabOrder = 6
        OnClick = btnCancelarClick
      end
      object pnlModo: TPanel
        Left = 13
        Top = 21
        Width = 90
        Height = 18
        BevelOuter = bvNone
        Caption = 'Edi'#231#227'o'
        Color = clGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 7
        Visible = False
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 192
    Width = 742
    Height = 273
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 2
    ExplicitTop = 122
    ExplicitHeight = 229
    object GridProdutos: TDBGrid
      Left = 3
      Top = 3
      Width = 736
      Height = 250
      Align = alClient
      DataSource = DM.dtstmpProdutosPedidos
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = GridProdutosDblClick
      OnExit = edtQtdeExit
      OnKeyDown = GridProdutosKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'codigo_produto'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'd. Produto'
          Width = 89
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricao'
          Title.Alignment = taCenter
          Title.Caption = 'Produto'
          Width = 325
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'quantidade'
          Title.Alignment = taCenter
          Title.Caption = 'Quantidade'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valor_unitario'
          Title.Alignment = taCenter
          Title.Caption = 'Valor Unit'#225'rio'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valor_total'
          Title.Alignment = taCenter
          Title.Caption = 'Valor Total'
          Width = 88
          Visible = True
        end>
    end
    object Panel7: TPanel
      Left = 3
      Top = 253
      Width = 736
      Height = 17
      Align = alBottom
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = ' <DEL> = Excluir produto | <ENTER> ou duplo clique para editar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      ExplicitTop = 254
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 465
    Width = 742
    Height = 28
    Align = alBottom
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 3
    ExplicitTop = 351
    object DBNavigator1: TDBNavigator
      Left = 3
      Top = 3
      Width = 136
      Height = 22
      DataSource = DM.dtstmpProdutosPedidos
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
      Align = alLeft
      TabOrder = 0
    end
    object pnlTotalPedido: TPanel
      Left = 539
      Top = 3
      Width = 185
      Height = 22
      Align = alRight
      Alignment = taRightJustify
      BevelOuter = bvNone
      Caption = 'Valor Total : R$ 0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object Panel6: TPanel
      Left = 724
      Top = 3
      Width = 15
      Height = 22
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 2
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 42
    Width = 742
    Height = 53
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 4
    object GroupBox1: TGroupBox
      Left = 3
      Top = 3
      Width = 736
      Height = 47
      Align = alClient
      Caption = 'Cliente'
      TabOrder = 0
      ExplicitLeft = 416
      ExplicitTop = 48
      ExplicitWidth = 185
      ExplicitHeight = 105
      object Label7: TLabel
        Left = 13
        Top = 19
        Width = 88
        Height = 13
        Caption = 'C'#243'digo do Cliente:'
      end
      object Label8: TLabel
        Left = 231
        Top = 19
        Width = 37
        Height = 13
        Caption = 'Cliente:'
      end
      object edtCliente: TEdit
        Left = 112
        Top = 15
        Width = 80
        Height = 21
        NumbersOnly = True
        TabOrder = 0
        OnKeyDown = edtClienteKeyDown
      end
      object edtNomeCliente: TPanel
        Left = 274
        Top = 15
        Width = 408
        Height = 21
        Alignment = taLeftJustify
        BevelKind = bkFlat
        BevelOuter = bvNone
        TabOrder = 1
      end
    end
  end
end
