object DM: TDM
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object conn: TFDConnection
    Params.Strings = (
      'Database=C:\sistema-de-vendas-delphi\fontesServidor\DB\banco.db'
      'LockingMode=Normal'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 184
    Top = 168
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 288
    Top = 176
  end
end
