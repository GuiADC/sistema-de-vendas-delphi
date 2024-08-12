unit Vcl.easyUtils;

interface

uses  Vcl.DBGrids, System.SysUtils;

procedure ResizeWidthColunGrid(pgrid: TDBGrid);

implementation

procedure ResizeWidthColunGrid(pgrid: TDBGrid);
begin
  for var iintCount := 0 to pgrid.Columns.count -1 do
  begin
    pgrid.Columns[iintCount].Width := (pgrid.Width div pgrid.Columns.Count - 1) - 5;
  end;


end;

end.
