program TesteWK;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uDM in 'uDM.pas' {DM: TDataModule},
  uPedidos in 'uPedidos.pas' {fPedidos},
  uConsultaPedidos in 'uConsultaPedidos.pas' {fConsultaPedidos},
  uConsultaProdutos in 'uConsultaProdutos.pas' {fConsultaProdutos},
  uConsultaClientes in 'uConsultaClientes.pas' {fConsultaClientes};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
