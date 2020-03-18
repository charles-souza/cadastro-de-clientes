unit uUFDAO;

interface

uses
  ZDataset, uUF, System.Generics.Collections, Vcl.StdCtrls;

type
  TUFDAO = class
  private
    FQuery: TZQuery;
    FUF: TUF;

  public
    constructor Create(pUF : TUF);
    procedure CarregarEstados(pComboUF: TComboBox; pUFPadrao: string = '');
  end;

implementation

uses
  uTabela, System.SysUtils;

{ TUFDAO }

constructor TUFDAO.Create(pUF: TUF);
begin
  FQuery := TZQuery.Create(nil);
  FQuery.Connection := uTabela.Tabela.conexao;
  FUF := pUF;
end;

procedure TUFDAO.CarregarEstados(pComboUF: TComboBox; pUFPadrao: string);
var
  i: integer;
begin
//Valida se o objeto já está criado na memória
  if not Assigned(pComboUF) then
    raise Exception.Create('O parâmetro do objeto do estado não foi informado.')
  else
  begin
    pComboUF.Items.Clear;

    FQuery.Close;

    FQuery.SQL.Clear;
    FQuery.SQL.Add('SELECT * ');
    FQuery.SQL.Add('FROM ESTADOS ');
    FQuery.Open;
    try
      while not FQuery.Eof do
      begin
        pComboUF.Items.Add(FQuery.FieldByName('UF').AsString);
        FQuery.Next;
      end;
    finally
      FQuery.Close;
    end;

    if pUFPadrao = '' then
      pComboUF.ItemIndex := -1
    else
    begin
      for i := 0 to pComboUF.Items.Count do
      begin
        if pComboUF.Items.Strings[i] = pUFPadrao then
        begin
          pComboUF.ItemIndex := i;
          Break;
        end;
      end;
    end;
  end;
end;

end.
