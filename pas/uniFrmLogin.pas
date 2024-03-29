unit uniFrmLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, dxGDIPlusClasses,
  Vcl.StdCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
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
  dxSkinXmas2008Blue, cxTextEdit, Data.DB, OracleData;

type
  TfrmLogin = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Image2: TImage;
    edtUsuario: TcxTextEdit;
    edtSenha: TcxTextEdit;
    Image3: TImage;
    qryLogin: TOracleDataSet;
    dsLogin: TDataSource;
    qryLoginCOD_USUARIO: TFloatField;
    qryLoginNOME_USUARIO: TStringField;
    qryLoginSENHA_USUARIO: TStringField;
    qryLoginNIVEL_USUARIO: TStringField;
    qryLoginSTATUS_USUARIO: TStringField;
    procedure Image2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure edtSenhaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses
  uniFrmMenuPrincipal, unidmConexao, uMensagem, AdmFun;

{$R *.dfm}

procedure TfrmLogin.edtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Image2Click(Self);
end;

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
  FrmLogin := Nil;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  qryLogin.Close;
  qryLogin.Open;
end;

procedure TfrmLogin.Image2Click(Sender: TObject);
begin
  if NotEmpty(edtSenha.Text) and NotEmpty(edtUsuario.Text) then
  begin
    if edtSenha.Text = Criptografar(QryLoginSENHA_USUARIO.AsString) then
    begin
      if not Assigned(frmMenuPrincipal) then
        frmMenuPrincipal := TfrmMenuPrincipal.Create(Application);

      frmMenuPrincipal.v_Usuario := qryLoginNOME_USUARIO.AsString;

      frmMenuPrincipal.ShowModal;

      FrmLogin.Close;
    end
    else
    begin
      mostraMensagem(tpErro, 'Senha incorreta.');
      Exit;
    end;
  end
  else
  begin
    mostraMensagem(tpErro, 'Informe os dados corretamente.');
  end;
end;

end.
