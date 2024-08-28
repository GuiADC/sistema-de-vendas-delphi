unit unitPedidoCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Navigation, Vcl.Loading, dataModules.Pedido,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls, VCL.Session, DataSet.Serialize,
  Vcl.Imaging.pngimage;

type
  TfrmPedidoCad = class(TForm)
    lblTitulo: TLabel;
    Label1: TLabel;
    Panel2: TPanel;
    btnCancelar: TSpeedButton;
    Panel1: TPanel;
    btnSalvar: TSpeedButton;
    edtCliente: TEdit;
    edtIdCliente: TEdit;
    Label2: TLabel;
    dtPedido: TDateTimePicker;
    Label3: TLabel;
    tabPedido: TFDMemTable;
    tabPedidoid_pedido: TIntegerField;
    tabPedidoid_usuario: TIntegerField;
    tabPedidoid_cliente: TIntegerField;
    tabPedidodt_pedido: TDateField;
    tabPedidovl_total: TCurrencyField;
    tabPedidonome: TStringField;
    tabPedidocidade: TStringField;
    tabPedidousuario: TStringField;
    gridItens: TDBGrid;
    tabItens: TFDMemTable;
    dsItens: TDataSource;
    tabItensid_item: TIntegerField;
    tabItensid_produto: TIntegerField;
    tabItensdescricao: TStringField;
    tabItensqtd: TIntegerField;
    tabItensvl_unitario: TCurrencyField;
    tabItensvl_total: TCurrencyField;
    lblTotal: TLabel;
    Label4: TLabel;
    pItem: TPanel;
    Panel4: TPanel;
    btnCancelarItem: TSpeedButton;
    Panel5: TPanel;
    btnSalvarItem: TSpeedButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    edtQtd: TDBEdit;
    edtUnitario: TDBEdit;
    edtTotal: TDBEdit;
    Panel6: TPanel;
    btnNovo: TSpeedButton;
    Panel3: TPanel;
    btnEditar: TSpeedButton;
    Panel7: TPanel;
    btnExcluir: TSpeedButton;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    imgBusca: TImage;
    imgBuscaProd: TImage;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnCancelarItemClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarItemClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure imgBuscaClick(Sender: TObject);
    procedure imgBuscaProdClick(Sender: TObject);
    procedure edtQtdExit(Sender: TObject);
    procedure edtUnitarioExit(Sender: TObject);
  private
    ptotal: double;
    fbooPermissionCalcular: boolean;
    { Private declarations }

    procedure TerminateLoad(Sender: TObject);
    procedure calcularTotal;
    procedure terminateSalvar(Sender: TObject);
    procedure SelecionarProduto(id_produto: integer; descricao: string; preco: double);
    procedure SelecionarCliente(id_cliente: integer; nome: string;
      extra: double);
    procedure calcularTotalItem;
  public
    { Public declarations }
  end;

var
  frmPedidoCad: TfrmPedidoCad;

implementation

{$R *.dfm}

uses unitBusca;

procedure TfrmPedidoCad.TerminateLoad(Sender: TObject);
begin
  TLoading.hide;
  calcularTotal;
  gridItens.DataSource := dsItens;
  tabItens.Active := true;

  if sender is TThread then
    if Assigned(TThread(sender).FatalException) then
    begin
      ShowMessage(Exception(TThread(sender).FatalException).Message);
      exit;
    end;

  edtIdCliente.Text := tabPedido.FieldByName('id_cliente').asstring;
  edtCliente.Text := tabPedido.FieldByName('nome').asstring;
  dtPedido.Date := tabPedido.FieldByName('dt_pedido').asDateTime;

end;

procedure TfrmPedidoCad.btnCancelarClick(Sender: TObject);
begin
  TNavigation.CloseAndCancel(self);
end;

procedure TfrmPedidoCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
  frmPedidoCad := nil;
end;

procedure TfrmPedidoCad.btnCancelarItemClick(Sender: TObject);
begin
  edtTotal.SetFocus;
  tabItens.Cancel;
  pItem.Visible := false;
end;

procedure TfrmPedidoCad.btnEditarClick(Sender: TObject);
begin
  if tabItens.RecordCount = 0  then
    exit;

  tabItens.Edit;
  pItem.Visible := true;
  fbooPermissionCalcular := true;
end;

procedure TfrmPedidoCad.btnExcluirClick(Sender: TObject);
begin
  if tabItens.RecordCount = 0  then
    exit;

  tabItens.delete;
  calcularTotal;
end;

