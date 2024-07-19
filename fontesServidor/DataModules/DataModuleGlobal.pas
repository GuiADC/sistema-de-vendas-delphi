unit DataModuleGlobal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, DataSet.Serialize.Config,
  system.JSON, Dataset.Serialize, fireDAC.DApt;

type
  TDM = class(TDataModule)
    conn: TFDConnection;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    procedure DataModuleCreate(Sender: TObject);
    procedure connBeforeConnect(Sender: TObject);
  private
    procedure carregarConfiogDB(Connection: TFDConnection);
  public
    function ClienteListar(pfiltro: string): TJsonArray;
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

end.
