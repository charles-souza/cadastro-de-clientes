unit FrmCadastroCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Datasnap.DBClient;

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
    edtDataNascimento: TMaskEdit;
    cbUF: TDBComboBox;
    Label7: TLabel;
    edtLimiteCredito: TMaskEdit;
    SpeedButton5: TSpeedButton;
    btnGravar: TSpeedButton;
    Label8: TLabel;
    procedure btnGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses uDmDados;

procedure TForm1.btnGravarClick(Sender: TObject);
begin
  if (edtCodigo.Text = EmptyStr) then
  begin
    ShowMessage('Favor informar um código para o cliente.');
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
  if ( DmDados.ClientDataSet1.State <> dsEdit) then
    begin
    DmDados.ClientDataSet1.Append;
    end;
    DmDados.ClientDataSet1Codigo.AsString := edtCodigo.Text;
    DmDados.ClientDataSet1Nome.AsString := edtNome.Text;
    DmDados.ClientDataSet1.Post;

    DmDados.ClientDataSet1.SaveToFile();

    ShowMessage('Cliente gravado com sucesso!');
    Close;

end;

end.
