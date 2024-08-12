unit Vcl.easyUtils;

interface

uses  Vcl.DBGrids, System.SysUtils, System.Classes, Data.DB;

procedure ResizeWidthColunGrid(pgrid: TDBGrid; pdataSource: TDataSource);

implementation

procedure ResizeWidthColunGrid(pgrid: TDBGrid; pdataSource: TDataSource);
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
    NewWidth := pGrid.ClientWidth div pGrid.Columns.Count;
    // Ajusta a largura de todas as colunas visíveis
    for lintCount := 0 to pGrid.Columns.Count - 1 do
    begin
      pGrid.Columns[lintCount].Width := NewWidth;
      if  (lintCount = pGrid.Columns.Count - 1) then
      begin
        if (pGrid.Columns[lintCount].Alignment =  taleftJustify) then
          pGrid.Columns[lintCount].Width := pGrid.Columns[lintCount].Width - 15
        else
        if (pGrid.Columns[lintCount].Alignment =  taRightJustify) then
          pGrid.Columns[lintCount].Width := pGrid.Columns[lintCount].Width - 25;
      end;
    end;
  pdataSource.Enabled := true;
end;

end.
