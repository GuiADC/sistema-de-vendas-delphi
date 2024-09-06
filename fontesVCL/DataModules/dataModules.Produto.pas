unit dataModules.Produto;

interface

uses
  System.SysUtils, System.Classes, DataSet.Serialize.Config,
  RESTRequest4D,
  DataSet.Serialize.Adapter.RESTRequest4D, FireDAC.Comp.Client, System.JSON, Vcl.constantes
  , unitProduto, DataSet.Serialize;

type
  TdmProduto = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  private
    Fpage: integer;
    Ftotal: integer;
    FtotalPages: integer;
    procedure Setpage(const Value: integer);
    function getpage: integer;
    procedure Settotal(const Value: integer);
    procedure SettotalPages(const Value: integer);
    { Private declarations }
  public
    { Public declarations }

    property total: integer read Ftotal write Settotal;
    property page: integer read getpage write Setpage;
    property totalPages: integer read FtotalPages write SettotalPages;

    procedure ListarProdutos(pmenTable: TFDMemTable; filtro: string);
    procedure ListarProdutoId(pmenTable: TFDMemTable; id_produto: integer);
    procedure inserir(pdescricao: string; pvalor: double);
    procedure editar(pid_produto: integer; pdescricao: string; pvalor: double);
    function Excluir(parrItensJson: TJSONArray): string;
  end;

var
  dmProduto: TdmProduto;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmProduto }

function TdmProduto.Excluir(parrItensJson: TJSONArray): string;
var
  lresp: IResponse;
  ljsonObj: TJSONObject;
begin
  lresp := TRequest.new.BaseURL(base_url)
                       .Resource('/produtos')
                       .AddBody(parrItensJson.ToJSON)
                       .accept('application/json')
                       .Delete;

  ljsonObj := TJSONObject(TJSONObject.ParseJSONValue(lresp.Content));

  result := ljsonObj.GetValue<string>('message');

  freeandnil(ljsonObj);

  if lresp.StatusCode <> 200 then
    raise Exception.Create(lresp.content);
end;

function TdmProduto.getpage: integer;
begin
  Result := fpage;
end;

procedure TdmProduto.DataModuleCreate(Sender: TObject);
begin
  TDatasetSerializeConfig.getinstance.CaseNameDefinition := cndLower;
  TDatasetSerializeConfig.getinstance.Import.DecimalSeparator := '.';

  fpage := 1;
end;

procedure TdmProduto.editar(pid_produto: integer; pdescricao: string; pvalor: double);
var
  lresp: IResponse;
  ljson: TJSONobject;
begin
  try
    ljson := TJSONObject.Create;
    ljson.AddPair('descricao', pdescricao);
    ljson.AddPair('valor', pvalor);

    lresp := TRequest.New.BaseURL(base_url)
                         .Resource('/produtos')
                         .ResourceSuffix(pid_produto.tostring)
                         .addBody(ljson.ToJSON)
                         .accept('application/json')
                         .Put;

    if lresp.StatusCode <> 200 then
      raise Exception.Create(lresp.content);
  finally
    freeandnil(ljson);
  end;
end;

procedure TdmProduto.inserir(pdescricao: string; pvalor: double);
var
  lresp: IResponse;
  ljson: TJSONobject;
begin
  try
    ljson := TJSONObject.Create;
    ljson.AddPair('descricao', pdescricao);
    ljson.AddPair('valor', pvalor);

    lresp := TRequest.New.BaseURL(base_url)
                         .Resource('/produtos')
                         .addBody(ljson.ToJSON)
                         .accept('application/json')
                         .Post;

    if lresp.StatusCode <> 201 then
      raise Exception.Create(lresp.content);
  finally
    freeandnil(ljson);
  end;
end;

procedure TdmProduto.ListarProdutos(pmenTable: TFDMemTable; filtro: string);
var
  resp: IResponse;
  lJsonObjResult: tjsonObject;
begin
  try
    resp := TRequest.new.BaseURL(base_url)
                        .Resource('/produtos')
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

procedure TdmProduto.Setpage(const Value: integer);
begin
  fpage := Value;
end;

procedure TdmProduto.Settotal(const Value: integer);
begin
  Ftotal := Value;
end;

procedure TdmProduto.SettotalPages(const Value: integer);
begin
  FtotalPages := Value;
end;

procedure TdmProduto.ListarProdutoId(pmenTable: TFDMemTable; id_produto: integer);
var
  resp: IResponse;
begin
  resp := TRequest.new.BaseURL(base_url)
                      .Resource('/produtos')
                      .ResourceSuffix(id_produto.ToString)
                      .accept('application/json')
                      .Adapters(TDataSetSerializeAdapter.new(pmenTable))
                      .Get;

  if resp.StatusCode <> 200 then
    raise Exception.Create(resp.content);

end;

end.
