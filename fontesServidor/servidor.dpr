program servidor;

uses
  Vcl.Forms,
  unitPrincipal in 'unitPrincipal.pas' {frmPrincipal},
  Controllers.Cliente in 'Controllers\Controllers.Cliente.pas',
  DataModuleGlobal in 'DataModules\DataModuleGlobal.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
