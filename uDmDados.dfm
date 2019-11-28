object DmDados: TDmDados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 219
  Width = 488
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 368
    Top = 88
    object ClientDataSet1Codigo: TIntegerField
      FieldName = 'Codigo'
    end
    object ClientDataSet1LimiteCredito: TFloatField
      FieldName = 'LimiteCredito'
    end
    object ClientDataSet1Nome: TStringField
      FieldName = 'Nome'
    end
    object ClientDataSet1CPF: TStringField
      FieldName = 'CPF'
    end
    object ClientDataSet1Endereco: TStringField
      FieldName = 'Endereco'
    end
    object ClientDataSet1DataNascimento: TDateField
      FieldName = 'DataNascimento'
    end
    object ClientDataSet1Cidade: TStringField
      FieldName = 'Cidade'
    end
    object ClientDataSet1UF: TStringField
      FieldName = 'UF'
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 192
    Top = 104
  end
end
