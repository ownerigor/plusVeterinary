unit uniFrmCadastroFuncionarios;

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
  dxSkinXmas2008Blue, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxDBEdit;

type
  TfrmCadastroFuncionarios = class(TForm)
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
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Panel6: TPanel;
    Panel7: TPanel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
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
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Image1: TImage;
    DBComboBox1: TDBComboBox;
    Label12: TLabel;
    DBEdit3: TDBEdit;
    Label13: TLabel;
    Label14: TLabel;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    Label15: TLabel;
    Label16: TLabel;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    procedure Image5Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryFuncionariosAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroFuncionarios: TfrmCadastroFuncionarios;

implementation

uses
  unidmConexao, uMensagem, uniFrmFuncionarios;

{$R *.dfm}

procedure TfrmCadastroFuncionarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmFuncionarios.qryFuncionarios.Refresh;
end;

procedure TfrmCadastroFuncionarios.FormShow(Sender: TObject);
begin
  qryFuncionarios.Close;
  qryFuncionarios.Open;
end;

procedure TfrmCadastroFuncionarios.Image2Click(Sender: TObject);
begin
  if qryFuncionarios.State in [dsEdit, dsInsert] then
  begin
    qryFuncionarios.Post;
    mostraMensagem(tpSucesso, 'Funcionário salvo com sucesso! ');
  end;
end;

procedure TfrmCadastroFuncionarios.Image4Click(Sender: TObject);
begin
  qryFuncionarios.Edit;
end;

procedure TfrmCadastroFuncionarios.Image5Click(Sender: TObject);
begin
  qryFuncionarios.Append;
end;

procedure TfrmCadastroFuncionarios.Image7Click(Sender: TObject);
begin
  if mostraMensagem(tpPergunta, 'Deseja realmente excluir o registro selecionado?') = retSim then
    qryFuncionarios.Delete;
end;

procedure TfrmCadastroFuncionarios.qryFuncionariosAfterInsert(
  DataSet: TDataSet);
begin
  DBComboBox1.ItemIndex := 0;
end;

end.
