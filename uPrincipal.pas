unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Mask, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls;

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
    Edit5: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtDataNascimento: TMaskEdit;
    edtCPF: TMaskEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtLimiteCredito: TMaskEdit;
    btnLimpar: TSpeedButton;
    btnPesquisar: TSpeedButton;
    cbUF: TDBComboBox;
    Label8: TLabel;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses FrmCadastroCliente, uDmDados;

procedure TfrmPrincipal.btnIncluirClick(Sender: TObject);
begin
  Form1.ShowModal;

end;

procedure TfrmPrincipal.btnPesquisarClick(Sender: TObject);
begin
  DmDados.ClientDataSet1.Filtered := False;
  DmDados.ClientDataSet1.Filter := EmptyStr;

  DmDados.ClientDataSet1.Close;
  DmDados.ClientDataSet1.Open;

  if (edtCodigo.Text <> EmptyStr) then
  begin
    DmDados.ClientDataSet1.Filter := 'CODIGO = ' + edtCodigo.Text;
  end;


  if not DmDados.ClientDataSet1.Filter.IsEmpty then
    DmDados.ClientDataSet1.Filtered := True;


end;

end.
