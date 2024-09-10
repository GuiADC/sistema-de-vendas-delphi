unit Vcl.Session;


interface

uses  System.Classes;

type
 Tcargo = (tadmin, tgerente, tanalista, tauxiliar);

type
  TSession = class
  private
    class var FID_USUARIO: integer;
    class var FEMAIL: string;
    class var FNOME: string;
    class var FCARGO: Tcargo;
    class var FDATANASC: string;
    class var FENDERECO: string;
    class function getCargo: string; static;
    class procedure setCargo(const Value: string); static;
  public
    class property ID_USUARIO: integer read FID_USUARIO write FID_USUARIO;
    class property EMAIL: string read FEMAIL write FEMAIL;
    class property NOME: string read FNOME write FNOME;
    class property CARGO: string read getCargo write setCargo;
    class property DATANASC: string read FDATANASC write FDATANASC;
    class property ENDERECO: string read FENDERECO write FENDERECO;
  end;

implementation

{ TSession }


{ TSession }

class function TSession.getCargo: string;
begin
  if (FCARGO = tadmin) then
    result := 'admin'
  else
  if (FCARGO = tgerente) then
    result := 'gerente'
  else
  if (FCARGO = tanalista) then
    result := 'analista'
  else
  if (FCARGO = tauxiliar) then
    result :=  'auxiliar'
  else
    result := 'none';

end;

class procedure TSession.setCargo(const Value: string);
begin
  if Value = 'admin' then
    FCARGO := tadmin
  else
  if Value = 'gerente' then
    FCARGO := tgerente
  else
  if value = 'analista' then
    FCARGO := tanalista
  else
  if value = 'auxiliar' then
    FCARGO := tauxiliar
  else
    exit;

end;

end.
