unit uMensagem;

interface

uses Vcl.Forms, System.SysUtils;

type TTipoMensagem  = (tpErro, tpInformacao, tpConfirmacao, tpSucesso, tpAtencao, tpPergunta);
type TRetornoMensagem = (retNull, retSim, retNao, retOk);
type TBotaoFocus      = (bfSim, bfNao);


function mostraMensagem(pTipoErro: TTipoMensagem; pMensagem: String; pTitulo: String = ''; pCaption: String = ''; pBotao: TBotaoFocus = bfSim): TRetornoMensagem;

implementation

uses untFrmMensagem;

function mostraMensagem(pTipoErro: TTipoMensagem; pMensagem: String; pTitulo: String = ''; pCaption: String = ''; pBotao: TBotaoFocus = bfSim): TRetornoMensagem;
begin
  frmMensagem := TfrmMensagem.Create(Application);

  case (pTipoErro) of
    tpErro       : begin
                     Result := retOk;
                     frmMensagem.imlMensagem.GetBitmap(0, frmMensagem.imgMensagem.Picture.Bitmap);
                     frmMensagem.btnOk.Visible := True;
                     frmMensagem.lblTitulo.Caption := 'Erro';
                     frmMensagem.Caption := pCaption;
                   end;

    tpInformacao : begin
                     Result := retOk;
                     frmMensagem.btnOk.Visible := True;
                     frmMensagem.imlMensagem.GetBitmap(1, frmMensagem.imgMensagem.Picture.Bitmap);
                     frmMensagem.lblTitulo.Caption := 'Informação';
                     frmMensagem.Caption := pCaption;
                   end;

    tpConfirmacao: begin
                     Result := retNao;
                     frmMensagem.btnSim.Visible := True;
                     frmMensagem.btnNao.Visible := True;
                     frmMensagem.imlMensagem.GetBitmap(2, frmMensagem.imgMensagem.Picture.Bitmap);
                     frmMensagem.lblTitulo.Caption := 'Confirmação';
                     frmMensagem.vFBotao := pBotao;
                     frmMensagem.Caption := pCaption;
                   end;

    tpPergunta   : begin
                     Result := retNao;
                     frmMensagem.btnSim.Visible := True;
                     frmMensagem.btnNao.Visible := True;
                     frmMensagem.imlMensagem.GetBitmap(4, frmMensagem.imgMensagem.Picture.Bitmap);
                     frmMensagem.lblTitulo.Caption := 'Confirmação';
                     frmMensagem.vFBotao := pBotao;
                     frmMensagem.Caption := pCaption;
                   end;

    tpSucesso    : begin
                     Result := retOk;
                     frmMensagem.btnOk.Visible := True;
                     frmMensagem.imlMensagem.GetBitmap(3, frmMensagem.imgMensagem.Picture.Bitmap);
                     frmMensagem.lblTitulo.Caption := 'Sucesso';
                     frmMensagem.Caption := pCaption;
                   end;

    tpAtencao    : begin
                     Result := retOk;
                     frmMensagem.btnOk.Visible := True;
                     frmMensagem.imlMensagem.GetBitmap(4, frmMensagem.imgMensagem.Picture.Bitmap);
                     frmMensagem.lblTitulo.Caption := 'Atenção';
                     frmMensagem.Caption := pCaption;
                   end;
  end;

  if (pTitulo <> '') then
    frmMensagem.lblTitulo.Caption := pTitulo;

  frmMensagem.lblMensagem.Caption := pMensagem;
  frmMensagem.vTipoMsg            := pTipoErro;

  frmMensagem.ShowModal;
  if (frmMensagem.vRetorno <> retNull) then
    Result := frmMensagem.vRetorno;

  FreeAndNil(frmMensagem);
end;

end.
