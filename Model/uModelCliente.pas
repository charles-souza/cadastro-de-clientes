unit uModelCliente;

interface

uses uTabela, System.SysUtils, uUF;

type
  TCliente = class
  private
    FCodigo: Integer;
    FNome: String;
    FEndereco: String;
    FCidade: String;
    FUF: String;
    FCPF: String;
    FDataNascimento: TDateTime;
    FLimiteCredito: Float64;
  public
    property Codigo: Integer read FCodigo write FCodigo;
    property Nome: String read FNome write FNome;
    property Endereco: String read FEndereco write FEndereco;
    property Cidade: String read FCidade write FCidade;
    property UF: String read FUF write FUF;
    property CPF: String read FCPF write FCPF;
    property DataNascimento: TDateTime read FDataNascimento write FDataNascimento;
    property LimiteCredito: Float64 read FLimiteCredito write FLimiteCredito;
    Destructor Destroy();
  end;

implementation

{ TCliente }

destructor TCliente.Destroy();
begin
  inherited Destroy;
end;

end.