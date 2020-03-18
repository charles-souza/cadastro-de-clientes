unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Mask, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.ComCtrls,
  uClienteDAO, uModelCliente;

type
  TfrmPrincipal = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    btnIncluir: TSpeedButton;
    btnEditar: TSpeedButton;
    btnExcluir: TSpeedButton;
    dbGridListagem: TDBGrid;
    edtCodigo: TEdit;
    edtEndereco: TEdit;
    edtCidade: TEdit;
    edtNome: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtCPF: TMaskEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtLimiteCredito: TMaskEdit;
    btnLimpar: TSpeedButton;
    btnPesquisar: TSpeedButton;
    Label8: TLabel;
    cboUF: TComboBox;
    edtDataNascimento: TMaskEdit;
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure edtCPFClick(Sender: TObject);
    procedure edtDataNascimentoClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbGridListagemDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
  gCliente: TCliente;

implementation

{$R *.dfm}

uses FrmCadastroCliente, uDmDados, uStatusTela, uTabela, uUF, uUFDAO;

procedure TelaCadastro(statusTela: statusTela);
var
  frmCadastro: TForm1;
begin
  try
    frmCadastro := TForm1.create(nil);
    frmCadastro.gCliente := gCliente;
    frmCadastro.gStatusTela := statusTela;
    frmCadastro.ShowModal();
  finally
    FreeAndNil(frmCadastro);
  end;
end;

procedure TfrmPrincipal.btnEditarClick(Sender: TObject);
var
  vCliente: TCliente;
