unit uniFrmClinicos;

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
  TfrmClinicos = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    pnlHeader: TPanel;
    Label1: TLabel;
    Shape7: TShape;
    SpeedButton7: TSpeedButton;
    Panel8: TPanel;
    Image3: TImage;
    Panel4: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    qryClinicos: TOracleDataSet;
    dsClinicos: TDataSource;
    Image6: TImage;
    qryClinicosCOD_CLINICO: TFloatField;
    qryClinicosNOME_CLINICIO: TStringField;
    qryClinicosRG_CLINICIO: TStringField;
    qryClinicosCPF_CLINICIO: TStringField;
    qryClinicosCRMV_CLINICIO: TStringField;
    qryClinicosRUA_CLINICIO: TStringField;
    qryClinicosNUMERO_CASA: TFloatField;
    qryClinicosBAIRRO_CLINICIO: TStringField;
    qryClinicosCIDADE_CLINICIO: TStringField;
    qryClinicosESTADO_CLINICIO: TStringField;
    cxGrid1DBTableView1COD_CLINICO: TcxGridDBColumn;
    cxGrid1DBTableView1NOME_CLINICIO: TcxGridDBColumn;
    cxGrid1DBTableView1RG_CLINICIO: TcxGridDBColumn;
    cxGrid1DBTableView1CPF_CLINICIO: TcxGridDBColumn;
    cxGrid1DBTableView1CRMV_CLINICIO: TcxGridDBColumn;
    cxGrid1DBTableView1RUA_CLINICIO: TcxGridDBColumn;
    cxGrid1DBTableView1NUMERO_CASA: TcxGridDBColumn;
    cxGrid1DBTableView1BAIRRO_CLINICIO: TcxGridDBColumn;
    cxGrid1DBTableView1CIDADE_CLINICIO: TcxGridDBColumn;
    cxGrid1DBTableView1ESTADO_CLINICIO: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClinicos: TfrmClinicos;

implementation

uses
  uMensagem, unidmConexao, uniFrmCadastroClinicos;

{$R *.dfm}

procedure TfrmClinicos.cxGrid1DBTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  if not Assigned(frmCadastroClinicos) then
    frmCadastroClinicos := TfrmCadastroClinicos.Create(Application);

  frmCadastroClinicos.qryClinicos.Close;
  frmCadastroClinicos.qryClinicos.SQL.Clear;
  frmCadastroClinicos.qryClinicos.SQL.Text := 'SELECT CV.ROWID, CV.* FROM CLINICO_VETERINARIO CV                 '+
                                              'WHERE CV.COD_CLINICO = ''' + qryClinicosCOD_CLINICO.AsString + ''' ';
  frmCadastroClinicos.qryClinicos.Open;

  frmCadastroClinicos.v_Visualizacao := True;

  frmCadastroClinicos.ShowModal;

  frmCadastroClinicos.v_Visualizacao := False;
  FreeAndNil(frmCadastroClinicos);
end;

procedure TfrmClinicos.FormShow(Sender: TObject);
begin
  qryClinicos.Close;
  qryClinicos.Open;
end;

procedure TfrmClinicos.SpeedButton7Click(Sender: TObject);
begin
  if not Assigned(frmCadastroClinicos) then
    frmCadastroClinicos := TfrmCadastroClinicos.Create(Application);
  frmCadastroClinicos.ShowModal;
end;

end.
