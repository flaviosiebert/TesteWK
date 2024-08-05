unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList, Vcl.Menus,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    ActionList1: TActionList;
    StatusBar1: TStatusBar;
    mMenu: TMenuItem;
    Pedidos2: TMenuItem;
    acPedidos: TAction;
    Consulta1: TMenuItem;
    Produtos2: TMenuItem;
    Sair1: TMenuItem;
    acSair: TAction;
    acConsulta: TAction;
    Panel1: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    procedure acPedidosExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure acSairExecute(Sender: TObject);
    procedure acConsultaExecute(Sender: TObject);
    procedure ActionList1Update(Action: TBasicAction; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uDM, uPedidos, uConsultaPedidos;

//ACTION - ABRE O FORMULÁRIO DE PEDIDOS
procedure TfrmPrincipal.acConsultaExecute(Sender: TObject);
begin
  DM.abreFormulario(fConsultaPedidos,TfConsultaPedidos);
end;

procedure TfrmPrincipal.acPedidosExecute(Sender: TObject);
begin
  DM.abreFormulario(fPedidos,TfPedidos);
end;

//ACTION - SAIR
procedure TfrmPrincipal.acSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.ActionList1Update(Action: TBasicAction;
  var Handled: Boolean);
begin
  acPedidos.Enabled  := DM.vgConectado;
  acConsulta.Enabled := DM.vgConectado;

end;

//CONFIRMA A SAÍDA DO SISTEMA
procedure TfrmPrincipal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := DM.confirma('Deseja sair do sistema ?');

  //DESCONECTA A BASE DE DADOS ANTES DE ENCERRAR;
  DM.FDConnection1.Connected := False;
end;

end.
