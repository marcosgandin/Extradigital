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
    LoginPrompt = False
    Left = 64
    Top = 40
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection
    Left = 56
    Top = 112
  end
  object DataSource1: TDataSource
    Left = 120
    Top = 112
  end
end
