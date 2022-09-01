object dmConexao: TdmConexao
  OldCreateOrder = False
  Height = 549
  Width = 808
  object oConnection: TOracleSession
    LogonUsername = 'IGOR'
    LogonPassword = 'SWXAQZ33'
    LogonDatabase = 'SERVIDOR01'
    Preferences.ConvertUTF = cuUTF8ToUTF16
    Connected = True
    Left = 40
    Top = 184
  end
  object SQLConnection: TSQLConnection
    DriverName = 'Oracle'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXOracle'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DBXCommonDriver230.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=23.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXOracleMetaDataCommandFactory,DbxOracle' +
        'Driver230.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXOracleMetaDataCommandFac' +
        'tory,Borland.Data.DbxOracleDriver,Version=23.0.0.0,Culture=neutr' +
        'al,PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverORACLE'
      'LibraryName=dbxora.dll'
      'LibraryNameOsx=libsqlora.dylib'
      'VendorLib=oci.dll'
      'VendorLibWin64=oci.dll'
      'VendorLibOsx=libociei.dylib'
      'Database=FRIGODIL'
      'User_Name=FRIGODIL'
      'Password=SWXAQZ33'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'RowsetSize=20'
      'OSAuthentication=False'
      'MultipleTransactions=False'
      'TrimChar=False'
      'BlobSize=-1'
      'ErrorResourceFile='
      'OS Authentication=False'
      'Multiple Transaction=False'
      'Trim Char=False'
      'Decimal Separator=.')
    Left = 40
    Top = 136
  end
end
