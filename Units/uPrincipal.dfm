object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Pedidos de Vendas (Teste de Fl'#225'vio B. Siebert)'
  ClientHeight = 373
  ClientWidth = 690
  Color = clSilver
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 354
    Width = 690
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Alignment = taRightJustify
        Width = 0
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 690
    Height = 42
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 1
    ExplicitLeft = -52
    ExplicitWidth = 742
    object ToolBar1: TToolBar
      Left = 3
      Top = 3
      Width = 684
      Height = 36
      Align = alClient
      ButtonHeight = 36
      ButtonWidth = 157
      Caption = 'ToolBar1'
      Images = DM.ImageList1
      ShowCaptions = True
      TabOrder = 0
      ExplicitWidth = 736
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Action = acConsulta
        Style = tbsTextButton
      end
      object ToolButton2: TToolButton
        Left = 157
        Top = 0
        Action = acPedidos
      end
      object ToolButton3: TToolButton
        Left = 314
        Top = 0
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object ToolButton4: TToolButton
        Left = 322
        Top = 0
        Action = acSair
        ImageIndex = 1
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 272
    Top = 152
    object mMenu: TMenuItem
      Caption = 'Menu'
      object Consulta1: TMenuItem
        Action = acConsulta
        ShortCut = 113
      end
      object Pedidos2: TMenuItem
        Action = acPedidos
      end
      object Produtos2: TMenuItem
        Caption = '-'
      end
      object Sair1: TMenuItem
        Action = acSair
      end
    end
  end
  object ActionList1: TActionList
    Images = DM.ImageList1
    OnUpdate = ActionList1Update
    Left = 424
    Top = 152
    object acPedidos: TAction
      Caption = 'Pedido de Vendas'
      ImageIndex = 2
      ShortCut = 114
      OnExecute = acPedidosExecute
    end
    object acConsulta: TAction
      Caption = 'Consulta de Pedidos de Vendas'
      ImageIndex = 3
      OnExecute = acConsultaExecute
    end
    object acSair: TAction
      Caption = 'Sair'
      ShortCut = 32883
      OnExecute = acSairExecute
    end
  end
end
