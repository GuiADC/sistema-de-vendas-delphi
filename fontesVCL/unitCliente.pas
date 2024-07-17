unit unitCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unitDefaultListItems, Vcl.Buttons,
  Vcl.StdCtrls, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Navigation;

type
  TfrmCliente = class(TfrmDefault)
    FDMemTable1: TFDMemTable;
    FDMemTable1Nome: TStringField;
    FDMemTable1Empresa: TStringField;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    procedure btnInserirClick(Sender: TObject);
  private
    procedure OpenCadCliente(idCliente: integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCliente: TfrmCliente;

implementation

{$R *.dfm}

uses unitDefaultCadastro;

procedure TfrmCliente.OpenCadCliente(idCliente: integer);
begin
  TNavigation.OpenModal(TfrmDefaultCadastro, frmDefaultCadastro);
end;

procedure TfrmCliente.btnInserirClick(Sender: TObject);
begin
  inherited;
  OpenCadCliente(0)
//Op
end;

end.
