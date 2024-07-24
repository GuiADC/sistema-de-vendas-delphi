unit uMD5;

interface

uses IdHashMessageDigest, Classes, SysUtils;

const
    SALT = 'k3zkaa9S8W6*(/OG5#1O1Dfp5z9/3U5dlsg34t34JIg9HFh9ghZ95FQyn7ab9r5j6k3';

function MD5(const Value: string): string;
function SaltPassword(pass: string): string;

implementation

function MD5(const Value: string): string;
var
    xMD5: TIdHashMessageDigest5;
begin
    xMD5 := TIdHashMessageDigest5.Create;
    Result := Value;

    try
        Result := xMD5.HashStringAsHex(Result);
    finally
        xMD5.Free;
    end;
end;

function SaltPassword(pass: string): string;
var
    xMD5: TIdHashMessageDigest5;
    randomStr: string;
    x : integer;
begin
    xMD5 := TIdHashMessageDigest5.Create;
    Result := '';

    try
        for x := 1 to Length(pass) do
            Result := Result + Copy(SALT, x, 1) + Copy(pass, x, 1);

        Result := LowerCase(xMD5.HashStringAsHex(Result));  // 1x
        Result := LowerCase(xMD5.HashStringAsHex(Result));  // 2x
    finally
        xMD5.Free;
    end;
end;

end.
