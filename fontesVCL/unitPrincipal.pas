unit unitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.WinXCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage, System.ImageList, Vcl.ImgList, Vcl.CategoryButtons,
  Vcl.StdCtrls, Vcl.Session, Vcl.Navigation, unitPedido, Vcl.easyUtils;

type

  TfrmPrincipal = class(TForm)
    sMenu: TSplitView;
    pLogo: TPanel;
    btnMenu: TSpeedButton;
    Image1: TImage;
    ImageList: TImageList;
    CategoryMenuButtons: TCategoryButtons;
    sSubMenu: TSplitView;
    CategorySubMenuButtons: TCategoryButtons;
    Panel1: TPanel;
    Label1: TLabel;
    btnCloseSub: TSpeedButton;
    pTela: TPanel;
    pNavbar: TPanel;
    pUsuario: TPanel;
    lblNome: TLabel;
    lblEmail: TLabel;
    Image2: TImage;
    Image3: TImage;
    pContainer: TPanel;


    procedure btnMenuClick(Sender: TObject);
    procedure btnCloseSubClick(Sender: TObject);
    procedure CategoryMenuButtonsCategories0Items2Click(Sender: TObject);
    procedure CategoryMenuButtonsCategories0Items5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CategoryMenuButtonsCategories0Items1Click(Sender: TObject);
    procedure CategorySubMenuButtonsCategories0Items0Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CategorySubMenuButtonsCategories0Items1Click(Sender: TObject);
    procedure sSubMenuClosed(Sender: TObject);
    procedure sSubMenuOpened(Sender: TObject);
  private
    procedure closeSubMenu;
    { Private declarations }
  public
    { Public declarations }
    procResizeColunsGrid: procedure(pintWidthSmenu: integer) of object;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses unitCliente, unitProduto;

procedure TfrmPrincipal.btnCloseSubClick(Sender: TObject);
begin
  closeSubMenu;
end;

procedure TfrmPrincipal.btnMenuClick(Sender: TObject);
begin
  sMenu.Opened := NOT(sMenu.Opened);
end;

procedure TfrmPrincipal.closeSubMenu;
begin
  if sSubMenu.Opened then
  begin
    sSubMenu.Opened := false;
    CategorySubMenuButtons.SelectedItem := nil;
    sMenu.SetFocus;
  end;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  lblNome.Caption := TSession.NOME;
  lblEmail.Caption := TSession.EMAIL;
end;

procedure TfrmPrincipal.sSubMenuClosed(Sender: TObject);
begin
  if TNavigation.FrmOpen <> nil then
  begin
   if (TNavigation.FrmOpen.name = 'frmCliente') or
      (TNavigation.FrmOpen.name = 'frmPedido') or
      (TNavigation.FrmOpen.name = 'frmProduto') then
    if sSubMenu.Opened then
      procResizeColunsGrid(sSubMenu.width)
    else
      procResizeColunsGrid(0);
  end;
end;

procedure TfrmPrincipal.sSubMenuOpened(Sender: TObject);
begin
  if TNavigation.FrmOpen <> nil then
  begin
   if (TNavigation.FrmOpen.name = 'frmCliente') or
      (TNavigation.FrmOpen.name = 'frmPedido') or
      (TNavigation.FrmOpen.name = 'frmProduto') then
    if sSubMenu.Opened then
      procResizeColunsGrid(sSubMenu.width)
    else
      procResizeColunsGrid(0);
  end;
end;

procedure TfrmPrincipal.CategoryMenuButtonsCategories0Items1Click(
  Sender: TObject);
begin
  closeSubMenu;
  TNavigation.Open(TfrmPedido, frmPedido, pContainer);

   if TNavigation.FrmOpen.name = 'frmPedido' then
   begin
    if sSubMenu.Opened then
      procResizeColunsGrid(sSubMenu.width)
    else
      procResizeColunsGrid(0);
    end;
end;

procedure TfrmPrincipal.CategoryMenuButtonsCategories0Items2Click(
  Sender: TObject);
begin
  sSubMenu.Opened := true;
end;

procedure TfrmPrincipal.CategoryMenuButtonsCategories0Items5Click(
  Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmPrincipal.CategorySubMenuButtonsCategories0Items0Click(
  Sender: TObject);
begin
   closeSubMenu;
   TNavigation.Open(TfrmCliente, frmCliente, pContainer);
end;

procedure TfrmPrincipal.CategorySubMenuButtonsCategories0Items1Click(
  Sender: TObject);
begin
   closeSubMenu;
   TNavigation.Open(TfrmProduto, frmProduto, pContainer);
end;

end.
