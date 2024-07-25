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
  unitClienteCad in 'unitClienteCad.pas' {frmClienteCad},
  dataModules.Cliente in 'DataModules\dataModules.Cliente.pas' {dmCliente: TDataModule},
  dataModules.Usuario in 'DataModules\dataModules.Usuario.pas' {dmUsuario: TDataModule},
  unitProduto in 'unitProduto.pas' {frmProduto},
  dataModules.Produto in 'DataModules\dataModules.Produto.pas' {dmProduto: TDataModule},
  unitProdutoCad in 'unitProdutoCad.pas' {frmProdutoCad},
  Vcl.utils in 'utils\Vcl.utils.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := true;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TdmCliente, dmCliente);
  Application.CreateForm(TdmUsuario, dmUsuario);
  Application.CreateForm(TdmProduto, dmProduto);
  Application.Run;
end.