procedure TfrmPedidoCad.btnNovoClick(Sender: TObject);
begin
  tabItens.Active := true;

  tabItens.Append;
  tabItens.FieldByName('qtd').AsInteger := 1;
  tabItens.FieldByName('vl_unitario').asFloat := 0;
  tabItens.FieldByName('vl_total').asFloat := 0;
  pItem.Visible := true;
  edtQtd.SetFocus;
end;

procedure TfrmPedidoCad.terminateSalvar(Sender: TObject);
begin
  TLoading.hide;

  if sender is TThread then
    if Assigned(TThread(sender).FatalException) then
    begin
      ShowMessage(Exception(TThread(sender).FatalException).Message);
      exit;
    end;

  TNavigation.Close(self);
end;

procedure TfrmPedidoCad.btnSalvarClick(Sender: TObject);
begin
  TLoading.Show;

  TLoading.ExecuteThread(procedure
  begin
    if TNavigation.ParamInt = 0 then
      dmPedido.inserir(tsession.ID_USUARIO, strtoint(edtIdCliente.text), dtPedido.date, ptotal, tabItens.ToJSONArray)
    else
      dmPedido.editar(TNavigation.ParamInt, strtoint(edtIdCliente.text), dtPedido.date, ptotal, tabItens.ToJSONArray);

  end, terminateSalvar);
end;

procedure TfrmPedidoCad.btnSalvarItemClick(Sender: TObject);
begin
  edtTotal.SetFocus;

  if tabItens.State in [dsEdit, dsInsert] then
  begin
    tabItens.post;
    calcularTotal;
  end;

  pItem.Visible := false;
end;

procedure TfrmPedidoCad.calcularTotal;
begin

  ptotal := 0;

  if tabItens.RecordCount = 0 then
    exit;

  tabItens.First;
  while not tabItens.eof do
  begin
    ptotal := ptotal + tabItens.FieldByName('vl_total').AsFloat;
    tabItens.Next;
  end;

  lblTotal.Caption :=  'Total: ' + FormatFloat(' R$ #,##0.00', ptotal);
end;

procedure TfrmPedidoCad.FormShow(Sender: TObject);
begin
  if TNavigation.ParamInt > 0 then
  begin
    lblTitulo.Caption := 'Editar pedido';
    gridItens.DataSource := nil;
    TLoading.show;

    TLoading.ExecuteThread(procedure
    begin
      dmPedido.listarPedidoId(tabPedido, tabItens, TNavigation.ParamInt);
    end, TerminateLoad);
  end
  else
    tabItens.Active := true;
end;

procedure TfrmPedidoCad.SelecionarProduto(id_produto: integer; descricao: string; preco: double);
begin
  tabItens.FieldByName('id_produto').asInteger := id_produto;
  tabItens.FieldByName('descricao').asString := descricao;
  tabItens.FieldByName('vl_unitario').asFloat := preco;

  calcularTotalItem;
  edtUnitario.SetFocus;
end;

procedure TfrmPedidoCad.SelecionarCliente(id_cliente: integer; nome: string; extra: double);
begin
  edtIdCliente.text := id_cliente.ToString;
  edtCliente.text := nome;
//  tabPedido.FieldByName('vl_unitario').asFloat := preco;

end;

procedure TfrmPedidoCad.calcularTotalItem;
begin
 //
 try
  tabItens.FieldByName('vl_total').AsFloat := tabItens.FieldByName('qtd').asInteger * tabItens.FieldByName('vl_unitario').asFloat;

 except
  tabItens.FieldByName('vl_total').AsFloat := 0;
 end;
end;

procedure TfrmPedidoCad.edtQtdExit(Sender: TObject);
begin
  if (edtQtd.Text = '') then
    tabItens.FieldByName('qtd').asInteger := 0;

  calcularTotalItem;
end;

procedure TfrmPedidoCad.edtUnitarioExit(Sender: TObject);
begin
  if (edtUnitario.Text = '') then
    tabItens.FieldByName('vl_unitario').asFloat := 0;

  calcularTotalItem;
end;

procedure TfrmPedidoCad.imgBuscaClick(Sender: TObject);
begin
  if not Assigned(frmBusca) then
    Application.CreateForm(TfrmBusca, frmBusca);

  frmBusca.tipo_pesquisa := 'cliente';
  frmbusca.executeOnClose :=  SelecionarCliente;
  frmbusca.show;
end;

procedure TfrmPedidoCad.imgBuscaProdClick(Sender: TObject);
begin
  if not Assigned(frmBusca) then
    Application.CreateForm(TfrmBusca, frmBusca);

  frmBusca.tipo_pesquisa := 'produto';
   frmbusca.executeOnClose :=  SelecionarProduto;
  frmbusca.show;
end;

end.
