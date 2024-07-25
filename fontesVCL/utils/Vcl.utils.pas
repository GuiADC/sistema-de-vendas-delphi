unit Vcl.utils;

interface

uses
  System.SysUtils;

 function RemovePontosVirgulasEmStrings(const AStr: string): string;

implementation

 function RemovePontosVirgulasEmStrings(const AStr: string): string;
var
  i: Integer;
begin
  Result := '';
  for i := 1 to Length(AStr) do
  begin
    if not (AStr[i] in ['.', ',']) then
      Result := Result + AStr[i];
  end;
end;

end.
