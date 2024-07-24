unit Controllers.Usuario;

interface

uses Horse, DataModuleGlobal, system.JSON, System.SysUtils;

procedure Login(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure RegistrarRotas;

implementation

procedure RegistrarRotas;
begin
  THorse.Post('/usuarios/login', Login);
end;

procedure Login(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  ldm: tdm;
  lbody, ljson: TJSONObject;
begin
  try
    try
      ldm := TDm.create(nil);

      lbody := req.Body<TJSONObject>;

      ljson := ldm.UsuarioLogin(lbody.GetValue<string>('email', ''), lbody.GetValue<string>('senha', ''));

      if ljson.Size = 0 then
      begin
        Res.send('E-mail ou senha inválida').Status(401);
        freeandnil(ljson);
      end
      else
        Res.send<TJSONObject>(ljson);

    except
      on E:Exception do
        Res.send('erro ao inserir cliente:' + E.message).status(500);
    end;
  finally
    freeAndNil(ldm);
  end;
end;

end.

