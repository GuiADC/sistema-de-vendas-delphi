﻿unit unitProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unitDefaultListItems, Vcl.Buttons,
  Vcl.StdCtrls, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Navigation, vcl.Loading, Vcl.easyUtils, unitPrincipal, system.JSON,
  frxSmartMemo, frxClass, frxExportBaseDialog, frxExportPDF, frxDBSet,
  frCoreClasses;

type
  TfrmProduto = class(TfrmDefault)
    gridProdutos: TDBGrid;
    tabProduto: TFDMemTable;
    dsProduto: TDataSource;
    tabProdutodescricao: TStringField;
    tabProdutopreco: TCurrencyField;
    tabProdutoid_produto: TIntegerField;
    tabProdutoImpressao: TFDMemTable;
    StringField1: TStringField;
    CurrencyField1: TCurrencyField;
    IntegerField1: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure refreshProdutos;
    procedure terminateBusca(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dsProdutoDataChange(Sender: TObject; Field: TField);
    procedure btnNextClick(Sender: TObject);
    procedure btnPreviousClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);

  private
    { Private declarations }
    fbookmark: TBookmark;
    fJSONArrayItemsSelected: tjsonarray;
    fbookmarkList: TBookmarkList;
    fstrMessageExclusao: string;

    procedure setCaptionPag(plbllabelPag: TLabel);
    procedure editar;
    procedure OpenCadProduto(idProduto: integer);
    procedure terminateDelete(Sender: TObject);
    procedure ResizeColunsGrid(pintWidthSmenu: integer);
    procedure setProcResizeGrid;
  public
    { Public declarations }
  end;

var
  frmProduto: TfrmProduto;

implementation

uses dataModules.Produto, unitProdutoCad;

{$R *.dfm}

procedure TfrmProduto.setCaptionPag(plbllabelPag: TLabel);
begin
  plbllabelPag.caption := 'Página ' + dmProduto.page.tostring + ' de ' + dmProduto.totalPages.tostring;
end;

procedure TfrmProduto.setProcResizeGrid;
begin
  frmPrincipal.procResizeColunsGrid := ResizeColunsGrid;

  removeScroll(gridProdutos);
end;

procedure TfrmProduto.ResizeColunsGrid(pintWidthSmenu: integer);
begin
  ResizeWidthColunGrid(gridProdutos, dsProduto, self.width, pintWidthSmenu);
end;

procedure TfrmProduto.FormCreate(Sender: TObject);
begin
  setProcResizeGrid;
end;

procedure TfrmProduto.FormDestroy(Sender: TObject);
begin
  if (fJSONArrayItemsSelected <> nil) then
    freeandnil(fJSONArrayItemsSelected);

  if fbookmarkList <> nil then
    fbookmarkList := nil;

  if fbookmark <> nil then
    fbookmark := nil;

end;

procedure TfrmProduto.FormShow(Sender: TObject);
begin
  refreshProdutos;
end;

procedure TfrmProduto.OpenCadProduto(idProduto: integer);
begin
  TNavigation.ExecuteOnClose := refreshProdutos;
  TNavigation.ParamInt := idProduto;
  TNavigation.OpenModal(TfrmProdutoCad, frmProdutoCad);
end;

procedure TfrmProduto.editar;
begin
  if tabProduto.RecordCount = 0  then
    exit;

   fbookmark := gridProdutos.DataSource.DataSet.GetBookmark;

   OpenCadProduto(tabProduto.FieldByName('id_produto').AsInteger);
end;

procedure TfrmProduto.btnEditarClick(Sender: TObject);
begin
  inherited;
  editar;
end;

procedure TfrmProduto.btnExcluirClick(Sender: TObject);
var
  slItemsSelecionados: TStringList;
