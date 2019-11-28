program cadastroDeClientes;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uModelCliente in 'uModelCliente.pas',
  FrmCadastroCliente in 'FrmCadastroCliente.pas' {Form1},
  uDmDados in 'uDmDados.pas' {DmDados: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDmDados, DmDados);
  Application.Run;
end.