begin
  try
    try
      vCliente := TCliente.create();

      vCliente.Codigo := dbGridListagem.DataSource.DataSet.FieldByName('CODIGO').AsInteger;
      vCliente.Nome := dbGridListagem.DataSource.DataSet.FieldByName('NOME').AsString;
      vCliente.CPF := dbGridListagem.DataSource.DataSet.FieldByName('CPF').AsString;
      vCliente.DataNascimento := dbGridListagem.DataSource.DataSet.FieldByName('DATA_NASCIMENTO').AsDateTime;
      vCliente.LimiteCredito := dbGridListagem.DataSource.DataSet.FieldByName('LIMITE_CREDITO').AsFloat;
      vCliente.Endereco := dbGridListagem.DataSource.DataSet.FieldByName('ENDERECO').AsString;
      vCliente.Cidade := dbGridListagem.DataSource.DataSet.FieldByName('CIDADE').AsString;
      vCliente.UF := dbGridListagem.DataSource.DataSet.FieldByName('UF').AsString;

      gCliente := vCliente;
      TelaCadastro(statusTela.Editar);
    except
      on E : Exception do
        ShowMessage('Um erro n�o tratado foi gerado! ' + #13 + 'Erro: ' +
                      E.Message + #13 + 'Classe: ' + E.ClassName);
       //raise Exception.Create('Erro ao montar o objeto');
    end;
  finally
    //vCliente.Destroy();
    FreeAndNil(vCliente);
  end;
end;

procedure TfrmPrincipal.btnExcluirClick(Sender: TObject);
var
  vCliente: TCliente;
  vCLienteDAO: TClienteDAO;
begin
try
	try
	  vCliente := TCliente.create();

	  vCliente.Codigo := dbGridListagem.DataSource.DataSet.FieldByName('CODIGO').AsInteger;
	  vCliente.Nome := dbGridListagem.DataSource.DataSet.FieldByName('NOME').AsString;
	  vCliente.CPF := dbGridListagem.DataSource.DataSet.FieldByName('CPF').AsString;
	  vCliente.DataNascimento := dbGridListagem.DataSource.DataSet.FieldByName('DATA_NASCIMENTO').AsDateTime;
	  vCliente.LimiteCredito := dbGridListagem.DataSource.DataSet.FieldByName('LIMITE_CREDITO').AsFloat;
	  vCliente.Endereco := dbGridListagem.DataSource.DataSet.FieldByName('ENDERECO').AsString;
	  vCliente.Cidade := dbGridListagem.DataSource.DataSet.FieldByName('CIDADE').AsString;
	  vCliente.UF := dbGridListagem.DataSource.DataSet.FieldByName('UF').AsString;

	  vCLienteDAO := TClienteDAO.create(vCliente);
	  if MessageDlg('Deseja mesmo apagar o registro?', mtConfirmation,
		[mbYes, mbNo], 0) = mrYes then
	  begin
		if vCLienteDAO.DeletarCliente then
		begin
		  ShowMessage('Cliente excluido com sucesso!');
		end
		else
		  ShowMessage('N�o foi poss�vel excluir o cliente.');
	  end;
	  frmPrincipal.btnPesquisarClick(vCliente);
	except
    on E : Exception do
      ShowMessage('Um erro n�o tratado foi gerado! ' + #13 + 'Erro: ' +
                    E.Message + #13 + 'Classe: ' + E.ClassName);
  end;
  finally
	FreeAndNil(vCliente);
end;
end;

procedure TfrmPrincipal.btnIncluirClick(Sender: TObject);
begin
  TelaCadastro(statusTela.Incluir);
end;

procedure TfrmPrincipal.btnLimparClick(Sender: TObject);
begin
  edtCodigo.Clear;
  edtNome.Clear;
  edtCPF.Clear;
  edtDataNascimento.Clear;
  edtLimiteCredito.Clear;
  edtEndereco.Clear;
  edtCidade.Clear;
  cboUF.ItemIndex := -1;
end;

procedure TfrmPrincipal.btnPesquisarClick(Sender: TObject);
var
  vCliente: TCliente;
  vCLienteDAO: TClienteDAO;
begin
try
	try
	  vCliente := TCliente.create();

	  vCliente.Codigo := StrToIntDef(edtCodigo.Text, 0);
	  vCliente.Nome := edtNome.Text;
	  vCliente.CPF := edtCPF.Text;
	  vCliente.DataNascimento := StrToDateTimeDef(edtDataNascimento.Text, 0);
	  vCliente.LimiteCredito := StrToFloatDef(edtLimiteCredito.Text, 0);
	  vCliente.Endereco := edtEndereco.Text;
	  vCliente.Cidade := edtCidade.Text;
	  vCliente.UF := cboUF.Text;

	  vCLienteDAO := TClienteDAO.create(vCliente);

	  Tabela.cdsCliente.DisableControls;
	  Tabela.cdsCliente.EmptyDataSet;

	  for vCliente in vCLienteDAO.ConsultarCliente() do
      begin
        Tabela.cdsCliente.Append;
        Tabela.cdsClienteCODIGO.AsInteger := vCliente.Codigo;
        Tabela.cdsClienteNOME.AsString := vCliente.Nome;
        Tabela.cdsClienteCPF.AsString := vCliente.CPF;
        Tabela.cdsClienteDATA_NASCIMENTO.AsDateTime := Trunc(vCliente.DataNascimento);
        Tabela.cdsClienteLIMITE_CREDITO.AsFloat := vCliente.LimiteCredito;
        Tabela.cdsClienteENDERECO.AsString := vCliente.Endereco;
        Tabela.cdsClienteCIDADE.AsString := vCliente.Cidade;
        Tabela.cdsClienteUF.AsString := vCliente.UF;
        Tabela.cdsCliente.Post;
      end;
      Tabela.cdsCliente.EnableControls;
	except
    on E : Exception do
      ShowMessage('Um erro n�o tratado foi gerado! ' + #13 + 'Erro: ' +
                    E.Message + #13 + 'Classe: ' + E.ClassName);
  end;
  finally
    FreeAndNil(vCliente);
    FreeAndNil(vCLienteDAO);
end;
end;

procedure TfrmPrincipal.dbGridListagemDblClick(Sender: TObject);
var
  vCliente: TCliente;
begin
try
	try
	  vCliente := TCliente.create();

	  vCliente.Codigo := dbGridListagem.DataSource.DataSet.FieldByName('CODIGO').AsInteger;
	  vCliente.Nome := dbGridListagem.DataSource.DataSet.FieldByName('NOME').AsString;
	  vCliente.CPF := dbGridListagem.DataSource.DataSet.FieldByName('CPF').AsString;
	  vCliente.DataNascimento := Trunc(dbGridListagem.DataSource.DataSet.FieldByName('DATA_NASCIMENTO').AsDateTime);
	  vCliente.LimiteCredito := dbGridListagem.DataSource.DataSet.FieldByName('LIMITE_CREDITO').AsFloat;
	  vCliente.Endereco := dbGridListagem.DataSource.DataSet.FieldByName('ENDERECO').AsString;
	  vCliente.Cidade := dbGridListagem.DataSource.DataSet.FieldByName('CIDADE').AsString;
	  vCliente.UF := dbGridListagem.DataSource.DataSet.FieldByName('UF').AsString;

	  gCliente := vCliente;
	  TelaCadastro(statusTela.Editar);
	except
    on E : Exception do
      ShowMessage('Um erro n�o tratado foi gerado! ' + #13 + 'Erro: ' +
                    E.Message + #13 + 'Classe: ' + E.ClassName);
  end;
  finally
	FreeAndNil(vCliente);
end;


end;

procedure TfrmPrincipal.edtCPFClick(Sender: TObject);
begin
  edtCPF.SelStart := 0;
end;

procedure TfrmPrincipal.edtDataNascimentoClick(Sender: TObject);
begin
  edtDataNascimento.SelStart := 0;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
var
  vCliente: TCliente;
  vClienteDAO: TClienteDAO;
  vUF : TUF;
  vUFDAO : TUFDAO;
begin
try
	try
	  vCliente := TCliente.Create();
	  vUF := TUF.Create();
	  vUFDAO := TUFDAO.Create(vUF);
	  frmPrincipal.btnPesquisarClick(vCliente);
	  vUFDAO.CarregarEstados(cboUF, '');
	except
    on E : Exception do
      ShowMessage('Um erro n�o tratado foi gerado! ' + #13 + 'Erro: ' +
                    E.Message + #13 + 'Classe: ' + E.ClassName);
  end;
  finally
	FreeAndNil(vCliente);
	FreeAndNil(vUF);
	FreeAndNil(vUFDAO);
end;
end;

end.