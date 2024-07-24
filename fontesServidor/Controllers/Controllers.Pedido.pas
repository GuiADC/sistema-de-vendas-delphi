unit Controllers.Pedido;

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
  THorse.Get('/pedidos', listar);
  THorse.Get('/pedidos/:id_pedido', listarId);
  THorse.Post('/pedidos', Inserir);
  THorse.Put('/pedidos/:id_pedido', Editar);
  THorse.Delete('/pedidos/:id_pedido', Excluir);
end;

procedure listar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  ldm: tdm;
begin
  try
    try
      ldm := TDm.create(nil);

      Res.send<TJSONArray>(ldm.PedidoListar(Req.Query['filtro'])).status(200);

    except
      on E:Exception do
        Res.send('erro ao listar Pedidos,' + E.message).status(500);
    end;
  finally
    freeAndNil(ldm);
  end;
end;

procedure listarId(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  ldm: tdm;
  id_pedido: integer;
begin
  try
    try
      ldm := TDm.create(nil);

      try
        id_pedido := req.Params['id_pedido'].ToInteger;
      except
        id_pedido := 0;
      end;

      Res.send<TJSONObject>(ldm.PedidoListarId(id_pedido)).status(200);

    except
      on E:Exception do
        Res.send('erro ao listar pedido do id ' + id_pedido.tostring + ':' + E.message).status(500);
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

      Res.send<TJSONObject>(ldm.PedidoInserir(lbody.GetValue<integer>('id_usuario', 0),
                                               lbody.GetValue<integer>('id_cliente', 0),
                                               lbody.GetValue<string>('dt_pedido', ''),
                                               lbody.GetValue<double>('vl_total', 0)
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
  id_pedido: integer;
begin
  try
    try
      ldm := TDm.create(nil);

      try
        id_pedido := req.Params['id_pedido'].ToInteger;
      except
        id_pedido := 0;
      end;

      lbody := req.Body<TJSONObject>;

      Res.send<TJSONObject>(ldm.PedidoEditar(id_pedido,
                                             lbody.GetValue<integer>('id_cliente', 0),
                                             lbody.GetValue<string>('dt_pedido', ''),
                                             lbody.GetValue<double>('vl_total', 0)
                                             )).Status(201);

    except
      on E:Exception do
        Res.send('erro ao editar pedido:' + E.message).status(500);
    end;
  finally
    freeAndNil(ldm);
  end;
end;

procedure Excluir(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  ldm: tdm;
  id_pedido: integer;
begin
  try
    try
      ldm := TDm.create(nil);

      try
        id_pedido := req.Params['id_pedido'].ToInteger;
      except
        id_pedido := 0;
      end;

      Res.send<TJSONObject>(ldm.PedidoExcluir(id_pedido));

    except
      on E:Exception do
        Res.send('erro ao Excluir pedido:' + E.message).status(500);
    end;
  finally
    freeAndNil(ldm);
  end;
end;

end.
