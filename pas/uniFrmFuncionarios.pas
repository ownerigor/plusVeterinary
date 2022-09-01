unit uniFrmFuncionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB,
  cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.StdCtrls, dxGDIPlusClasses, OracleData;

type
  TfrmFuncionarios = class(TForm)
    Panel1: TPanel;
    pnlHeader: TPanel;
    Label1: TLabel;
    Shape7: TShape;
    SpeedButton7: TSpeedButton;
    Panel8: TPanel;
    Image3: TImage;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    qryFuncionarios: TOracleDataSet;
    dsFuncionarios: TDataSource;
    qryFuncionariosCOD_FUNCIONARIO: TFloatField;
    qryFuncionariosNOME_FUNCIONARIO: TStringField;
    qryFuncionariosENDERECO_FUNCIONARIO: TStringField;
    qryFuncionariosCIDADE_FUNCIONARIO: TStringField;
    qryFuncionariosESTADO_FUNCIONARIO: TStringField;
    qryFuncionariosBAIRRO_FUNCIONARIO: TStringField;
    qryFuncionariosCELULAR_FUNCIONARIO: TStringField;
    qryFuncionariosCARGO_FUNCIONARIO: TStringField;
    qryFuncionariosCPF_FUNCIONARIO: TStringField;
    qryFuncionariosRG_FUNCIONARIO: TStringField;
    qryFuncionariosSALARIO_FUNCIONARIO: TFloatField;
    qryFuncionariosDT_NASCIMENTO_FUNCIONARIO: TDateTimeField;
    qryFuncionariosDT_ADMISSAO_FUNCIONARIO: TDateTimeField;
    qryFuncionariosVL_TICKET_FUNCIONARIO: TFloatField;
    qryFuncionariosSTATUS_FUNCIONARIO: TStringField;
    cxGrid1DBTableView1COD_FUNCIONARIO: TcxGridDBColumn;
    cxGrid1DBTableView1NOME_FUNCIONARIO: TcxGridDBColumn;
    cxGrid1DBTableView1ENDERECO_FUNCIONARIO: TcxGridDBColumn;
    cxGrid1DBTableView1CIDADE_FUNCIONARIO: TcxGridDBColumn;
    cxGrid1DBTableView1ESTADO_FUNCIONARIO: TcxGridDBColumn;
    cxGrid1DBTableView1BAIRRO_FUNCIONARIO: TcxGridDBColumn;
    cxGrid1DBTableView1CELULAR_FUNCIONARIO: TcxGridDBColumn;
    cxGrid1DBTableView1CARGO_FUNCIONARIO: TcxGridDBColumn;
    cxGrid1DBTableView1CPF_FUNCIONARIO: TcxGridDBColumn;
    cxGrid1DBTableView1RG_FUNCIONARIO: TcxGridDBColumn;
    cxGrid1DBTableView1SALARIO_FUNCIONARIO: TcxGridDBColumn;
    cxGrid1DBTableView1DT_NASCIMENTO_FUNCIONARIO: TcxGridDBColumn;
    cxGrid1DBTableView1DT_ADMISSAO_FUNCIONARIO: TcxGridDBColumn;
    cxGrid1DBTableView1VL_TICKET_FUNCIONARIO: TcxGridDBColumn;
    cxGrid1DBTableView1STATUS_FUNCIONARIO: TcxGridDBColumn;
    Image2: TImage;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFuncionarios: TfrmFuncionarios;

implementation

uses
  unidmConexao, uniFrmCadastroFuncionarios;

{$R *.dfm}

procedure TfrmFuncionarios.FormShow(Sender: TObject);
begin
  qryFuncionarios.Close;
  qryFuncionarios.Open;
end;

procedure TfrmFuncionarios.SpeedButton7Click(Sender: TObject);
begin
  if not Assigned(frmCadastroFuncionarios) then
    frmCadastroFuncionarios := TfrmCadastroFuncionarios.Create(Application);
  frmCadastroFuncionarios.ShowModal;

  FreeAndNil(frmCadastroFuncionarios);
end;

end.
