program cadastroDeClientes;

uses
  Vcl.Forms,
  uPrincipal in 'Formularios\uPrincipal.pas' {frmPrincipal},
  uModelCliente in 'Model\uModelCliente.pas',
  FrmCadastroCliente in 'Formularios\FrmCadastroCliente.pas' {Form1},
  uStatusTela in 'Model\uStatusTela.pas',
  uTabela in 'DAO\uTabela.pas' {Tabela: TDataModule},
  uClienteDAO in 'DAO\uClienteDAO.pas',
  uUF in 'Model\uUF.pas',
  uUFDAO in 'DAO\uUFDAO.pas';

{$R *.res}

begin
  Application.Initialize;
  ReportMemoryLeaksOnShutdown := DebugHook <> 0;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TTabela, Tabela);
  Application.Run;
end.
