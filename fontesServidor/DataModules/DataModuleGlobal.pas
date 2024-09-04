unit DataModuleGlobal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, DataSet.Serialize.Config,
  system.JSON, Dataset.Serialize, fireDAC.DApt,uMD5, FireDAC.Phys.FBDef,
  FireDAC.Phys.IBBase, FireDAC.Phys.FB;

type
  TDM = class(TDataModule)
    conn: TFDConnection;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    procedure DataModuleCreate(Sender: TObject);
    procedure connBeforeConnect(Sender: TObject);
  private
    procedure carregarConfiogDB(Connection: TFDConnection);

  public
    /////////////////// CLIENTE ////////////////
    function ClienteListar(pfiltro: string; ptipoPesquisa: string = ''): TJsonArray;
    function ClienteListarId(pid_cliente: integer): TJsonObject;
    function ClienteInserir(pnome, pendereco, pcomplemento, pbairro, pcidade, puf: string): TJsonObject;
    function ClienteEditar(pid_cliente: integer; pnome, pendereco, pcomplemento, pbairro, pcidade, puf: string): TJsonObject;
    function ClienteExcluir(parrJson: TJSONArray; pstrTypeSituation: string): TJSONArray;

    /////////////////// PRODUTO ////////////////
    function ProdutoListar(pfiltro: string): TJsonArray;
    function ProdutoListarId(pid_produto: integer): TJsonObject;
    function ProdutoInserir(pdescricao: string; pvalor: double): TJsonObject;
    function produtoEditar(pid_produto: integer; pdescricao: string; pvalor: double): TJsonObject;
    function ProdutoExcluir(parrJson: TJSONArray): TJSONObject;
    /////////////////// USUARIO ////////////////
function UsuarioLogin(pemail, psenha: string): TJsonObject;

    /////////////////// PEDIDO ////////////////
    function PedidoEditar(pid_pedido, pid_cliente: integer; pdt_pedido: string; pvl_total: double; parrItems: TJSONArray): TJsonObject;
    function PedidoExcluir(parrJsonIdPedido: TJSONArray): TJSONArray;
    function PedidoInserir(pid_usuario, pid_cliente: integer; pdt_pedido: string; pvl_total: double; parrItems: TJSONArray): TJsonObject;
    function PedidoListar(pfiltro: string): TJsonArray;
    function PedidoListarId(pid_pedido: integer): TJsonObject;

    /////////////////// BUSCA GLOBAL ////////////////
    function pesquisaGlobal(tipo_pesquisa, filtro: string): TJsonArray;

  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.carregarConfiogDB(Connection: TFDConnection);
begin

  Connection.DriverName := 'FB';
  with Connection.Params do
  begin
    Clear;
    Add('DataBase='+ system.SysUtils.GetCurrentDir + '\DBVENDAS.FDB');
    Add('DriverID=FB');

    Add('User_Name= SYSDBA');
    Add('Password= masterkey');
    Add('Port=');
    Add('Server=');
    Add('Protocol=');
    Add('LockingMode=Normal');
  end;
end;

procedure TDM.connBeforeConnect(Sender: TObject);
begin
  carregarConfiogDB(conn);
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  TDatasetSerializeConfig.getinstance.CaseNameDefinition := cndLower;
  TDatasetSerializeConfig.getinstance.Import.DecimalSeparator := '.';

  conn.Connected := true;
end;

function TDM.ClienteListarId(pid_cliente: integer): TJsonObject;
var
  qry: TFDQuery;
begin
  try
    qry := TFDQuery.create(nil);
    qry.connection := conn;
    qry.SQL.Add('Select *');
    qry.SQL.Add('FROM cliente');
    qry.SQL.Add('Where id_cliente = :id_cliente');
    qry.ParamByName('id_cliente').Value := pid_cliente;

    qry.Active := true;

    result := qry.ToJSONObject;
  finally
    freeAndNil(qry);
  end;
end;

function TDM.ClienteInserir(pnome, pendereco, pcomplemento, pbairro, pcidade, puf: string): TJsonObject;
var
  qry: TFDQuery;
