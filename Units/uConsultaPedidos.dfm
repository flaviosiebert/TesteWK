object fConsultaPedidos: TfConsultaPedidos
  Left = 0
  Top = 0
  Caption = 'Consulta de Pedidos de Vendas'
  ClientHeight = 433
  ClientWidth = 715
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 715
    Height = 42
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 0
    ExplicitLeft = -73
    ExplicitWidth = 742
    object ToolBar1: TToolBar
      Left = 3
      Top = 3
      Width = 709
      Height = 36
      Align = alClient
      ButtonHeight = 36
      ButtonWidth = 67
      Caption = 'ToolBar1'
      Images = DM.ImageList1
      ShowCaptions = True
      TabOrder = 0
      ExplicitWidth = 736
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Caption = 'Novo Pedido'
        ImageIndex = 0
        Style = tbsTextButton
        OnClick = ToolButton1Click
      end
      object ToolButton2: TToolButton
        Left = 67
        Top = 0
        Caption = 'Sair'
        ImageIndex = 1
        OnClick = ToolButton2Click
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 42
    Width = 715
    Height = 155
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 1
    object GroupBox2: TGroupBox
      Left = 3
      Top = 3
      Width = 709
      Height = 149
      Align = alClient
      Caption = 'Pedidos'
      TabOrder = 0
      ExplicitLeft = 264
      ExplicitTop = 6
      ExplicitWidth = 185
      ExplicitHeight = 105
      object Panel7: TPanel
        Left = 2
        Top = 119
        Width = 705
        Height = 28
        Align = alBottom
        BevelOuter = bvNone
        BorderWidth = 3
        TabOrder = 0
        ExplicitTop = 107
        object DBNavigator1: TDBNavigator
          Left = 3
          Top = 3
          Width = 136
          Height = 22
          DataSource = DM.dtsDadosGerais
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
          Align = alLeft
          TabOrder = 0
        end
      end
      object GridProdutos: TDBGrid
        Left = 2
        Top = 15
        Width = 705
        Height = 104
        Align = alClient
        DataSource = DM.dtsDadosGerais
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'numero_pedido'
            Title.Alignment = taCenter
            Title.Caption = 'N'#186' do Pedido'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'data_emissao'
            Title.Alignment = taCenter
            Title.Caption = 'Emiss'#227'o:'
            Width = 145
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'codigo_cliente'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'd. Cliente'
            Width = 77
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valor_total'
            Title.Alignment = taCenter
            Title.Caption = 'Valor:'
            Visible = True
          end>
      end
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 197
    Width = 715
    Height = 217
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 2
    ExplicitLeft = 328
    ExplicitTop = 216
    ExplicitWidth = 185
    ExplicitHeight = 41
    object GroupBox1: TGroupBox
      Left = 3
      Top = 3
      Width = 709
      Height = 211
      Align = alClient
      Caption = 'Produtos do Pedido'
      TabOrder = 0
      ExplicitLeft = 264
      ExplicitTop = 48
      ExplicitWidth = 185
      ExplicitHeight = 105
      object Panel6: TPanel
        Left = 2
        Top = 181
        Width = 705
        Height = 28
        Align = alBottom
        BevelOuter = bvNone
        BorderWidth = 3
        TabOrder = 0
        ExplicitTop = 125
        object DBNavigator2: TDBNavigator
          Left = 3
          Top = 3
          Width = 136
          Height = 22
          DataSource = DM.dtsProdutosPedidos
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
          Align = alLeft
          TabOrder = 0
          ExplicitLeft = 9
          ExplicitTop = 2
          ExplicitHeight = 39
        end
      end
      object DBGrid1: TDBGrid
        Left = 2
        Top = 15
        Width = 705
        Height = 166
        Align = alClient
        DataSource = DM.dtsProdutosPedidos
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'codigo_produto'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'd. Produto'
            Width = 95
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'quantidade'
            Title.Alignment = taCenter
            Title.Caption = 'Quantidade'
            Width = 93
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
            Width = 106
            Visible = True
          end>
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 414
    Width = 715
    Height = 19
    Panels = <>
    ExplicitLeft = 264
    ExplicitTop = 24
    ExplicitWidth = 0
  end
end
