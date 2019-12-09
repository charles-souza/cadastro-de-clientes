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
    edtNome: TEdit;
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
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure edtCPFClick(Sender: TObject);
    procedure edtDataNascimentoClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses FrmCadastroCliente, uDmDados, uStatusTela;

procedure TelaCadastro(statusTela : StatusTela);
var
 frmCadastro : TForm1;
begin
  try
    frmCadastro := TForm1.create(nil);
    frmCadastro.gStatusTela := statusTela;

//    if (statusTela = StatusTela.Incluir) then
//    begin
//      DmDados.ClientDataSet1.State := dsInsert;
//    end;
//
    if (statusTela = Editar) then
    begin
      DmDados.ClientDataSet1.Edit;
    end;

    frmCadastro.ShowModal();
  finally
     FreeAndNil(frmCadastro);
  end;
end;

procedure TfrmPrincipal.btnEditarClick(Sender: TObject);
begin  
  TelaCadastro(StatusTela.Editar);
  //DmDados.ClientDataSet1.LoadFromFile();

//  edtCodigo.Text        := DmDados.ClientDataSet1.FieldByName('CODIGO').AsString;
//  edtNome.Text          := DmDados.ClientDataSet1.FieldByName('NOME').AsString;
//  edtCPF.Text;
//  //edtDataNascimento.Text := DmDados.ClientDataSet1.FieldByName('DATANASCIMENTO').AsString;
//  edtLimiteCredito.Text := DmDados.ClientDataSet1.FieldByName('LIMITECREDITO').AsString;
//  edtEndereco.Text      := DmDados.ClientDataSet1.FieldByName('ENDERECO').AsString;
//  edtCidade.Text        := DmDados.ClientDataSet1.FieldByName('CIDADE').AsString;
//  cbUF.Text             := DmDados.ClientDataSet1.FieldByName('UF').AsString;
end;

procedure TfrmPrincipal.btnExcluirClick(Sender: TObject);
begin
 //TelaCadastro(StatusTela.Excluir);
 //MessageDlg('Deseja mesmo apagar o registro?', mtConfirmation, [mbYes, mbNo], 0);
 if not DmDados.ClientDataSet1.IsEmpty then
 begin
 //MessageDlg('Deseja mesmo apagar o registro?', mtConfirmation, [mbYes, mbNo], 0);
   if MessageDlg('Deseja mesmo apagar o registro?', mtConfirmation,
     [mbYes, mbNo], 0) = mrYes then
   begin
     DmDados.ClientDataSet1.Delete;
     ShowMessage('Cliente excluido com sucesso!');
   end;
 end;
end;

procedure TfrmPrincipal.btnIncluirClick(Sender: TObject);
begin
  TelaCadastro(StatusTela.Incluir);
end;

procedure TfrmPrincipal.btnLimparClick(Sender: TObject);
begin
  DmDados.ClientDataSet1.Fields.Clear;

  edtCodigo.Text        := EmptyStr;
  edtNome.Text          := EmptyStr;
  edtCPF.Text           := EmptyStr;
  edtDataNascimento.Text:= EmptyStr;
  edtLimiteCredito.Text := EmptyStr;
  edtEndereco.Text      := EmptyStr;
  edtCidade.Text        := EmptyStr;
  cbUF.Text             := EmptyStr;
end;

procedure TfrmPrincipal.btnPesquisarClick(Sender: TObject);
var
filtro : String;

begin
  DmDados.ClientDataSet1.Filtered := False;
  DmDados.ClientDataSet1.Filter := EmptyStr;

  DmDados.ClientDataSet1.Close;
  DmDados.ClientDataSet1.Open;

  filtro := '';

  if (edtcodigo.Text <> EmptyStr) then
  begin
    filtro := 'CODIGO = ' + edtCodigo.Text; //IntToStr()
  end;

  if (edtNome.Text <> EmptyStr) then
  begin
    if(filtro <> EmptyStr) then
    begin
      filtro := filtro + ' AND UPPER(NOME) LIKE ''%' + QuotedStr('%' + edtNome.Text + '%');
    end
    else
    begin
     filtro := 'UPPER(NOME) like ' + QuotedStr('%' + edtNome.Text + '%');
    end;
  end;

  if (edtCPF.Text <> EmptyStr) then
  begin
    if(filtro <> EmptyStr) then
    begin
      filtro := filtro + ' AND UPPER(CPF) LIKE '+ QuotedStr('%' + UpperCase(edtCPF.Text) + '%');
    end
    else
    begin
      filtro := 'UPPER(CPF) LIKE ' + QuotedStr('%' + UpperCase(edtCPF.Text) + '%');
    end;
  end;

  if ((edtDataNascimento.Text <> EmptyStr) AND (edtDataNascimento.Text <> '  /  /    ')) then
  begin
    if(filtro <> EmptyStr) then
    begin
      filtro := filtro + ' AND UPPER(DATANASCIMENTO) LIKE ''%' + UpperCase(edtDataNascimento.Text) + '%''';
    end
    else
    begin
      filtro := 'UPPER(DATANASCIMENTO) LIKE ''%' + UpperCase(edtDataNascimento.Text) + '%''';
    end;
  end;

  if (edtLimiteCredito.Text <> EmptyStr) then
  begin
    if(filtro <> EmptyStr) then
    begin
      filtro := filtro + ' AND UPPER(LIMITECREDITO) LIKE ''%' + UpperCase(edtLimiteCredito.Text) + '%''';
    end
    else
    begin
      filtro := 'UPPER(LIMITECREDITO) LIKE ''%' + UpperCase(edtLimiteCredito.Text) + '%''';
    end;
  end;

  if (edtEndereco.Text <> EmptyStr) then
  begin
    if(filtro <> EmptyStr) then
    begin
      filtro := filtro + ' AND UPPER(ENDERECO) LIKE ''%' + UpperCase(edtEndereco.Text) + '%''';
    end
    else
    begin
      filtro := 'UPPER(ENDERECO) LIKE ''%' + UpperCase(edtEndereco.Text) + '%''';
    end;
  end;

  if (edtCidade.Text <> EmptyStr) then
  begin
    if(filtro <> EmptyStr) then
    begin
      filtro := filtro + ' AND UPPER(CIDADE) LIKE ''%' + UpperCase(edtCidade.Text) + '%''';
    end
    else
    begin
      filtro := 'UPPER(CIDADE) LIKE ''%' + UpperCase(edtCidade.Text) + '%''';
    end;
  end;

  if (cbUF.Text <> EmptyStr) then
  begin
    if(filtro <> EmptyStr) then
    begin
      filtro := filtro + ' AND UPPER(UF) LIKE ''%' + UpperCase(cbUF.Text) + '%''';
    end
    else
    begin
      filtro := 'UPPER(UF) LIKE ''%' + UpperCase(cbUF.Text) + '%''';
    end;
  end;

  DmDados.ClientDataSet1.Filter := filtro;
  DmDados.ClientDataSet1.Filtered := true;

  // Ao Setar Filtered := true, irá atualizar a grid, pois está vinculada ao ClientDataSet
  if not DmDados.ClientDataSet1.Filter.IsEmpty then
    DmDados.ClientDataSet1.Filtered := True;



end;

procedure TfrmPrincipal.edtCPFClick(Sender: TObject);
begin
  edtCPF.SelStart := 0;
end;

procedure TfrmPrincipal.edtDataNascimentoClick(Sender: TObject);
begin
  edtDataNascimento.SelStart := 0;
end;


end.