begin
  if tabProduto.RecordCount = 0  then
    exit;

  fJSONArrayItemsSelected := nil;
  fbookmarkList := gridProdutos.SelectedRows;

  slItemsSelecionados := nil;
  try
    slItemsSelecionados := TStringlist.create;
    slItemsSelecionados.Clear;

    fJSONArrayItemsSelected := TJSONArray.Create;

    for var iintCount := 0 to fbookmarkList.Count -1 do
    begin
      dsProduto.DataSet.GotoBookmark(fbookmarkList.items[iintCount]);

      slItemsSelecionados.add(dsProduto.DataSet.FieldByName('descricao').AsString);

      fJSONArrayItemsSelected.add(TJSONObject.Create(TJSONPair.create('id_produto', dsProduto.DataSet.FieldByName('id_produto').asInteger)));
    end;

    if MessageDlg('Deseja Excluir o(s) produto(s) selecionado(s)?: ' + sLineBreak + slItemsSelecionados.text, TMsgDlgType.mtConfirmation,[TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes then
    begin
      TLoading.Show;
      Tloading.ExecuteThread(procedure
      begin
        fstrMessageExclusao := dmProduto.Excluir(fJSONArrayItemsSelected);
      end, terminateDelete);
    end
    else
    begin
      if (fJSONArrayItemsSelected <> nil) then
        freeandnil(fJSONArrayItemsSelected);
    end;
  finally
    if (slItemsSelecionados <> nil) then
      freeandnil(slItemsSelecionados);
  end;
end;

procedure TfrmProduto.btnImprimirClick(Sender: TObject);
begin
  if MessageDlg('Deseja imprimir somente a página atual? ', TMsgDlgType.mtConfirmation,[TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes then
  begin
    frxDBDataset1.DataSet := tabProduto;
  end
  else
  begin
    frxDBDataset1.DataSet := tabProdutoImpressao;
    dmproduto.ListarProdutos(tabProdutoImpressao, edtBuscar.text, false);
  end;

  frxReport1.ShowReport(true);
end;

procedure TfrmProduto.btnInserirClick(Sender: TObject);
begin
  OpenCadProduto(0);
end;

procedure TfrmProduto.btnNextClick(Sender: TObject);
begin
  if not (dmProduto.page >= dmProduto.totalPages) then
  begin
    dmProduto.page := dmProduto.page + 1;
    refreshProdutos;
  end
  else
    exit;
end;

procedure TfrmProduto.btnPreviousClick(Sender: TObject);
begin
  if not (dmProduto.page < 2) and not (dmProduto.totalPages < 2) then
  begin
    dmProduto.page := dmProduto.page - 1;
    refreshProdutos;
  end
  else
    exit;
end;

procedure TfrmProduto.dsProdutoDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if ((gridProdutos.DataSource <> nil) and (tabProduto.RecordCount > 33) and (tabProduto.RecNo >= tabproduto.RecordCount -2)) then
  begin
    ShowMessage('ultimo registro');
  end;
end;

procedure TfrmProduto.refreshProdutos;
begin
  TLoading.Show;
  Tloading.ExecuteThread(procedure
  begin
    gridProdutos.DataSource := nil;
    dmProduto.ListarProdutos(tabProduto, edtBuscar.text, true);

  end, terminateBusca);
end;

procedure TfrmProduto.terminateDelete(Sender: TObject);
begin
  TLoading.hide;
  try
    if sender is TThread then
      if Assigned(TThread(sender).FatalException) then
      begin
        ShowMessage(Exception(TThread(sender).FatalException).Message);
        exit;
      end;

   ShowMessage(fstrMessageExclusao);
  finally
    if fJSONArrayItemsSelected <> nil then
      freeandnil(fJSONArrayItemsSelected);

    if fbookmarkList <> nil then
      fbookmarkList := nil;
  end;
  refreshProdutos;
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

  setCaptionPag(lblPagina);

  if fbookmark <> nil then
  begin
    gridProdutos.DataSource.DataSet.GotoBookmark(fbookmark);
    fbookmark := nil;
  end;
end;

end.
