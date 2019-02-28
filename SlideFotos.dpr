program SlideFotos;

uses
  System.StartUpCopy,
  FMX.Forms,
  uSlideFotos in 'uSlideFotos.pas' {frmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