begin
  try
    qry := TFDQuery.create(nil);
    qry.connection := conn;
    qry.SQL.Add('Insert into cliente(nome, endereco, complemento, bairro, cidade, uf)');
    qry.SQL.Add('values(:nome, :endereco, :complemento, :bairro, :cidade, :uf)');

    qry.SQL.Add('RETURNING id_cliente');

    qry.ParamByName('nome').Value := pnome;
    qry.ParamByName('endereco').Value := pendereco;
    qry.ParamByName('complemento').Value := pcomplemento;
    qry.ParamByName('bairro').Value := pbairro;
    qry.ParamByName('cidade').Value := pcidade;
    qry.ParamByName('uf').Value := puf;

    qry.Active := true;

    result := qry.ToJSONObject;
  finally
    freeAndNil(qry);
  end;
end;

function TDM.ClienteEditar(pid_cliente: integer; pnome, pendereco, pcomplemento, pbairro, pcidade, puf: string): TJsonObject;
var
  qry: TFDQuery;
begin
  try
    qry := TFDQuery.create(nil);
    qry.connection := conn;
    qry.SQL.Add('Update cliente set nome = :nome, endereco = :endereco, complemento = :complemento, bairro = :bairro, cidade = :cidade, uf = :uf');

    qry.SQL.Add('where id_cliente = :id_cliente');

    qry.ParamByName('id_cliente').Value := pid_cliente;
    qry.ParamByName('nome').Value := pnome;
    qry.ParamByName('endereco').Value := pendereco;
    qry.ParamByName('complemento').Value := pcomplemento;
    qry.ParamByName('bairro').Value := pbairro;
    qry.ParamByName('cidade').Value := pcidade;
    qry.ParamByName('uf').Value := puf;

    qry.ExecSQL;

    result := TJSONObject.create(TJSONPair.Create('id_cliente', pid_cliente));
  finally
    freeAndNil(qry);
  end;
end;

function TDM.ClienteExcluir(parrJson: TJSONArray; pstrTypeSituation: string): TJSONArray;
var
  qry: TFDQuery;
  lslIdClientes: TStringList;
begin
  lslIdClientes := nil;
  qry := nil;
  try
    lslIdClientes := TStringList.create;
    lslIdClientes.clear;

    for var iintCount := 0 to parrJson.size -1 do
    begin
      lslIdClientes.add(parrJson[iintCount].GetValue<string>('id_cliente'));
    end;
    qry := TFDQuery.create(nil);
    qry.connection := conn;
    qry.SQL.clear;

    if (pstrTypeSituation = '0') then
      qry.SQL.Add('update cliente set ativo = 0')
    else
      qry.SQL.Add('update cliente set ativo = 1');

    qry.SQL.Add('where id_cliente in ('+ lslIdClientes.CommaText +')');

    qry.ExecSQL;

    result := parrJson;
  finally
    freeAndNil(qry);
    freeAndNil(lslIdClientes);
  end;
end;

function TDM.ClienteListar(pfiltro: string; ptipoPesquisa: string = ''): TJsonArray;
var
  qry: TFDQuery;
begin
  try
    qry := TFDQuery.create(nil);
    qry.connection := conn;
    qry.SQL.Add('Select *');
    qry.SQL.Add('FROM cliente');
    qry.SQL.Add('Where id_cliente > 0');

    if not(pfiltro.isEmpty) then
    begin
      qry.SQL.Add('AND nome like :filtro');
      qry.ParamByName('filtro').Value := '%' + pfiltro + '%';
    end;

    if (ptipoPesquisa = '0') then
      qry.SQL.Add('AND ativo = 1')
    else
    if (ptipoPesquisa = '1') then
      qry.SQL.Add('AND ativo = 0');

    qry.SQL.Add('order by nome');
    qry.Active := true;

    result := qry.ToJSONArray;
  finally
    freeAndNil(qry);
  end;
end;

function TDM.ProdutoListar(pfiltro: string): TJsonArray;
var
  qry: TFDQuery;
begin
  try
    qry := TFDQuery.create(nil);
    qry.connection := conn;
    qry.SQL.Add('Select *');
    qry.SQL.Add('FROM produto');

    if not(pfiltro.isEmpty) then
    begin
      qry.SQL.Add('Where descricao like :filtro');
      qry.ParamByName('filtro').Value := '%' + pfiltro + '%';
    end;

    qry.SQL.Add('order by descricao');
    qry.Active := true;

    result := qry.ToJSONArray;
  finally
    freeAndNil(qry);
  end;
end;

function TDM.ProdutoListarId(pid_produto: integer): TJsonObject;
var
  qry: TFDQuery;
