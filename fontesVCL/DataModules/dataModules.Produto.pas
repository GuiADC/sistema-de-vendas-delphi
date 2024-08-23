unit dataModules.Produto;

interface

uses
  System.SysUtils, System.Classes, DataSet.Serialize.Config,
  RESTRequest4D,
  DataSet.Serialize.Adapter.RESTRequest4D, FireDAC.Comp.Client, System.JSON, Vcl.constantes
  , unitProduto;

type
  TdmProduto = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    procedure ListarProdutos(pmenTable: TFDMemTable; filtro: string);
    procedure ListarProdutoId(pmenTable: TFDMemTable; id_produto: integer);
    procedure inserir(pdescricao, pvalor: string);
    procedure editar(pid_produto: integer; pdescricao, pvalor: string);
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

procedure TdmProduto.DataModuleCreate(Sender: TObject);
begin
  TDatasetSerializeConfig.getinstance.CaseNameDefinition := cndLower;
  TDatasetSerializeConfig.getinstance.Import.DecimalSeparator := '.';
end;

procedure TdmProduto.editar(pid_produto: integer; pdescricao, pvalor: string);
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

procedure TdmProduto.inserir(pdescricao, pvalor: string);
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
begin
  resp := TRequest.new.BaseURL(base_url)
                      .Resource('/produtos')
                      .addParam('filtro',filtro)
                      .accept('application/json')
                      .Adapters(TDataSetSerializeAdapter.new(pmenTable))
                      .Get;

  if resp.StatusCode <> 200 then
    raise Exception.Create(resp.content);
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
