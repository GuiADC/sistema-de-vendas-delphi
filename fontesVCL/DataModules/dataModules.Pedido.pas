unit dataModules.Pedido;

interface

uses
  System.SysUtils, System.Classes,DataSet.Serialize.Config, RESTRequest4D,
  DataSet.Serialize.Adapter.RESTRequest4D, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, System.JSON, DataSet.Serialize, Vcl.constantes;

type
  TdmPedido = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  private
    FtotalPages: integer;
    Ftotal: integer;
    Fpage: integer;

    function getpage: integer;
    procedure Setpage(const Value: integer);
    procedure Settotal(const Value: integer);
    procedure SettotalPages(const Value: integer);
    { Private declarations }
  public
    { Public declarations }

    property total: integer read Ftotal write Settotal;
    property page: integer read getpage write Setpage;
    property totalPages: integer read FtotalPages write SettotalPages;

    procedure ListarPedidoId(pmenTable, pmenItens: TFDMemTable; id_pedido: integer);
    procedure ListarPedidos(pmenTable: TFDMemTable; filtro: string);
    procedure inserir(pid_usuario, pid_cliente: integer; pdt_pedido: TDate; ptotal: double; parritens: TJSONArray);
    procedure editar(pid_pedido, pid_cliente: integer; pdt_pedido: TDate; ptotal: double; parritens: TJSONArray);
    procedure excluir(pjsonArrIdPedido: TJSONArray);
  end;

var
  dmPedido: TdmPedido;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure  TdmPedido.ListarPedidos(pmenTable: TFDMemTable; filtro: string);
var
  resp: IResponse;
  lJsonObjResult: tjsonObject;
begin
  try
    resp := TRequest.new.BaseURL(base_url)
                        .Resource('/pedidos')
                        .addParam('filtro',filtro)
                        .addParam('pagina',getpage.tostring)
                        .accept('application/json')
                        .Get;

      lJsonObjResult := TJSONObject(TJSONObject.ParseJSONValue(resp.Content));

      total := lJsonObjResult.GetValue<integer>('total');
      page := lJsonObjResult.GetValue<integer>('pageAtual');
      totalPages := lJsonObjResult.GetValue<integer>('totalPages');

      if pmenTable.Active then
        pmenTable.EmptyDataSet;

      pmenTable.LoadFromJSON(lJsonObjResult.GetValue<TJSONArray>('docs'), false);

    if resp.StatusCode <> 200 then
      raise Exception.Create(resp.content);
  finally
      lJsonObjResult.free;
  end;
end;

procedure TdmPedido.Setpage(const Value: integer);
begin
  Fpage := value;
end;

procedure TdmPedido.Settotal(const Value: integer);
begin
  Ftotal := Value;
end;

procedure TdmPedido.SettotalPages(const Value: integer);
begin
  FtotalPages := Value;
end;

procedure TdmPedido.DataModuleCreate(Sender: TObject);
begin
  TDatasetSerializeConfig.getinstance.CaseNameDefinition := cndLower;
  TDatasetSerializeConfig.getinstance.Import.DecimalSeparator := '.';

  Fpage := 1;
end;

procedure  TdmPedido.ListarPedidoId(pmenTable, pmenItens: TFDMemTable; id_pedido: integer);
var
  resp: IResponse;
  ljson: TJSONObject;
  larrItens: TJSONArray;
begin
  resp := TRequest.new.BaseURL(base_url)
                      .Resource('/pedidos')
                      .ResourceSuffix(id_pedido.ToString)
                      .accept('application/json')
                      //.Adapters(TDataSetSerializeAdapter.new(pmenTable))
                      .Get;

  if resp.StatusCode <> 200 then
    raise Exception.Create(resp.content);

  ljson := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(resp.Content), 0) as TJSONObject;
  larrItens := ljson.GetValue<TJSONArray>('itens');

  pmenItens.LoadFromJSON(larrItens, false);
  pmenTable.LoadFromJSON(ljson);
end;

procedure TdmPedido.inserir(pid_usuario, pid_cliente: integer; pdt_pedido: TDate; ptotal: double; parritens: TJSONArray);
var
  lresp: IResponse;
  ljson: TJSONobject;
begin
  try
    ljson := TJSONObject.create;
    ljson.AddPair('id_usuario', pid_usuario);
    ljson.AddPair('id_cliente', pid_cliente);
    ljson.AddPair('dt_pedido', formatdatetime('yyyy-mm-dd', pdt_pedido));
    ljson.AddPair('vl_total', ptotal);
    ljson.AddPair('itens', parritens);

    lresp := TRequest.new.BaseURL(base_url)
                        .Resource('/pedidos')
                        .AddBody(ljson.ToJSON)
                        .accept('application/json')
                        .Post;

    if lresp.StatusCode <> 201 then
      raise Exception.Create(lresp.content);
  finally
    freeandnil(ljson);
  end;
end;

procedure TdmPedido.editar(pid_pedido, pid_cliente: integer; pdt_pedido: TDate; ptotal: double; parritens: TJSONArray);
var
  lresp: IResponse;
  ljson: TJSONobject;
begin
  try
    ljson := TJSONObject.create;

    ljson.AddPair('id_cliente', pid_cliente);
    ljson.AddPair('dt_pedido', formatdatetime('yyyy-mm-dd', pdt_pedido));
    ljson.AddPair('vl_total', ptotal);
    ljson.AddPair('itens', parritens);

    lresp := TRequest.new.BaseURL(base_url)
                        .Resource('/pedidos')
                        .ResourceSuffix(pid_pedido.ToString)
                        .AddBody(ljson.ToJSON)
                        .accept('application/json')
                        .Put;

    if lresp.StatusCode <> 201 then
      raise Exception.Create(lresp.content);
  finally
    freeandnil(ljson);
  end;
end;

procedure TdmPedido.excluir(pjsonArrIdPedido: TJSONArray);
var
  lresp: IResponse;
begin
  lresp := TRequest.new.BaseURL(base_url)
                      .Resource('/pedidos')
                      .AddBody(pjsonArrIdPedido.ToJSON)
                      .accept('application/json')
                      .Delete;

  if lresp.StatusCode <> 200 then
    raise Exception.Create(lresp.content);

end;

function TdmPedido.getpage: integer;
begin
  result := Fpage;
end;

end.
