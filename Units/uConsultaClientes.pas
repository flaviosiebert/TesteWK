unit uConsultaClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TfConsultaClientes = class(TForm)
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    GridConsulta: TDBGrid;
    procedure GridConsultaDblClick(Sender: TObject);
    procedure GridConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConsultaClientes: TfConsultaClientes;

implementation

{$R *.dfm}
uses uDM;

procedure TfConsultaClientes.GridConsultaDblClick(Sender: TObject);
begin
  ModalResult := mrok;
end;

procedure TfConsultaClientes.GridConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
    ModalResult := mrok
  else if key = VK_ESCAPE then
    ModalResult := mrCancel;

end;

end.
