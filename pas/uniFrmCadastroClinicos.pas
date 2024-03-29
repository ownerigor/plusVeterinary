unit uniFrmCadastroClinicos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.ComCtrls, dxGDIPlusClasses, Vcl.ExtCtrls, Data.DB, OracleData, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxDBEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalc;

type
  TfrmCadastroClinicos = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label10: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel5: TPanel;
    Image2: TImage;
    Image4: TImage;
    Image5: TImage;
    Image7: TImage;
    Panel4: TPanel;
    Panel3: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Image6: TImage;
    qryClinicos: TOracleDataSet;
    dsClinicos: TDataSource;
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
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    procedure Image5Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure qryClinicosAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    v_Visualizacao : Boolean;
  end;

var
  frmCadastroClinicos: TfrmCadastroClinicos;

implementation

uses
  unidmConexao, uMensagem, uniFrmClinicos;

{$R *.dfm}

procedure TfrmCadastroClinicos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmClinicos.qryClinicos.Refresh;
end;

procedure TfrmCadastroClinicos.FormShow(Sender: TObject);
begin
  if v_Visualizacao = False then
  begin
    qryClinicos.Close;
    qryClinicos.SQL.Clear;
    qryClinicos.SQL.Text := 'SELECT CV.ROWID, CV.* FROM CLINICO_VETERINARIO CV';
    qryClinicos.Open;

    qryClinicosCOD_CLINICO.AsString     := '';
    qryClinicosNOME_CLINICIO.AsString   := '';
    qryClinicosRG_CLINICIO.AsString     := '';
    qryClinicosCPF_CLINICIO.AsString    := '';
    qryClinicosCRMV_CLINICIO.AsString   := '';
    qryClinicosRUA_CLINICIO.AsString    := '';
    qryClinicosNUMERO_CASA.AsString     := '';
    qryClinicosBAIRRO_CLINICIO.AsString := '';
    qryClinicosCIDADE_CLINICIO.AsString := '';
    qryClinicosESTADO_CLINICIO.AsString := '';
  end;
end;

procedure TfrmCadastroClinicos.Image2Click(Sender: TObject);
begin
  if qryClinicos.State in [dsEdit, dsInsert] then
  begin
    qryClinicos.Post;
    mostraMensagem(tpSucesso, 'Cl�nico salvo com sucesso! ');
  end;
end;

procedure TfrmCadastroClinicos.Image4Click(Sender: TObject);
begin
  qryClinicos.Edit;
end;

procedure TfrmCadastroClinicos.Image5Click(Sender: TObject);
begin
  qryClinicos.Append;
end;

procedure TfrmCadastroClinicos.Image7Click(Sender: TObject);
begin
  if mostraMensagem(tpPergunta, 'Deseja realmente excluir o registro selecionado?') = retSim then
    qryClinicos.Delete;
end;

procedure TfrmCadastroClinicos.qryClinicosAfterPost(DataSet: TDataSet);
begin
  dmConexao.oConnection.ApplyUpdates([qryClinicos], true);
end;

end.
