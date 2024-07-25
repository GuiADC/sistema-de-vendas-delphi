unit unitClienteCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Navigation, Vcl.Loading,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.StorageBin, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmClienteCad = class(TForm)
    lblTitulo: TLabel;
    Panel2: TPanel;
    btnCancelar: TSpeedButton;
    Panel1: TPanel;
    btnSalvar: TSpeedButton;
    edtNome: TEdit;
    Label1: TLabel;
    edtEndereco: TEdit;
    Label2: TLabel;
    edtComplemento: TEdit;
    Label3: TLabel;
    edtBairro: TEdit;
    Label4: TLabel;
    edtCidade: TEdit;
    Label5: TLabel;
    edtUF: TEdit;
    Label6: TLabel;
    tabClienteCad: TFDMemTable;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    procedure TerminateLoad(Sender: TObject);
    procedure TerminateSalvar(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClienteCad: TfrmClienteCad;

implementation

{$R *.dfm}

uses dataModules.Cliente;

procedure TfrmClienteCad.btnCancelarClick(Sender: TObject);
begin
  TNavigation.CloseAndCancel(self);
end;

procedure TfrmClienteCad.TerminateSalvar(Sender: TObject);
begin
  TLoading.hide;

  if sender is TThread then
    if Assigned(TThread(sender).FatalException) then
    begin
      ShowMessage(Exception(TThread(sender).FatalException).Message);
      exit;
    end;

  tnavigation.close(self);
end;

procedure TfrmClienteCad.btnSalvarClick(Sender: TObject);
begin
  TLoading.Show;
  TLoading.ExecuteThread(procedure
  begin
    if TNavigation.ParamInt = 0 then
      dmCliente.inserir(edtNome.text, edtEndereco.Text, edtComplemento.Text, edtBairro.Text, edtCidade.Text, edtUF.Text)
    else
      dmCliente.editar(TNavigation.ParamInt, edtNome.text, edtEndereco.Text, edtComplemento.Text, edtBairro.Text, edtCidade.Text, edtUF.Text);
  end, TerminateSalvar);
end;

procedure TfrmClienteCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;

  TfrmClienteCad(sender) := nil;
end;

procedure TfrmClienteCad.TerminateLoad(Sender: TObject);
begin
  TLoading.hide;

  if sender is TThread then
    if Assigned(TThread(sender).FatalException) then
    begin
      ShowMessage(Exception(TThread(sender).FatalException).Message);
      exit;
    end;

  edtNome.Text := tabClienteCad.FieldByName('nome').asstring;
  edtEndereco.Text := tabClienteCad.FieldByName('Endereco').asstring;
  edtComplemento.Text := tabClienteCad.FieldByName('Complemento').asstring;
  edtBairro.Text := tabClienteCad.FieldByName('Bairro').asstring;
  edtCidade.Text := tabClienteCad.FieldByName('Cidade').asstring;
  edtUF.Text := tabClienteCad.FieldByName('UF').asstring;

end;

procedure TfrmClienteCad.FormShow(Sender: TObject);
begin
  if TNavigation.ParamInt > 0 then
  begin
    lblTitulo.Caption := 'Editar cliente';

    TLoading.show;

    TLoading.ExecuteThread(procedure
    begin
      dmCliente.listarClienteId(tabClienteCad, TNavigation.ParamInt);
    end, TerminateLoad);
  end;
end;

end.
