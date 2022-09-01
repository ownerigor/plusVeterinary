unit untFrmMensagem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Menus, System.ImageList,
  Vcl.ImgList, uMensagem, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinsDefaultPainters, cxButtons, dxGDIPlusClasses, dxSkinBlack,
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
  dxSkinTheAsphaltWorld, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue;

type
  TFrmMensagem = class(TForm)
    imlMensagem: TImageList;
    Panel2: TPanel;
    imgMensagem: TImage;
    lblTitulo: TLabel;
    lblMensagem: TLabel;
    btnSim: TcxButton;
    btnOk: TcxButton;
    btnNao: TcxButton;
    procedure btnSimClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnNaoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    vRetorno:  TRetornoMensagem;
    vFBotao:   TBotaoFocus;
    vTipoMsg:  TTipoMensagem;
  end;

var
  FrmMensagem: TFrmMensagem;

implementation

{$R *.dfm}

procedure TFrmMensagem.btnNaoClick(Sender: TObject);
begin
  vRetorno := retNao;
  Close;
end;

procedure TFrmMensagem.btnOkClick(Sender: TObject);
begin
  vRetorno := retOk;
  Close;
end;

procedure TFrmMensagem.btnSimClick(Sender: TObject);
begin
  vRetorno := retSim;
  Close;
end;

procedure TFrmMensagem.FormCreate(Sender: TObject);
begin
  lblTitulo.Caption := '';
  lblMensagem.Caption := '';
end;

procedure TFrmMensagem.FormShow(Sender: TObject);
begin
  if (vTipoMsg = tpConfirmacao) then
  begin
    case vFBotao of
      bfSim: btnSim.SetFocus;
      bfNao: BtnNao.SetFocus;
    end;
  end;

  vRetorno := retNull;
end;

end.
