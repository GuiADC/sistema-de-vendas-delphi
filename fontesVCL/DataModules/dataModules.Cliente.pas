unit dataModules.Cliente;

interface

uses
  System.SysUtils, System.Classes, DataSet.Serialize.Config,
  RESTRequest4D,
  DataSet.Serialize.Adapter.RESTRequest4D, FireDAC.Comp.Client;

type
  TdmCliente = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ListarClientes(pmenTable: TFDMemTable; filtro: string);
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

  //
end;

procedure TdmCliente.DataModuleCreate(Sender: TObject);
begin
  TDatasetSerializeConfig.getinstance.CaseNameDefinition := cndLower;
  TDatasetSerializeConfig.getinstance.Import.DecimalSeparator := '.';
end;

end.
