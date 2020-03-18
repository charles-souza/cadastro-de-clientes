unit uUF;

interface

uses
  System.SysUtils, System.Classes;

type
  TUF = class
  private
    FUF : String;
    FDescricao : String;
  public
    property UF : String read FUF write FUF;
    property Descricao : String read FDescricao write FDescricao;
  end;

implementation

uses
  uTabela;

{ TUF }

end.
