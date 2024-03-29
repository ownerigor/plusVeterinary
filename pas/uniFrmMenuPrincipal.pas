unit uniFrmMenuPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, dxGDIPlusClasses,
  Vcl.StdCtrls;

type
  TfrmMenuPrincipal = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    pnlHeader: TPanel;
    pnlTelas: TPanel;
    Image3: TImage;
    Image4: TImage;
    Panel12: TPanel;
    imgMenuPrinicpal: TImage;
    Label5: TLabel;
    Label6: TLabel;
    Image5: TImage;
    lblDataHora: TLabel;
    lblNomeEmpresa: TLabel;
    tempoAtual: TTimer;
    pnlMenuUsuario: TPanel;
    pnlInformacoesUsuario: TPanel;
    Image1: TImage;
    lblNomeUsuario: TLabel;
    lblNivelUsuario: TLabel;
    Panel9: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Label4: TLabel;
    Image9: TImage;
    Panel6: TPanel;
    Label3: TLabel;
    Image8: TImage;
    Panel7: TPanel;
    Label2: TLabel;
    Image7: TImage;
    Panel8: TPanel;
    Label1: TLabel;
    Image6: TImage;
    Panel10: TPanel;
    imgAdministracao: TImage;
    Image2: TImage;
    Label7: TLabel;
    imgCadastros: TImage;
    procedure FormShow(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    v_Usuario : String;
    v_NomeEmpresa : string;

    procedure LoginSistema;
  end;

var
  frmMenuPrincipal: TfrmMenuPrincipal;

implementation

uses
  uniFrmLogin, uniFrmAdministracao, comandosDashboard, uMensagem;

{$R *.dfm}

procedure TfrmMenuPrincipal.FormShow(Sender: TObject);
begin
  LoginSistema;
end;

procedure TfrmMenuPrincipal.Image4Click(Sender: TObject);
begin
  if mostraMensagem(tpPergunta, 'Deseja realmente sair do sistema?') = retSim then
    Application.Terminate;
end;

procedure TfrmMenuPrincipal.Label1Click(Sender: TObject);
begin
  abrirAdministracao;
end;

procedure TfrmMenuPrincipal.Label2Click(Sender: TObject);
begin
  abrirCadastros;
end;

procedure TfrmMenuPrincipal.Label7Click(Sender: TObject);
begin
  abrirMenuPrincipal;
end;

procedure TfrmMenuPrincipal.LoginSistema;
  var
    v_DataHora : TDateTime;
begin
  lblNomeUsuario.Caption := v_Usuario;

  if (frmLogin.qryLoginNIVEL_USUARIO.AsInteger = 1) then
    lblNivelUsuario.Caption := 'Usu�rio'
  else if (frmLogin.qryLoginNIVEL_USUARIO.AsInteger = 2) then
    lblNivelUsuario.Caption := 'Financeiro'
  else
    lblNivelUsuario.Caption := 'Administrador';

  v_DataHora := Now();
  lblDataHora.Caption := DateTimeToStr(v_DataHora);

  v_NomeEmpresa := '- Fiorilli Software';
  lblNomeEmpresa.Caption := v_NomeEmpresa;
end;

end.
