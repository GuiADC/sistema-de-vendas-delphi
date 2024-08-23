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
    Panel5: TPanel;
    cmbTipoPesquisa: TComboBox;
    Panel6: TPanel;
    SpeedButton1: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmbTipoPesquisaDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDefault: TfrmDefault;

implementation

{$R *.dfm}

procedure TfrmDefault.cmbTipoPesquisaDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
  with (Control as TComboBox).Canvas do
  begin
    // Define o fundo como branco
    Brush.Color := clWhite;
    FillRect(Rect);

    // Define a cor do texto como preto
    Font.Color := clBlack;
    Font.size := 12;
    TextOut(Rect.Left + 5, Rect.Top + 5, (Control as TComboBox).Items[Index]);
  end;
end;

procedure TfrmDefault.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;

  TForm(sender) := nil;
end;

end.
