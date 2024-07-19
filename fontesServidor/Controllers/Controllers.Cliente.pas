unit Controllers.Cliente;

interface

uses Horse, DataModuleGlobal, system.JSON, System.SysUtils;

procedure listar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure Inserir(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure Editar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure Excluir(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure RegistrarRotas;

implementation

procedure RegistrarRotas;
begin
  THorse.Get('/clientes', listar);
  THorse.Post('/clientes', Inserir);
  THorse.Put('/clientes', Editar);
  THorse.Delete('/clientes', Excluir);
end;

procedure listar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  ldm: tdm;
begin
  try
    try
      ldm := TDm.create(nil);

      Res.send<TJSONArray>(ldm.ClienteListar(Req.Query['filtro'])).status(200);

    except
      on E:Exception do
        Res.send('erro ao listar clientes,' + E.message).status(500);
    end;
  finally
    freeAndNil(ldm);
  end;
end;

procedure Inserir(Req: THorseRequest; Res: THorseResponse; Next: TProc);
begin
  Res.send('Aqui vou Inserir os clientes').status(201);
end;

procedure Editar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
begin
  Res.send('Aqui vou Editar os clientes').status(200);
end;

procedure Excluir(Req: THorseRequest; Res: THorseResponse; Next: TProc);
begin
  Res.send('Aqui vou Excluir os clientes').status(200);
end;

end.
