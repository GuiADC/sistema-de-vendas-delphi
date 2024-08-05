unit dataModules.Usuario;

interface

uses
  System.SysUtils, System.Classes, DataSet.Serialize.Config,
  RESTRequest4D,
  DataSet.Serialize.Adapter.RESTRequest4D, FireDAC.Comp.Client, System.JSON,  Vcl.constantes;

type
  TdmUsuario = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    procedure Login(pmenTable: TFDMemTable; pemail, psenha: string);
  end;

var
  dmUsuario: TdmUsuario;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmUsuario.DataModuleCreate(Sender: TObject);
begin
  TDatasetSerializeConfig.getinstance.CaseNameDefinition := cndLower;
  TDatasetSerializeConfig.getinstance.Import.DecimalSeparator := '.';
end;

procedure TdmUsuario.Login(pmenTable: TFDMemTable; pemail, psenha: string);
var
  lresp: IResponse;
  ljson: TJSONobject;
begin
  try
    ljson := TJSONObject.create;
    ljson.AddPair('email', pemail);
    ljson.AddPair('senha', psenha);

    lresp := TRequest.new.BaseURL(base_url)
                        .Resource('/usuarios/login')
                        .AddBody(ljson.ToJSON)
                        .accept('application/json')
                        .Adapters(TDataSetSerializeAdapter.new(pmenTable))
                        .Post;

    if lresp.StatusCode <> 200 then
      raise Exception.Create(lresp.content);
  finally
    freeandnil(ljson);
  end;

  //
end;

end.
