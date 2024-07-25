unit unitProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unitDefaultListItems, Vcl.Buttons,
  Vcl.StdCtrls, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Navigation, vcl.Loading;

type
  TfrmProduto = class(TfrmDefault)
    gridProdutos: TDBGrid;
    tabProduto: TFDMemTable;
    dsProduto: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure refreshProdutos;
    procedure terminateBusca(Sender: TObject);
  private
    { Private declarations }
    fbookmark: TBookmark;
    procedure editar;
    procedure OpenCadProduto(idProduto: integer);
  public
    { Public declarations }
  end;

var
  frmProduto: TfrmProduto;

implementation

uses dataModules.Produto;

{$R *.dfm}

procedure TfrmProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
//
end;

procedure TfrmProduto.FormShow(Sender: TObject);
begin
  refreshProdutos;
end;

procedure TfrmProduto.OpenCadProduto(idProduto: integer);
begin
  TNavigation.ExecuteOnClose := refreshProdutos;
  TNavigation.ParamInt := idProduto;
//  TNavigation.OpenModal(TfrmDefaultCadastro, frmDefaultCadastro);
end;

procedure TfrmProduto.editar;
begin
  if tabProduto.RecordCount = 0  then
    exit;

  fbookmark := gridProdutos.DataSource.DataSet.GetBookmark;

  OpenCadProduto(tabProduto.FieldByName('id_produto').AsInteger);
end;

procedure TfrmProduto.refreshProdutos;
begin
  TLoading.Show;
  Tloading.ExecuteThread(procedure
  begin
    Sleep(800);
    gridProdutos.DataSource := nil;
    dmProduto.ListarProdutos(tabProduto, edtBuscar.text);

  end, terminateBusca);
end;

procedure TfrmProduto.terminateBusca(Sender: TObject);
begin
  TLoading.hide;
  gridProdutos.DataSource := dsProduto;

  if sender is TThread then
  begin
    if assigned(TTHread(sender).FatalException) then
    begin
      ShowMessage(Exception(TThread(sender).FatalException).Message);
      exit;
    end;
  end;

  if fbookmark <> nil then
  try
    gridProdutos.DataSource.DataSet.GotoBookmark(fbookmark);
    fbookmark := nil;
  finally
  end;
end;

end.
