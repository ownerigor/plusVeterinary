unit uniFrmCadastroConsultas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ComCtrls, dxGDIPlusClasses, Data.DB, OracleData, cxGraphics,
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
  TfrmCadastroConsultas = class(TForm)
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
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Panel6: TPanel;
    Panel7: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    qryConsultas: TOracleDataSet;
    dsConsultas: TDataSource;
    qryClinico: TOracleDataSet;
    dsClinico: TDataSource;
    dsClientes: TDataSource;
    qryClientes: TOracleDataSet;
    DBEdit2: TDBEdit;
    qryConsultasCOD_CONSULTA: TFloatField;
    qryConsultasCOD_CLINICO_VET: TFloatField;
    qryConsultasCOD_DONO_ANIMAL: TFloatField;
    qryConsultasNOME_ANIMAL: TStringField;
    qryConsultasIDADE_ANIMAL: TFloatField;
    qryConsultasSEXO_ANIMAL: TStringField;
    qryConsultasRACA_ANIMAL: TStringField;
    qryConsultasRGA_ANIMAL: TStringField;
    qryConsultasCOR_ANIMAL: TStringField;
    qryConsultasDT_NASC_ANIMAL: TDateTimeField;
    qryConsultasHORA_CONSULTA: TStringField;
    qryConsultasDT_CONSULTA: TDateTimeField;
    qryConsultasNOME_CLIENTE: TStringField;
    qryConsultasNOME_CLINICIO: TStringField;
    qryClinicoCOD_CLINICO: TFloatField;
    qryClinicoNOME_CLINICIO: TStringField;
    qryClientesCOD_CLIENTE: TFloatField;
    qryClientesNOME_CLIENTE: TStringField;
    Panel8: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    Label12: TLabel;
    DBEdit5: TDBEdit;
    GroupBox1: TGroupBox;
    Label13: TLabel;
    DBEdit11: TDBEdit;
    Label14: TLabel;
    cxDBDateEdit1: TcxDBDateEdit;
    Image1: TImage;
    DBComboBox1: TDBComboBox;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Image7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    v_Visualizacao : Boolean;
  end;

var
  frmCadastroConsultas: TfrmCadastroConsultas;

implementation

uses
  unidmConexao, uniFrmClientes, uMensagem, uniFrmConsultas;

{$R *.dfm}

procedure TfrmCadastroConsultas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmConsultas.qryConsultas.Refresh;
end;

procedure TfrmCadastroConsultas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F10 : begin
               if not Assigned(frmClientes) then
                 frmClientes := TfrmClientes.Create(Application);
               frmClientes.ShowModal;
             end;
  end;

end;

procedure TfrmCadastroConsultas.FormShow(Sender: TObject);
begin
  qryConsultas.Close;
  qryConsultas.Open;

  qryClinico.Close;
  qryClinico.Open;

  qryClientes.Close;
  qryClientes.Open;

  if v_Visualizacao = False then
  begin
    qryConsultas.Close;
    qryConsultas.SQL.Clear;
    qryConsultas.SQL.Text := 'SELECT C.ROWID, C.*, CLI.NOME_CLIENTE, CV.NOME_CLINICIO '+
                             '  FROM CONSULTAS C                                      '+
                             ' INNER JOIN CLIENTES CLI                                '+
                             '    ON C.COD_DONO_ANIMAL = CLI.COD_CLIENTE              '+
                             ' INNER JOIN CLINICO_VETERINARIO CV                      '+
                             '    ON C.COD_CLINICO_VET = CV.COD_CLINICO               ';

    qryConsultas.Open;

    qryConsultasCOD_CONSULTA.AsString    := '';
    qryConsultasCOD_CLINICO_VET.AsString := '';
    qryConsultasCOD_DONO_ANIMAL.AsString := '';
    qryConsultasNOME_ANIMAL.AsString     := '';
    qryConsultasIDADE_ANIMAL.AsString    := '';
    qryConsultasSEXO_ANIMAL.AsString     := '';
    qryConsultasRACA_ANIMAL.AsString     := '';
    qryConsultasRGA_ANIMAL.AsString      := '';
    qryConsultasCOR_ANIMAL.AsString      := '';
    qryConsultasDT_NASC_ANIMAL.AsString  := '';
    qryConsultasHORA_CONSULTA.AsString   := '';
    qryConsultasDT_CONSULTA.AsString     := '';
  end;

end;

procedure TfrmCadastroConsultas.Image2Click(Sender: TObject);
begin
  if qryConsultas.State in [dsEdit, dsInsert] then
  begin
    qryConsultas.Post;
    mostraMensagem(tpSucesso, 'Consulta salva com sucesso! ');
  end;
end;

procedure TfrmCadastroConsultas.Image4Click(Sender: TObject);
begin
  qryConsultas.Edit;
end;

procedure TfrmCadastroConsultas.Image5Click(Sender: TObject);
begin
  qryConsultas.Append;
end;

procedure TfrmCadastroConsultas.Image7Click(Sender: TObject);
begin
  if mostraMensagem(tpPergunta, 'Deseja realmente excluir o registro selecionado?') = retSim then
    qryConsultas.Delete;
end;

end.
