/////////////////////////////////////////////////////////////////////////////
{
    Unit Vcl.Navigation
    Criação: 99 Coders | Heber Stein Mazutti
    Site: https://www.youtube.com/@99coders
    Versão: 1.0
}
/////////////////////////////////////////////////////////////////////////////



unit Vcl.Navigation;

interface

uses System.SysUtils, System.UITypes, Vcl.Forms, Vcl.Graphics, Vcl.WinXCtrls,
  Vcl.StdCtrls, Vcl.ExtCtrls, System.Generics.Collections, System.Classes;

type
  TNavigation = class
    private
        class var FrmOpen: TForm;
        class var FrmModalOpen: TForm;
        class var FrmModalFundo: TForm;
    public
        class var ParamInt: integer;
        class var ExecuteOnClose: procedure of Object;

        class procedure Open(FrmClass: TFormClass;
                             Frm: TForm;
                             Parent: TPanel = nil);
        class procedure OpenModal(FrmClass: TFormClass;
                                  Frm: TForm;
                                  Parent: TForm = nil);
        class procedure Close(Frm: TForm);
    end;


implementation

class procedure TNavigation.Open(FrmClass: TFormClass;
              Frm: TForm;
              Parent: TPanel);
begin
    // Fecha o form caso tenha algo algum aberto...
    if Assigned(FrmOpen) then
    begin
        FrmOpen.Free;
        FrmOpen := nil
    end;

    if (FrmClass = nil) then
        exit;

    if NOT Assigned(Frm) then
        Application.CreateForm(FrmClass, Frm);

    if Parent <> nil then
    begin
        if Parent.ClassType = TPanel then
        begin
            Frm.Parent := TPanel(Parent);
            TPanel(Parent).Margins.Bottom := 1;
            TPanel(Parent).Margins.Bottom := 0;
        end
        else if Parent.ClassType = TForm then
            Frm.Parent := TForm(Parent);
    end;

    FrmOpen := Frm; // Salva qual é o form aberto
    Frm.Show;
end;

class procedure TNavigation.OpenModal(FrmClass: TFormClass;
                                      Frm: TForm;
                                      Parent: TForm = nil);
begin
    // Fundo opaco...
    if NOT Assigned(FrmModalFundo) then
        FrmModalFundo := TForm.Create(Frm);

    FrmModalFundo.AlphaBlend := true;
    FrmModalFundo.AlphaBlendValue := 160;
    FrmModalFundo.Color := clBlack;

    if Parent = nil then
        FrmModalFundo.WindowState := wsMaximized
    else
    begin
        FrmModalFundo.WindowState := wsNormal;
        FrmModalFundo.Position := poDesigned;
        FrmModalFundo.Width := Parent.Width;
        FrmModalFundo.Height := Parent.Height;
        FrmModalFundo.Left := Parent.Left;
        FrmModalFundo.Top := Parent.Top;
    end;

    FrmModalFundo.BorderStyle := bsNone;

    if NOT Assigned(Frm) then
        Frm := FrmClass.Create(Frm);

    FrmModalFundo.Show;

    FrmModalOpen := Frm; // Salva qual é o form modal aberto...
    Frm.ShowModal;
end;

class procedure TNavigation.Close(Frm: TForm);
begin
    // Verifica se está fechando um modal...
    if Frm.Name = FrmModalOpen.Name then
    begin
        FrmModalFundo.Free;
        FrmModalFundo := nil;
    end;

    if Assigned(ExecuteOnClose) then
    begin
        ExecuteOnClose();
        ExecuteOnClose := nil;
    end;

    Frm.Close;
end;





end.
