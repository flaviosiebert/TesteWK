object fConsultaClientes: TfConsultaClientes
  Left = 0
  Top = 0
  Caption = 'Consulta de Clientes'
  ClientHeight = 289
  ClientWidth = 531
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
    Top = 270
    Width = 531
    Height = 19
    Panels = <
      item
        Text = 'Clique 2x vezes ou pressione ENTER para selecionar o cliente.'
        Width = 0
      end>
    SimpleText = 'Clique 2x vezes ou pressione ENTER para selecionar o produto.'
    ExplicitTop = 227
    ExplicitWidth = 462
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 531
    Height = 270
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 1
    ExplicitWidth = 462
    ExplicitHeight = 233
    object GridConsulta: TDBGrid
      Left = 3
      Top = 3
      Width = 525
      Height = 264
      Align = alClient
      DataSource = DM.dtsClientes
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
          FieldName = 'nome'
          Title.Alignment = taCenter
          Title.Caption = 'Cliente'
          Width = 238
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cidade'
          Title.Alignment = taCenter
          Title.Caption = 'Cidade'
          Width = 148
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'uf'
          Title.Alignment = taCenter
          Title.Caption = 'UF'
          Width = 35
          Visible = True
        end>
    end
  end
end
