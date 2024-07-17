/////////////////////////////////////////////////////////////////////////////
{
    Unit Vcl.Loading
    Criação: 99 Coders | Heber Stein Mazutti
    Site: https://www.youtube.com/@99coders
    Versão: 1.0
}
/////////////////////////////////////////////////////////////////////////////



unit Vcl.Loading;

interface

uses System.SysUtils, System.UITypes, Vcl.Forms, Vcl.Graphics, Vcl.WinXCtrls,
  Vcl.StdCtrls, System.Classes;

type
  TMyThreadMethod = procedure(Sender: TObject) of object;

  TLoading = class
    private
        class var Fundo: TForm;
        class var Loading: TForm;
        class var Indicator: TActivityIndicator;
    public
      class procedure Show(Frm: TForm);
      class procedure Hide;
      class procedure ExecuteThread(proc: TProc;
                                       procTerminate: TMyThreadMethod);
    end;

implementation

{ TLoading }


class procedure TLoading.Hide;
begin
    if Assigned(Indicator) then
        FreeAndNil(Indicator);

    if Assigned(Loading) then
        FreeAndNil(Loading);

    if Assigned(Fundo) then
        FreeAndNil(Fundo);
end;

class procedure TLoading.Show(Frm: TForm);
begin
    // Form de fundo opaco...
    if NOT Assigned(Fundo) then
        Fundo := TForm.Create(nil);

    Fundo.AlphaBlend := true;
    Fundo.AlphaBlendValue := 60;
    Fundo.Color := clBlack;
    //Fundo.WindowState := wsMaximized;
    Fundo.Position := poDesigned;
    Fundo.BorderStyle := bsNone;
    Fundo.Width := Frm.Width;
    Fundo.Height := Frm.Height;
    Fundo.Left := Frm.Left;
    Fundo.Top := Frm.Top;


    // Form transparente com o loading...
    if NOT Assigned(Loading) then
        Loading := TForm.Create(nil);

    Loading.TransparentColor := true;
    Loading.Color := $00737373;
    Loading.TransparentColorValue := $00737373;
    //Loading.WindowState := wsMaximized;
    Loading.Position := poDesigned;
    Loading.BorderStyle := bsNone;
    Loading.Width := Frm.Width - 16;
    Loading.Height := Frm.Height - 8;
    Loading.Left := Frm.Left + 8;
    Loading.Top := Frm.Top;



    // Cria a animacao...
    if NOT Assigned(Indicator) then
        Indicator := TActivityIndicator.Create(Loading);

    Indicator.Parent := Loading;
    Indicator.IndicatorSize := aisLarge;
    Indicator.IndicatorType := aitRotatingSector;
    Indicator.FrameDelay := 100;
    Indicator.Left := Trunc(Frm.Width / 2) - Trunc(Indicator.Width / 2);
    Indicator.Top := Trunc(Frm.Height / 2) - Trunc(Indicator.Height / 2);
    Indicator.Animate := true;


    // Exibe o loading...
    Fundo.Show;
    Loading.Show;
end;

class procedure TLoading.ExecuteThread(proc: TProc;
                                       procTerminate: TMyThreadMethod);
var
    t: TThread;
begin
    t := TThread.CreateAnonymousThread(proc);

    if Assigned(procTerminate) then
        t.OnTerminate := procTerminate;

    t.Start;
end;

end.
