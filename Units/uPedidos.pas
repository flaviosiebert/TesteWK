unit uPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.NumberBox, Vcl.Buttons,
  Vcl.ComCtrls, Vcl.ToolWin;

type
  TfPedidos = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    GridProdutos: TDBGrid;
    DBNavigator1: TDBNavigator;
    pnlTotalPedido: TPanel;
    Panel6: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    Panel5: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtCodigo: TEdit;
    edtValor: TNumberBox;
    edtQtde: TNumberBox;
    btnInserir: TBitBtn;
    edtDescricao: TPanel;
    edtValorTotal: TPanel;
    btnCancelar: TBitBtn;
    pnlModo: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    edtCliente: TEdit;
    edtNomeCliente: TPanel;
    Panel7: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtCodigoExit(Sender: TObject);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtQtdeExit(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure GridProdutosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtQtdeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure edtClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridProdutosDblClick(Sender: TObject);
  private
    function CalcValorTotalPedido: Real;
    function validaDados: Boolean;
    procedure CarregaProduto;
    procedure CalcValorTotal;
    procedure LimparPedido;
    procedure ConsultaProdutos;
    procedure GravaPedido;
    procedure ConsultaClientes;
    procedure CarregaCliente;
    procedure editarProduto;
    procedure ReiniciarPedido;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPedidos: TfPedidos;
  vgModo : String;

implementation

uses uDM, uConsultaClientes, uConsultaProdutos;
{$R *.dfm}


procedure TfPedidos.LimparPedido;
begin
  vgModo := 'INSERT';
  btnInserir.Caption := 'Inserir';
  pnlModo.Visible       := False;

  edtCodigo.Text        := '0';
  edtQtde.Text          := '1';
  edtValor.Text         := '0.00';
  edtValorTotal.Caption := '0.00';
  edtDescricao.Caption  := EmptyStr;

  edtValor.Enabled := False;
  edtQtde.Enabled  := False;

  if edtCodigo.CanFocus then edtCodigo.SetFocus;
end;

//----------------------------------------------------------------------------//
//PREPARA A TELA PARA UM NOVO PEDIDO
procedure TfPedidos.ReiniciarPedido;
begin
  edtCliente.Clear;
  edtNomeCliente.Caption := EmptyStr;
  edtCodigo.Clear;
  edtDescricao.Caption := EmptyStr;
  edtQtde.Text := '1';
  edtValor.Clear;
  edtValorTotal.Caption := 'R$0,00';
  DM.tmpProdutosPedidos.Close;
  DM.tmpProdutosPedidos.Create(self);
  pnlTotalPedido.Caption := 'Valor Total : R$ 0.00';
  if edtCliente.CanFocus then edtCliente.SetFocus;
end;

//----------------------------------------------------------------------------//
//GRAVA O PEDIDO DE VENDAS
procedure TfPedidos.GravaPedido;
var sSql : String;
    TotalPedido : Real;
begin
  try
    try
      DM.FDConnection1.StartTransaction;

      //ALIMENTA A TABELA DE DADOS GERAIS DO PEDIDO
      sSql := 'INSERT INTO ped_dados_gerais (' +
                                            ' data_emissao,'+
                                            ' codigo_cliente,'+
                                            ' valor_total'+
                                 ') VALUES (' +
                                            ' current_timestamp,'+
                                            edtCliente.text+','+
                                            QuotedStr(FormatFloat('0.00',CalcValorTotalPedido))+
                                            ')';
      DM.qryAuxiliar1.SQL.Text := sSql;
      DM.qryAuxiliar1.ExecSQL;

      //ALIMENTA A TABELA DE PRODUTOS DO PEDIDO
      TotalPedido := 0;
      DM.dtstmpProdutosPedidos.DataSet.DisableControls;
      DM.dtstmpProdutosPedidos.DataSet.First;
      while not DM.dtstmpProdutosPedidos.DataSet.Eof do
        begin
          sSql := 'INSERT INTO ped_produtos (numero_pedido,'+
                                           ' codigo_produto, '+
                                           ' quantidade, '+
                                           ' valor_unitario, '+
                                           ' valor_total '+
                                ' ) VALUES ('+
                   IntToStr(DM.ultimoPedido)+','+
                   DM.dtstmpProdutosPedidos.DataSet.FieldByName('codigo_produto').AsString+','+
                   DM.dtstmpProdutosPedidos.DataSet.FieldByName('quantidade').AsString+','+
                   QuotedStr(FormatFloat('0.00',DM.dtstmpProdutosPedidos.DataSet.FieldByName('valor_unitario').AsFloat))+','+
                   QuotedStr(FormatFloat('0.00',DM.dtstmpProdutosPedidos.DataSet.FieldByName('valor_total').AsFloat))+
                                         ' );';
          DM.qryAuxiliar1.SQL.Text := sSql;
          DM.qryAuxiliar1.ExecSQL;

          DM.dtstmpProdutosPedidos.DataSet.Next;
        end;

      DM.FDConnection1.Commit;
      DM.dtstmpProdutosPedidos.DataSet.EnableControls;
    except
      on E: Exception do
        Application.messagebox('Erro ao gravar os dados do pedido!','Erro',MB_ICONERROR);
    end;
  finally
    Application.messagebox(pchar('Pedido '+IntToStr(DM.ultimoPedido)+' gerado com sucesso!'),'Sucesso',MB_ICONINFORMATION);
    ReiniciarPedido;
  end;
end;

procedure TfPedidos.ToolButton1Click(Sender: TObject);
begin
  //VERIFICA SE EXISTEM PRODUTOS PARA GERAR O PEDIDO
  if DM.tmpProdutosPedidos.IsEmpty then
    begin
      Application.MessageBox('Nenhum produto selecionado!','Aviso',MB_ICONINFORMATION);
      Exit;
    end;

  if ((edtCliente.text = '0') or (edtCliente.text = EmptyStr)) then
    begin
      Application.MessageBox('Informe o cliente!','Aviso',MB_ICONINFORMATION);
      if edtCliente.CanFocus then edtCliente.SetFocus;
      Exit;
    end;

  GravaPedido;
end;

procedure TfPedidos.ToolButton2Click(Sender: TObject);
begin
  if DM.confirma('Deseja fechar o cadastro de pedidos ?') then
    Close;
end;

procedure TfPedidos.btnCancelarClick(Sender: TObject);
begin
  LimparPedido;
end;

function TfPedidos.validaDados : Boolean;
begin
  try
    if ((edtCodigo.Text = EmptyStr) or (edtCodigo.Text = '0')) then
      begin
        Application.MessageBox('Informe o código do produto!','Atenção',MB_ICONINFORMATION);
        if edtCodigo.CanFocus then edtCodigo.SetFocus;
        Result := False;
        Exit;
      end;
    if ((edtQtde.Text = EmptyStr) or (edtQtde.Text = '0')) then
      begin
        Application.MessageBox('Informe uma quantidade válida!','Atenção',MB_ICONINFORMATION);
        if edtQtde.CanFocus then edtQtde.SetFocus;
        Result := False;
        Exit;
      end;
    if ((edtValor.Text = EmptyStr) or (edtValor.Text = '0')) then
      begin
        Application.MessageBox('Informe o valor unitário!','Atenção',MB_ICONINFORMATION);
        if edtValor.CanFocus then edtValor.SetFocus;
        Result := False;
        Exit;
      end;
    Result := True;
  except
    on E: Exception do
      Application.messagebox('Erro ao validar dados do pedido!','Erro',MB_ICONERROR);
  end;
end;

procedure TfPedidos.btnInserirClick(Sender: TObject);
var Total : Real;
begin
  try
    if validaDados then
      begin
        if vgModo = 'INSERT' then
          DM.tmpProdutosPedidos.Append
        else
          DM.tmpProdutosPedidos.Edit;

        DM.tmpProdutosPedidos.FieldByName('codigo_produto').AsInteger := StrToInt(edtCodigo.Text);
        DM.tmpProdutosPedidos.FieldByName('descricao').AsString       := edtDescricao.caption;
        DM.tmpProdutosPedidos.FieldByName('quantidade').AsInteger     := StrToInt(edtQtde.Text);
        DM.tmpProdutosPedidos.FieldByName('valor_unitario').AsFloat   := StrToFloat(edtValor.Text);
        Total := StrToInt(edtQtde.Text) * StrToFloat(edtValor.Text);
        DM.tmpProdutosPedidos.FieldByName('valor_total').AsFloat := Total;
        DM.tmpProdutosPedidos.Post;
        pnlTotalPedido.Caption := 'Valor Total : R$ '+FormatFloat('0.00',CalcValorTotalPedido);
        LimparPedido
      end;
  except
    on E: Exception do
      Application.messagebox('Erro ao gravar os dados do pedido!','Erro',MB_ICONERROR);
  end;
end;

procedure TfPedidos.CalcValorTotal;
var Total: real;
begin
  try
    Total := StrToInt(edtQtde.Text) * StrToFloat(edtValor.Text);
    edtValorTotal.Caption := FormatFloat('0.00',Total);
  except
  end;
end;

function TfPedidos.CalcValorTotalPedido: Real;
var TotalPedido: real;
    iPos : Integer;
    sSql : String;
begin
  try
    iPos := DM.dtstmpProdutosPedidos.DataSet.RecNo;
    TotalPedido := 0;
    DM.dtstmpProdutosPedidos.DataSet.DisableControls;
    DM.dtstmpProdutosPedidos.DataSet.First;
    while not DM.dtstmpProdutosPedidos.DataSet.Eof do
      begin
        TotalPedido := TotalPedido + DM.dtstmpProdutosPedidos.DataSet.FieldByName('valor_total').AsFloat;
        DM.dtstmpProdutosPedidos.DataSet.Next;
      end;
    DM.dtstmpProdutosPedidos.DataSet.RecNo := iPos;
    DM.dtstmpProdutosPedidos.DataSet.EnableControls;
    result := TotalPedido;
  except
    on E: Exception do
      begin
        Application.messagebox('Erro ao calcular o valor total do pedido!','Erro',MB_ICONERROR);
        result := 0;
      end;
  end;
end;

procedure TfPedidos.ConsultaProdutos;
begin
  try
    if TComponent(fConsultaProdutos) = nil then
      Application.CreateForm(TfConsultaProdutos, fConsultaProdutos);
    with fConsultaProdutos do
      begin
        Showmodal;
        if modalResult = mrOK then
          begin
            edtCodigo.Text       := DM.qryProdutos.FieldByName('codigo').asString;
            edtdescricao.Caption := DM.qryProdutos.FieldByName('descricao').asString;
            edtQtde.Text         := '1';
            edtValor.Text        := FormatFloat('0,00',DM.qryProdutos.FieldByName('preco_venda').asFloat);
            edtValor.Enabled := True;
            edtQtde.Enabled  := True;
            if edtQtde.CanFocus then edtQtde.SetFocus;
            CalcValorTotal;
          end
        else
          if edtCodigo.CanFocus then edtCodigo.SetFocus;
      end;
  except
    on E: Exception do
      Application.messagebox('Erro ao abrir consulta de produtos!','Erro',MB_ICONERROR);
  end;
end;

procedure TfPedidos.ConsultaClientes;
begin
  try
    if TComponent(fConsultaClientes) = nil then
      Application.CreateForm(TfConsultaClientes, fConsultaClientes);
    with fConsultaClientes do
      begin
        Showmodal;
        if modalResult = mrOK then
          begin
            edtCliente.Text        := DM.qryClientes.FieldByName('codigo').asString;
            edtnomeCliente.Caption := DM.qryClientes.FieldByName('nome').asString+' - '+
                                      DM.qryClientes.FieldByName('cidade').asString+' - '+
                                      DM.qryClientes.FieldByName('uf').asString;
            if edtCodigo.CanFocus then edtCodigo.SetFocus;
          end
        else
          if edtCliente.CanFocus then edtCliente.SetFocus;
      end;
  except
    on E: Exception do
      Application.messagebox('Erro ao abrir consulta de produtos!','Erro',MB_ICONERROR);
  end;
end;

procedure TfPedidos.CarregaCliente;
var sSql : String;
begin
  try
    if ((edtCliente.Text <> '0') and (edtCliente.Text <> EmptyStr)) then
      begin
        edtNomeCliente.Caption := EmptyStr;

        sSql := 'SELECT * FROM cad_clientes '+
                       ' WHERE codigo = '+edtCliente.Text;
        DM.qryAuxiliar1.Open(sSql);
        if DM.qryAuxiliar1.IsEmpty then
          begin
            Application.MessageBox('Cliente não encontrado!','Atenção',MB_ICONINFORMATION);
            if edtCliente.CanFocus then edtCliente.SetFocus;
            Exit;
          end
        else
          begin
            edtNomeCliente.Caption := DM.qryAuxiliar1.FieldByName('nome').AsString+' - '+
                                      DM.qryAuxiliar1.FieldByName('cidade').AsString+' - '+
                                      DM.qryAuxiliar1.FieldByName('uf').AsString;
            if edtCodigo.CanFocus then edtCodigo.SetFocus;
          end;
      end;
  except
    on E: Exception do
      Application.messagebox('Erro ao carregar dados do cliente!','Erro',MB_ICONERROR);
  end;
end;


procedure TfPedidos.CarregaProduto;
var sSql : String;
begin
  try
    if ((edtCodigo.Text <> '0') and (edtCodigo.Text <> EmptyStr)) then
      begin
        edtDescricao.Caption := EmptyStr;

        sSql := 'SELECT * FROM cad_produtos '+
                       ' WHERE codigo = '+edtCodigo.Text;
        DM.qryAuxiliar1.Open(sSql);
        if DM.qryAuxiliar1.IsEmpty then
          begin
            Application.MessageBox('Produto não encontrado!','Atenção',MB_ICONINFORMATION);
            edtValor.Enabled := False;
            edtQtde.Enabled  := False;
            if edtCodigo.CanFocus then edtCodigo.SetFocus;
            Exit;
          end
        else
          begin
            edtDescricao.Caption := DM.qryAuxiliar1.FieldByName('descricao').AsString;
            edtQtde.Text := '1';
            edtValor.Text := FormatFloat('0.00',DM.qryAuxiliar1.FieldByName('preco_venda').AsCurrency);
            edtValor.Enabled := True;
            edtQtde.Enabled  := True;
            if edtQtde.CanFocus then edtQtde.SetFocus;
            CalcValorTotal;
          end;
      end;
  except
    on E: Exception do
      Application.messagebox('Erro ao carregar dados do produto!','Erro',MB_ICONERROR);
  end;
end;


procedure TfPedidos.edtClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    begin
      if ((edtCliente.Text = '0') or (edtCliente.Text = EmptyStr)) then
        ConsultaClientes
      else
        CarregaCliente;
    end;
end;

procedure TfPedidos.edtCodigoExit(Sender: TObject);
begin
  CarregaProduto;
end;

procedure TfPedidos.edtCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    begin
      if ((edtCodigo.Text = '0') or (edtCodigo.Text = EmptyStr)) then
        ConsultaProdutos
      else perform(WM_NEXTDLGCTL,0,0);
    end;
end;

procedure TfPedidos.edtQtdeExit(Sender: TObject);
begin
  CalcValorTotal;
end;

procedure TfPedidos.edtQtdeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfPedidos.FormActivate(Sender: TObject);
begin
  if not DM.tmpProdutosPedidos.IsEmpty then
    pnlTotalPedido.Caption := 'Valor Total : R$ '+FormatFloat('0.00',CalcValorTotalPedido);

  if edtCliente.CanFocus then edtCliente.SetFocus;
  vgModo := 'INSERT';
end;

procedure TfPedidos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //LIBERA O FORMULÁRIO DA MEMÓRIA
  Action  := caFree;
  fPedidos := nil;
end;

procedure TfPedidos.editarProduto;
begin
    try
      if DM.dtstmpProdutosPedidos.DataSet.FieldByName('codigo_produto').IsNull then
        Exit;

      vgModo := 'EDITAR';
      btnInserir.Caption    := 'Salvar';
      pnlModo.Visible       := True;
      edtCodigo.Text        := DM.dtstmpProdutosPedidos.DataSet.FieldByName('codigo_produto').AsString;
      edtQtde.Text          := DM.dtstmpProdutosPedidos.DataSet.FieldByName('quantidade').AsString;
      edtValor.Text         := DM.dtstmpProdutosPedidos.DataSet.FieldByName('valor_unitario').AsString;
      edtValorTotal.Caption := DM.dtstmpProdutosPedidos.DataSet.FieldByName('valor_total').AsString;
      edtDescricao.Caption  := DM.dtstmpProdutosPedidos.DataSet.FieldByName('descricao').AsString;
      edtValor.Enabled := True;
      edtQtde.Enabled  := True;
      if edtCodigo.CanFocus then edtCodigo.SetFocus;
    except
      on E: Exception do
        Application.messagebox('Erro ao abrir a edição do produto!','Erro',MB_ICONERROR);
    end;
end;

procedure TfPedidos.GridProdutosDblClick(Sender: TObject);
begin
  editarProduto;
end;

procedure TfPedidos.GridProdutosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if DM.dtstmpProdutosPedidos.DataSet.IsEmpty then
    Exit;

  if key = VK_DELETE then
    begin
      if DM.confirma('Confirma exclusão deste produto?') then
        begin
          DM.dtstmpProdutosPedidos.DataSet.Delete;
          pnlTotalPedido.Caption := 'Valor Total : R$ '+FormatFloat('0.00',CalcValorTotalPedido);
        end;
    end
  else if key = VK_RETURN then
    begin
      EditarProduto;
    end;
end;

end.