begin
  try
    qry := TFDQuery.create(nil);
    qry.connection := conn;
    qry.SQL.Add('Select *');
    qry.SQL.Add('FROM produto');
    qry.SQL.Add('Where id_produto = :id_produto');
    qry.ParamByName('id_produto').Value := pid_produto;

    qry.Active := true;

    result := qry.ToJSONObject;
  finally
    freeAndNil(qry);
  end;
end;

function TDM.ProdutoInserir(pdescricao: string; pvalor: double): TJsonObject;
var
  qry: TFDQuery;
begin
  try
    qry := TFDQuery.create(nil);
    qry.connection := conn;
    qry.SQL.Add('Insert into produto(descricao, preco)');
    qry.SQL.Add('values(:descricao, :valor)');

    qry.SQL.Add('RETURNING id_produto');

    qry.ParamByName('descricao').Value := pdescricao;
    qry.ParamByName('valor').Value := pvalor;

    qry.Active := true;

    result := qry.ToJSONObject;
  finally
    freeandnil(qry);
  end;
end;

function TDM.produtoEditar(pid_produto: integer; pdescricao: string; pvalor: double): TJsonObject;
var
  qry: TFDQuery;
begin
  try
    qry := TFDQuery.create(nil);
    qry.connection := conn;
    qry.SQL.Add('Update produto set descricao = :descricao, preco = :preco');

    qry.SQL.Add('where id_produto = :id_produto');

    qry.ParamByName('id_produto').Value := pid_produto;
    qry.ParamByName('descricao').Value := pdescricao;
    qry.ParamByName('preco').Value := pvalor;

    qry.ExecSQL;

    result := TJSONObject.create(TJSONPair.Create('id_produto', pid_produto));
  finally
    freeAndNil(qry);
  end;
end;

function TDM.ProdutoExcluir(parrJson: TJSONArray): TJSONObject;
var
  qry: TFDQuery;
  lslIdProdutos, lstrIdProdutosPedido: TStringList;
  lstrItems: string;
  lintCount: integer;
  ljsonObj: TJSONObject;
begin
  try
    lstrIdProdutosPedido := nil;
    lslIdProdutos := nil;

    lstrItems := '';
    qry := TFDQuery.create(nil);
    qry.connection := conn;
    qry.SQL.clear;

    lslIdProdutos := TStringList.create;
    lslIdProdutos.clear;

    for  lintCount := 0 to parrJson.size -1 do
    begin
      lslIdProdutos.add(parrJson[lintCount].GetValue<string>('id_produto'));
    end;

    // fazer um select na pedidoItems com o in do stringList do produto

    qry.SQL.add(' select distinct pedido_item.id_produto, produto.descricao');
    qry.SQL.add('from');
    qry.SQL.add(' pedido_item');
    qry.SQL.add('inner join produto on pedido_item.id_produto = produto.id_produto');
    qry.SQL.add('where');
    qry.SQL.add(' pedido_item.id_produto in (' + lslIdProdutos.CommaText + ')');
    qry.Open;

    if qry.RecordCount > 0 then
    begin
      lstrIdProdutosPedido := TStringList.create;
      lstrItems := 'os seguintes itens não podem ser excluidos, pois existem pedidos com os mesmos:';
      while  not qry.Eof do
      begin
        lstrIdProdutosPedido.add(qry.FieldByName('id_produto').AsInteger.ToString);
        lstrItems := lstrItems + sLineBreak + qry.FieldByName('descricao').asString;

        qry.next;
      end;

     for lintcount := pred(lslIdProdutos.Count) downto 0 do
      begin
        if lstrIdProdutosPedido.IndexOf(lslIdProdutos[lintcount]) <> -1 then
        begin
          lslIdProdutos.Delete(lintcount);
        end;
      end;
    end
    else
      lstrItems := 'Item(s) excluido(s) com sucesso!';

    qry.SQL.clear;
    qry.Close;
    qry.SQL.Add('delete from produto');
    qry.SQL.Add('where id_produto in ( ' + lslIdProdutos.CommaText + ')');

    qry.ExecSQL;

    result := TJSONObject.Create(TJSONPair.Create('message', lstrItems));
  finally
    freeAndNil(qry);
    freeandnil(lslIdProdutos);
    freeandnil(lstrIdProdutosPedido);
  end;
end;

