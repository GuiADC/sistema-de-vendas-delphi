unit unitPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unitDefaultListItems, Vcl.Buttons,
  Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.StorageBin, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Navigation, vcl.Loading, unitPedidoCad, dataModules.Pedido,
  FireDAC.Stan.Async, FireDAC.DApt, System.JSON, frxSmartMemo, frxClass,
  frxExportBaseDialog, frxExportPDF, frxDBSet, frCoreClasses;

type
  TfrmPedido = class(TfrmDefault)
    gridPedidos: TDBGrid;
    dsPedido: TDataSource;
    tabPedido: TFDMemTable;
    tabPedidoid_pedido: TIntegerField;
    tabPedidoid_usuario: TIntegerField;
    tabPedidoid_cliente: TIntegerField;
    tabPedidodt_pedido: TDateField;
    tabPedidovl_total: TCurrencyField;
    tabPedidonome: TStringField;
    tabPedidocidade: TStringField;
    tabPedidousuario: TStringField;
    procedure gridPedidosDblClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);

  private
   { Private declarations }
    fbookmark: TBookmark;
    fstrItemsDelete: string;
    fBookmarksList: TBookmarkList;
    fJSONArrayItemsSelected: TJSONArray;
    fpage: integer;

    procedure editar;
    procedure OpenCadPedido(idPedido: integer);
    procedure refreshPedidos;
    procedure terminateBusca(Sender: TObject);
    procedure terminateDelete(Sender: TObject);
    procedure ResizeColunsGrid(pintWidthSmenu: integer);
    procedure setProcResizeGrid;
  public
    { Public declarations }
  end;

var
  frmPedido: TfrmPedido;

implementation

uses Vcl.easyUtils, unitPrincipal;

{$R *.dfm}

procedure TfrmPedido.OpenCadPedido(idPedido: integer);
begin
  TNavigation.ExecuteOnClose := refreshPedidos;
  TNavigation.ParamInt := idPedido;
  TNavigation.OpenModal(TfrmPedidoCad, frmPedidoCad);
end;

procedure TfrmPedido.setProcResizeGrid;
begin
  frmPrincipal.procResizeColunsGrid := ResizeColunsGrid;

  removeScroll(gridPedidos);
end;

procedure TfrmPedido.SpeedButton1Click(Sender: TObject);
begin
  if tabPedido.RecordCount > 0 then
  inherited;
end;

procedure TfrmPedido.ResizeColunsGrid(pintWidthSmenu: integer);
begin
  ResizeWidthColunGrid(gridpedidos, dsPedido, self.width - pintWidthSmenu, pintWidthSmenu);
end;

procedure TfrmPedido.terminateDelete(Sender: TObject);
begin
  try
    TLoading.hide;

    if sender is TThread then
      if Assigned(TThread(sender).FatalException) then
      begin
        ShowMessage(Exception(TThread(sender).FatalException).Message);
        exit;
      end;
  finally
    if fJSONArrayItemsSelected <> nil then
      freeandnil(fJSONArrayItemsSelected);

    if fBookmarksList <> nil then
      fBookmarksList := nil;

    if fbookmark <> nil then
      fbookmark := nil;
  end;
  refreshPedidos;
end;

procedure TfrmPedido.terminateBusca(Sender: TObject);
begin
  TLoading.hide;
  gridPedidos.datasource := dsPedido;

  if sender is TThread then
    if Assigned(TThread(sender).FatalException) then
    begin
      ShowMessage(Exception(TThread(sender).FatalException).Message);
      exit;
    end;

  if fbookmark <> nil then
    try
      gridPedidos.DataSource.DataSet.GotoBookmark(fbookmark);
      fbookmark := nil;
    except
    end;

  //ResizeWidthColunGrid(gridPedidos, dsPedido, self.width);
end;

procedure TfrmPedido.refreshPedidos;
begin
  fstrItemsDelete := '';
  TLoading.Show;
  Tloading.ExecuteThread(procedure
  begin
    gridPedidos.DataSource := nil;
    dmPedido.ListarPedidos(tabPedido, edtBuscar.text);

  end,
  terminateBusca);
end;

procedure TfrmPedido.btnBuscarClick(Sender: TObject);
begin
  refreshPedidos;
end;

procedure TfrmPedido.btnEditarClick(Sender: TObject);
begin
  editar;
end;

procedure TfrmPedido.btnExcluirClick(Sender: TObject);
var
  lslNomePedidos: TStringList;
begin
  fJSONArrayItemsSelected := nil;

  try
    lslNomePedidos := TStringList.Create;
    lslNomePedidos.Clear;

    fJSONArrayItemsSelected := TJSONArray.Create;

    fBookmarksList := gridPedidos.SelectedRows;

    for var iintCount := 0 to fBookmarksList.Count - 1 do
    begin
      dsPedido.DataSet.GotoBookmark(fBookmarksList.Items[iintCount]);
      lslNomePedidos.add(dsPedido.DataSet.FieldByName('Nome').AsString);
      fJSONArrayItemsSelected.Add(TJSONObject.create(TJSONPair.Create('id_pedido', dsPedido.DataSet.FieldByName('id_pedido').AsInteger)));
    end;

    if MessageDlg('Deseja excluir o(s) cliente(s) selecionado(s)? ' + sLineBreak + lslNomePedidos.text, TMsgDlgType.mtConfirmation,[TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes then
    begin
      TLoading.Show;
      Tloading.ExecuteThread(procedure
      begin
        dmPedido.Excluir(fJSONArrayItemsSelected);
      end, terminateDelete);
    end
    else
    begin
      if fJSONArrayItemsSelected <> nil then
        freeandnil(fJSONArrayItemsSelected);
    end;
  finally
    freeandnil(lslNomePedidos);
  end;
end;

procedure TfrmPedido.btnInserirClick(Sender: TObject);
begin
  OpenCadPedido(0);
end;

procedure TfrmPedido.gridPedidosDblClick(Sender: TObject);
begin
  editar;
end;

procedure TfrmPedido.editar;
begin
  if tabPedido.RecordCount = 0  then
    exit;

   fbookmark := gridPedidos.DataSource.DataSet.GetBookmark;

   OpenCadPedido(tabPedido.FieldByName('id_pedido').AsInteger);
end;

procedure TfrmPedido.FormCreate(Sender: TObject);
begin
  fpage := 1;
  setProcResizeGrid;
end;

procedure TfrmPedido.FormDestroy(Sender: TObject);
begin

  if fJSONArrayItemsSelected <> nil then
    freeandnil(fJSONArrayItemsSelected);

  if fBookmarksList <> nil then
    fBookmarksList := nil;

  if fbookmark <> nil then
    fbookmark := nil;

  inherited;
end;

procedure TfrmPedido.FormShow(Sender: TObject);
begin
  refreshPedidos;
end;

end.
