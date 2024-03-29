unit uniFrmClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  dxGDIPlusClasses, cxGraphics, cxControls, cxLookAndFeels,
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
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, OracleData, Vcl.Buttons;

type
  TfrmClientes = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    pnlHeader: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Panel4: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    qryClientes: TOracleDataSet;
    dsClientes: TDataSource;
    qryClientesCOD_CLIENTE: TFloatField;
    qryClientesNOME_CLIENTE: TStringField;
    qryClientesRG_CLIENTE: TStringField;
    qryClientesCPF_CLIENTE: TStringField;
    qryClientesRUA_CLIENTE: TStringField;
    qryClientesNUMERO_CASA: TFloatField;
    qryClientesBAIRRO_CLIENTE: TStringField;
    qryClientesCIDADE_CLIENTE: TStringField;
    qryClientesESTADO_CLIENTE: TStringField;
    cxGrid1DBTableView1COD_CLIENTE: TcxGridDBColumn;
    cxGrid1DBTableView1NOME_CLIENTE: TcxGridDBColumn;
    cxGrid1DBTableView1RG_CLIENTE: TcxGridDBColumn;
    cxGrid1DBTableView1CPF_CLIENTE: TcxGridDBColumn;
    cxGrid1DBTableView1RUA_CLIENTE: TcxGridDBColumn;
    cxGrid1DBTableView1NUMERO_CASA: TcxGridDBColumn;
    cxGrid1DBTableView1BAIRRO_CLIENTE: TcxGridDBColumn;
    cxGrid1DBTableView1CIDADE_CLIENTE: TcxGridDBColumn;
    cxGrid1DBTableView1ESTADO_CLIENTE: TcxGridDBColumn;
    Panel8: TPanel;
    Image3: TImage;
    Shape7: TShape;
    SpeedButton7: TSpeedButton;
    procedure Image5Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
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
  frmClientes: TfrmClientes;

implementation

uses
  unidmConexao, uMensagem, uniFrmCadastroClientes;

{$R *.dfm}

procedure TfrmClientes.cxGrid1DBTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  if not Assigned(frmCadastroClientes) then
    frmCadastroClientes := TfrmCadastroClientes.Create(Application);

  frmCadastroClientes.qryCadClientes.Close;
  frmCadastroClientes.qryCadClientes.SQL.Clear;
  frmCadastroClientes.qryCadClientes.SQL.Text := 'SELECT C.ROWID, C.* FROM CLIENTES C                               '+
                                                 'WHERE C.COD_CLIENTE = ''' + qryClientesCOD_CLIENTE.AsString + ''' ';
  frmCadastroClientes.qryCadClientes.Open;

  frmCadastroClientes.v_Visualizacao := True;

  frmCadastroClientes.ShowModal;

  frmCadastroClientes.v_Visualizacao := False;
  FreeAndNil(frmCadastroClientes);
end;

procedure TfrmClientes.FormShow(Sender: TObject);
begin
  qryClientes.Close;
  qryClientes.Open;
end;

procedure TfrmClientes.Image2Click(Sender: TObject);
begin
  if qryClientes.State in [dsEdit, dsInsert] then
  begin
    qryClientes.Post;
  end;
end;

procedure TfrmClientes.Image4Click(Sender: TObject);
begin
  qryClientes.Edit;
end;

procedure TfrmClientes.Image5Click(Sender: TObject);
begin
  qryClientes.Append;
end;

procedure TfrmClientes.Image7Click(Sender: TObject);
begin
  if mostraMensagem(tpPergunta, 'Deseja realmente excluir o registro selecionado?') = retSim then
    qryClientes.Delete;
end;

procedure TfrmClientes.SpeedButton7Click(Sender: TObject);
begin
  if not Assigned(frmCadastroClientes) then
    frmCadastroClientes := TfrmCadastroClientes.Create(Application);
  frmCadastroClientes.ShowModal;
end;

end.
