object dmPrincipal: TdmPrincipal
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 298
  Width = 482
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=C:\Projetos\Extradigital\Database\TESTEEXTRADIGITAL.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 64
    Top = 40
  end
  object qryGeral: TFDQuery
    Connection = FDConnection
    Left = 56
    Top = 112
  end
  object dtsGeral: TDataSource
    DataSet = qryGeral
    Left = 120
    Top = 112
  end
  object qryMostraDadosPessoas: TFDQuery
    AfterScroll = qryMostraDadosPessoasAfterScroll
    Connection = FDConnection
    SQL.Strings = (
      'select * from pessoa')
    Left = 56
    Top = 168
    object qryMostraDadosPessoasIDPESSOA: TIntegerField
      FieldName = 'IDPESSOA'
      Origin = 'IDPESSOA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryMostraDadosPessoasNOMEPESSOA: TStringField
      FieldName = 'NOMEPESSOA'
      Origin = 'NOMEPESSOA'
      Required = True
      Size = 50
    end
    object qryMostraDadosPessoasCPF: TStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      Required = True
      Size = 14
    end
    object qryMostraDadosPessoasDATANASCIMENTO: TDateField
      FieldName = 'DATANASCIMENTO'
      Origin = 'DATANASCIMENTO'
    end
    object qryMostraDadosPessoasSEXO: TStringField
      FieldName = 'SEXO'
      Origin = 'SEXO'
      OnGetText = qryMostraDadosPessoasSEXOGetText
      FixedChar = True
      Size = 1
    end
    object qryMostraDadosPessoasTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Size = 14
    end
    object qryMostraDadosPessoasDATACADASTRO: TDateField
      FieldName = 'DATACADASTRO'
      Origin = 'DATACADASTRO'
    end
  end
  object dtsMostraDadosPessoas: TDataSource
    DataSet = qryMostraDadosPessoas
    Left = 184
    Top = 168
  end
end
