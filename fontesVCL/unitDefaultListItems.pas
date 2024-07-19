unit unitDefaultListItems;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmDefault = class(TForm)
    pHeader: TPanel;
    Label1: TLabel;
    Panel1: TPanel;
    btnExcluir: TSpeedButton;
    Panel2: TPanel;
    btnInserir: TSpeedButton;
    Panel3: TPanel;
    btnEditar: TSpeedButton;
    Panel4: TPanel;
    Panel7: TPanel;
    btnBuscar: TSpeedButton;
    edtBuscar: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDefault: TfrmDefault;

implementation

{$R *.dfm}

procedure TfrmDefault.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;

  TfrmDefault(sender) := nil;
end;

end.
