unit unitDefaultListItems;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  frxSmartMemo, frxClass, frCoreClasses, frxDBSet, frxExportBaseDialog,
  frxExportPDF;

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
    btnImprimir: TSpeedButton;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    pnlPaginate: TPanel;
    btnNext: TSpeedButton;
    btnPrevious: TSpeedButton;
    lblPagina: TLabel;
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
  // Verifica se o item está selecionado na lista aberta
    if (odComboBoxEdit in State) then
    begin
      // Item selecionado na caixa de edição (item final)
      Brush.Color := clWhite;
      Font.Color := clBlack;
    end
    else if (odSelected in State) then
    begin
      // Item sobre o qual o mouse está passando na lista aberta
      Brush.Color := clHighlight;
      Font.Color := clWhite;
    end
    else
    begin
      // Itens não selecionados
      Brush.Color := clWhite;
      Font.Color := clBlack;
    end;
  end;
end;


procedure TfrmDefault.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;

  TForm(sender) := nil;
end;



end.
