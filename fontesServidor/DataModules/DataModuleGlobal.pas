unit DataModuleGlobal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, DataSet.Serialize.Config,
  system.JSON, Dataset.Serialize, fireDAC.DApt,uMD5;

type
  TDM = class(TDataModule)
    conn: TFDConnection;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    procedure DataModuleCreate(Sender: TObject);
    procedure connBeforeConnect(Sender: TObject);
  private
    procedure carregarConfiogDB(Connection: TFDConnection);

  public
    /////////////////// CLIENTE ////////////////
    function ClienteListar(pfiltro: string): TJsonArray;
    function ClienteListarId(pid_cliente: integer): TJsonObject;
    function ClienteInserir(pnome, pendereco, pcomplemento, pbairro, pcidade, puf: string): TJsonObject;
    function ClienteEditar(pid_cliente: integer; pnome, pendereco, pcomplemento, pbairro, pcidade, puf: string): TJsonObject;
    function ClienteExcluir(pid_cliente: integer): TJsonObject;

    /////////////////// PRODUTO ////////////////
    function ProdutoListar(pfiltro: string): TJsonArray;

    /////////////////// USUARIO ////////////////
function UsuarioLogin(pemail, psenha: string): TJsonObject;

    /////////////////// PEDIDO ////////////////
    function PedidoEditar(pid_pedido, pid_cliente: integer; pdt_pedido: string; pvl_total: double): TJsonObject;
    function PedidoExcluir(pid_pedido: integer): TJsonObject;
    function PedidoInserir(pid_usuario, pid_cliente: integer; pdt_pedido: string; pvl_total: double): TJsonObject;
    function PedidoListar(pfiltro: string): TJsonArray;
    function PedidoListarId(pid_pedido: integer): TJsonObject;

  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.carregarConfiogDB(Connection: TFDConnection);
begin

  Connection.DriverName := 'SQLite';
  with Connection.Params do
  begin
    Clear;
    Add('DataBase='+ system.SysUtils.GetCurrentDir + '\DB\banco.db');
    Add('DriverID=SQLite');

    Add('User_Name=');
    Add('Password=');
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
  //
end;

function TDM.ClienteInserir(pnome, pendereco, pcomplemento, pbairro, pcidade, puf: string): TJsonObject;
var
  qry: TFDQuery;
begin
  try
    qry := TFDQuery.create(nil);
    qry.connection := conn;
    qry.SQL.Add('Insert into cliente(nome, endereco, complemento, bairro, cidade, uf)');
    qry.SQL.Add('values(:nome, :endereco, :complemento, :bairro, :cidade, :uf);');

    qry.SQL.Add('select last_insert_rowid() as id_cliente');

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

function TDM.ClienteExcluir(pid_cliente: integer): TJsonObject;
var
  qry: TFDQuery;
begin
  try
    qry := TFDQuery.create(nil);
    qry.connection := conn;
    qry.SQL.Add('delete from cliente');
    qry.SQL.Add('where id_cliente = :id_cliente');

    qry.ParamByName('id_cliente').Value := pid_cliente;

    qry.ExecSQL;

    result := TJSONObject.create(TJSONPair.Create('id_cliente', pid_cliente));
  finally
    freeAndNil(qry);
  end;
end;

function TDM.ClienteListar(pfiltro: string): TJsonArray;
var
  qry: TFDQuery;
begin
  try
    qry := TFDQuery.create(nil);
    qry.connection := conn;
    qry.SQL.Add('Select *');
    qry.SQL.Add('FROM cliente');

    if not(pfiltro.isEmpty) then
    begin
      qry.SQL.Add('Where nome like :filtro');
      qry.ParamByName('filtro').Value := '%' + pfiltro + '%';
    end;

    qry.SQL.Add('order by nome');
    qry.Active := true;

    result := qry.ToJSONArray;
  finally
    freeAndNil(qry);
  end;
  //
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
  //
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
    qry.SQL.Add('Select p.*, c.nome, c.cidade');
    qry.SQL.Add('FROM pedido p');
    qry.SQL.Add('inner join cliente c on (c.id_cliente = p.id_cliente)');
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

function TDM.PedidoInserir(pid_usuario, pid_cliente: integer; pdt_pedido: string; pvl_total: double): TJsonObject;
var
  qry: TFDQuery;
begin
  try
    qry := TFDQuery.create(nil);
    qry.connection := conn;
    qry.SQL.Add('Insert into pedido(id_usuario, id_cliente, dt_pedido, vl_total)');
    qry.SQL.Add('values(:id_usuario, :id_cliente, :dt_pedido, :vl_total');

    qry.SQL.Add('select last_insert_rowid() as id_pedido');

    qry.ParamByName('id_usuario').Value := pid_usuario;
    qry.ParamByName('id_cliente').Value := pid_cliente;
    qry.ParamByName('dt_pedido').Value := pdt_pedido;
    qry.ParamByName('vl_total').Value := pvl_total;

    qry.Active := true;

    result := qry.ToJSONObject;
  finally
    freeAndNil(qry);
  end;
end;

function TDM.PedidoEditar(pid_pedido, pid_cliente: integer; pdt_pedido: string; pvl_total: double): TJsonObject;
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

    result := TJSONObject.create(TJSONPair.Create('id_pedido', pid_pedido));
  finally
    freeAndNil(qry);
  end;
end;

function TDM.PedidoExcluir(pid_pedido: integer): TJsonObject;
var
  qry: TFDQuery;
begin
  try
    qry := TFDQuery.create(nil);
    qry.connection := conn;
    qry.SQL.Add('delete from pedido_item');
    qry.SQL.Add('where id_pedido = :id_pedido');
    qry.ParamByName('id_pedido').Value := pid_pedido;
    qry.ExecSQL;

    qry.sql.Clear;
    qry.SQL.Add('delete from pedido');
    qry.SQL.Add('where id_pedido = :id_pedido');
    qry.ParamByName('id_pedido').Value := pid_pedido;

    qry.ExecSQL;

    result := TJSONObject.create(TJSONPair.Create('id_pedido', pid_pedido));
  finally
    freeAndNil(qry);
  end;
end;

function TDM.PedidoListar(pfiltro: string): TJsonArray;
var
  qry: TFDQuery;
begin
  try
    qry := TFDQuery.create(nil);
    qry.connection := conn;
    qry.SQL.Add('Select p.*, c.nome, c.cidade');
    qry.SQL.Add('FROM pedido p');
    qry.SQL.Add('inner join cliente c on (c.id_cliente = p.id_cliente)');

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

end.
