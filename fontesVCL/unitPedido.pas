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
  FireDAC.Stan.Async, FireDAC.DApt;

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

  private
   { Private declarations }
    fbookmark: TBookmark;

    procedure editar;
    procedure OpenCadPedido(idPedido: integer);
    procedure refreshPedidos;
    procedure terminateBusca(Sender: TObject);
    procedure terminateDelete(Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmPedido: TfrmPedido;

implementation

{$R *.dfm}

procedure TfrmPedido.OpenCadPedido(idPedido: integer);
begin
  TNavigation.ExecuteOnClose := refreshPedidos;
  TNavigation.ParamInt := idPedido;
  TNavigation.OpenModal(TfrmPedidoCad, frmPedidoCad);
end;

procedure TfrmPedido.terminateDelete(Sender: TObject);
begin
  TLoading.hide;

  if sender is TThread then
    if Assigned(TThread(sender).FatalException) then
    begin
      ShowMessage(Exception(TThread(sender).FatalException).Message);
      exit;
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

end;

procedure TfrmPedido.refreshPedidos;
begin
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
begin
begin
  if MessageDlg('Deseja excluir o cliente selecionado?', TMsgDlgType.mtConfirmation,[TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes then
  begin
    TLoading.Show;
    Tloading.ExecuteThread(procedure
    begin
      dmPedido.Excluir(tabPedido.FieldByName('id_pedido').AsInteger);
    end, terminateDelete);
  end;
end;
end;

procedure TfrmPedido.btnInserirClick(Sender: TObject);
begin
  OpenCadPedido(0);
end;

procedure TfrmPedido.gridPedidosDblClick(Sender: TObject);
begin
  inherited;
  editar;
end;

procedure TfrmPedido.editar;
begin
  if tabPedido.RecordCount = 0  then
    exit;

   fbookmark := gridPedidos.DataSource.DataSet.GetBookmark;

   OpenCadPedido(tabPedido.FieldByName('id_pedido').AsInteger);
end;

procedure TfrmPedido.FormShow(Sender: TObject);
begin
  refreshPedidos;
end;

end.
