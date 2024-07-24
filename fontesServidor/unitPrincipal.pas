unit unitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, horse, horse.jhonson, horse.CORS, Controllers.Cliente,
  Controllers.Produto;

type
  TfrmPrincipal = class(TForm)
    lblServer: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  THorse.use(Jhonson());
  THorse.use(CORS);
  THorse.listen(3000);

  Controllers.Cliente.RegistrarRotas;
  Controllers.Produto.RegistrarRotas;

  lblServer.Caption := 'Servidor rodando na porta: ' + THorse.port.tostring;
end;

end.
