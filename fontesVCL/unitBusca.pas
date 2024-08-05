unit unitBusca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Navigation,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TExecuteOnClose = procedure(id: integer; descricao: string; extra: double) of object;

  TfrmBusca = class(TForm)
    Panel4: TPanel;
    Panel7: TPanel;
    edtBuscar: TEdit;
    lblTitulo: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    btnCancelar: TSpeedButton;
    Panel3: TPanel;
    btnSelecionar: TSpeedButton;
    grid: TDBGrid;
    tabBusca: TFDMemTable;
    dsBusca: TDataSource;
    btnFiltrar: TSpeedButton;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure gridDblClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
  private
    campo_id, campo_descricao, campo_extra: string;

    procedure SetupLayout;
    procedure refreshBusca;
    procedure Selecionar;
    { Private declarations }
  public
    { Public declarations }
    tipo_pesquisa: string;
    ExecuteOnClose: TExecuteOnClose;
  end;

var
  frmBusca: TfrmBusca;

implementation

{$R *.dfm}

uses dataModule.Geral;

procedure TfrmBusca.btnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TfrmBusca.btnFiltrarClick(Sender: TObject);
begin
  refreshBusca;
end;

procedure TfrmBusca.btnSelecionarClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmBusca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action := TCloseAction.caFree;
 frmBusca := nil;
end;

procedure TfrmBusca.refreshBusca;
begin
  dmGeral.PesquisaGlobal(tabBusca, tipo_pesquisa, edtBuscar.text);
end;

procedure TfrmBusca.SetupLayout;
var
  col: TColumn;
begin
  grid.Columns.Clear;

  if tipo_pesquisa = 'cliente' then
  begin
    tabBusca.FieldDefs.clear;
    tabBusca.FieldDefs.Add('id_cliente', ftinteger, 0, false);
    tabBusca.FieldDefs.Add('nome', ftstring, 100, false);

    col := grid.Columns.Add;
    col.FieldName := 'id_cliente';
    col.Title.Caption := 'Id. Cliente';
    col.width := 100;

    col := grid.Columns.Add;
    col.FieldName := 'nome';
    col.Title.Caption := 'Nome';
    col.width := 550;

    campo_id := 'id_cliente';
    campo_descricao := 'nome';
    campo_extra := 'id_cliente';
  end
  else
  if tipo_pesquisa = 'produto' then
  begin
    tabBusca.FieldDefs.clear;
    tabBusca.FieldDefs.Add('id_produto', ftinteger, 0, false);
    tabBusca.FieldDefs.Add('descricao', ftstring, 100, false);
    tabBusca.FieldDefs.Add('preco', ftcurrency, 0, false);

    col := grid.Columns.Add;
    col.FieldName := 'id_produto';
    col.Title.Caption := 'Id. Produto';
    col.width := 100;

    col := grid.Columns.Add;
    col.FieldName := 'descricao';
    col.Title.Caption := 'Descrição';
    col.width := 500;

    col := grid.Columns.Add;
    col.FieldName := 'preco';
    col.Title.Caption := 'Preço';
    col.width := 100;

    campo_id := 'id_produto';
    campo_descricao := 'descricao';
    campo_extra := 'preco';
  end;
end;

procedure TfrmBusca.Selecionar;
begin
  if tabBusca.recordcount = 0 then
    exit;

  if assigned(ExecuteOnClose) then
    ExecuteOnClose(tabBusca.FieldByName(campo_id).AsInteger, tabBusca.FieldByName(campo_descricao).asString, tabBusca.FieldByName(campo_extra).asFloat);

  close;
end;

procedure TfrmBusca.FormShow(Sender: TObject);
begin
  setupLayout;
  RefreshBusca;
end;

procedure TfrmBusca.gridDblClick(Sender: TObject);
begin
  Selecionar;
end;

end.
