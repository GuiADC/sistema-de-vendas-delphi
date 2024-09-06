unit Vcl.Session;

interface

type
  TSession = class
  private
    class var FID_USUARIO: integer;
    class var FEMAIL: string;
    class var FNOME: string;
    class var FCARGO: string;
    class var FDATANASC: string;
    class var FENDERECO: string;
  public
    class property ID_USUARIO: integer read FID_USUARIO write FID_USUARIO;
    class property EMAIL: string read FEMAIL write FEMAIL;
    class property NOME: string read FNOME write FNOME;
    class property CARGO: string read FCARGO write FCARGO;
    class property DATANASC: string read FDATANASC write FDATANASC;
    class property ENDERECO: string read FENDERECO write FENDERECO;
  end;

implementation

{ TSession }


end.
