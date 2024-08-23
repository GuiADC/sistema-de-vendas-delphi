unit Controllers.Geral;

interface

uses Horse, DataModuleGlobal, system.JSON, System.SysUtils;

procedure RegistrarRotas;
procedure pesquisa(Req: THorseRequest; Res: THorseResponse; Next: TProc);

implementation

procedure RegistrarRotas;
begin
  THorse.Get('/pesquisas/:tipo_pesquisa', pesquisa);
end;

procedure pesquisa(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  ldm: tdm;
  tipo_pesquisa, filtro: string;
begin
  try
    try
      ldm := TDm.create(nil);
      Res.send<TJSONArray>(ldm.pesquisaGlobal(req.Params['tipo_pesquisa'], req.query['filtro']));

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
  id_produto: integer;
begin
  try
    try
      ldm := TDm.create(nil);

      try
        id_produto := req.Params['id_produto'].ToInteger;
      except
        id_produto := 0;
      end;

      Res.send<TJSONObject>(ldm.ProdutoListarId(id_produto)).status(200);

    except
      on E:Exception do
        Res.send('erro ao listar produto do id ' + id_produto.tostring + ':' + E.message).status(500);
    end;
  finally
    freeAndNil(ldm);
  end;
end;

procedure inserir(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  ldm: tdm;
  lbody: TJSONObject;
begin
  try
    try
      ldm := TDm.create(nil);
      lbody := Req.Body<TJSONObject>;

      res.Send<TJSONObject>(ldm.ProdutoInserir(lbody.GetValue<string>('descricao', ''),
                                               lbody.GetValue<double>('valor', 0)
                                               )).Status(201);

    except
      on E:exception do
        Res.send('erro ao inserir produto:' + E.message).status(500);

    end;

  finally
    freeAndNil(ldm);
  end;
end;

procedure Editar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  ldm: tdm;
  lbody: TJSONObject;
  id_produto: integer;
begin
  try
    try
      ldm := TDm.create(nil);

      try
        id_produto := req.Params['id_produto'].ToInteger;
      except
        id_produto := 0;
      end;

      lbody := req.Body<TJSONObject>;

      Res.send<TJSONObject>(ldm.produtoEditar(id_produto,
                                               lbody.GetValue<string>('descricao', ''),
                                               lbody.GetValue<double>('valor', 0)
                                               ));

    except
      on E:Exception do
        Res.send('erro ao editar produto:' + E.message).status(500);
    end;
  finally
    freeAndNil(ldm);
  end;
end;

procedure excluir(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  ldm: tdm;
  lbody: TJSONObject;
  larrJson: tjsonArray;
begin
  try
    try
      ldm := TDm.create(nil);

      larrJson := (TJSONArray(TJSONObject.ParseJSONValue(req.Body)));

      Res.send<TJSONObject>(ldm.produtoExcluir(larrJson));

    except
      on E:Exception do
        Res.send('erro ao excluir produto:' + E.message).status(500);
    end;
  finally
    freeAndNil(ldm);
  end;
end;

end.
