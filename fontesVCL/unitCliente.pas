unit unitCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unitDefaultListItems, Vcl.Buttons,
  Vcl.StdCtrls, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Navigation, vcl.Loading;

type
  TfrmCliente = class(TfrmDefault)
    tabCliente: TFDMemTable;
    dsCliente: TDataSource;
    gridClientes: TDBGrid;
    procedure btnInserirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
  private
    procedure OpenCadCliente(idCliente: integer);
    procedure refreshClientes;
    procedure terminateBusca(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCliente: TfrmCliente;

implementation

{$R *.dfm}

uses unitDefaultCadastro, dataModules.Cliente;


procedure TfrmCliente.FormShow(Sender: TObject);
begin
  refreshClientes;
end;

procedure TfrmCliente.OpenCadCliente(idCliente: integer);
begin
  TNavigation.OpenModal(TfrmDefaultCadastro, frmDefaultCadastro);
end;

procedure TfrmCliente.terminateBusca(Sender: TObject);
begin
  TLoading.hide;
  gridclientes.datasource := dsCliente;

  if sender is TThread then
    if Assigned(TThread(sender).FatalException) then
    begin
      ShowMessage(Exception(TThread(sender).FatalException).Message);
      exit;
    end;
end;

procedure tfrmCliente.refreshClientes;
begin
  TLoading.Show(self);
  Tloading.ExecuteThread(procedure
  begin
    gridClientes.DataSource := nil;
    dmCliente.ListarClientes(tabCliente, edtBuscar.text);

  end,
  terminateBusca);

end;


procedure TfrmCliente.btnBuscarClick(Sender: TObject);
begin
  inherited;
  refreshClientes;
end;

procedure TfrmCliente.btnInserirClick(Sender: TObject);
begin
  inherited;
  OpenCadCliente(0)
end;

end.
