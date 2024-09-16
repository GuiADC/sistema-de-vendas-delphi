unit DataModuleNFe;

interface

uses
  System.SysUtils, System.Classes, ACBrDFeReport, ACBrDFeDANFeReport,
  ACBrNFeDANFEClass, ACBrDANFCeFortesFr, ACBrBase, ACBrDFe, ACBrNFe, pcnNFe;

type
  TDmNFe = class(TDataModule)
    ACBrNFe1: TACBrNFe;
    ACBrNFeDANFCeFortes1: TACBrNFeDANFCeFortes;
  private
    { Private declarations }
  public
    { Public declarations }
    class function New: TDmNFe;

    function ACBrNFe: TACBrNFe;
    function ACBrDANFce: TACBrNFeDANFCeFortes;
    function AddNotaFiscal: TNfe;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDmNFe }

function TDmNFe.ACBrDANFce: TACBrNFeDANFCeFortes;
begin
  result := ACBrNFeDANFCeFortes1;
end;

function TDmNFe.ACBrNFe: TACBrNFe;
begin
  result := ACBrNFe1;
end;

function TDmNFe.AddNotaFiscal: TNfe;
begin
  ACBrNFe1.NotasFiscais.Clear;
  result := ACBrNFe1.NotasFiscais.Add.NFe;
end;

class function TDmNFe.New: TDmNFe;
begin
  Result := self.create(nil);
end;

end.
