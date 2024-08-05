object fConsultaProdutos: TfConsultaProdutos
  Left = 0
  Top = 0
  Caption = 'Consulta de Produtos'
  ClientHeight = 252
  ClientWidth = 462
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 233
    Width = 462
    Height = 19
    Panels = <
      item
        Text = 'Clique 2x vezes ou pressione ENTER para selecionar o produto.'
        Width = 0
      end>
    SimpleText = 'Clique 2x vezes ou pressione ENTER para selecionar o produto.'
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 462
    Height = 233
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 1
    object GridConsulta: TDBGrid
      Left = 3
      Top = 3
      Width = 456
      Height = 227
      Align = alClient
      DataSource = DM.dtsProdutos
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = GridConsultaDblClick
      OnKeyDown = GridConsultaKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'codigo'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricao'
          Title.Alignment = taCenter
          Title.Caption = 'Descri'#231#227'o'
          Width = 267
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'preco_venda'
          Title.Alignment = taCenter
          Title.Caption = 'Pre'#231'o de Venda'
          Visible = True
        end>
    end
  end
end
