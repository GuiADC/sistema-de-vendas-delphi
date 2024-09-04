unit unitProdutoCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,  Vcl.Navigation, Vcl.Loading;

type
  TfrmProdutoCad = class(TForm)
    lblTitulo: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    btnCancelar: TSpeedButton;
    Panel1: TPanel;
    btnSalvar: TSpeedButton;
    edtDescricao: TEdit;
    edtValor: TEdit;
    tabProdutoCad: TFDMemTable;
    procedure edtValorKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorExit(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    procedure terminateSalvar(Sender: TObject);
    procedure terminateload(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProdutoCad: TfrmProdutoCad;

implementation

uses dataModules.Produto;

{$R *.dfm}

procedure TfrmProdutoCad.btnCancelarClick(Sender: TObject);
begin
  TNavigation.CloseAndCancel(self);
end;

procedure TfrmProdutoCad.terminateSalvar(Sender: TObject);
begin
  TLoading.Hide;

  if sender is TThread then
  begin
    if assigned(TThread(sender).FatalException) then
    begin
      ShowMessage(Exception(TThread(sender).FatalException).Message);
      exit;
    end;
  end;

  tnavigation.close(self);
end;

procedure TfrmProdutoCad.btnSalvarClick(Sender: TObject);
begin
  TLoading.Show;
  TLoading.ExecuteThread(procedure
  begin
    if TNavigation.ParamInt = 0 then
      dmProduto.inserir(edtDescricao.text, strtofloat(edtValor.Text))
    else
      dmProduto.editar(TNavigation.ParamInt, edtDescricao.text, strtofloat(edtValor.Text));

  end, TerminateSalvar);
end;

procedure TfrmProdutoCad.edtValorExit(Sender: TObject);
var
  Value: Currency;
begin
  if TryStrToCurr(edtValor.Text, Value) then
  begin
    edtValor.Text := FormatCurr('#,##0.00', Value);
  end
end;

procedure TfrmProdutoCad.edtValorKeyPress(Sender: TObject; var Key: Char);
begin
  // Permitir números, vírgula, ponto e backspace
  if not (Key in ['0'..'9', ',', '.', #8]) then
  begin
    Key := #0;
  end;
end;

procedure TfrmProdutoCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;

  TfrmProdutoCad(sender) := nil;
end;

procedure TfrmProdutoCad.terminateload(Sender: TObject);
begin
  TLoading.hide;

  if sender is TThread then
    if Assigned(TThread(sender).FatalException) then
    begin
      ShowMessage(Exception(TThread(sender).FatalException).Message);
      exit;
    end;

  edtDescricao.Text := tabProdutoCad.FieldByName('descricao').asstring;
  edtValor.Text := tabProdutoCad.FieldByName('preco').asstring;
end;

procedure TfrmProdutoCad.FormShow(Sender: TObject);
begin
  if TNavigation.ParamInt > 0 then
  begin
    lblTitulo.Caption := 'Editar produto';

    TLoading.show;

    TLoading.ExecuteThread(procedure
    begin
      dmProduto.listarProdutoId(tabProdutoCad, TNavigation.ParamInt);
    end, TerminateLoad);
  end;
end;

end.
