program servidor;

uses
  Vcl.Forms,
  unitPrincipal in 'unitPrincipal.pas' {frmPrincipal},
  Controllers.Cliente in 'Controllers\Controllers.Cliente.pas',
  DataModuleGlobal in 'DataModules\DataModuleGlobal.pas' {DM: TDataModule},
  Controllers.Produto in 'Controllers\Controllers.Produto.pas',
  Controllers.Usuario in 'Controllers\Controllers.Usuario.pas',
  uMD5 in 'Utils\uMD5.pas',
  Controllers.Pedido in 'Controllers\Controllers.Pedido.pas',
  Controllers.Geral in 'Controllers\Controllers.Geral.pas';

{$R *.res}

begin
  Application.Initialize;
  ReportMemoryLeaksOnShutdown := true;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
