unit unitCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unitDefaultListItems, Vcl.Buttons,
  Vcl.StdCtrls, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Navigation, vcl.Loading, Vcl.easyUtils, unitPrincipal, system.JSON;

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
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    fbookmarkList:TBookmarkList;
    fbookmark: TBookmark;
    fJSONArrayItemsSelected: TJsonArray;
    procedure OpenCadCliente(idCliente: integer);
    procedure refreshClientes;
    procedure terminateBusca(Sender: TObject);
    procedure editar;
    procedure terminateDelete(Sender: TObject);
    procedure resizeGrid(pintWidthSmenu: integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCliente: TfrmCliente;

implementation

{$R *.dfm}

uses unitClienteCad, dataModules.Cliente;

procedure TfrmCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if fbookmarkList <> nil then
    fbookmarkList := nil;

  if  (fJSONArrayItemsSelected )<> nil then
    freeandnil(fJSONArrayItemsSelected);
end;

procedure TfrmCliente.FormCreate(Sender: TObject);
begin
  frmPrincipal.procResizeColunsGrid := resizeGrid;
end;

procedure TfrmCliente.resizeGrid(pintWidthSmenu: integer);
begin
  ResizeWidthColunGrid(gridClientes, dsCliente, self.width, pintWidthSmenu);

  removeScroll(gridclientes);
end;

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
var
  slItemsSelecionados: TStringList;
begin
  fJSONArrayItemsSelected := nil;
  fbookmarkList := gridClientes.SelectedRows;

  slItemsSelecionados := nil;
  try
    slItemsSelecionados.create;
    slItemsSelecionados.Clear;

    fJSONArrayItemsSelected := TJSONArray.Create;

    for var iintCount := 0 to fbookmarkList.Count -1 do
    begin
      dsCliente.DataSet.GotoBookmark(fbookmarkList.items[iintCount]);

      slItemsSelecionados.add(dsCliente.DataSet.FieldByName('Nome').AsString);

      fJSONArrayItemsSelected.add(TJSONObject.Create(TJSONPair.create('id_cliente', dsCliente.DataSet.FieldByName('id_cliente').asInteger)));
    end;

    if MessageDlg('Deseja excluir o cliente selecionado?', TMsgDlgType.mtConfirmation,[TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes then
    begin
      TLoading.Show;
      Tloading.ExecuteThread(procedure
      begin
        dmCliente.Excluir(tabCliente.FieldByName('id_cliente').AsInteger);
      end, terminateDelete);
    end
    else
    begin
      if (fJSONArrayItemsSelected )<> nil then
        freeandnil(fJSONArrayItemsSelected);
    end;
  finally
    if (slItemsSelecionados <> nil) then
      freeandnil(slItemsSelecionados);
  end;
end;

procedure TfrmCliente.btnInserirClick(Sender: TObject);
begin
  inherited;
  OpenCadCliente(0);
end;

end.
