unit uModelCliente;

interface

type
TCliente = class
  private
  FCodigo : Integer;
  FNome : String;
  FEndereco : String;
  FCidade : String;
  FUF : String;
  FCPF : String;
  FDataNascimento : TDate;
  FLimiteCredito : Double;
  public
  property Codigo : Integer read FCodigo write FCodigo;
  property Nome : String read FNome write FNome;
  property Endereco : String read FEndereco write FEndereco;
  property Cidade : String read FCidade write FCidade;
  property UF : String read FUF write FUF;
  property CPF : String read FCPF write FCPF;
  property DataNascimento : TDate read FDataNascimento write FDataNascimento;
  property LimiteCredito : Double read FLimiteCredito write FLimiteCredito;
end;

implementation

end.
