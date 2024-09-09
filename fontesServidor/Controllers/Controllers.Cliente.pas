unit Controllers.Cliente;

interface

uses Horse, DataModuleGlobal, system.JSON, System.SysUtils;

procedure listar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure listarId(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure Inserir(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure Editar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure Excluir(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure RegistrarRotas;

implementation

procedure RegistrarRotas;
begin
  THorse.Get('/clientes', listar);
  THorse.Get('/clientes/:id_cliente', listarId);
  THorse.Post('/clientes', Inserir);
  THorse.Put('/clientes/:id_cliente', Editar);
  THorse.Delete('/clientes', Excluir);
end;

procedure listar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  ldm: tdm;
begin
  try
    try
      ldm := TDm.create(nil);

      Res.send<TJSONObject>(ldm.ClienteListar(Req.Query['filtro'], Req.Query['tipoPesquisa'], Req.Query['pagina']))).status(200);

    except
      on E:Exception do
        Res.send('erro ao listar clientes,' + E.message).status(500);
    end;
  finally
    freeAndNil(ldm);
  end;
end;

procedure listarId(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  ldm: tdm;
  id_cliente: integer;
begin
  try
    try
      ldm := TDm.create(nil);

      try
        id_cliente := req.Params['id_cliente'].ToInteger;
      except
        id_cliente := 0;
      end;

      Res.send<TJSONObject>(ldm.ClienteListarId(id_cliente)).status(200);

    except
      on E:Exception do
        Res.send('erro ao listar cliente do id ' + id_cliente.tostring + ':' + E.message).status(500);
    end;
  finally
    freeAndNil(ldm);
  end;
end;

procedure Inserir(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  ldm: tdm;
  lbody: TJSONObject;
begin
  try
    try
      ldm := TDm.create(nil);

      lbody := req.Body<TJSONObject>;

      Res.send<TJSONObject>(ldm.ClienteInserir(lbody.GetValue<string>('nome', ''),
                                               lbody.GetValue<string>('endereco', ''),
                                               lbody.GetValue<string>('complemento', ''),
                                               lbody.GetValue<string>('bairro', ''),
                                               lbody.GetValue<string>('cidade', ''),
                                               lbody.GetValue<string>('uf', '')
                                               )).Status(201);

    except
      on E:Exception do
        Res.send('erro ao inserir cliente:' + E.message).status(500);
    end;
  finally
    freeAndNil(ldm);
  end;
end;

procedure Editar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  ldm: tdm;
  lbody: TJSONObject;
  id_cliente: integer;
begin
  try
    try
      ldm := TDm.create(nil);

      try
        id_cliente := req.Params['id_cliente'].ToInteger;
      except
        id_cliente := 0;
      end;

      lbody := req.Body<TJSONObject>;

      Res.send<TJSONObject>(ldm.ClienteEditar(id_cliente,
                                               lbody.GetValue<string>('nome', ''),
                                               lbody.GetValue<string>('endereco', ''),
                                               lbody.GetValue<string>('complemento', ''),
                                               lbody.GetValue<string>('bairro', ''),
                                               lbody.GetValue<string>('cidade', ''),
                                               lbody.GetValue<string>('uf', '')
                                               ));

    except
      on E:Exception do
        Res.send('erro ao editar cliente:' + E.message).status(500);
    end;
  finally
    freeAndNil(ldm);
  end;
end;

procedure Excluir(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  ldm: tdm;
  id_cliente: integer;
  larrJson: TJSONArray;
begin
  try
    try
      ldm := TDm.create(nil);

      if (req.body = '') then
        exit;

      larrJson := TJSONArray(TJSONObject.ParseJSONValue(req.Body));

      Res.send<TJSONArray>(ldm.ClienteExcluir(larrJson, req.Query['situacao']));

    except
      on E:Exception do
        Res.send('erro ao Excluir cliente:' + E.message).status(500);
    end;
  finally
    freeAndNil(ldm);
  end;
end;

end.
