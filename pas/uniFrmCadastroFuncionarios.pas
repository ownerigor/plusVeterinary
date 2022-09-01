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
    Image6: TImage;
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
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
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
    cxDBDateEdit1: TcxDBDateEdit;
    Label3: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroFuncionarios: TfrmCadastroFuncionarios;

implementation

uses
  unidmConexao;

{$R *.dfm}

end.
