unit Controllers.Produto;

interface

uses Horse, DataModuleGlobal, system.JSON, System.SysUtils;

procedure listar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure RegistrarRotas;

implementation

procedure RegistrarRotas;
begin
  THorse.Get('/produtos', listar);
end;

procedure listar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  ldm: tdm;
begin
  try
    try
      ldm := TDm.create(nil);

      Res.send<TJSONArray>(ldm.ProdutoListar(Req.Query['filtro'])).status(200);

    except
      on E:Exception do
        Res.send('erro ao listar clientes,' + E.message).status(500);
    end;
  finally
    freeAndNil(ldm);
  end;
end;

end.
