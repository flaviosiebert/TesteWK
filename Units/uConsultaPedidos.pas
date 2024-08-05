unit uConsultaPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.DBCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfConsultaPedidos = class(TForm)
    Panel2: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    Panel3: TPanel;
    Panel4: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Panel6: TPanel;
    Panel7: TPanel;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    StatusBar1: TStatusBar;
    GridProdutos: TDBGrid;
    DBGrid1: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConsultaPedidos: TfConsultaPedidos;

implementation

Uses uDM, uPedidos;
{$R *.dfm}

procedure TfConsultaPedidos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //LIBERA O FORMULÁRIO DA MEMÓRIA
  Action  := caFree;
  fConsultaPedidos := nil;
end;

procedure TfConsultaPedidos.ToolButton1Click(Sender: TObject);
begin
  DM.abreFormulario(fPedidos,TfPedidos);
end;

procedure TfConsultaPedidos.ToolButton2Click(Sender: TObject);
begin
  Close;
end;

end.
