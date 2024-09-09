unit dataModules.Cliente;

interface

uses
  System.SysUtils, System.Classes, DataSet.Serialize,DataSet.Serialize.Config,
  RESTRequest4D,
  DataSet.Serialize.Adapter.RESTRequest4D, FireDAC.Comp.Client, System.JSON, Vcl.constantes;

type
  TdmCliente = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  private
    Fpage: integer;
    FtotalPages: integer;
    Ftotal: integer;
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

    procedure ListarClientes(pmenTable: TFDMemTable; filtro: string; pintTipoPesquisa: integer; ppaginate: boolean);
    procedure ListarClienteId(pmenTable: TFDMemTable; id_cliente: integer);
    procedure Inserir(pnome, pendereco, pcomplemento, pbairro, pcidade, puf: string);
    procedure Editar(pid_cliente: integer; pnome, pendereco, pcomplemento, pbairro, pcidade, puf: string);
    procedure Excluir(parrJson: TJSONArray; pstrTypeClient: string);
  end;

var
  dmCliente: TdmCliente;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure  TdmCliente.ListarClientes(pmenTable: TFDMemTable; filtro: string; pintTipoPesquisa: integer; ppaginate: boolean);
var
  resp: IResponse;
  lJsonObjResult: tjsonObject;
begin
  try
    resp := TRequest.new.BaseURL(base_url)
                        .Resource('/clientes')
                        .addParam('filtro', filtro)
                        .addParam('tipoPesquisa', pintTipoPesquisa.tostring)
                        .addParam('pagina', getpage.tostring)
                        .addParam('x-paginate', ppaginate.tostring)
                        .accept('application/json')
                        .Get;

    lJsonObjResult := TJSONObject(TJSONObject.ParseJSONValue(resp.content));

    if ppaginate then
    begin
      total := lJsonObjResult.GetValue<integer>('total');
      page := lJsonObjResult.GetValue<integer>('pageAtual');
      totalPages := lJsonObjResult.GetValue<integer>('totalPages');
    end;

    if pmenTable.Active then
      pmenTable.EmptyDataSet;

    pmenTable.LoadFromJSON(lJsonObjResult.GetValue<TJSONArray>('docs'), false);

    if resp.StatusCode <> 200 then
      raise Exception.Create(resp.content);

  finally
    lJsonObjResult.free;
  end;
end;

procedure TdmCliente.Setpage(const Value: integer);
begin
  Fpage := Value;
end;

procedure TdmCliente.Settotal(const Value: integer);
begin
  Ftotal := Value;
end;

procedure TdmCliente.SettotalPages(const Value: integer);
begin
  FtotalPages := Value;
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

    lresp := TRequest.new.BaseURL(base_url)
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

    lresp := TRequest.new.BaseURL(base_url)
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

procedure  TdmCliente.Excluir(parrJson: TJSONArray; pstrTypeClient: string);
var
  lresp: IResponse;
begin
  lresp := TRequest.new.BaseURL(base_url)
                      .Resource('/clientes')
                      .AddParam('Situacao', pstrTypeClient)
                      .AddBody(parrJson.ToJSON)
                      .accept('application/json')
                      .Delete;

  if lresp.StatusCode <> 200 then
    raise Exception.Create(lresp.content);
end;

function TdmCliente.getpage: integer;
begin
  Result := Fpage;
end;

procedure  TdmCliente.ListarClienteId(pmenTable: TFDMemTable; id_cliente: integer);
var
  resp: IResponse;
begin
  resp := TRequest.new.BaseURL(base_url)
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

  Fpage := 1;
end;

end.
