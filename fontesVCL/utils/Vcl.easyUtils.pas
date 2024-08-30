unit Vcl.easyUtils;

interface

uses  Vcl.DBGrids, System.SysUtils, System.Classes, Data.DB, Winapi.Windows;

procedure ResizeWidthColunGrid(pgrid: TDBGrid; pdataSource: TDataSource; pintWidthForm, pintWidthSmenu: integer);
procedure removeScroll(pdbgrid: TDBGrid);

implementation

procedure ResizeWidthColunGrid(pgrid: TDBGrid; pdataSource: TDataSource; pintWidthForm, pintWidthSmenu: integer);
var
  lintCount, NewWidth: Integer;
begin
  pdataSource.Enabled := false;
  NewWidth := 0;

  NewWidth := pGrid.width div pGrid.Columns.Count;

  for lintCount := 0 to pGrid.Columns.Count - 1 do
  begin
    pGrid.Columns[lintCount].Width := NewWidth;

     if (lintCount = pGrid.Columns.Count - 1) and ((pGrid.Columns[lintCount].FieldName = 'vl_total') or (pGrid.Columns[lintCount].FieldName = 'preco')) then
     begin
      if (pGrid.Columns[lintCount].FieldName = 'vl_total') then
        pGrid.Columns[lintCount].Width := trunc(pGrid.Columns[lintCount].Width * 0.87);

      if (pGrid.Columns[lintCount].FieldName = 'preco') then
        pGrid.Columns[lintCount].Width := trunc(pGrid.Columns[lintCount].Width * 0.94);
     end;

  end;

  pdataSource.Enabled := true;
end;

procedure removeScroll(pdbgrid: TDBGrid);
begin
  ShowScrollBar(pdbgrid.Handle, SB_HORZ, FALSE);
end;

end.
