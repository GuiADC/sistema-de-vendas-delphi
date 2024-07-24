unit unitLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.jpeg,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.Loading, Vcl.Session,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.StorageBin, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmLogin = class(TForm)
    Image1: TImage;
    pLogin: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    edtEmail: TEdit;
    Panel3: TPanel;
    edtSenha: TEdit;
    btnAcessar: TSpeedButton;
    Label4: TLabel;
    Label2: TLabel;
    tabUsuario: TFDMemTable;
    procedure btnAcessarClick(Sender: TObject);
  private
    procedure TerminateLogin(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses unitPrincipal, dataModules.Usuario;

{$R *.dfm}

procedure  TfrmLogin.TerminateLogin(Sender: TObject);
begin
  tloading.hide;

  if sender is TThread then
    if Assigned(TThread(sender).FatalException) then
    begin
      ShowMessage(Exception(TThread(sender).FatalException).Message);
      exit;
    end;

  //dados de acesso..
  TSession.ID_USUARIO := tabUsuario.FieldByName('id_usuario').AsInteger;
  TSession.EMAIL := tabUsuario.FieldByName('email').asString;
  TSession.NOME := tabUsuario.FieldByName('nome').asString;

  if not assigned(frmPrincipal) then
    Application.CreateForm(TfrmPrincipal, frmPrincipal);

  frmPrincipal.Show;
end;

procedure TfrmLogin.btnAcessarClick(Sender: TObject);
begin
  TLoading.show(self);

  //criar requisicao para servidor...
  TLoading.ExecuteThread(procedure
  begin
    sleep(800);
    dmUsuario.Login(tabUsuario, edtEmail.text, edtSenha.text);
  end,
  TerminateLogin);

end;

end.
