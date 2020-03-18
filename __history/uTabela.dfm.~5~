object Tabela: TTabela
  OldCreateOrder = False
  Height = 227
  Width = 468
  object conexao: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    Connected = True
    HostName = 'localhost'
    Port = 1521
    Database = 'xe'
    User = 'local'
    Password = 'local'
    Protocol = 'oracle'
    Left = 64
    Top = 40
  end
  object dsCliente: TDataSource
    DataSet = cdsCliente
    Left = 392
    Top = 16
  end
  object qryClientes: TZQuery
    Connection = conexao
    SQL.Strings = (
      'select * from clientes')
    Params = <>
    Left = 112
    Top = 96
    object qryClientesCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object qryClientesUF: TWideStringField
      FieldName = 'UF'
    end
    object qryClientesNOME: TWideStringField
      FieldName = 'NOME'
      Size = 50
    end
    object qryClientesENDERECO: TWideStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object qryClientesCIDADE: TWideStringField
      FieldName = 'CIDADE'
      Size = 50
    end
    object qryClientesCPF: TWideStringField
      FieldName = 'CPF'
      Size = 11
    end
    object qryClientesDATA_NASCIMENTO: TDateTimeField
      FieldName = 'DATA_NASCIMENTO'
    end
    object qryClientesLIMITE_CREDITO: TFloatField
      FieldName = 'LIMITE_CREDITO'
    end
  end
  object qryProxCodigo: TZQuery
    Connection = conexao
    SQL.Strings = (
      'SELECT SEQ_CLIENTES.NEXTVAL SEQUENCE FROM DUAL')
    Params = <>
    Left = 216
    Top = 120
    object qryProxCodigoSEQUENCE: TFloatField
      FieldName = 'SEQUENCE'
      ReadOnly = True
    end
  end
  object qryUF: TZQuery
    Connection = conexao
    SQL.Strings = (
      'select * from estados')
    Params = <>
    Left = 328
    Top = 136
    object qryUFUF: TWideStringField
      FieldName = 'UF'
      Required = True
      Size = 2
    end
    object qryUFDESCRICAO: TWideStringField
      FieldName = 'DESCRICAO'
    end
  end
  object dsUF: TDataSource
    DataSet = qryUF
    Left = 400
    Top = 88
  end
  object cdsCliente: TClientDataSet
    PersistDataPacket.Data = {
      E40000009619E0BD010000001800000008000000000003000000E40006434F44
      49474F0400010000000000044E4F4D4501004900000001000557494454480200
      020014000343504601004900000001000557494454480200020014000F444154
      415F4E415343494D454E544F0100490000000100055749445448020002001400
      0E4C494D4954455F4352454449544F080004000000000008454E44455245434F
      0100490000000100055749445448020002001400064349444144450100490000
      0001000557494454480200020014000255460100490000000100055749445448
      0200020014000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CPF'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DATA_NASCIMENTO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'LIMITE_CREDITO'
        DataType = ftFloat
      end
      item
        Name = 'ENDERECO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CIDADE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'UF'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 256
    Top = 24
    object cdsClienteCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsClienteNOME: TStringField
      FieldName = 'NOME'
    end
    object cdsClienteCPF: TStringField
      FieldName = 'CPF'
    end
    object cdsClienteDATA_NASCIMENTO: TStringField
      FieldName = 'DATA_NASCIMENTO'
    end
    object cdsClienteLIMITE_CREDITO: TFloatField
      FieldName = 'LIMITE_CREDITO'
    end
    object cdsClienteENDERECO: TStringField
      FieldName = 'ENDERECO'
    end
    object cdsClienteCIDADE: TStringField
      FieldName = 'CIDADE'
    end
    object cdsClienteUF: TStringField
      FieldName = 'UF'
    end
  end
end
