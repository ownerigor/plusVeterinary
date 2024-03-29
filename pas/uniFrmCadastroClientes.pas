unit uniFrmCadastroClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, OracleData,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
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
  dxSkinXmas2008Blue, dxGDIPlusClasses, cxDBEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalc, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.Buttons;

type
  TfrmCadastroClientes = class(TForm)
    Panel1: TPanel;
    dsCadClientes: TDataSource;
    qryCadClientes: TOracleDataSet;
    qryCadClientesCOD_CLIENTE: TFloatField;
    qryCadClientesNOME_CLIENTE: TStringField;
    qryCadClientesRG_CLIENTE: TStringField;
    qryCadClientesCPF_CLIENTE: TStringField;
    qryCadClientesRUA_CLIENTE: TStringField;
    qryCadClientesNUMERO_CASA: TFloatField;
    qryCadClientesBAIRRO_CLIENTE: TStringField;
    qryCadClientesCIDADE_CLIENTE: TStringField;
    qryCadClientesESTADO_CLIENTE: TStringField;
    Panel2: TPanel;
    Label10: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    qryCadClientesDATA_NASC_CLIENTE: TDateTimeField;
    qryCadClientesCEP_CLIENTE: TStringField;
    Panel5: TPanel;
    Image2: TImage;
    Image4: TImage;
    Image5: TImage;
    Image7: TImage;
    Panel4: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label11: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Panel6: TPanel;
    Panel7: TPanel;
    Label12: TLabel;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    DBEdit10: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label6: TLabel;
    DBEdit8: TDBEdit;
    Label5: TLabel;
    Label4: TLabel;
    DBEdit11: TDBEdit;
    Label3: TLabel;
    DBEdit4: TDBEdit;
    Image1: TImage;
    procedure Image5Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qryCadClientesAfterPost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    v_Visualizacao : Boolean;
  end;

var
  frmCadastroClientes: TfrmCadastroClientes;

implementation

uses
  uMensagem, unidmConexao, uniFrmClientes;

{$R *.dfm}

procedure TfrmCadastroClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmClientes.qryClientes.Refresh;
end;

procedure TfrmCadastroClientes.FormShow(Sender: TObject);
begin
  if v_Visualizacao = False then
  begin
    qryCadClientes.Close;
    qryCadClientes.SQL.Clear;
    qryCadClientes.SQL.Text := 'SELECT C.ROWID, C.* FROM CLIENTES C';
    qryCadClientes.Open;

    qryCadClientesCOD_CLIENTE.AsString       := '';
    qryCadClientesNOME_CLIENTE.AsString      := '';
    qryCadClientesRG_CLIENTE.AsString        := '';
    qryCadClientesCPF_CLIENTE.AsString       := '';
    qryCadClientesRUA_CLIENTE.AsString       := '';
    qryCadClientesNUMERO_CASA.AsString       := '';
    qryCadClientesBAIRRO_CLIENTE.AsString    := '';
    qryCadClientesCIDADE_CLIENTE.AsString    := '';
    qryCadClientesESTADO_CLIENTE.AsString    := '';
    qryCadClientesDATA_NASC_CLIENTE.AsString := '';
    qryCadClientesCEP_CLIENTE.AsString       := '';
  end;
end;

procedure TfrmCadastroClientes.Image2Click(Sender: TObject);
begin
  if qryCadClientes.State in [dsEdit, dsInsert] then
  begin
    qryCadClientes.Post;
    mostraMensagem(tpSucesso, 'Cliente salvo com sucesso! ');
  end;
end;

procedure TfrmCadastroClientes.Image4Click(Sender: TObject);
begin
  qryCadClientes.Edit;
end;

procedure TfrmCadastroClientes.Image5Click(Sender: TObject);
begin
  qryCadClientes.Append;
end;

procedure TfrmCadastroClientes.Image7Click(Sender: TObject);
begin
  if mostraMensagem(tpPergunta, 'Deseja realmente excluir o registro selecionado?') = retSim then
    qryCadClientes.Delete;
end;

procedure TfrmCadastroClientes.qryCadClientesAfterPost(DataSet: TDataSet);
begin
  dmConexao.oConnection.ApplyUpdates([qryCadClientes], true);
end;

end.
