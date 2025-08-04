object DMRotas: TDMRotas
  Height = 559
  Width = 710
  object NetHTTPClient1: TNetHTTPClient
    UserAgent = 'Embarcadero URI Client/1.0'
    Left = 200
    Top = 120
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 200
    Top = 208
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 200
    Top = 280
  end
  object FDConnection1: TFDConnection
    Left = 528
    Top = 392
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    Left = 544
    Top = 496
  end
end
