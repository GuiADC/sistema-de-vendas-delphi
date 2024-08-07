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
    { Private declarations }
  public
    { Public declarations }

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
begin
  resp := TRequest.new.BaseURL(base_url)
                      .Resource('/pedidos')
                      .addParam('filtro',filtro)
                      .accept('application/json')
                      .Adapters(TDataSetSerializeAdapter.new(pmenTable))
                      .Get;

  if resp.StatusCode <> 200 then
    raise Exception.Create(resp.content);
end;

procedure TdmPedido.DataModuleCreate(Sender: TObject);
begin
  TDatasetSerializeConfig.getinstance.CaseNameDefinition := cndLower;
  TDatasetSerializeConfig.getinstance.Import.DecimalSeparator := '.';
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
                      .accept('application/json')
                      .AddBody(pjsonArrIdPedido.ToJSON)
                      .Delete;

  if lresp.StatusCode <> 200 then
    raise Exception.Create(lresp.content);

end;

end.
