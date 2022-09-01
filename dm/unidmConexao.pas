unit unidmConexao;

interface

uses
  System.SysUtils, System.Classes, Data.DBXOracle, Data.DB, Data.SqlExpr, Oracle;

type
  TdmConexao = class(TDataModule)
    oConnection: TOracleSession;
    SQLConnection: TSQLConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmConexao: TdmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
