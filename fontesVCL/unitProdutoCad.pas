unit unitProdutoCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmProdutoCad = class(TForm)
    lblTitulo: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    btnCancelar: TSpeedButton;
    Panel1: TPanel;
    btnSalvar: TSpeedButton;
    edtNome: TEdit;
    edtEndereco: TEdit;
    tabClienteCad: TFDMemTable;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProdutoCad: TfrmProdutoCad;

implementation

{$R *.dfm}

end.
