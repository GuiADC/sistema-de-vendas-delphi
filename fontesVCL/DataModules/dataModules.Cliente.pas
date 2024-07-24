unit dataModules.Cliente;

interface

uses
  System.SysUtils, System.Classes, DataSet.Serialize.Config,
  RESTRequest4D,
  DataSet.Serialize.Adapter.RESTRequest4D, FireDAC.Comp.Client, System.JSON;

type
  TdmCliente = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  private


    { Private declarations }
  public
    { Public declarations }
    procedure ListarClientes(pmenTable: TFDMemTable; filtro: string);
    procedure ListarClienteId(pmenTable: TFDMemTable; id_cliente: integer);
    procedure Inserir(pnome, pendereco, pcomplemento, pbairro, pcidade, puf: string);
    procedure Editar(pid_cliente: integer; pnome, pendereco, pcomplemento, pbairro, pcidade, puf: string);
    procedure Excluir(pid_cliente: integer);
  end;

var
  dmCliente: TdmCliente;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure  TdmCliente.ListarClientes(pmenTable: TFDMemTable; filtro: string);
var
  resp: IResponse;
begin
  resp := TRequest.new.BaseURL('http://localhost:3000')
                      .Resource('/clientes')
                      .addParam('filtro',filtro)
                      .accept('application/json')
                      .Adapters(TDataSetSerializeAdapter.new(pmenTable))
                      .Get;

  if resp.StatusCode <> 200 then
    raise Exception.Create(resp.content);
end;

procedure  TdmCliente.Inserir(pnome, pendereco, pcomplemento, pbairro, pcidade, puf: string);
var
  lresp: IResponse;
  ljson: TJSONobject;
begin
  try
    ljson := TJSONObject.create;
    ljson.AddPair('nome', pnome);
    ljson.AddPair('endereco', pendereco);
    ljson.AddPair('complemento', pcomplemento);
    ljson.AddPair('bairro', pbairro);
    ljson.AddPair('cidade', pcidade);
    ljson.AddPair('uf', puf);

    lresp := TRequest.new.BaseURL('http://localhost:3000')
                        .Resource('/clientes')
                        .AddBody(ljson.ToJSON)
                        .accept('application/json')
                        .Post;

    if lresp.StatusCode <> 201 then
      raise Exception.Create(lresp.content);
  finally
    freeandnil(ljson);
  end;

  //
end;

procedure  TdmCliente.Editar(pid_cliente: integer; pnome, pendereco, pcomplemento, pbairro, pcidade, puf: string);
var
  lresp: IResponse;
  ljson: TJSONobject;
begin
  try
    ljson := TJSONObject.create;
    ljson.AddPair('nome', pnome);
    ljson.AddPair('endereco', pendereco);
    ljson.AddPair('complemento', pcomplemento);
    ljson.AddPair('bairro', pbairro);
    ljson.AddPair('cidade', pcidade);
    ljson.AddPair('uf', puf);

    lresp := TRequest.new.BaseURL('http://localhost:3000')
                        .Resource('/clientes')
                        .ResourceSuffix(pid_cliente.tostring)
                        .AddBody(ljson.ToJSON)
                        .accept('application/json')
                        .Put;

    if lresp.StatusCode <> 200 then
      raise Exception.Create(lresp.content);
  finally
    freeandnil(ljson);
  end;
end;

procedure  TdmCliente.Excluir(pid_cliente: integer);
var
  lresp: IResponse;
begin
  lresp := TRequest.new.BaseURL('http://localhost:3000')
                      .Resource('/clientes')
                      .ResourceSuffix(pid_cliente.tostring)
                      .accept('application/json')
                      .Delete;

  if lresp.StatusCode <> 200 then
    raise Exception.Create(lresp.content);
end;

procedure  TdmCliente.ListarClienteId(pmenTable: TFDMemTable; id_cliente: integer);
var
  resp: IResponse;
begin
  resp := TRequest.new.BaseURL('http://localhost:3000')
                      .Resource('/clientes')
                      .ResourceSuffix(id_cliente.ToString)
                      .accept('application/json')
                      .Adapters(TDataSetSerializeAdapter.new(pmenTable))
                      .Get;

  if resp.StatusCode <> 200 then
    raise Exception.Create(resp.content);
end;

procedure TdmCliente.DataModuleCreate(Sender: TObject);
begin
  TDatasetSerializeConfig.getinstance.CaseNameDefinition := cndLower;
  TDatasetSerializeConfig.getinstance.Import.DecimalSeparator := '.';
end;

end.
