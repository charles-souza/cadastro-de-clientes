unit FrmCadastroCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Datasnap.DBClient, uStatusTela,
  uModelCliente, Vcl.ComCtrls, DateUtils, uClienteDAO, uPrincipal;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    edtCodigo: TEdit;
    Label5: TLabel;
    edtEndereco: TEdit;
    Label2: TLabel;
    edtNome: TEdit;
    Label3: TLabel;
    edtCPF: TMaskEdit;
    Label6: TLabel;
    edtCidade: TEdit;
    Label4: TLabel;
    Label7: TLabel;
    btnCancelar: TSpeedButton;
    btnGravar: TSpeedButton;
    Label8: TLabel;
    edtDataNascimento: TDateTimePicker;
    edtLimiteCredito: TEdit;
    cboUF: TComboBox;
    procedure btnGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    gStatusTela: StatusTela;
    gCliente: TCliente;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses uTabela, uUF, uUFDAO;

function validaIdade(Data: TDate): Boolean;
var
  vAnos: Integer;
begin
  vAnos := YearsBetween(Date, Data);
  if (vAnos >= 18) then
  begin
    Result := true;
  end
  else
  begin
    Result := false;
  end;
end;

function validaIdadeLimite(Data: TDate; pLimite: Double): Boolean;
var
  vAnos: Integer;
  vLimmite: Double;
begin
  vAnos := YearsBetween(Date, Data);
  vLimmite := 0;

  if (vAnos >= 18) then
  begin
    if (vAnos <= 22) then
    begin
      vLimmite := 4000
    end
    else
    begin
      if (vAnos <= 30) then
      begin
        vLimmite := 10000
      end
      else
        vLimmite := 99999999999999999;
    end;
  end;

  Result := vLimmite >= pLimite;
end;

//function ListaUF: TStrings;
//begin
//  Tabela.qryUF.First;
//  while not(Tabela.qryUF.Eof) do
//  begin
//    Result.Add(Tabela.qryUF.FieldByName('UF').AsString);
//    Tabela.qryUF.Next;
//  end;
//end;

procedure TForm1.btnGravarClick(Sender: TObject);
var
  vCliente: TCliente;
  vClienteDAO: TClienteDAO;
begin
  vCliente := TCliente.Create();
  if (edtNome.Text = EmptyStr) then
  begin
    ShowMessage('Favor informar um nome para o cliente.');
    exit;
  end;
  if (edtCPF.Text = EmptyStr) then
  begin
    ShowMessage('Favor informar um CPF para o cliente.');
    exit;
  end;
  if not(validaIdade(edtDataNascimento.Date)) then
  begin
    ShowMessage('Data de nascimento n�o permitida!' + #13 + 'Cliente menor de idade.');
    edtDataNascimento.SetFocus;
    exit;
  end;

  if not validaIdadeLimite(edtDataNascimento.Date,
    StrToFloatDef(edtLimiteCredito.Text, 0)) then
  begin
    ShowMessage('O limite � inv�lido');
    edtLimiteCredito.SetFocus;
    exit;
  end;

  if Assigned(vCliente) then
  begin

    vCliente.Codigo := StrToIntDef(edtCodigo.Text, 0);
    vCliente.Nome := edtNome.Text;
    vCliente.CPF := edtCPF.Text;
    vCliente.DataNascimento := edtDataNascimento.DateTime;
    vCliente.LimiteCredito := StrToFloatDef(edtLimiteCredito.Text, 0);
    vCliente.Endereco := edtEndereco.Text;
    vCliente.Cidade := edtCidade.Text;
    vCliente.UF := cboUF.Text;


    if (gStatusTela = StatusTela.Incluir) then
    begin
      try
        vClienteDAO := TClienteDAO.Create(vCliente);
        vCliente.Codigo := vClienteDAO.gerarProxCodigo;
        vClienteDAO := TClienteDAO.Create(vCliente);

        if vClienteDAO.InserirCliente then
        begin
          Application.MessageBox('Registro incluido com sucesso!',
            'Aten��o', MB_OK);
          Close;
        end
        else
        begin
          Application.MessageBox('O registro n�o foi incluido!',
            'Aten��o', MB_OK);
          Close;
        end;
      except
        ShowMessage('Erro ao obter o c�digo.');
      end;
    end;

    if (gStatusTela = StatusTela.Editar) then
    begin
      vClienteDAO := TClienteDAO.Create(vCliente);
      if vClienteDAO.AlterarCliente() then
      begin
        Application.MessageBox('Registro alterado com sucesso!',
          'Aten��o', MB_OK);
        Close;
      end
      else
      begin
        Application.MessageBox('O registro n�o foi alterado!',
          'Aten��o', MB_OK);
        Close;
      end;
    end;
  end;
  frmPrincipal.btnPesquisarClick(vCliente);
end;

procedure TForm1.FormShow(Sender: TObject);
var
  vUF : TUF;
  vUFDAO : TUFDAO;
begin
  vUFDAO := TUFDAO.Create(vUF);
  if (gStatusTela = StatusTela.Incluir) then
  begin
  vUFDAO.CarregarEstados(cboUF, 'GO');
  end;

  if (gStatusTela = StatusTela.Editar) then
  begin
    if Assigned(gCliente) then
    begin

      edtCodigo.Text := IntToStr(gCliente.Codigo);
      edtNome.Text := gCliente.Nome;
      edtCPF.Text := gCliente.CPF;
      edtDataNascimento.DateTime := gCliente.DataNascimento;
      edtLimiteCredito.Text := FloatToStr(gCliente.LimiteCredito);
      edtEndereco.Text := gCliente.Endereco;
      edtCidade.Text := gCliente.Cidade;

      vUFDAO.CarregarEstados(cboUF, gCliente.UF);
    end;

  end;

end;

procedure TForm1.btnCancelarClick(Sender: TObject);
begin
  Self.Close;
end;

end.
