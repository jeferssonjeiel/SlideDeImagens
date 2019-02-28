unit uSlideFotos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, System.Actions,
  FMX.ActnList;

type
  TfrmPrincipal = class(TForm)
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    TabItem4: TTabItem;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    ToolBar1: TToolBar;
    playBtn: TSpeedButton;
    pauseBtn: TSpeedButton;
    esqBtn: TSpeedButton;
    dirBtn: TSpeedButton;
    sairBtn: TSpeedButton;
    Timer1: TTimer;
    ActionList1: TActionList;
    ChangeTabAction1: TChangeTabAction;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure pauseBtnClick(Sender: TObject);
    procedure playBtnClick(Sender: TObject);
    procedure dirBtnClick(Sender: TObject);
    procedure esqBtnClick(Sender: TObject);
    procedure sairBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

procedure TfrmPrincipal.dirBtnClick(Sender: TObject);
var Slide: integer;
  begin
    TabControl1.Next();

    if TabControl1.ActiveTab = TabItem4 then
      begin
        dirBtn.Enabled := false;
      end

    else
      begin
        dirBtn.Enabled := true;
      end;

      if TabControl1.ActiveTab = TabItem2 then
        begin
          esqBtn.Enabled := true;
        end;
  end;

procedure TfrmPrincipal.esqBtnClick(Sender: TObject);
  begin
    TabControl1.Previous();

    if TabControl1.ActiveTab = TabItem1 then
      begin
        esqBtn.Enabled := false;
      end

    else
      begin
        esqBtn.Enabled := true;
      end;


    if TabControl1.ActiveTab = TabItem3 then
      begin
        dirBtn.Enabled := true;
      end;
  end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
  begin
    TabControl1.ActiveTab := TabItem1;

    if Timer1.Enabled = true then
      begin
        playBtn.Enabled := false;

        esqBtn.Enabled := false;
        dirBtn.Enabled := false;

      if TabControl1.ActiveTab = TabItem1 then
        begin
          esqBtn.Enabled := false;
        end

      else
        begin
          esqBtn.Enabled := true;
        end;

      end;
  end;

procedure TfrmPrincipal.pauseBtnClick(Sender: TObject);
  begin
    Timer1.Enabled := false;
    pauseBtn.Enabled := false;
    playBtn.Enabled := true;

    esqBtn.Enabled := true;
    dirBtn.Enabled := true;

    if TabControl1.ActiveTab = TabItem1 then
      begin
        esqBtn.Enabled := false;
      end;

  end;

procedure TfrmPrincipal.playBtnClick(Sender: TObject);
  begin
    Timer1.Enabled := true;
    playBtn.Enabled := false;
    pauseBtn.Enabled := true;

    esqBtn.Enabled := false;
    dirBtn.Enabled := false;
  end;

procedure TfrmPrincipal.sairBtnClick(Sender: TObject);
  begin
    Close();
  end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
  begin
    TabControl1.Next();

    if TabControl1.ActiveTab = TabItem4 then
      begin
        sleep(5000);
        ChangeTabAction1.Tab := TabItem1;
        ChangeTabAction1.ExecuteTarget(self);
        //dirBtn.Enabled := true;
      end;

  end;

end.
