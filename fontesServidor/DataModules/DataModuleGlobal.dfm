object DM: TDM
  OnCreate = DataModuleCreate
  Height = 1200
  Width = 1600
  PixelsPerInch = 240
  object conn: TFDConnection
    Params.Strings = (
      'Database=C:\sistema-de-vendas-delphi\fontesServidor\DB\banco.db'
      'LockingMode=Normal'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 460
    Top = 420
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 720
    Top = 440
  end
end
