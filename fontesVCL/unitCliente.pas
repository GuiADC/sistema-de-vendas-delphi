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
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure gridClientesDblClick(Sender: TObject);
  private
    fbookmark: TBookmark;
    procedure OpenCadCliente(idCliente: integer);
    procedure refreshClientes;
    procedure terminateBusca(Sender: TObject);
    procedure editar;
    procedure terminateDelete(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCliente: TfrmCliente;

implementation

{$R *.dfm}

uses unitClienteCad, dataModules.Cliente;


procedure TfrmCliente.FormShow(Sender: TObject);
begin
  refreshClientes;
end;

procedure TfrmCliente.gridClientesDblClick(Sender: TObject);
begin
  inherited;
  editar;
end;

procedure TfrmCliente.OpenCadCliente(idCliente: integer);
begin
  TNavigation.ExecuteOnClose := refreshClientes;
  TNavigation.ParamInt := idCliente;
  TNavigation.OpenModal(TfrmClienteCad, frmClienteCad);
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

  if fbookmark <> nil then
    try
      gridClientes.DataSource.DataSet.GotoBookmark(fbookmark);
      fbookmark := nil;
    finally
    end;

end;

procedure tfrmCliente.refreshClientes;
begin
  TLoading.Show;
  Tloading.ExecuteThread(procedure
  begin
    gridClientes.DataSource := nil;
    dmCliente.ListarClientes(tabCliente, edtBuscar.text);

  end,
  terminateBusca);

end;

procedure tfrmCliente.editar;
begin
  if tabCliente.RecordCount = 0  then
    exit;

   fbookmark := gridClientes.DataSource.DataSet.GetBookmark;

   OpenCadCliente(tabCliente.FieldByName('id_cliente').AsInteger);
end;

procedure TfrmCliente.btnBuscarClick(Sender: TObject);
begin
  inherited;
  refreshClientes;
end;

procedure TfrmCliente.btnEditarClick(Sender: TObject);
begin
  inherited;
  editar;
end;

procedure tfrmCliente.terminateDelete(Sender: TObject);
begin
  TLoading.hide;

  if sender is TThread then
    if Assigned(TThread(sender).FatalException) then
    begin
      ShowMessage(Exception(TThread(sender).FatalException).Message);
      exit;
    end;

  refreshClientes;
end;

procedure TfrmCliente.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Deseja excluir o cliente selecionado?', TMsgDlgType.mtConfirmation,[TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes then
  begin
    TLoading.Show;
    Tloading.ExecuteThread(procedure
    begin
      dmCliente.Excluir(tabCliente.FieldByName('id_cliente').AsInteger);
    end, terminateDelete);
  end;
end;

procedure TfrmCliente.btnInserirClick(Sender: TObject);
begin
  inherited;
  OpenCadCliente(0);
end;

end.
