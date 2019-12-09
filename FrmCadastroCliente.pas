unit FrmCadastroCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Datasnap.DBClient, uStatusTela,
  uModelCliente, Vcl.ComCtrls, DateUtils;

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
    SpeedButton5: TSpeedButton;
    btnGravar: TSpeedButton;
    Label8: TLabel;
    edtDataNascimento: TDateTimePicker;
    edtLimiteCredito: TEdit;
    cbUF: TComboBox;
    procedure btnGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    gStatusTela : StatusTela;
    gCliente : TCliente;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses uDmDados;

function validaIdade(data : TDate) : Boolean;
var
  vAnos : Integer;
 begin
   vAnos := YearsBetween(Date,data);
   if (vAnos >= 18) then
   begin
     Result := true;
   end
   else
   begin
     Result := false;
   end;
 end;

function validaIdadeLimite(data : TDate; limite : Double) : Boolean;
var
  vAnos : Integer;
  vLimmite : Double;
begin
 vAnos := YearsBetween(Date,data);
 vLimmite := 0;

 if (vAnos >= 18 ) then
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

  Result := vLimmite >= limite;
end;

function proxCodigo() : Integer;
var
  proxCodigo : Integer;
begin
  DmDados.ClientDataSet1.Last;
  proxCodigo := DmDados.ClientDataSet1.FieldByName('CODIGO').AsInteger;

  Result := proxCodigo + 1;
end;

procedure TForm1.btnGravarClick(Sender: TObject);
begin
  if (edtCodigo.Text = EmptyStr) then
  begin
    ShowMessage('Favor informar um c�digo para o cliente.');
    exit;
  end;
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
 if not (validaIdade(edtDataNascimento.Date)) then
  begin
    ShowMessage('Data de nascimento n�o permitida!'+#13 +'Cliente menor de idade.');
    edtDataNascimento.SetFocus;
    exit;
  end;

  if not validaIdadeLimite(edtDataNascimento.Date, StrToFloatDef(edtLimiteCredito.Text,0)) then
    begin
      ShowMessage('O limite � inv�lido');
      edtLimiteCredito.SetFocus;
      exit;
    end;


  if ( DmDados.ClientDataSet1.State <> dsEdit) then
    begin
    DmDados.ClientDataSet1.Append;
    end;
    DmDados.ClientDataSet1Codigo.AsString := edtCodigo.Text;
    DmDados.ClientDataSet1Nome.AsString := edtNome.Text;
    DmDados.ClientDataSet1CPF.AsString := edtCPF.Text;
    Dmdados.ClientDataSet1DataNascimento.AsDateTime := edtDataNascimento.Date;
    DmDados.ClientDataSet1LimiteCredito.AsString := edtLimiteCredito.Text;
    DmDados.ClientDataSet1Endereco.AsString := edtEndereco.Text;
    DmDados.ClientDataSet1Cidade.AsString := edtCidade.Text;
    DmDados.ClientDataSet1UF.AsString := cbUF.Text;

    DmDados.ClientDataSet1.Post;
    DmDados.ClientDataSet1.SaveToFile();

    ShowMessage('Cliente gravado com sucesso!');
    Close;

end;

procedure TForm1.FormShow(Sender: TObject);
begin
  if(gStatusTela = StatusTela.Incluir) then
  begin
  edtCodigo.Text := IntToStr(proxCodigo());
  end;

  if(gStatusTela = StatusTela.Editar) then
  begin
  edtCodigo.Text        := DmDados.ClientDataSet1.FieldByName('CODIGO').AsString;
  edtNome.Text          := DmDados.ClientDataSet1.FieldByName('NOME').AsString;
  edtCPF.Text           := DmDados.ClientDataSet1.FieldByName('CPF').AsString;
  edtDataNascimento.Date:= DmDados.ClientDataSet1.FieldByName('DATANASCIMENTO').AsDateTime;
  edtLimiteCredito.Text := DmDados.ClientDataSet1.FieldByName('LIMITECREDITO').AsString;
  edtEndereco.Text      := DmDados.ClientDataSet1.FieldByName('ENDERECO').AsString;
  edtCidade.Text        := DmDados.ClientDataSet1.FieldByName('CIDADE').AsString;
  cbUF.Text             := DmDados.ClientDataSet1.FieldByName('UF').AsString;
  end;

  if(gStatusTela = StatusTela.Excluir) then
  begin
    //ShowMessage('EXCLUIR');
  end;

end;

procedure TForm1.SpeedButton5Click(Sender: TObject);
begin
  Self.Close;
end;

end.
