unit unitLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.jpeg,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.Loading, Vcl.Session;

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

uses unitPrincipal;

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
  TSession.ID_USUARIO := 1;
  TSession.EMAIL := 'guilherme@outlook.com';
  TSession.NOME := 'Guilherme Araujo';

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
    sleep(1000);
  end,
  TerminateLogin);

end;

end.
