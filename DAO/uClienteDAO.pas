unit uClienteDAO;

interface

uses uModelCliente, uTabela, System.SysUtils, Vcl.Dialogs, Generics.Collections,Data.DB, ZAbstractTable, ZDataset, ZAbstractConnection, ZConnection;

type
  TClienteDAO = class
  private
    FQuery: TZQuery;
    FCliente: TCliente;
    FListaClientes: TList<TCliente>;

  public
    Constructor Create(pCliente: TCliente);
    function gerarProxCodigo(): Integer;
    function InserirCliente: boolean;
    function ConsultarCliente(): TList<TCliente>;
    function AlterarCliente(): boolean;
    function DeletarCliente(): boolean;
  end;

implementation

constructor TClienteDAO.Create(pCliente: TCliente);
begin
  FQuery := TZQuery.Create(nil);
  FQuery.Connection := uTabela.Tabela.conexao;
  FListaClientes := TList<TCliente>.Create;
  FCliente := pCliente;
end;

function TClienteDAO.gerarProxCodigo(): Integer;
begin
  try

    FQuery.Close;
    FQuery.SQL.Clear;
    FQuery.SQL.Add('SELECT SEQ_CLIENTES.NEXTVAL SEQUENCE FROM DUAL');
    FQuery.Open;
    Result := FQuery.FieldByName('SEQUENCE').AsInteger;

  except
    on E : Exception do
      ShowMessage('Um erro n�o tratado foi gerado! ' + #13 + 'Erro: ' +
                    E.Message + #13 + 'Classe: ' + E.ClassName);
  end;
end;

function TClienteDAO.InserirCliente: boolean;
begin
try
  try
    FQuery.Close;
    FQuery.SQL.Clear;
    FQuery.SQL.Add('INSERT INTO CLIENTES(CODIGO, NOME, ENDERECO, CIDADE, ');
    FQuery.SQL.Add(' UF, CPF, DATA_NASCIMENTO, LIMITE_CREDITO)');
    FQuery.SQL.Add(' VALUES (:CODIGO, :NOME, :ENDERECO, :CIDADE, ');
    FQuery.SQL.Add(' :UF, :CPF, :DATA_NASCIMENTO, :LIMITE_CREDITO)');

    FQuery.ParamByName('CODIGO').AsInteger := FCliente.Codigo;
    FQuery.ParamByName('NOME').AsString := FCliente.Nome;
    FQuery.ParamByName('ENDERECO').AsString := FCliente.Endereco;
    FQuery.ParamByName('CIDADE').AsString := FCliente.Cidade;
    FQuery.ParamByName('UF').AsString := FCliente.UF;
    FQuery.ParamByName('CPF').AsString := FCliente.CPF;
    FQuery.ParamByName('DATA_NASCIMENTO').AsDate := FCliente.DataNascimento;
    FQuery.ParamByName('LIMITE_CREDITO').AsFloat := FCliente.LimiteCredito;
    // ShowMessage(FQuery.SQL.Text);

    FQuery.ExecSQL;
    Result := true;
  except
    Result := false;
  end;
finally
  //FreeAndNil(FCliente);
  //FQuery.Close;
end;
end;

function TClienteDAO.ConsultarCliente(): TList<TCliente>;
var
  Cliente: TCliente;
  vFiltro: String;
begin
  vFiltro := EmptyStr;
  if (FCliente.Codigo > 0) then
    vFiltro := ' AND CODIGO = ' + QuotedStr(IntToStr(FCliente.Codigo));

  if FCliente.Nome <> EmptyStr then
    vFiltro := vFiltro + ' AND UPPER(NOME) LIKE ' +
      QuotedStr('%' + FCliente.Nome + '%');

  if FCliente.CPF <> EmptyStr then
    vFiltro := vFiltro + ' AND CPF LIKE ' + QuotedStr('%' + FCliente.CPF + '%');

  if ((FCliente.DataNascimento > 0)) then
    vFiltro := vFiltro + ' AND DATA_NASCIMENTO = ' +
      QuotedStr(DateTimeToStr(FCliente.DataNascimento));

  if FCliente.LimiteCredito > 0 then
    vFiltro := vFiltro + ' AND LIMITE_CREDITO = ' +
      QuotedStr(FloatToStr(FCliente.LimiteCredito));

  if FCliente.Endereco <> EmptyStr then
    vFiltro := vFiltro + ' AND UPPER(ENDERECO) LIKE ' +
      QuotedStr('%' + UpperCase(FCliente.Endereco) + '%');

  if FCliente.Cidade <> EmptyStr then
    vFiltro := vFiltro + ' AND UPPER(CIDADE) LIKE ' +
      QuotedStr('%' + UpperCase(FCliente.Cidade) + '%');

  if FCliente.UF <> EmptyStr then
    vFiltro := vFiltro + ' AND UPPER(UF) LIKE ' +
      QuotedStr('%' + UpperCase(FCliente.UF) + '%');

  vFiltro := vFiltro + ' ORDER BY CODIGO ASC';
  if FQuery.IsEmpty then
  begin
    FQuery.Close;
    FQuery.SQL.Clear;
    FQuery.SQL.Add('SELECT * ');
    FQuery.SQL.Add('FROM CLIENTES ');
    FQuery.SQL.Add('WHERE 0=0 ');
    FQuery.SQL.Add(vFiltro);
    FQuery.Open;

    while not FQuery.Eof do
    begin
      Cliente := TCliente.Create;

      Cliente.Codigo := FQuery.FieldByName('CODIGO').AsInteger;
      Cliente.Nome := FQuery.FieldByName('NOME').AsString;
      Cliente.Endereco := FQuery.FieldByName('ENDERECO').AsString;
      Cliente.Cidade := FQuery.FieldByName('CIDADE').AsString;
      Cliente.UF := FQuery.FieldByName('UF').AsString;
      Cliente.CPF := FQuery.FieldByName('CPF').AsString;
      Cliente.DataNascimento := FQuery.FieldByName('DATA_NASCIMENTO').AsDateTime;
      Cliente.LimiteCredito := FQuery.FieldByName('LIMITE_CREDITO').AsFloat;

      FListaClientes.Add(Cliente);
      FQuery.Next;
    end;
  end;
  Result := FListaClientes;
end;

function TClienteDAO.AlterarCliente(): boolean;
begin
  FQuery.Close;
  FQuery.SQL.Clear;
  FQuery.SQL.Add('UPDATE CLIENTES SET ');
  FQuery.SQL.Add('CODIGO = :CODIGO, NOME = :NOME, ENDERECO = :ENDERECO, CIDADE = :CIDADE, UF = :UF, ');
  FQuery.SQL.Add('CPF = :CPF, DATA_NASCIMENTO = :DATA_NASCIMENTO, LIMITE_CREDITO = :LIMITE_CREDITO ');
  FQuery.SQL.Add('WHERE 0=0 ');
  FQuery.SQL.Add('AND CODIGO = :CODIGO');

  FQuery.ParamByName('CODIGO').AsInteger := FCliente.Codigo;
  FQuery.ParamByName('NOME').AsString := FCliente.Nome;
  FQuery.ParamByName('ENDERECO').AsString := FCliente.Endereco;
  FQuery.ParamByName('CIDADE').AsString := FCliente.Cidade;
  FQuery.ParamByName('UF').AsString := FCliente.UF;
  FQuery.ParamByName('CPF').AsString := FCliente.CPF;
  FQuery.ParamByName('DATA_NASCIMENTO').AsDate := FCliente.DataNascimento;
  FQuery.ParamByName('LIMITE_CREDITO').AsFloat := FCliente.LimiteCredito;

  try
    FQuery.ExecSQL;
    Result := true;
  except
    Result := false;
  end;
end;

function TClienteDAO.DeletarCliente: boolean;
begin
try
  FQuery.Close;
  FQuery.SQL.Clear;
  FQuery.SQL.Add('DELETE FROM CLIENTES ');
  FQuery.SQL.Add('WHERE 0=0');
  FQuery.SQL.Add('AND CODIGO = :CODIGO');
  FQuery.ParamByName('CODIGO').AsInteger := FCliente.Codigo;

  try
    FQuery.ExecSQL;
    Result := true;
  except
    Result := false;
  end;
finally
  //FreeAndNil(FCliente);
  //FQuery.Close;
end;
end;

end.