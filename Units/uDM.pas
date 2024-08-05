unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, iniFiles, Vcl.Forms, Winapi.Windows,Vcl.Controls,
  Datasnap.DBClient, Datasnap.Provider, System.ImageList, Vcl.ImgList;


type
  TDM = class(TDataModule)
    FDConnection1: TFDConnection;
    qryClientes: TFDQuery;
    qryProdutos: TFDQuery;
    qryProdutosPedidos: TFDQuery;
    qryDadosGerais: TFDQuery;
    dtsProdutos: TDataSource;
    dtsClientes: TDataSource;
    dtsProdutosPedidos: TDataSource;
    dtsDadosGerais: TDataSource;
    qryClientescodigo: TIntegerField;
    qryClientesnome: TStringField;
    qryClientescidade: TStringField;
    qryClientesuf: TStringField;
    qryProdutoscodigo: TIntegerField;
    qryProdutosdescricao: TStringField;
    qryProdutospreco_venda: TBCDField;
    qryProdutosPedidosnumero_pedido: TIntegerField;
    qryProdutosPedidoscodigo_produto: TIntegerField;
    qryProdutosPedidosquantidade: TIntegerField;
    qryProdutosPedidosvalor_unitario: TBCDField;
    qryProdutosPedidosvalor_total: TBCDField;
    dtstmpProdutosPedidos: TDataSource;
    qryAuxiliar1: TFDQuery;
    qryAuxiliar2: TFDQuery;
    tmpProdutosPedidos: TClientDataSet;
    tmpProdutosPedidoscodigo_produto: TIntegerField;
    tmpProdutosPedidosdescricao: TStringField;
    tmpProdutosPedidosquantidade: TIntegerField;
    tmpProdutosPedidosvalor_unitario: TFloatField;
    tmpProdutosPedidosvalor_total: TFloatField;
    DataSetProvider1: TDataSetProvider;
    ImageList1: TImageList;
    qryDadosGeraisnumero_pedido: TFDAutoIncField;
    qryDadosGeraisdata_emissao: TSQLTimeStampField;
    qryDadosGeraiscodigo_cliente: TIntegerField;
    qryDadosGeraisvalor_total: TBCDField;
    procedure DataModuleCreate(Sender: TObject);
    procedure FDConnection1AfterConnect(Sender: TObject);
    procedure abreFormulario(var Reference; ClasseForm: TComponentClass);
    function ultimoPedido: Integer;
    function confirma(sMsg: String): Boolean;
    procedure qryDadosGeraisAfterScroll(DataSet: TDataSet);

  private
    { Private declarations }
  public
    { Public declarations }
    vgConectado : Boolean;
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uPrincipal;
{$R *.dfm}

function TDM.ultimoPedido:Integer;
var sSql: String;
begin
  try
    sSql := 'select coalesce(max(numero_pedido),0) as ultimo from ped_dados_gerais';
    qryAuxiliar2.Open(sSql);
    result := qryAuxiliar2.FieldByName('ultimo').AsInteger;
    qryAuxiliar2.Close;
  except
    on E: Exception do
      begin
        Application.messagebox('Erro ao retornar o número do pedido!','Erro',MB_ICONERROR);
        result := 0;
      end;
  end;
end;

function TDM.confirma(sMsg:String):Boolean;
begin
  try
    result := Application.MessageBox(pChar(sMsg),'CONFIRMAÇÃO',mb_yesNo+mb_iconQuestion+mb_Defbutton2) <> IDNO;
  except
    on E: Exception do
      Application.messagebox('Erro ao solicitar confirmação!','Erro',MB_ICONERROR);
  end;
end;

//CRIA O FORMULÁRIO EM TEMPO DE EXECUÇÃO
procedure TDM.abreFormulario(var Reference; ClasseForm: TComponentClass);
begin
  Screen.Cursor := CrHourGlass;
  Try
    if TComponent(Reference) = nil then
      Application.CreateForm(ClasseForm, Reference);
    TForm(Reference).FormStyle := fsMDIChild;

    TForm(Reference).Show;

    Application.ProcessMessages;
  Except
    on E: Exception do
      Application.messagebox('Não foi possível criar o formulário!','Atenção',MB_ICONWARNING);
  end;
  Screen.Cursor := CrDefault;
end;


//FAZ A COENEXÃO COM A BASE DE DADOS - LOCALHOST
procedure TDM.DataModuleCreate(Sender: TObject);
begin
  try
    try
      FDConnection1.Connected := True;
    finally
      frmPrincipal.StatusBar1.Panels[0].Text := 'Conectado a '+FDConnection1.Params[0];
      vgConectado := FDConnection1.Connected;
      qryClientes.Active := FDConnection1.Connected;
      qryProdutos.Active := FDConnection1.Connected;
      qryProdutosPedidos.Active := FDConnection1.Connected;
      qryDadosGerais.Active := FDConnection1.Connected;
    end;
  except
    on E: Exception do
      begin
        FDConnection1.Connected := False;
        vgConectado := False;
        frmPrincipal.StatusBar1.Panels[0].Text := 'Desconectado';
      end;
  end;
end;

//CARREGA O ARQUIVO INI COM AS CONFIGURAÇÕES DA CONEXÃO
procedure TDM.FDConnection1AfterConnect(Sender: TObject);
var ArqINI: TIniFile;
    sDataBase,
    sUserName,
    sPassword,
    arqConfig : String;
begin
  try
    arqConfig := ExtractFilePath(Application.ExeName) + 'conexao.ini';
    if fileexists(arqConfig) then
      begin
        ArqINI := TIniFile.Create(arqConfig);
        sDataBase := ArqINI.ReadString('MYSQL', 'database', '');
        sUserName := ArqINI.ReadString('MYSQL', 'username', '');
        sPassword := ArqINI.ReadString('MYSQL', 'password', '');
        with FDConnection1.Params do
          begin;
            Database := sDataBase;
            UserName := sUserNAme;
            if (Trim(sPassword) <> emptystr) then
              Password := sPassword;
          end;
        ArqINI.Free;
      end
    else
      begin
        Application.messagebox(PChar('Arquivo de configuração '+#13+#13+'"'+
         Trim(arqConfig)+'"'+#13+#13+'não foi localizado!'),'Atenção',MB_ICONWARNING);
        Application.Terminate;
      end;
  except
    on E: Exception do
      begin
        Application.messagebox('Não foi possível estabelecer a conexão com a base de dados!','Atenção',MB_ICONWARNING);
        Exit;
      end;
   end;
end;

procedure TDM.qryDadosGeraisAfterScroll(DataSet: TDataSet);
var sSql : String;
begin
  sSql := 'SELECT * FROM ped_produtos WHERE numero_pedido = '+
    qryDadosGerais.FieldByName('numero_pedido').AsString;
  qryProdutosPedidos.open(sSql);
end;

end.