function TDM.UsuarioLogin(pemail ,psenha: string): TJsonObject;
var
  qry: TFDQuery;
begin
  try
    qry := TFDQuery.create(nil);
    qry.connection := conn;
    qry.SQL.Add('Select id_usuario, nome, email');
    qry.SQL.Add('FROM usuario');
    qry.SQL.Add('Where email = :email AND senha = :senha');

    qry.ParamByName('email').Value := pemail;
    qry.ParamByName('senha').Value := SaltPassword(psenha);

    qry.Active := true;

    result := qry.ToJSONObject;
  finally
    freeAndNil(qry);
  end;
end;


function TDM.PedidoListarId(pid_pedido: integer): TJsonObject;
var
  qry: TFDQuery;
begin
  try
    qry := TFDQuery.create(nil);
    qry.connection := conn;
    qry.SQL.Add('Select p.*, c.nome, c.cidade, u.nome as usuario');
    qry.SQL.Add('FROM pedido p');
    qry.SQL.Add('inner join cliente c on (c.id_cliente = p.id_cliente)');
    qry.SQL.Add('inner join usuario u on (u.id_usuario = p.id_usuario)');
    qry.SQL.Add('Where p.id_pedido = :id_pedido');
    qry.ParamByName('id_pedido').Value := pid_pedido;
    qry.Active := true;

    result := qry.ToJSONObject;

    qry.Active := false;
    qry.sql.clear;
    qry.SQL.Add('Select i.id_item, i.id_produto, p.descricao, i.qtd, i.vl_unitario, i.vl_total ');
    qry.SQL.Add('FROM pedido_item i');
    qry.SQL.Add('inner join produto p on (p.id_produto = i.id_produto)');
    qry.SQL.Add('Where i.id_pedido = :id_pedido');
    qry.ParamByName('id_pedido').Value := pid_pedido;
    qry.Active := true;

    result.AddPair('itens', qry.ToJSONArray);
  finally
    freeAndNil(qry);
  end;
end;

function TDM.PedidoInserir(pid_usuario, pid_cliente: integer; pdt_pedido: string; pvl_total: double; parrItems: TJSONArray): TJsonObject;
var
  qry: TFDQuery;
  lintIdPedido: integer;
begin
  try
    qry := TFDQuery.create(nil);
    qry.connection := conn;
    qry.SQL.Add('Insert into pedido(id_usuario, id_cliente, dt_pedido, vl_total)');
    qry.SQL.Add('values(:id_usuario, :id_cliente, :dt_pedido, :vl_total)');

    qry.SQL.Add('RETURNING id_pedido');


    qry.ParamByName('id_usuario').Value := pid_usuario;
    qry.ParamByName('id_cliente').Value := pid_cliente;
    qry.ParamByName('dt_pedido').Value := pdt_pedido;
    qry.ParamByName('vl_total').Value := pvl_total;

    qry.Active := true;

    lintIdPedido := qry.FieldByName('id_pedido').AsInteger;

    for var lintIndex := 0 to parrItems.size -1 do
    begin
      qry.SQL.Clear;
      qry.SQL.Add('Insert into pedido_item(id_pedido, id_produto, qtd, vl_unitario, vl_total)');
      qry.SQL.Add('values(:id_pedido, :id_produto, :qtd, :vl_unitario, :vl_total);');

      qry.ParamByName('id_pedido').Value := lintIdPedido;
      qry.ParamByName('id_produto').Value := parrItems[lintIndex].GetValue<integer>('id_produto', 0);
      qry.ParamByName('qtd').Value := parrItems[lintIndex].GetValue<integer>('qtd', 0);
      qry.ParamByName('vl_unitario').Value := parrItems[lintIndex].GetValue<double>('vl_unitario', 0);
      qry.ParamByName('vl_total').Value := parrItems[lintIndex].GetValue<double>('vl_total', 0);

      qry.ExecSQL;
    end;

    result := TJSONObject.Create(TJSONPair.Create('id_pedido', lintIdPedido));
  finally
    freeAndNil(qry);
  end;
end;

function TDM.PedidoEditar(pid_pedido, pid_cliente: integer; pdt_pedido: string; pvl_total: double; parrItems: TJSONArray): TJsonObject;
var
  qry: TFDQuery;
