program EasyPedido;

uses
  Vcl.Forms,
  unitLogin in 'unitLogin.pas' {frmLogin},
  unitPrincipal in 'unitPrincipal.pas' {frmPrincipal},
  Vcl.Loading in 'utils\Vcl.Loading.pas',
  Vcl.Session in 'utils\Vcl.Session.pas',
  Vcl.Navigation in 'utils\Vcl.Navigation.pas',
  unitDefaultListItems in 'unitDefaultListItems.pas' {frmDefault},
  unitPedido in 'unitPedido.pas' {frmPedido},
  unitCliente in 'unitCliente.pas' {frmCliente},
  unitDefaultCadastro in 'unitDefaultCadastro.pas' {frmDefaultCadastro},
  dataModules.Cliente in 'DataModules\dataModules.Cliente.pas' {dmCliente: TDataModule};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := true;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TdmCliente, dmCliente);
  Application.Run;
end.
