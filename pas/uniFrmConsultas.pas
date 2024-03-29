unit uniFrmConsultas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, dxGDIPlusClasses,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, OracleData, Vcl.Menus;

type
  TfrmConsultas = class(TForm)
    Panel1: TPanel;
    pnlHeader: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    qryConsultas: TOracleDataSet;
    dsConsultas: TDataSource;
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
    cxGrid1DBTableView1COD_CONSULTA: TcxGridDBColumn;
    cxGrid1DBTableView1COD_CLINICO_VET: TcxGridDBColumn;
    cxGrid1DBTableView1COD_DONO_ANIMAL: TcxGridDBColumn;
    cxGrid1DBTableView1NOME_ANIMAL: TcxGridDBColumn;
    cxGrid1DBTableView1IDADE_ANIMAL: TcxGridDBColumn;
    cxGrid1DBTableView1SEXO_ANIMAL: TcxGridDBColumn;
    cxGrid1DBTableView1RACA_ANIMAL: TcxGridDBColumn;
    cxGrid1DBTableView1RGA_ANIMAL: TcxGridDBColumn;
    cxGrid1DBTableView1COR_ANIMAL: TcxGridDBColumn;
    cxGrid1DBTableView1DT_NASC_ANIMAL: TcxGridDBColumn;
    cxGrid1DBTableView1HORA_CONSULTA: TcxGridDBColumn;
    cxGrid1DBTableView1DT_CONSULTA: TcxGridDBColumn;
    qryConsultasNOME_CLIENTE: TStringField;
    qryConsultasNOME_CLINICIO: TStringField;
    cxGrid1DBTableView1NOME_CLIENTE: TcxGridDBColumn;
    cxGrid1DBTableView1NOME_CLINICIO: TcxGridDBColumn;
    Panel8: TPanel;
    Image3: TImage;
    Shape7: TShape;
    SpeedButton7: TSpeedButton;
    qryConsultasSTATUS_CONSULTA: TStringField;
    PopupMenu1: TPopupMenu;
    FinalizarConsulta1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure FinalizarConsulta1Click(Sender: TObject);
    procedure cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultas: TfrmConsultas;

implementation

uses
  unidmConexao, uniFrmCadastroConsultas;

{$R *.dfm}

procedure TfrmConsultas.cxGrid1DBTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  if not Assigned(frmCadastroConsultas) then
    frmCadastroConsultas := TfrmCadastroConsultas.Create(Application);

  frmCadastroConsultas.qryConsultas.Close;
  frmCadastroConsultas.qryConsultas.SQL.Clear;
  frmCadastroConsultas.qryConsultas.SQL.Text := 'SELECT C.ROWID, C.*, CLI.NOME_CLIENTE, CV.NOME_CLINICIO               '+
                                                '  FROM CONSULTAS C                                                    '+
                                                ' INNER JOIN CLIENTES CLI                                              '+
                                                '    ON C.COD_DONO_ANIMAL = CLI.COD_CLIENTE                            '+
                                                ' INNER JOIN CLINICO_VETERINARIO CV                                    '+
                                                '    ON C.COD_CLINICO_VET = CV.COD_CLINICO                             '+
                                                ' WHERE C.COD_CONSULTA = ''' + qryConsultasCOD_CONSULTA.AsString + ''' ';
  frmCadastroConsultas.qryConsultas.Open;

  frmCadastroConsultas.v_Visualizacao := True;

  frmCadastroConsultas.ShowModal;

  frmCadastroConsultas.v_Visualizacao := False;
  FreeAndNil(frmCadastroConsultas);
end;

procedure TfrmConsultas.FinalizarConsulta1Click(Sender: TObject);
begin
  qryConsultas.Edit;
  qryConsultasSTATUS_CONSULTA.AsString := 'FINALIZADO';
  qryConsultas.Post;

  dmConexao.oConnection.ApplyUpdates([qryConsultas], true);
end;

procedure TfrmConsultas.FormShow(Sender: TObject);
begin
  qryConsultas.Close;
  qryConsultas.Open;
end;

procedure TfrmConsultas.SpeedButton7Click(Sender: TObject);
begin
  if not Assigned(frmCadastroConsultas) then
    frmCadastroConsultas := TfrmCadastroConsultas.Create(Application);
  frmCadastroConsultas.ShowModal;
end;

end.
