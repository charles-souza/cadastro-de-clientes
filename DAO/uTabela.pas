unit uTabela;

interface

uses
  System.SysUtils, System.Classes, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZAbstractTable, ZDataset, ZAbstractConnection, ZConnection,
  Vcl.DBCtrls, Vcl.StdCtrls, Datasnap.DBClient;

type
  TTabela = class(TDataModule)
    conexao: TZConnection;
    dsCliente: TDataSource;
    qryClientes: TZQuery;
    qryClientesCODIGO: TIntegerField;
    qryClientesNOME: TWideStringField;
    qryClientesENDERECO: TWideStringField;
    qryClientesCIDADE: TWideStringField;
    qryClientesUF: TWideStringField;
    qryClientesCPF: TWideStringField;
    qryClientesDATA_NASCIMENTO: TDateTimeField;
    qryClientesLIMITE_CREDITO: TFloatField;
    qryProxCodigo: TZQuery;
    qryProxCodigoSEQUENCE: TFloatField;
    qryUF: TZQuery;
    dsUF: TDataSource;
    qryUFUF: TWideStringField;
    qryUFDESCRICAO: TWideStringField;
    cdsCliente: TClientDataSet;
    cdsClienteCODIGO: TIntegerField;
    cdsClienteNOME: TStringField;
    cdsClienteCPF: TStringField;
    cdsClienteDATA_NASCIMENTO: TStringField;
    cdsClienteLIMITE_CREDITO: TFloatField;
    cdsClienteENDERECO: TStringField;
    cdsClienteCIDADE: TStringField;
    cdsClienteUF: TStringField;
  private
    { Private declarations }
  public
  end;

var
  Tabela: TTabela;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TTabela }

end.