begin
  try
    qry := TFDQuery.create(nil);
    qry.connection := conn;
    qry.SQL.Add('Update pedido set id_cliente = :id_cliente, dt_pedido = :dt_pedido, vl_total = :vl_total');
    qry.SQL.Add('where id_pedido = :id_pedido');

    qry.ParamByName('id_pedido').Value := pid_pedido;
    qry.ParamByName('id_cliente').Value := pid_cliente;
    qry.ParamByName('dt_pedido').Value := pdt_pedido;
    qry.ParamByName('vl_total').Value := pvl_total;
    qry.ExecSQL;
    qry.SQL.Clear;

    qry.SQL.Add('delete from pedido_item');
    qry.SQL.Add('where id_pedido = :id_pedido');
    qry.ParamByName('id_pedido').Value := pid_pedido;
    qry.ExecSQL;

    for var lintIndex := 0 to parrItems.size -1 do
    begin
      qry.SQL.Clear;
      qry.SQL.Add('Insert into pedido_item(id_pedido, id_produto, qtd, vl_unitario, vl_total)');
      qry.SQL.Add('values(:id_pedido, :id_produto, :qtd, :vl_unitario, :vl_total)');

      qry.ParamByName('id_pedido').Value := pid_pedido;
      qry.ParamByName('id_produto').Value := parrItems[lintIndex].GetValue<integer>('id_produto', 0);
      qry.ParamByName('qtd').Value := parrItems[lintIndex].GetValue<integer>('qtd', 0);
      qry.ParamByName('vl_unitario').Value := parrItems[lintIndex].GetValue<double>('vl_unitario', 0);
      qry.ParamByName('vl_total').Value := parrItems[lintIndex].GetValue<double>('vl_total', 0);
      qry.ExecSQL;
    end;

    result := TJSONObject.Create(TJSONPair.Create('id_pedido', pid_pedido));
  finally
    freeAndNil(qry);
  end;
end;

function TDM.PedidoExcluir(parrJsonIdPedido: TJSONArray): TJSONArray;
var
  qry: TFDQuery;
  lslIdPedido: TStringList;
  lJsonObject: TJSONObject;
  IdPedido: Integer;
begin
  lslIdPedido := TStringList.create;
  lslIdPedido.clear;

  for var lintIndex := 0 to parrJsonIdPedido.Size -1 do
  begin
    lJsonObject := parrJsonIdPedido.Items[lintIndex] as TJSONObject;

    if lJsonObject.TryGetValue('id_pedido', IdPedido) then
      lslIdPedido.add(IdPedido.ToString);
  end;

  try
    qry := TFDQuery.create(nil);
    qry.connection := conn;
    qry.SQL.Add('delete from pedido_item');
    qry.SQL.Add('where id_pedido in (' + lslIdPedido.CommaText + ')');
    qry.ExecSQL;

    qry.sql.Clear;
    qry.SQL.Add('delete from pedido');
    qry.SQL.Add('where id_pedido in (' + lslIdPedido.CommaText + ')');
    qry.ExecSQL;

    result := parrJsonIdPedido;
  finally
    freeAndNil(qry);
    freeandnil(lslIdPedido);
  end;
end;

function TDM.PedidoListar(pfiltro: string): TJsonArray;
var
  qry: TFDQuery;
begin
  try
    qry := TFDQuery.create(nil);
    qry.connection := conn;
    qry.SQL.Add('Select p.*, c.nome, c.cidade, u.nome as usuario ');
    qry.SQL.Add('FROM pedido p');
    qry.SQL.Add('inner join cliente c on (c.id_cliente = p.id_cliente)');
    qry.SQL.Add('inner join usuario u on (u.id_usuario = p.id_usuario)');

    if not(pfiltro.isEmpty) then
    begin
      qry.SQL.Add('Where c.nome like :filtro');
      qry.ParamByName('filtro').Value := '%' + pfiltro + '%';
    end;

    qry.SQL.Add('order by p.id_pedido desc');
    qry.Active := true;

    result := qry.ToJSONArray;
  finally
    freeAndNil(qry);
  end;
end;

function TDM.pesquisaGlobal(tipo_pesquisa, filtro: string): TJsonArray;
begin
  if tipo_pesquisa = 'cliente' then
    result := ClienteListar(filtro)
  else if tipo_pesquisa = 'produto' then
    result := ProdutoListar(filtro)
  else
    raise Exception.Create('Tipo de pesquisa inválida');
end;

end.
