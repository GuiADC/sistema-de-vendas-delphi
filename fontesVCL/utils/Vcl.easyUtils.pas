unit Vcl.easyUtils;

interface

uses  Vcl.DBGrids, System.SysUtils, System.Classes, Data.DB;

procedure ResizeWidthColunGrid(pgrid: TDBGrid; pdataSource: TDataSource; pintWidthForm, pintWidthSmenu: integer);

implementation

procedure ResizeWidthColunGrid(pgrid: TDBGrid; pdataSource: TDataSource; pintWidthForm, pintWidthSmenu: integer);
var
  lintCount: Integer;
  TotalWidth, NewWidth: Integer;
begin
  TotalWidth := 0;
  pdataSource.Enabled := false;
  // Soma a largura de todas as colunas visíveis
  for lintCount := 0 to pGrid.Columns.Count - 1 do
    TotalWidth := TotalWidth + pGrid.Columns[lintCount].Width;
  // Se a largura total das colunas for menor que a largura do grid
  // Calcula a nova largura das colunas para preencher o espaço disponível
  NewWidth := (pGrid.ClientWidth -1) div pGrid.Columns.Count;
  // Ajusta a largura de todas as colunas visíveis
  for lintCount := 0 to pGrid.Columns.Count - 1 do
  begin
    pGrid.Columns[lintCount].Width := NewWidth;
    if (lintCount = pGrid.Columns.Count - 1) then
      pGrid.Columns[lintCount].Width := pintWidthSmenu -1;
  end;
  pdataSource.Enabled := true;
end;

end.
