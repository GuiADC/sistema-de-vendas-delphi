unit unitDefaultCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Navigation;

type
  TfrmDefaultCadastro = class(TForm)
    lblTitulo: TLabel;
    Panel2: TPanel;
    btnCancelar: TSpeedButton;
    Panel1: TPanel;
    btnSalvar: TSpeedButton;
    Edit1: TEdit;
    Label1: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDefaultCadastro: TfrmDefaultCadastro;

implementation

{$R *.dfm}

procedure TfrmDefaultCadastro.btnCancelarClick(Sender: TObject);
begin
  TNavigation.Close(self);
end;

procedure TfrmDefaultCadastro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;

  TfrmDefaultCadastro(sender) := nil;
end;

end.
