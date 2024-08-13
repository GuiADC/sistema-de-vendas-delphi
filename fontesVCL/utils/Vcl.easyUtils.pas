unit Vcl.easyUtils;

interface

uses  Vcl.DBGrids, System.SysUtils, System.Classes, Data.DB, Winapi.Windows;

procedure ResizeWidthColunGrid(pgrid: TDBGrid; pdataSource: TDataSource; pintWidthForm, pintWidthSmenu: integer);
procedure removeScroll(pdbgrid: TDBGrid);

implementation

procedure ResizeWidthColunGrid(pgrid: TDBGrid; pdataSource: TDataSource; pintWidthForm, pintWidthSmenu: integer);
var
  lintCount: Integer;
  TotalWidth, NewWidth: Integer;
begin
  TotalWidth := 0;
  pdataSource.Enabled := false;
  // Soma a largura de todas as colunas visíveis

  NewWidth := (pGrid.ClientWidth div pGrid.Columns.Count);

  for lintCount := 0 to pGrid.Columns.Count - 1 do
  begin
    pGrid.Columns[lintCount].Width := NewWidth;
    TotalWidth := TotalWidth + pGrid.Columns[lintCount].Width;

    if (lintCount = pGrid.Columns.Count - 1) then
    begin

      if (lintCount = pGrid.Columns.Count - 1) and (pgrid.ClientWidth < pintWidthForm -1) then
      begin
       while TotalWidth  < pintWidthForm -1 do
       begin
        TotalWidth := TotalWidth + 1;
        pGrid.Columns[lintCount].Width := pGrid.Columns[lintCount].Width + 1;
       end;
      end;

      if (pGrid.Columns[lintCount].fieldname = 'vl_total') then
        if pintWidthSmenu <= 0 then
          pGrid.Columns[lintCount].Width := trunc(pGrid.Columns[lintCount].Width * 0.89)
        else
          pGrid.Columns[lintCount].Width := trunc(pGrid.Columns[lintCount].Width * 0.87)
    end;
  end;

  pdataSource.Enabled := true;
end;

procedure removeScroll(pdbgrid: TDBGrid);
begin
  ShowScrollBar(pdbgrid.Handle, SB_HORZ, FALSE);
end;

end.
