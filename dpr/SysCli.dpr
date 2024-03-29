program SysCli;

uses
  Vcl.Forms,
  uniFrmMenuPrincipal in '..\pas\uniFrmMenuPrincipal.pas' {frmMenuPrincipal},
  uniFrmLogin in '..\pas\uniFrmLogin.pas' {frmLogin},
  AdmFun in '..\util\AdmFun.pas',
  untFrmMensagem in '..\util\untFrmMensagem.pas' {FrmMensagem},
  unidmConexao in '..\dm\unidmConexao.pas' {dmConexao: TDataModule},
  uMensagem in '..\pas\uMensagem.pas',
  uniFrmAdministracao in '..\pas\uniFrmAdministracao.pas' {frmAdministracao},
  comandosDashboard in '..\util\comandosDashboard.pas',
  uniFrmCadastros in '..\pas\uniFrmCadastros.pas' {frmCadastros},
  uniFrmConsultas in '..\pas\uniFrmConsultas.pas' {frmConsultas},
  uniFrmClientes in '..\pas\uniFrmClientes.pas' {frmClientes},
  uniFrmCadastroClientes in '..\pas\uniFrmCadastroClientes.pas' {frmCadastroClientes},
  uniFrmClinicos in '..\pas\uniFrmClinicos.pas' {frmClinicos},
  uniFrmCadastroClinicos in '..\pas\uniFrmCadastroClinicos.pas' {frmCadastroClinicos},
  uniFrmCadastroConsultas in '..\pas\uniFrmCadastroConsultas.pas' {frmCadastroConsultas},
  uniFrmFuncionarios in '..\pas\uniFrmFuncionarios.pas' {frmFuncionarios},
  uniFrmCadastroFuncionarios in '..\pas\uniFrmCadastroFuncionarios.pas' {frmCadastroFuncionarios};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TdmConexao, dmConexao);
  Application.Run;
end.
