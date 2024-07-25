unit dataModules.Produto;

interface

uses
  System.SysUtils, System.Classes, DataSet.Serialize.Config,
  RESTRequest4D,
  DataSet.Serialize.Adapter.RESTRequest4D, FireDAC.Comp.Client, System.JSON;

type
  TdmProduto = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }

    procedure ListarProdutos(pmenTable: TFDMemTable; filtro: string);
  end;

var
  dmProduto: TdmProduto;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmProduto }

procedure TdmProduto.ListarProdutos(pmenTable: TFDMemTable; filtro: string);
var
  resp: IResponse;
begin
  resp := TRequest.new.BaseURL('http://localhost:3000')
                      .Resource('/produtos')
                      .addParam('filtro',filtro)
                      .accept('application/json')
                      .Adapters(TDataSetSerializeAdapter.new(pmenTable))
                      .Get;

  if resp.StatusCode <> 200 then
    raise Exception.Create(resp.content);
end;

end.
