unit AdmFun;

interface

uses
  Windows, Messages, SysUtils, WinTypes, WinProcs, Printers, DB, Dialogs, Registry, Clipbrd,CheckLst,
  Forms, Classes, Graphics, Controls, ToolWin, Math, StdCtrls,  DbxOracle, Variants,
  OracleData, WinInet, SysConst, WinSock, DateUtils, StrUtils, cxControls,cxClasses,cxDropDownEdit,
  dxNavBar, dxDockControl, dxNavBarCollns, dxDockPanel, IniFiles,ShellAPI, cxColorComboBox, cxShellComboBox,
  cxGrid, cxGridExportLink, ACBrETQ, ACBrBase, ACBrDevice, ACBrETQClass,
  DBClient ;

Type TTipoEnvio = (enviarLoteW,fecharEscalaW,cancelarLoteW,enviarItensW,retificarItemAbateW);

type TTrataEndereco = Record
     Logradouro  : String [15];
     Endereco    : String [60];
     Numero      : Integer;
end;

type TNFEntrada = Record
     VerificaImportacao  : String[1];
     VerDiferenca:         String[1];
     ConfirmouConferencia: Boolean;
end;
    //TPaginacao = Record Sql, Sql2: String; Inicial, Final, qtdRegistros : Integer; End;
    //TSql  = Record Sql, Sql2, Columns, From, Join, Where, Group, Having, Order : String; End;
    TFor  = Record I, II, III, IV, V, VI, VII, VIII, IX, X : Integer; Texto: String; End;


function SeparaEndereco (STR : String ): TTrataEndereco;
function MarcaItemFavoritos(Self: TForm; Caption: String): Boolean;
function CopiarDemarcado(Texto: String; Delimitador: Char): String;
// Funcao para Validar a Data com relacao ao ano 2000
// Funcao para criar N espacos
function Space(N: integer): string;

function UltimoDiaMes(Mdt: TDateTime) : TDateTime;
Function PrimeiroDiaMes(Data: TDateTime) : TDateTime;


// Funcao de codificacao de senha
function Codifica(S: string): string;

type
  TRoundToRange = -37..37;

// Arredondamento de Valores
function RoundTo(const AValue: Double; const ADigit: TRoundToRange): Double;

// Coloca zeros a esquerda
function StrZero(N: longint; Tamanho: integer): string;
function StrZeroString(N: string; Tamanho: integer): string;
function StrZero1(Num : Real ; Zeros,Deci: integer): string;
function StrZeroStringZero(N: string; Tamanho: integer): string;

// Reproduz um string varias vezes
function Repl(C: string; Tamanho: integer): string;
function retornaCodigoEstado(pEstado: String): Integer;
Function AjustaStr(str: String; tam: Integer): String;

// Tratamento de Erros No Oracle e Procedures
//Procedure MostraErros (Sender : Tobject ; E : Exception );

// Retorna o Dia de uma data
function Dia(Data: TDateTime): string;

// Retorna o Mes de uma data
function Mes(Data: TDateTime): string;

// Retorna o Mes/Ano de uma data
function MesAno(Data: TDateTime): string;

// Retorna o Ano de uma data
function Ano(Data: TDateTime): string;

// Retorna o Ano de uma data com dois digitos
function Ano2Dig(Data: TDateTime): string;

// Retorna o ultimo dia do mes
function UltimoDiaDoMes(MesAno: string): string;

// Retorna a data no formato MM/DD/AA
function MMDDAA(Data: string): string;

// Retira os espacos em branco da direita
function Trim(Dados: string): string;

// Retira os espacos em branco da direita
function AllTrim(Dados: string): string;

// Verifica se a string esta vazia
function Empty(Dados: string): boolean;

// Verifica se a string nao esta vazia }
function NotEmpty(Dados: string): boolean;

// Calcula o digito verificador
function Digito(Dados: string): boolean;

// Retorna uma string com zeros a esquerda
function Zeros(Dados: string; Tamanho: integer): string;

// Verifica se o CGC é valido
function C_G_C(Dados: string): boolean;

// Verifica se o CPF é valido
function C_P_F(Dados: string): boolean;

// Alinha algarismos a direita
function Transform(Conteudo: Extended; const Mascara: string): string;

// Funcao para formatacao de data
function FDateTime(const Mascara: string; Conteudo: TDateTime; Nulo: boolean): string;


procedure ValorExtenso(var VExt: array of string; nValor:Real ; cTextoIni,cTextoFim: string;
          nLinhas,nLargura: integer; cResto: Char; nMoeda: Integer);

// Procedure para Corrigir um Bug do Windows NT de Acess Violetion.
procedure Abortar;

// Limpa strings para serem convertidas em valores numericos
function LimpaNumeros(const Dados: string): string;
function SOLimpaNumeros(vValor: string): string;

// Função para Comparar duas Horas
function ComparaHora(Primeira,Segunda : String):String;

// Retorna o numero da Semana no mes
function SemanaDoMes(Data: TDateTime): Integer;

// Executar um Comando externo e Aguardar o Termino do mesmo.
function WinExecAndWait32(FileName: String; Visibility: integer):DWORD;

// Troca virgula por ponto
Function ConvValor(const wv:real): string;
// Troca ponto por virgula
Function ConvValorPonPorVir(const wv:string): string;

// Função para Capturar Linha e Coluna do RDPrint
Function Lin(Campo: String): Integer;
Function Col(Campo: String): Integer;

Function ValidaData(vDatF: TDateTime): Boolean;

// Rotina para formatacao de numero
function Formata_codigo_idx(codigo : String; maximo: Integer): String;

// Analisa retornoda Impressora Fiscal..
Procedure Analisa_iRetorno;

// Checar a Conectividade da Internet
function DetectarInternet: Boolean;

// Campturar o Nome do Computador;
function NomeComputador : String;

// Detectar Próximo dia Útil
Function ProximoDiaUtil (dData : TDateTime): TDateTime;

// Obter IP Local da Maquina
function GetLocalIP : string;

// verifica se numero é inteiro
function StrIsInteger(const S: string): boolean;
function StrIsFloat(const S: string): boolean;
function StrIsDate(const S: string): boolean;
function ValidarData(Data: TDateTime): Boolean;
function ConverteUF_DescCodigo(UF: String): String;
function ConverteUF_CodigoDesc(UF: String): String;
function Troca_virgula(Valor: string): String;
function NormalizarPalavra(texto: String): String;
function FormatarCEPDANFE(str: String): String;
function FormatarTelefoneDANFE(Fone: String): String;
function FormataDataDanfe(data: String): String;
function Formata_Nnf_DANFE(n_nf : String): String;
function Formata_CNPJ_CPF(strNum: String): String;
function ConfirmarDocumento(strDoc, TipoDoc: String): Boolean;
function StrIsEmailValido(str: String): Boolean;
Function RetornaDiadaSemana(Data : Tdatetime) : String;
function CalculaDigEAN13(Cod:String):String;
function ConvertePeso(cmd: String): String;
//function RemoveInvalid(NotToRemoveStr: String; FromStr: String): String;
function RemoveNumeros( const Dados: string ): string;
// Arredondar Decimais
Function Arredondar(value: double;casas : integer): double;
function justr(s : string; tamanho : integer) : string; // Ajusta String na memo
function justl(s : string; tamanho : integer) : string; // Ajusta linha da string da memo

function RemoveInvalid(NotToRemoveStr: WideString; FromStr: WideString): WideString; stdcall; export;
function Remove_Acentos(str: String): String;
function RemoveCaracterInvalidoEmail(str: String): String;
function FormatoAlfa(str: String): String;
function FormataPrazo(str: String): String;
function RetornaSenhaFrete(pCodigoCliente, pPedido: String; pDataLiberacao: TDate; pValorFrete: Double): String;

function GetFileDate(Arquivo: String): String;

//Criptografar e descriptografar senha do usuário
function Criptografar(wStri: String): String;

// configurar a impressora de etiquetas com acbr
// Listar Impressoras do Windows
Procedure ListarImpressoraSistema(pcxCombo : TcxComboBox; pTipo:Integer);
// executa uma sql Retorna uma string
// executa query nas consultas cxgrid passando apenas o nome qry oracle
procedure ExecutaQrySql(pQry : TOracleDataSet; pSql : String; pTipo: Integer);
// retornar lista todos os itens checados no checklistbox para SQL
// etiqueta personalizada AcbrEtiq
// Alinhar Texto
function AlinharTexto(pTexto: String; pTipo : Integer):String;
// Verifica se é zero ou nulo caso seja retorna 1 - Utilizado em divisoes a qual não pode ser nulo ou 0
function Coalesce(Value1: Variant; Value2: Variant): Variant;
// Compactar/Descompactar Arquivos Zip

// Troca Caracteres Especiais
function TrocaCaracterEspecial(aTexto : string): string;

function TrocaCaracterEspecial_InfAd_Sat(aTexto : string): string;

function DataExtenso(Data:TDateTime): String;

function NomedoMes(dData:TDatetime):string;

function FormatarMoeda( valor: string ): string;

//data e hora atual do banco
function calculaDescricaoLoteProducao(pCodProduto, pQtdProduzida : Double ) : String;

procedure Split(const Delimiter: Char; Value: string; const Strings: TStrings);

function TipoEnvio(Envio : TTipoEnvio): String;

type  Tnumeros = array[1..10] of string[15];
      Tmoeda   = array[1..3,1..2] of string[10];

var
  cTexto,cValor1,cPosicao1,cPosicao2,cPosicao3,cPosicao4 : string;
  cTipoMoeda: Byte;
  NF_Ent: TNFEntrada;
  URL_SERVIDOR : String;
  TOKEN_API    : String;
  AMBIENTE     : String;
  Envio        : TTipoEnvio;

const
AlfaArray : PChar = 'ABCDEFGHIJKLMNOPQRSTUVWXYZàâêôûãõáéíóúçüÀÂÊÔÛÃÕÁÉÍÓÚÇÜ 0123456789.;,<>?/[]{}*&^%$#@!_+-="`~\°ºª()|§'; // .;,<>?/[]{}*&^%$#@!_+-="`~\

aUnidade : Tnumeros = ('UM ','DOIS ','TRES ','QUATRO ','CINCO ','SEIS ','SETE ',
                      'OITO ','NOVE ','');
aDezena  : Tnumeros = ('DEZ ','VINTE ','TRINTA ','QUARENTA ','CINQUENTA ','SESSENTA ',
                      'SETENTA ','OITENTA ','NOVENTA ','');
aDezena2 : Tnumeros = ('DEZ ','ONZE ','DOZE ','TREZE ','QUATORZE ','QUINZE ',
                      'DEZESSEIS ','DEZESSETE  ','DEZOITO ','DEZENOVE ');
aCentena : Tnumeros = ('CENTO ','DUZENTOS ','TREZENTOS ','QUATROCENTOS ','QUINHENTOS ',
                      'SEISCENTOS ','SETECENTOS ','OITOCENTOS ' ,'NOVECENTOS ','');
aMilhar  : Tnumeros = ('MIL ','MILHAO ','MILHOES ','','','','','','','');
aMoeda   : Tmoeda   = (('',''),('DOLAR ','DOLARES '),
                      ('REAL ','REAIS '));
aCentavo : Tnumeros = ('CENTAVO','CENTAVOS','','','','','','','','');

implementation

function TipoEnvio(Envio : TTipoEnvio): String;
begin
 if Envio = enviarLoteW then
  Result := 'LOTE_ENVIADO'
 else
 if Envio = fecharEscalaW then
  Result := 'ESCALA_FECHADA'
 else
 if Envio = cancelarLoteW then
  Result := 'LOTE_CANCELADO'
  else
 if Envio = enviarItensW then
  Result := 'ITENS_ENVIADO'
  else
 if Envio = retificarItemAbateW then
  Result := 'ITENS_RETIFICADO';
end;


procedure Split(const Delimiter: Char; Value: string; const Strings: TStrings);
begin
  Assert(Assigned(Strings));
  Strings.Clear;
  Strings.DelimitedText := Value;
  Strings.Delimiter := Delimiter;
end;

function FormatarMoeda( valor: string ): string;
var
  decimais, centena, milhar: string;
  i: Integer;
begin
  Result := EmptyStr;

  for i := 0 to Length(valor) - 1 do
    if not CharInSet(valor[i], ['0' .. '9']) then
      delete(valor, i, 1);

  if copy(valor, 1, 1) = '0' then
    valor := copy(valor, 2, Length(valor));

  decimais := RightStr(valor, 2);
  centena := copy(RightStr(valor, 5), 1, 3);
  milhar := copy(RightStr(valor, 8), 1, 3);

  case Length(valor) of
    1:
      Result := '0,0' + valor;
    2:
      Result := '0,' + valor;
    6 .. 8:
      begin
        milhar := LeftStr(valor, Length(valor) - 5);
        Result := milhar + '.' + centena + ',' + decimais;
      end;
  else
    Result := LeftStr(valor, Length(valor) - 2) + ',' + decimais;
  end;
end;

function Criptografar(wStri: String): String;
var
  Simbolos : array [0..4] of String;
  x : Integer;
begin
  Simbolos[1]:= 'ABCDEFGHIJLMNOPQRSTUVXZYWK ~!@#$%^&*()';

  Simbolos[2]:= 'ÂÀ©Øû×ƒçêùÿ5Üø£úñÑªº¿®¬¼ëèïÙýÄÅÉæÆôöò»Á';

  Simbolos[3]:= 'abcdefghijlmnopqrstuvxzywk1234567890';

  Simbolos[4]:= 'áâäàåíóÇüé¾¶§÷ÎÏ-+ÌÓß¸°¨·¹³²Õµþîì¡«½';

  for x := 1 to Length(Trim(wStri)) do
  begin
    if pos(copy(wStri,x,1),Simbolos[1])>0 then
      Result := Result+copy(Simbolos[2], pos(copy(wStri,x,1),Simbolos[1]),1)
    else
    if pos(copy(wStri,x,1),Simbolos[2])>0 then
      Result := Result+copy(Simbolos[1], pos(copy(wStri,x,1),Simbolos[2]),1)
    else
    if pos(copy(wStri,x,1),Simbolos[3])>0 then
      Result := Result+copy(Simbolos[4], pos(copy(wStri,x,1),Simbolos[3]),1)
    else
    if pos(copy(wStri,x,1),Simbolos[4])>0 then
      Result := Result+copy(Simbolos[3], pos(copy(wStri,x,1),Simbolos[4]),1);
  end;
end;

function MarcaItemFavoritos(Self: TForm; Caption: String): Boolean;
var
 i: Integer;
begin
  Result := False;
  //Marca os Itens dos Meus Favoritos na tela de configuração
  for i:=0 to Self.ComponentCount - 1 do
    begin
      if (Self.Components[i] is TdxNavBarItem) then
        begin
          if (Caption = (Self.Components[i] as TdxNavBarItem).Caption) then
            Result := (Self.Components[i] as TdxNavBarItem).Visible;
        end;
    end;
end;

function CopiarDemarcado(Texto: String; Delimitador: Char): String;
begin
   Result :=  TrimRight(Copy(Texto, 1, pos(Delimitador, Texto)-1));
end;


function justl(s : string; tamanho : integer) : string;
var i : integer;
begin
  //Result:=Format('%-'+IntToStr(n)+'.'+IntToStr(n)+'s',[s]);
  i := tamanho-length(s);
  if i>0 then
    s := s+DupeString(' ', i);
  justl := s;
end;

function justr(s : string; tamanho : integer) : string;
var
  i : integer;
begin
  i := tamanho-length(s);
  if i > 0 then
    s := DupeString(' ', i)+s;
  justr := s;
end;

function GetFileDate(Arquivo: String): String;
var
FHandle: integer;
v_Data: TDateTime;
begin
//FHandle := FileOpen(Arquivo, 0);
//try
Result := FormatDateTime('DD/MM/YYYY HH:MM:SS',FileDateToDateTime(FileAge(Arquivo)));
//finally
//FileClose(FHandle);
//end;
end;

//-- Remove caracteres invalidos de uma String conforme String de caracteres válidos
//-- Usage: "NotToRemoveStr" is the Char Array NOT to be removed, "FromStr" is the ShortString to be removed from
function RemoveInvalid(NotToRemoveStr: WideString; FromStr: WideString): WideString; stdcall; export;
var
 Res, TempStr   : WideString;
 x, quantidade  : Integer;
begin
  TempStr    := UpperCase(FromStr);
  Res        := '';
  quantidade := Length(TempStr);

  for x := 1 to quantidade do begin
    if Pos(TempStr[x], NotToRemoveStr) <> 0 then
      Res := Res + FromStr[x];
  end;

  Result := Res;
end;

//-- Função remove caracteres acentuados de uma string substituindo os mesmos pela sua versão não acentuada
function Remove_Acentos(str: String): String;
var
  i, j: Integer;
const
 com_acento: array[1..52] of char = ('á','é','í','ó','ú','à','è','ì','ò','ù','â','ê','î','ô','û','ä','ë','ï',
                                     'ö','ü','ã','õ','ñ','ç','Á','É','Í','Ó','Ú','À','È','Ì','Ò','Ù','Â','Ê',
                                     'Î','Ô','Û','Ä','Ë','Ï','Ö','Ü','Ã','Õ','Ñ','Ç','ª','º','-', '''');

 sem_acento: array[1..52] of char = ('a','e','i','o','u','a','e','i','o','u','a','e','i','o','u','a','e','i',
                                     'o','u','a','o','n','c','A','E','I','O','U','A','E','I','O','U','A','E',
                                     'I','O','U','A','E','I','O','U','A','O','N','C',' ',' ',' ',' ');
begin
 for i := 1 to Length (str) do
  for j := 0 to High(com_acento) do
   if com_acento[j] = str[i] then
    str[i] := sem_acento[j];

 Result := AllTrim(str);
end;

function RemoveCaracterInvalidoEmail(str: String): String;
var
  i, j: Integer;
const
 com_acento: array[1..51] of char = ('á','é','í','ó','ú','à','è','ì','ò','ù','â','ê','î','ô','û','ä','ë','ï',
                                     'ö','ü','ã','õ','ñ','ç','Á','É','Í','Ó','Ú','À','È','Ì','Ò','Ù','Â','Ê',
                                     'Î','Ô','Û','Ä','Ë','Ï','Ö','Ü','Ã','Õ','Ñ','Ç','ª','º','''');

 sem_acento: array[1..51] of char = ('a','e','i','o','u','a','e','i','o','u','a','e','i','o','u','a','e','i',
                                     'o','u','a','o','n','c','A','E','I','O','U','A','E','I','O','U','A','E',
                                     'I','O','U','A','E','I','O','U','A','O','N','C',' ',' ',' ');
begin
 for i := 1 to Length (str) do
  for j := 0 to High(com_acento) do
   if com_acento[j] = str[i] then
    str[i] := sem_acento[j];

 Result := AllTrim(str);
end;

function TrocaCaracterEspecial(aTexto : string): string;  //Sol.17029
const
  //Lista de caracteres especiais
  xCarEsp: array[1..38] of String = ('á', 'à', 'ã', 'â', 'ä','Á', 'À', 'Ã', 'Â', 'Ä',
                                     'é', 'è','É', 'È','í', 'ì','Í', 'Ì',
                                     'ó', 'ò', 'ö','õ', 'ô','Ó', 'Ò', 'Ö', 'Õ', 'Ô',
                                     'ú', 'ù', 'ü','Ú','Ù', 'Ü','ç','Ç','ñ','Ñ');
  //Lista de caracteres para troca
  xCarTro: array[1..38] of String = ('a', 'a', 'a', 'a', 'a','A', 'A', 'A', 'A', 'A',
                                     'e', 'e','E', 'E','i', 'i','I', 'I',
                                     'o', 'o', 'o','o', 'o','O', 'O', 'O', 'O', 'O',
                                     'u', 'u', 'u','u','u', 'u','c','C','n', 'N');
  //Lista de Caracteres Extras
  xCarExt: array[1..56] of string = ('<','>','!','@','#','$','%','¨','&','*',
                                     '(',')','_','+','=','{','}','[',']','?',
                                     ';','ï','å','|','*','"','~','^','´','`',
                                     '¨','æ','Æ','ø','£','Ø','ƒ','ª','º','¿',
                                     '®','½','¼','ß','µ','þ','ý','Ý','¶','§',
                                     '€','°','','/','\',':'); //,'.',',');
var
  xTexto : string;
  i : Integer;
begin
   xTexto := aTexto;
   for i:=1 to 38 do
     xTexto := StringReplace(xTexto, xCarEsp[i], xCarTro[i], [rfreplaceall]);

   for i:=1 to 56 do
     xTexto := StringReplace(xTexto, xCarExt[i], '', [rfreplaceall]);

   Result := xTexto;
end;

function TrocaCaracterEspecial_InfAd_Sat(aTexto : string): string;
const
  //Lista de Caracteres Extras
  xCarExt: array[1..2] of string = ('|','"');
var
  xTexto : string;
  i : Integer;
begin
   xTexto := aTexto;

   for i:=1 to 2 do
     xTexto := StringReplace(xTexto, xCarExt[i], '', [rfreplaceall]);

   Result := xTexto;
end;

function DataExtenso(Data:TDateTime): String;
{Retorna uma data por extenso}
var
  NoDia : Integer;
  DiaDaSemana : array [1..7] of String;
  Meses : array [1..12] of String;
  Dia, Mes, Ano : Word;
begin
  { Dias da Semana }
  DiaDasemana [1]:= 'Domingo';
  DiaDasemana [2]:= 'Segunda-feira';
  DiaDasemana [3]:= 'Terçafeira';
  DiaDasemana [4]:= 'Quarta-feira';
  DiaDasemana [5]:= 'Quinta-feira';
  DiaDasemana [6]:= 'Sexta-feira';
  DiaDasemana [7]:= 'Sábado';

  { Meses do ano }
  Meses [1] := 'Janeiro';
  Meses [2] := 'Fevereiro';
  Meses [3] := 'Março';
  Meses [4] := 'Abril';
  Meses [5] := 'Maio';
  Meses [6] := 'Junho';
  Meses [7] := 'Julho';
  Meses [8] := 'Agosto';
  Meses [9] := 'Setembro';
  Meses [10]:= 'Outubro';
  Meses [11]:= 'Novembro';
  Meses [12]:= 'Dezembro';

  DecodeDate (Data, Ano, Mes, Dia);
  NoDia := DayOfWeek (Data);
  Result := DiaDaSemana[NoDia] + ', ' + IntToStr(Dia) + ' de ' + Meses[Mes]+ ' de ' + IntToStr(Ano);
end;

function NomedoMes(dData:TDatetime):string;
var
nAno,nMes,nDia:word;
cMes:array[1..12] of string;
begin
  cMes[01] := 'Janeiro';
  cMes[02] := 'Fevereiro';
  cMes[03] := 'Março';
  cMes[04] := 'Abril';
  cMes[05] := 'Maio';
  cMes[06] := 'Junho';
  cMes[07] := 'Julho';
  cMes[08] := 'Agosto';
  cMes[09] := 'Setembro';
  cMes[10] := 'Outubro';
  cMes[11] := 'Novembro';
  cMes[12] := 'Dezembro';
  decodedate(dData,nAno,nMes,nDia);
  if (nMes>=1) and (nMes<=13)then
    Result:=cMes[nMes]
  else
    Result:='';
end;

function FormatoAlfa(str: String): String;
//function FormatoAlfa(var str: String; value: String): Boolean;
begin
  str    := RemoveInvalid(AlfaArray, str);
  str    := Remove_Acentos(str);
  Result := str;

end;

function RemoveNumeros( const Dados: string ): string;
var
  Contar: integer;
begin
  Result := '';
  for Contar := 1 to Length( Dados ) do
  begin
   if not(Pos( Copy( Dados, Contar, 1 ) ,'0123456789,º' ) > 0) and
      not(Pos( Copy( Dados, Contar, 2 ) ,'Nº' ) > 0)  then
      Result := Result + Copy( Dados, Contar, 1 );
  end;
end;


function SeparaEndereco(Str: String): TTrataEndereco;
Var
  iPos: Integer;
Begin
  case AnsiIndexStr(UpperCase(Copy(str,1,2)), ['R ', 'RU', 'AV', 'TR', 'AE', 'AP', 'AL', 'BC', 'BL', 'CA', 'ES', 'ET', 'FA', 'FO', 'GL', 'LD', 'LG', 'PÇ', 'PR', 'QD', 'KM', 'QT', 'RO', 'VD', 'VL']) of
    0 : Result.Logradouro := 'RUA';
    1 : Result.Logradouro := 'RUA';
    2 : Result.Logradouro := 'AVENIDA';
    3 : Result.Logradouro := 'TRAVESSA';
    4 : Result.Logradouro := 'AEROPORTO';
    5 : Result.Logradouro := 'APARTAMENTO';
    6 : Result.Logradouro := 'ALAMEDA';
    7 : Result.Logradouro := 'BECO';
    8 : Result.Logradouro := 'BLOCO';
    9 : Result.Logradouro := 'CAMINHO';
    10 : Result.Logradouro := 'ESTACAO';
    11 : Result.Logradouro := 'ESTRADA';
    12 : Result.Logradouro := 'FAZENDA';
    13 : Result.Logradouro := 'FORTALEZA';
    14 : Result.Logradouro := 'GALERIA';
    15 : Result.Logradouro := 'LADEIRA';
    16 : Result.Logradouro := 'LARGO';
    17 : Result.Logradouro := 'PRACA';
    18 : Result.Logradouro := 'PARQUE';
    19 : Result.Logradouro := 'QUADRA';
    20 : Result.Logradouro := 'QUILOMETRO';
    21 : Result.Logradouro := 'QUINTA';
    22 : Result.Logradouro := 'RODOVIA';
    23 : Result.Logradouro := 'VIADUTO';
    24 : Result.Logradouro := 'VILA';
  else
    Result.Logradouro := 'OUTROS';
  end;

  iPos := Pos(' ',str );
  Result.Endereco := RemoveNumeros(Copy(str,iPos,(Length(str)-(iPos-1))));   // RemoveNumeros

  if NotEmpty(LimpaNumeros(str)) then
    Result.Numero := StrToInt(Copy(LimpaNumeros(str),1,6))
  else
    Result.Numero := 0000000000;
End;

function ConvertePeso(cmd: String): String;
var A : Integer ;
begin
  Result := '' ;
  For A := 1 to length( cmd ) do
  begin
     if not (cmd[A] in ['A'..'Z','a'..'z','0'..'9',
                        ' ','.',',','/','?','<','>',';',':',']','[','{','}',
                        '\','|','=','+','-','_',')','(','*','&','^','%','$',
                        '#','@','!','~',']' ]) then
        Result := Result + '#' + IntToStr(ord( cmd[A] )) + ' '
     else
        Result := Result + cmd[A] + ' ';
  end ;
end;

function CalculaDigEAN13(Cod:String):String;
function Par(Cod:Integer):Boolean;
begin
   Result:= Cod Mod 2 = 0;
end;
var i,SomaPar,SomaImpar:Integer;
begin
  SomaPar:=0;SomaImpar:=0;
  for i:=1 to 12 do
    if Par(i) then
       SomaPar:=SomaPar+StrToInt(Cod[i])
   else
       SomaImpar:=SomaImpar+StrToInt(Cod[i]);
   SomaPar:=SomaPar*3;i:=0;
   while i < (SomaPar+SomaImpar)do
   Inc(i,10);
   Result:=IntToStr(i-(SomaPar+SomaImpar));
end;


Function PrimeiroDiaMes (Data : TDateTime) : TDateTime;
var
  Ano, Mes, Dia : word;
  DiaDaSemana : Integer;
begin
  DecodeDate (Data, Ano, Mes, Dia);
  Dia := 1;
  PrimeiroDiaMes := EncodeDate (Ano, Mes, Dia);
end;


Function RetornaDiadaSemana(Data : Tdatetime) : String;
begin
case DayOfWeek(Data) of
  1:result:='Domingo';
  2:result:='Segunda-feira';
  3:result:='Terça-feira';
  4:result:='Quarta-feira';
  5:result:='Quinta-feira';
  6:result:='Sexta-feira';
  7:result:='Sábado';
else
  Result:='';
end;
end;


function StrIsEmailValido(str: String): Boolean;
var
  i : Integer;
  status : Integer;
begin
  Result := False;
  status := -1;
  for i:= 1 to Length(str)-1 do begin
    if str[i] = '@' then
      status := 1;
  end;
  if status = 1 then
    Result := True;
end;

function ConfirmarDocumento(strDoc, TipoDoc: String): Boolean;
begin
  Result := True;
  if TipoDoc = 'CPF' then begin
    if (strDoc = '') OR (strDoc = ' ') OR (strDoc = '   .   .   -') OR (Copy(strDoc,1,2) = '  ') OR (strDoc = '___.___.___-__') OR (strDoc = '000.000.000-00') then
      Result := False;
  end
  else
  if TipoDoc = 'CNPJ' then begin
    if (strDoc = '') OR (strDoc = ' ') OR (strDoc = '  .   .   /    -') OR (Copy(strDoc,1,2) = '  ') OR (strDoc = '00.000.000/0000-00') then
      Result := False;
  end
  else
    Result := False;
end;

function Formata_CNPJ_CPF(strNum: String): String;
var
  documento : String;
begin
  Result := '';
  documento := '';

  if Length(strNum) = 11 then
    // ___.___.___-__
    documento := copy(strNum,1,3) +'.'+ copy(strNum,4,3) +'.'+ copy(strNum,7,3) +'-'+ copy(strNum,10,2)
  else
  if Length(strNum) = 14 then
    // __.___.___/____-__
    documento := copy(strNum,1,2) +'.'+ copy(strNum,3,3) +'.'+ copy(strNum,6,3) +'/'+ copy(strNum,9,4) +'-'+ copy(strNum,13,2);

  Result := documento;
end;

function FormataPrazo(str: String): String;
var
  documento : String;
begin
  Result := '';
  documento := '';
  // __X___/___
  documento := copy(str,1,2) +'X'+ copy(str,3,3) +'/'+ copy(str,6,3);
  Result := documento;
end;

function Formata_Nnf_DANFE(n_nf : String): String;
var
 tamanho, i    : Integer;
 num_formatado : String;
begin
  tamanho := Length(n_nf);
  Result  := '';

  if (tamanho < 9) then begin
    for i:= 1 to 9-tamanho do begin
      Result := '0' + Result;
    end;
    num_formatado := Result + n_nf;
    num_formatado := copy(num_formatado, 1, 3)+'.'+ copy(num_formatado, 4, 3)+'.'+ copy(num_formatado, 7, 3);
    Result        := num_formatado;
  end
  else begin
    num_formatado := n_nf;
    num_formatado := copy(num_formatado, 1, 3)+'.'+ copy(num_formatado, 4, 3)+'.'+ copy(num_formatado, 7, 3);
    Result        := num_formatado;
  end;
end;

//-- Rotina de formatacao de data para impressao do DANFE
function FormataDataDanfe(data: String): String;
var
  str_dia, str_mes, str_ano : String;
begin
  str_ano := copy(data, 1, 4);
  str_mes := copy(data, 6, 2);
  str_dia := copy(data, 9, 2);
  Result  := str_dia+'/'+str_mes+'/'+str_ano;
end;

function FormatarTelefoneDANFE(Fone: String): String;
var
  Area      : String;
  DDD       : String;
  Prefixo   : String;
  Numero    : String;
  Telefone  : String;
  Caracter  : String;
  Ind       : Integer;
  Estado    : Integer; // 0-DDD, 1-Prefixo, 2-Numero
begin
  Ind       := 1;
  DDD       := '';
  Prefixo   := '';
  Numero    := '';
  Estado    := -1;
  Telefone  := '';

  while ind <= length(Fone) do begin
    caracter := Copy(Fone,ind,1);

    if caracter = '(' then begin
      Estado := 0;
    end
    else begin
      if caracter = ')' then begin
        if Estado = 0 then begin
          Estado := 1;
        end;
      end
      else begin
        if caracter = '-' then begin
          if Estado = 1 then begin
            Estado := 2;
          end;
        end;
      end;
    end;

    case Estado of
      0 : DDD     := DDD + Caracter;
      1 : Prefixo := Prefixo + Caracter;
      2 : Numero  := Numero + Caracter;
    end;

    Ind := Ind + 1;
  end;

  if Estado = -1 then begin
    Telefone := Fone;
    if Length(Telefone) = 10 then begin
      Result := '('+Copy(Telefone,1,2)+') '+Copy(Telefone,3,4)+'-'+Copy(Telefone,7,4);
    end
    else begin
      if Length(Telefone) = 7 then begin
        Result := '('+Area+') '+Copy(Telefone,1,3)+'-'+Copy(Telefone,4,4)
      end
      else begin
        Result := Fone;
      end;
    end;
  end
  else begin
    if Length(DDD) = 0 then begin
      DDD := Area;
    end;
    if Length(Numero) = 0 then begin
      Result := '('+DDD+') '+Prefixo
    end
    else begin
      Result := '('+DDD+') '+Prefixo+'-'+Numero;
    end;
  end;
end;

function FormatarCEPDANFE(str: String): String;
begin
  if Length(str) = 8 then begin
    Result := Copy(str,1,5)+'-'+Copy(str,6,3);
  end
  else
    Result := '';
end;

function NormalizarPalavra(texto: String): String;
var
  st            : TStringList;
  i, quantidade : Integer;
  palavra       : String;
begin
  st := TStringList.Create;
  //-- informa qual caractere delimitador
  st.Delimiter := ' ';

  //-- informar o texto delimitado - não importa a quantidade de espaços que irá separar os campos
  st.DelimitedText := texto;
  quantidade       := st.count; //Length(texto);
  palavra          := '';

  for i:= 0 to quantidade-1 do begin
    Application.ProcessMessages;
    st.Strings[i];
    palavra := palavra +' '+ st.Strings[i];
  end;

  st.Free;
  //-- Retira caracteres invalidos e retira acentos
  Result := palavra;
end;

function Troca_virgula(Valor: string): String;
var
  i: integer;
begin
  if Valor <> '' then begin
    for i := 1 to Length(Valor) do begin
      if Valor[i]='.' then begin
        Valor[i]:=',';
      end
      else if Valor[i] = ',' then begin
        Valor[i]:='.';
      end;
    end;
  end;
  Result := Valor;
end;


//-- Rotina verifica codigo do estado.
function ConverteUF_CodigoDesc(UF: String): String;
begin
  Result:= '00';
  //-- REGIAO NORTE
  if (UF = '11') then Result:= 'RO - Rondônia';            // RO Rondônia
  if (UF = '12') then Result:= 'AC - Acre';                // AC Acre
  if (UF = '13') then Result:= 'AM - Amazonas';            // AM Amazonas
  if (UF = '14') then Result:= 'RR - Roraima';             // RR Roraima
  if (UF = '15') then Result:= 'PA - Pará';                // PA Pará
  if (UF = '16') then Result:= 'AP - Amapá';               // AP Amapá
  if (UF = '17') then Result:= 'TO - Tocantins';           // TO Tocantins
  //-- REGIAO NORDESTE
  if (UF = '21') then Result:= 'MA - Maranhão';            // MA Maranhão
  if (UF = '22') then Result:= 'PI - Piauí';               // PI Piauí
  if (UF = '23') then Result:= 'CE - Ceará';               // CE Ceará
  if (UF = '24') then Result:= 'RN - Rio grande do Norte'; // RN Rio grande do Norte
  if (UF = '25') then Result:= 'PB - Paraíba';             // PB Paraíba
  if (UF = '26') then Result:= 'PE - Pernambuco';          // PE Pernambuco
  if (UF = '27') then Result:= 'AL - Alagoas';             // AL Alagoas
  if (UF = '28') then Result:= 'SE - Sergipe';             // SE Sergipe
  if (UF = '29') then Result:= 'BA - Bahia';               // BA Bahia
  //-- REGIAO SUDESTE
  if (UF = '31') then Result:= 'MG - Minas Gerais';        // MG Minas Gerais
  if (UF = '32') then Result:= 'ES - Espírito Santo';      // ES Espírito Santo
  if (UF = '33') then Result:= 'RJ - Rio de Janeiro';      // RJ Rio de Janeiro
  if (UF = '35') then Result:= 'SP - São Paulo';           // SP São Paulo
  //-- REGIAO SUL
  if (UF = '41') then Result:= 'PR - Paraná';              // PR Paraná
  if (UF = '42') then Result:= 'SC - Santa Catarina';      // SC Santa Catarina
  if (UF = '43') then Result:= 'RS - Rio Grande do Sul';   // RS Rio Grande do Sul
  //--  REGIAO CENTRO-OESTE
  if (UF = '50') then Result:= 'MS - Mato Grosso do Sul';  // MS Mato Grosso do Sul
  if (UF = '51') then Result:= 'MT - Mato Grosso';         // MT Mato Grosso
  if (UF = '52') then Result:= 'GO - Goiás';               // GO Goiás
  if (UF = '53') then Result:= 'DF - Distrito Federal';    // DF Distrito Federal
end;

//-- Rotina verifica codigo do estado.
function ConverteUF_DescCodigo(UF: String): String;
begin
  Result:= '00';
  //REGIAO NORTE
  if (UF = 'RONDONIA')            then Result:= '11'; // RO Rondônia
  if (UF = 'ACRE')                then Result:= '12'; // AC Acre
  if (UF = 'AMAZONAS')            then Result:= '13'; // AM Amazonas
  if (UF = 'RORAIMA')             then Result:= '14'; // RR Roraima
  if (UF = 'PARA')                then Result:= '15'; // PA Pará
  if (UF = 'AMAPA')               then Result:= '16'; // AP Amapá
  if (UF = 'TOCANTINS')           then Result:= '17'; // TO Tocantins
  //REGIAO NORDESTE
  if (UF = 'MARANHAO')            then Result:= '21'; // MA Maranhão
  if (UF = 'PIAUI')               then Result:= '22'; // PI Piauí
  if (UF = 'CEARA')               then Result:= '23'; // CE Ceará
  if (UF = 'RIO GRANDE DO NORTE') then Result:= '24'; // RN Rio grande do Norte
  if (UF = 'PARAIBA')             then Result:= '25'; // PB Paraíba
  if (UF = 'PERNAMBUCO')          then Result:= '26'; // PE Pernambuco
  if (UF = 'ALAGOAS')             then Result:= '27'; // AL Alagoas
  if (UF = 'SERGIPE')             then Result:= '28'; // SE Sergipe
  if (UF = 'BAHIA')               then Result:= '29'; // BA Bahia
  //REGIAO SUDESTE
  if (UF = 'MINAS GERAIS')        then Result:= '31'; // MG Minas Gerais
  if (UF = 'ESPIRITO SANTO')      then Result:= '32'; // ES Espírito Santo
  if (UF = 'RIO DE JANEIRO')      then Result:= '33'; // RJ Rio de Janeiro
  if (UF = 'SAO PAULO')           then Result:= '35'; // SP São Paulo
  //REGIAO SUL
  if (UF = 'PARANA')              then Result:= '41'; // PR Paraná
  if (UF = 'SANTA CATARINA')      then Result:= '42'; // SC Santa Catarina
  if (UF = 'RIO GRANDE DO SUL')   then Result:= '43'; // RS Rio Grande do Sul
  //REGIAO CENTRO-OESTE
  if (UF = 'MATO GROSSO DO SUL')  then Result:= '50'; // MS Mato Grosso do Sul
  if (UF = 'MATO GROSSO')         then Result:= '51'; // MT Mato Grosso
  if (UF = 'GOIAS')               then Result:= '52'; // GO Goiás
  if (UF = 'DISTRITO FEDERAL')    then Result:= '53'; // DF DISTRITO FEDERAL
end;

function ValidarData(Data: TDateTime): Boolean;
Var
  Ano, Mes, Dia : Word;
Begin
   Result := False;
   DecodeDate(Data, Ano, Mes, Dia);

   if IsValidDate(Ano, Mes, Dia) Then
     Result := True;
end;

function StrIsInteger(const S: string): boolean;
begin
  try
    StrToInt(S);
    Result := true;
  except
    Result := false;
  end;
end;

function StrIsFloat(const S: string): boolean;
begin
  try
    StrToFloat(S);
    Result := true;
  except
    Result := false;
  end;
end;

function StrIsDate(const S: string): boolean;
begin
  try
    StrToDate(S);
    Result := true;
  except
    Result := false;
  end;
end;


function GetLocalIP : string;
type
  TaPInAddr = array [0..10] of PInAddr;
  PaPInAddr = ^TaPInAddr;
var
  phe : PHostEnt;
  pptr : PaPInAddr;
  Buffer : array [0..63] of Ansichar;  I : Integer;
  GInitData : TWSADATA;
begin
  WSAStartup($101, GInitData);
  Result := '';
  GetHostName(Buffer, SizeOf(Buffer));
  phe :=GetHostByName(buffer);

  if phe = nil then
    Exit;
  pptr := PaPInAddr(Phe^.h_addr_list);
  I := 0;

  while pptr^[I] <> nil do begin
  result:=StrPas(inet_ntoa(pptr^[I]^));
  result := StrPas(inet_ntoa(pptr^[I]^));
  Inc(I);
  end;

  WSACleanup;
end;

Function ProximoDiaUtil(dData : TDateTime): TDateTime;
begin
  if DayOfWeek(dData) = 7 then
    dData := dData + 2
  else
  if DayOfWeek(dData) = 1 then
    dData := dData + 1;
  ProximoDiaUtil := dData;
end;

function DetectarInternet: Boolean;
var
  Flags : dword;
begin
  Result := InternetGetConnectedState(@Flags, 0);
end;

function NomeComputador : String;
var
  lpBuffer : PChar;
  nSize : DWord;
  const Buff_Size = MAX_COMPUTERNAME_LENGTH + 1;
begin
  nSize := Buff_Size;
  lpBuffer := StrAlloc(Buff_Size);
  GetComputerName(lpBuffer,nSize);
  Result := String(lpBuffer);
  StrDispose(lpBuffer);
end;

Procedure Analisa_iRetorno();
var
  iRetorno: Integer;
begin
  if iRetorno = 0 then
    Application.MessageBox('Erro de Comunicação !','Erro', MB_IconError + MB_OK);

  If iRetorno = -1 Then
    Application.MessageBox('Erro de Execução na Função. Verifique!','Erro', MB_IconError + MB_OK);

  if iRetorno = -2 then
    Application.MessageBox('Parâmetro Inválido !','Erro', MB_IconError + MB_OK);

  if iRetorno = -3 then
    Application.MessageBox('Alíquota não programada !','Atenção', MB_IconInformation + MB_OK);

  If iRetorno = -4 Then
    Application.MessageBox('Arquivo BemaFI32.INI não encontrado. Verifique!','Atenção', MB_IconInformation + MB_OK);

  If iRetorno = -5 Then
    Application.MessageBox('Erro ao Abrir a Porta de Comunicação','Erro', MB_IconError + MB_OK);

  If iRetorno = -6 Then
    Application.MessageBox('Impressora Desligada ou Desconectada','Atenção', MB_IconInformation + MB_OK);

  If iRetorno = -7 Then
    Application.MessageBox('Banco Não Cadastrado no Arquivo BemaFI32.ini','Atenção', MB_IconInformation + MB_OK);

  If iRetorno = -8 Then
    Application.MessageBox('Erro ao Criar ou Gravar no Arquivo Retorno.txt ou Status.txt','Erro', MB_IconError + MB_OK);

  if iRetorno = -18 then
    Application.MessageBox('Não foi possível abrir arquivo INTPOS.001 !','Atenção', MB_IconInformation + MB_OK);

  if iRetorno = -19 then
    Application.MessageBox('Parâmetro diferentes !','Atenção', MB_IconInformation + MB_OK);

  if iRetorno = -20 then
    Application.MessageBox('Transação cancelada pelo Operador !','Atenção', MB_IconInformation + MB_OK);

  if iRetorno = -21 then
    Application.MessageBox('A Transação não foi aprovada !','Atenção', MB_IconInformation + MB_OK);

  if iRetorno = -22 then
    Application.MessageBox('Não foi possível terminal a Impressão !','Atenção', MB_IconInformation + MB_OK);

  if iRetorno = -23 then
    Application.MessageBox('Não foi possível terminal a Operação !','Atenção', MB_IconInformation + MB_OK);

  if iRetorno = -24 then
    Application.MessageBox('Forma de pagamento não programada.','Atenção', MB_IconInformation + MB_OK);

  if iRetorno = -25 then
    Application.MessageBox('Totalizador não fiscal não programado.','Atenção', MB_IconInformation + MB_OK);

  if iRetorno = -26 then
    Application.MessageBox('Transação já Efetuada !','Atenção', MB_IconInformation + MB_OK);

  if iRetorno = -28 then
    Application.MessageBox('Não há Informações para serem Impressas !','Atenção', MB_IconInformation + MB_OK);
end;

Function Lin(Campo: String): Integer;
Begin
  Try
    Result:=StrtoInt(Copy(Campo,1,3));
  Except
    Result:=0;
  end;
end;

procedure Abortar;
  function ReturnAddr: Pointer;
  asm
          MOV     EAX,[EBP + 4]
  end;
begin
  raise EAbort.CreateRes(@SOperationAborted) at ReturnAddr;
end;

Function Col(Campo: String): Integer;
Begin
  Try
    Result:=StrtoInt(Copy(Campo,5,3));
  Except
    Result:=0;
  end;
end;

Function ValidaData(vDatF: TDateTime): boolean;
Begin
  Try
    DateToStr(vDatF);
    Result := True;
  Except
    Result := False;
  End;
End;

function ComparaHora(Primeira,Segunda : String):String;
var
  Prim,Segu : TDateTime;
begin
  Prim := StrToTime(Primeira);
  Segu := StrToTime(Segunda);

  if (Prim > Segu) then
    Result := 'maior'
  else
    Result := 'menor';
end;

function ConvValor(const wv:real): string;
var
  ws: String;
begin
  ws := FloatToStr(wv);
  while Pos(',', ws) > 0 do
    ws[Pos(',', ws)]:='.';

  Result := ws;
end;

function ConvValorPonPorVir(const wv:string): string;
var
  ws: String;
begin
  ws := wv;
  while Pos('.', ws) > 0 do
    ws[Pos('.', ws)]:=',';

  Result := ws;
end;

function WinExecAndWait32(FileName: String; Visibility: integer):DWORD;
(*
  Executa um aplicativo e aguarda que seja encerrado.
  As opcões de visualização são as mesmas do WinExec ou seja:
  SW_HIDE, SW_MAXIMIZE, SW_MINIMIZE, SW_RESTORE,
  SW_SHOW, SW_SHOWDEFAULT, SW_SHOWMAXIMIZED,
  SW_SHOWMINIMIZED, SW_SHOWMINNOACTIVE, SW_SHOWNA,
  SW_SHOWNOACTIVATE, SW_SHOWNORMAL
*)
var
  zAppName      : Array[0..512] of char;
  zCurDir       : Array[0..255] of char;
  WorkDir       : String;
  StartupInfo   : TStartupInfo;
  ProcessInfo   : TProcessInformation;
begin
  StrPCopy(zAppName,FileName);
  GetDir(0,WorkDir);
  StrPCopy(zCurDir,WorkDir);
  FillChar(StartupInfo,Sizeof(StartupInfo),#0);
  StartupInfo.cb := Sizeof(StartupInfo);
  StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
  StartupInfo.wShowWindow := Visibility;

  if not CreateProcess(nil,
    zAppName,          { pointer to command line string }
    nil,               { pointer to process security attributes}
    nil,               { pointer to thread security attributes}
    false,             { handle inheritance flag }
    CREATE_NEW_CONSOLE or    { creation flags }
    NORMAL_PRIORITY_CLASS,
    nil,               { pointer to new environment block }
    nil,               { pointer to current directory name }
    StartupInfo,       { pointer to STARTUPINFO }
    ProcessInfo) then Result := DWORD(-1) { pointer to PROCESS_INF }
  else
  begin
    WaitforSingleObject(ProcessInfo.hProcess, INFINITE);
    GetExitCodeProcess(ProcessInfo.hProcess, Result);
  end;
end;

function RoundTo(const AValue: Double; const ADigit: TRoundToRange): Double;
var
  LFactor: Double;
begin
  LFactor := IntPower(10, ADigit);
  Result  := Round(AValue / LFactor) * LFactor;
end;

function AjustaStr(str:String;tam: Integer): String;
begin
  while Length(Str) < tam do
    str := str + ' ';

  if Length(str) > tam then
    str := Copy(str, 1, tam );
  Result := str;
end;

function Alltrim01(Text : string) : string;
begin
  while Pos(' ',Text) > 0 do
    Delete(Text,Pos(' ',Text),1);

  Result := Text;
end;

function Rtrim(Text : string) : string;
var
  n : integer;
begin
  for n := length(Text) downto 1 do begin
    if Copy(Text,n,1) <> ' ' then
      break;
    Delete(Text,n,1);
  end;
  Result := Text;
end;

function BuscaDireita(Busca,Text : string) : integer;
var
  n,retorno : integer;
begin
  retorno := 0;
  for n := length(Text) downto 1 do begin
    if Copy(Text,n,1) = Busca then begin
      retorno := n;
      break;
    end;
  end;
  Result := retorno;
end;

function BuscaTroca(Text,Busca,Troca : string) : string;
var
  n : integer;
begin
  for n := 1 to length(Text) do begin
    if Copy(Text,n,1) = Busca then begin
      Delete(Text,n,1);
      Insert(Troca,Text,n);
    end;
  end;
  Result := Text;
end;

function Repete(Caractere : char; nCaracteres : integer) : string;
var
  n : integer; CadeiaCar : string;
begin
  CadeiaCar := '';
  for n := 1 to nCaracteres do
    CadeiaCar := CadeiaCar + Caractere;
  Result := CadeiaCar;
end;

function StrZero1(Num : Real ; Zeros,Deci: integer): string;
var
  tam,z   : integer;
  res,zer : string;
begin
  Str(Num:Zeros:Deci, res);
  res := Alltrim01(res);
  tam := length(res);
  zer := '';

  for z := 1 to (Zeros-tam) do zer := zer + '0';

  Result := zer+res;
end;

Procedure Converte(cNumero: string ; nCasas: byte);
var
  cNumero1, cNumero2,
  cNumero3, cNumero4 : string;
begin
  if cNumero = '000' then
    exit;

  cNumero1 := Copy(cNumero,1,1);
  cNumero2 := Copy(cNumero,2,1);
  cNumero3 := Copy(cNumero,length(cNumero),1);
  cNumero4 := Copy(cNumero,length(cNumero)-1,2);

  if nCasas = 4 then
    if StrToInt(cPosicao1+cPosicao2+cPosicao3) <> 0
      then cTexto := cTexto + 'E ';

  if cNumero1 <> '0' then begin
    if (cNumero4 = '00') AND (cNumero1 = '1')
      then cTexto := cTexto + 'CEM '
      else cTexto := cTexto + aCentena[StrToInt(cNumero1)];
  end;

  if (cNumero4 >= '10') AND (cNumero4 <= '19') then begin
    if (cNumero1 <> '0')
      then cTexto := cTexto + 'E '+aDezena2[StrToInt(cNumero4)-9]
      else cTexto := cTexto + aDezena2[StrToInt(cNumero4)-9];
  end;

  if cNumero2 >= '2' then begin
   if cNumero1 <> '0'
     then cTexto := cTexto + 'E '+aDezena[StrToInt(cNumero2)]
     else cTexto := cTexto + aDezena[StrToInt(cNumero2)];
  end;

  if (cNumero3 <> '0') AND ((cNumero4 < '10') OR (cNumero4 > '19')) then begin
    if (cNumero1 <> '0') or (cNumero2 <> '0')
      then cTexto := cTexto + 'E '+aUnidade[StrToInt(cNumero3)]
      else cTexto := cTexto + aUnidade[StrToInt(cNumero3)];
  end;

  Case nCasas of
    1: begin
         if StrToInt(cNumero) = 1
           then cTexto := cTexto + aMilhar[2]
           else cTexto := cTexto + aMilhar[3];
       end;
    2: begin
         if StrToInt(cNumero) > 0
           then cTexto := cTexto + aMilhar[1];
       end;
    3: begin
         if StrToInt(cPosicao1+cPosicao2+cPosicao3) = 1
           then cTexto := cTexto + aMoeda[cTipoMoeda,1]
           else cTexto := cTexto + aMoeda[cTipoMoeda,2];
       end;
    4: begin
         if StrToInt(cNumero) = 1
           then cTexto := cTexto + aCentavo[1]
           else cTexto := cTexto + aCentavo[2];
       end;
  end;
end;

function Formata(Text: string; nLinhas,nTamanho : integer; cResto : Char): string;
var
  nTotLin, n1, n2,
  nInicio, nFalta, nAcha : integer;
  cTextoAux, cLinha      : string;
begin
  nTotLin := nLinhas; {length(cTexto) div nTamanho;}
  nInicio := 1;

  if nTotLin > nLinhas then
    nTotLin := nLinhas;
  cTextoAux := '';

  for n1 := 1 to nTotLin do begin
    cLinha := Rtrim(Copy(Text,nInicio,nTamanho));
    while True do begin

      nFalta := nTamanho - length(cLinha);
      if (nFalta >= 1) or (Copy(cLinha,length(cLinha),1) = '.') then break;
      if length(cLinha) < nTamanho then begin
        cLinha := BuscaTroca(cLinha,' ','|');

        for n2 := 1 to nFalta do begin
          nAcha := BuscaDireita('|',cLinha);
          if nAcha = 0 then break;
          Delete(cLinha,nAcha,1);
          Insert(' ',cLinha,nAcha);
        end;
        cLinha := BuscaTroca(cLinha,'|',' ');
      end;
      if length(Rtrim(cLinha)) = nTamanho then break;
    end;
    cTextoAux := cTextoAux + cLinha;
    nInicio   := nInicio + nTamanho;
  end;
  cTextoAux := Copy(Rtrim(cTextoAux)+Repete(cResto,nTamanho * nLinhas),1,nTamanho * nLInhas);
  Result    := cTextoAux
end;

procedure ValorExtenso(var VExt: array of string; nValor:Real ; cTextoIni,cTextoFim: string;
          nLinhas,nLargura: integer; cResto: Char; nMoeda: Integer);
var
  n1, nInicio : integer;
begin
  cTexto := '';
  if nMoeda = 0
    then cTipoMoeda := 3
    else cTipoMoeda := nMoeda;

    cValor1   := StrZero1(nValor,13,2);
    cPosicao1 := Copy(cValor1,2,3);
    cPosicao2 := Copy(cValor1,5,3);
    cPosicao3 := Copy(cValor1,8,3);
    cPosicao4 := '0'+Copy(cValor1,(length(cValor1)-1),2);
    Converte(cPosicao1,1);
    cTexto    := cTextoIni + ' ' + cTexto;
    Converte(cPosicao2,2);

    if (StrToInt(cPosicao2) <> 0) and (Copy(cPosicao3,1,1) = '0') and (StrToInt(cPosicao3) <> 0) Then //and (StrToInt(cPosicao4) = 0) then
      cTexto := cTexto + 'E ';

    Converte(cPosicao3,3);
    if (StrToInt(cPosicao3) = 0) and (StrToInt(cPosicao1+cPosicao2) <> 0) then cTexto := cTexto + aMoeda[cTipoMoeda,2];
    Converte(cPosicao4,4);
    cTexto := cTexto + ' '+cTextoFim;
    cTexto := Formata(cTexto,nLinhas,nLargura,cResto);
    nInicio := 1;

    for n1 := 0 to nLinhas-1 do begin
      VExt[n1] := Copy(cTexto,nInicio,nLargura);
      nInicio  := nInicio + nLargura;
    end;
end;

{ Essa rotina calcula a qtde de semanas que o mes passa, por exemplo:
O mes de Março de 2002
1 e 2   -> está na primeira semana
3 a 9   -> está na segunda semana
10 a 16 -> está na terceira semana
17 a 23 -> está na quarta semana
24 a 30 -> está na quinta semana
31      -> está na sexta semana   }
function SemanaDoMes(Data: TDateTime): Integer;
var nDia, uDia   : Integer;
    nData, uData : TDateTime;
{ Parametro Total = True -> Retorna a quantidade de semanas que tem o mes
  Se Total = False -> Retorna em que semana do mes está o Dia Atual }
begin
  //-- Verifica em que dia da semana cai o primeiro dia do Mes
  nData  := StrToDate(FormatDateTime('01/mm/yyyy', Data));
  nDia   := DayOfWeek(nData);
  //-- Quantos dia falta para o próximo Sábado
  nDia   := (7 - nDia);
  nData  := nData + nDia;
  Result := 1;

  While Data > nData do begin
    Result := Result + 1;
    nData  := nData + 7;
  end;
end;

function LimpaNumeros(const Dados: string): string;
var
  Contar    : integer;
  Resultado : string;
begin
  Resultado := '';

  for Contar := 1 to Length(Dados) do begin
    if Pos(Copy(Dados, Contar, 1) ,'0123456789') > 0 then begin
      if Copy(Dados, Contar, 1) = '.'
        then Resultado := Resultado + ','
        else Resultado := Resultado + Copy(Dados, Contar, 1);
    end;
  end;

  if Copy(Dados, Contar, 1) = '-' then
    Resultado := Resultado + '';
  if Copy(Resultado, 0, 1) = ',' then
    Resultado := '0' + Resultado;
  if Copy(Resultado, Length(Resultado ), 1) = ',' then
    Resultado := Resultado + '00';

  Result := Resultado;
end;

function SOLimpaNumeros(vValor: string): string;
begin
  vValor := StringReplace(vValor, ',', '', [rfIgnoreCase]);
  vValor := StringReplace(vValor, '.', '', [rfIgnoreCase]);
  Result := vValor;
end;


function FDateTime(const Mascara: string; Conteudo: TDateTime; Nulo: boolean): string;
begin
  if Nulo
    then Result := Space(10)
    else Result := FormatDateTime(Mascara, Conteudo);
end;

function Transform(Conteudo: Extended; const Mascara: string): string;
var
  TamMascara : Integer;
  Brancos    : String;
  Dados      : String;
begin
  TamMascara := Length(Mascara);
  Dados      := FormatFloat(Mascara,Conteudo);
  if TamMascara > Length(Dados) then begin
    Brancos := Space(TamMascara - Length(Dados));
    Dados   := Brancos + Dados;
  end;
  Transform := Dados;
end;

function Zeros(Dados: string; Tamanho: integer): String;
begin
  if Dados <> Space( Tamanho ) then
     Dados := StrZero( StrToInt( AllTrim01( Dados ) ), Tamanho );
  Zeros := Dados;
end;

function Digito(Dados: String): Boolean;
var
  iDigito: integer;
begin
  if Length(Trim(Dados)) = 0 then
    Dados := '0' + Space(Length(Dados) - 1 );

  Dados   := StrZero( StrToInt( AllTrim( Dados ) ), Length( Dados ) );
  iDigito := StrToInt( Copy( Dados, 1, Length( Dados ) - 1 ) ) mod 11;
  if iDigito = 10 then iDigito := 0;

  if iDigito <> StrToInt(Copy(Dados, Length(Dados), 1))
    then Digito := False
    else Digito := True;
end;

function Trim( Dados: string ): string;
var
  Contar: integer;
begin
  for Contar := Length( Dados ) downto 1 do begin
    if Copy(Dados, Contar, 1) <> ' ' then Break;
    Dados := Copy(Dados, 1, Contar - 1);
    Application.ProcessMessages;
  end;
  Trim := Dados;
end;

function AllTrim( Dados: string ): string;
var
  Contar: integer;
begin
  Dados := Trim( Dados );
  for Contar := 1 to Length( Dados ) do begin
    if Copy( Dados, Contar, 1 ) <> ' ' then Break;
    Dados := Copy( Dados, Contar + 1, Length( Dados ) - 1 );
    Application.ProcessMessages;
  end;
  AllTrim := Dados;
end;

function Empty(Dados: string): boolean;
begin
  if (Length(Trim(Dados)) = 0) or (Trim(Dados) = '  /  /')
    then Empty := True
    else Empty := False;
end;

function NotEmpty(Dados: string): boolean;
begin
  if Empty(Dados)
    then NotEmpty := False
    else NotEmpty := True;
end;

function MMDDAA(Data: string): string;
var
  sDia: String;
  sMes: String;
  sAno: String;
begin
  sDia := Copy(Data, 1, 2);
  sMes := Copy(Data, 4, 2);
  sAno := Copy(Data, 7, 4);
  if (sDia + sMes + sAno = '        ')
    then MMDDAA := ''
    else MMDDAA := sMes + '/' + sDia + '/' + sAno;
end;

function UltimoDiaMes(Mdt: TDateTime) : TDateTime;

//retorna o ultimo dia o mes, de uma data fornecida

var

  ano, mes, dia : word;

  mDtTemp : TDateTime;

begin

  Decodedate(mDt, ano, mes, dia);

  mDtTemp := (mDt - dia) + 33;

  Decodedate(mDtTemp, ano, mes, dia);

  Result := mDtTemp - dia;

end;

function UltimoDiaDoMes(MesAno: string): string;
var
  sMes: string;
  sAno: string;
begin
  sMes := Copy(MesAno, 1, 2);
  sAno := Copy(MesAno, 6, 2);
  if Pos(sMes, '01 03 05 07 08 10 12') > 0 then UltimoDiaDoMes := '31'
  else
    if sMes <> '02' then
      UltimoDiaDoMes := '30'
    else
      if (StrToInt(sAno) mod 4) = 0
        then UltimoDiaDoMes := '29'
        else UltimoDiaDoMes := '28';
end;

function Dia(Data: TDateTime): string;
var
  sAno, sMes, sDia: Word;
begin
  DecodeDate(Data, sAno, sMes, sDia);
  Dia := StrZero( sDia, 2 );
end;

function Mes(Data: TDateTime): string;
var
  sAno, sMes, sDia: Word;
begin
  DecodeDate( Data, sAno, sMes, sDia );
  Mes := StrZero( sMes, 2 );
end;

function MesAno( Data: TDateTime ): string;
var
  sAno, sMes, sDia: Word;
begin
  DecodeDate( Data, sAno, sMes, sDia );
  MesAno := StrZero( sMes, 2 ) + '/' +
    Copy( StrZero( sAno, 4 ), 3, 2 );
end;

function Ano( Data: TDateTime ): string;
var
  sAno, sMes, sDia: Word;
begin
  DecodeDate( Data, sAno, sMes, sDia );
  Ano := StrZero( sAno, 4 );
end;

function Ano2Dig( Data: TDateTime ): string;
var
  sAno, sMes, sDia: Word;
begin
  DecodeDate( Data, sAno, sMes, sDia );
  Ano2Dig := Copy(StrZero( sAno, 4 ),3,2);
end;


function Space(N: integer): string;
var
  I     : Integer;
  Dados : String;
begin
  Dados := '';
  for I := 1 to N do begin
    Dados := Dados + ' ';
    Application.ProcessMessages;
  end;
  Space := Dados;
end;

function Codifica(S: string): string;
var
  Cod : String;
  I   : Integer;
begin
  S   := S + #13 + '          ';
  Cod := '';

  for I := 9 downto 1 do Cod := Cod + Copy( S, I, 1 );

  S := Copy( Cod, 4, 3 ) +
       Copy( Cod, 1, 3 ) +
       Copy( Cod, 7, 3 );
  Cod := '';

  for I := 1 to 9 do begin
    if (I mod 2) = 0 then begin
      if ord( S[I] ) = 255
        then Cod := Cod + #0
        else Cod := Cod + chr( ord( S[I] ) + 1 );
    end
    else begin
      if ord( S[I] ) = 0
        then Cod := Cod + chr( 255 )
        else Cod := Cod + chr( ord( S[I] ) - 1 );
    end;
  end;
  Codifica := Cod;
end;

function StrZero(N: longint; Tamanho: integer): string;
var
  Conteudo  : String;
  Diferenca : Longint;
begin
  Conteudo  := IntToStr( N );
  Diferenca := Tamanho - Length( Conteudo );
  if Diferenca > 0 then Conteudo := Repl( '0', Diferenca ) + Conteudo;
  StrZero := Conteudo;
end;

function StrZeroString(N: string; Tamanho: integer): string;
var
  Conteudo  : String;
  Diferenca : Longint;
begin
  Conteudo  := N;
  Diferenca := Tamanho - Length( Conteudo );
  if Diferenca > 0 then
    Conteudo := Repl( ' ', Diferenca ) + Conteudo;
  Result := Conteudo;
end;

function StrZeroStringZero(N: string; Tamanho: integer): string;
var
  Conteudo  : String;
  Diferenca : Longint;
begin
  Conteudo  := N;

  Conteudo := StringReplace(Conteudo, ' ', EmptyStr, [rfReplaceAll]);
  Conteudo := StringReplace(Conteudo, ',', EmptyStr, [rfReplaceAll]);
  Conteudo := StringReplace(Conteudo, 'kg', EmptyStr, [rfReplaceAll]);

  Diferenca := Tamanho - Length( Conteudo );
  if Diferenca > 0 then
    Conteudo := Repl( '0', Diferenca ) + Conteudo;
  Result := Conteudo;
end;

function Repl(C: string; Tamanho: integer): string;
var
  Conteudo : String;
  Contar   : Integer;
begin
  Conteudo := '';
  for Contar := 1 to Tamanho do begin
    Conteudo := Conteudo + C;
    Application.ProcessMessages;
  end;
  Repl := Conteudo;
end;

function C_G_C( Dados: string ): boolean;
var
  CGC    : string;
  Soma   : integer;
  Contar : integer;
  Digito : integer;
begin
  try
    if Length( Dados ) > 14 then
      Dados := Copy( Dados, 1, 2 ) + Copy( Dados, 4, 3 ) +
        Copy( Dados, 8, 3 ) + Copy( Dados, 12, 4 )
        + Copy( Dados, 17, 2 );
    if Length( Trim( Dados ) ) = 0 then
    begin
      Result := True;
      exit;
    end;
    CGC := Copy( Dados, 1, 12 );
    Soma := 0;
    for Contar := 1 to 4 do
      Soma := Soma +
        StrToInt( copy( CGC, Contar, 1 ) )
        * ( 6 - Contar );
    for Contar := 1 to 8 do
      Soma := Soma + StrToInt( copy( CGC,
        Contar + 4, 1 ) ) * ( 10 - Contar );
    Digito := 11 - Soma mod 11;
    if Digito in [ 10, 11 ] then
      CGC := CGC + '0'
    else
      CGC := CGC +IntToStr( Digito );
    Soma := 0;
    for Contar := 1 to 5 do
      Soma := Soma + StrToInt( copy( CGC,
        Contar, 1 ) ) * ( 7 - Contar );
    for Contar := 1 to 8 do
      Soma := Soma + StrToInt( copy( CGC,
      Contar + 5, 1 ) ) * ( 10 - Contar );
    Digito := 11 - Soma mod 11;
    if Digito in [ 10, 11 ] then
      CGC := CGC + '0'
    else
      CGC := CGC +
        IntToStr( Digito );
    if Dados <> CGC then
      Result := false
    else
      Result := true;
  except on econverterror do
    Result := false;
  end;
end;

function C_P_F( Dados: string ): boolean;
var
  CPF: string;
  Soma: integer;
  Contar: integer;
  Digito: integer;
begin
  try
    if Length( Dados ) > 11 then
      Dados := Copy( Dados, 1, 3 ) + Copy( Dados, 5, 3 ) +
        Copy( Dados, 9, 3 ) + Copy( Dados, 13, 2 );
    if Length( Trim( Dados ) ) = 0 then
    begin
      Result := True;
      exit;
    end;
    CPF := copy( Dados, 1, 9 );
    Soma := 0;
    for Contar := 1 to 9 do
      Soma := Soma +
        StrToInt( copy( CPF, Contar, 1 ) )
        * ( 11 - Contar );
    Digito := 11 - Soma mod 11;
    if Digito in [ 10,11 ] then
      CPF:= CPF + '0'
    else
      CPF := CPF + IntToStr( Digito );
    Soma := 0;
    for Contar := 1 to 10 do
      Soma := Soma +
        StrToInt( copy( CPF, Contar, 1 ) ) *
        ( 12 - Contar );
    Digito := 11 - Soma mod 11;
    if Digito in [ 10, 11 ] then
      CPF := CPF + '0'
    else
      CPF := CPF +
        IntToStr( Digito );
    if Dados <> CPF then
      Result := false
    else
      Result := true;
  except on econverterror do
    Result := false;
  end;
end;

//-- Rotina para formatacao de numero
function Formata_codigo_idx(codigo : String; maximo: Integer): String;
var
 tamanho, i : Integer;
begin
  if (codigo <> '') then begin
    tamanho := Length(codigo);
    Result  := '';

    if (tamanho < maximo) then begin
      for i:=1 to maximo-tamanho do begin
        Result := '0' + Result;
      end;
      Result:= Result + codigo;
    end
    else Result:= codigo;
  end;
end;

//-- Rotina para Arredondar Decimais
Function Arredondar(value: double;casas : integer): double;
Var
fracao, Total:real;
decimal:string;
begin
  try
  fracao:=Frac(value); //Retorna a parte fracionária de um número
  decimal:=(RightStr(floattostr(fracao),length(floattostr(fracao))-2)); //decimal recebe a parte decimal
    //Enquanto o tamanho da variavel decimal for maior que o número de casas faça
    while length(decimal) > casas do
    begin
    //Verifica se o último digito da variável decimal é maior que 5
    if strtoint(RightStr(decimal,1))>5 then
    begin
      //Descarta o último digito da variável Decimal
      decimal:=leftstr(decimal,length(decimal)-1);
      //Soma o valor número da variavel decimal + 1
      decimal:=floattostr(strtofloat(decimal) + 1);
    end
    else
      decimal:=leftstr(decimal,length(decimal)-1); //Descarta o último digito da variável Decimal
    end;
    result:=(int(value) + (strtofloat(decimal)/100)); //devolve o resultado para a função
  except
  Raise Exception.Create('Erro no arredondamento');
  end;
end;

// Listar Impressoras do Windows
procedure ListarImpressoraSistema(pcxCombo:TcxComboBox; pTipo:Integer);
var
 aDevice : array[0..255] of char;
 aDriver : array[0..255] of char;
 aPort : array[0..255] of char;
 ahDMode : THandle;
 Impressoras : TStringList;
 I : Integer;
begin
  Case pTipo of
   // Retorna Impressora padrão
   0 : Begin
          Printer.GetPrinter(aDevice, aDriver, aPort, ahDMode);
          pcxCombo.Text := aDevice;

       End;

   // Define Impressora padrão
   1  : Begin
          Printer.PrinterIndex := Printer.Printers.IndexOf(pcxCombo.Text)
        End;

   // Lista Todas Impressoras do sistema
   2 : Begin
         Impressoras := TStringList.Create;

         for I := 0 to Printer.Printers.Count - 1 do
           begin
             if Pos('\\',Printer.Printers.Strings[I]) <> 0 then
               pcxCombo.Properties.Items.AddObject(Printer.Printers.Strings[I], TObject(I))
             Else
               pcxCombo.Properties.Items.AddObject('\\127.0.0.1\'+ Printer.Printers.Strings[I], TObject(I));

           end;

         Impressoras.Free;
       End;

  End;

end;

procedure ExecutaQrySql(pQry : TOracleDataSet; pSql: String; pTipo: Integer);
begin
  Case pTipo Of
    0 : Begin
          pQry.Close;
          pQry.SQL.Clear;
          pQry.SQL.Text := pSql;
          Clipboard.AsText := pSql;
          pQry.First;
        End;
  End;
end;

function AlinharTexto(pTexto: String; pTipo : Integer): String;
Var
  vMetade, vTamanho : Integer;
begin

  pTexto := Trim(pTexto);
  vTamanho := Length(pTexto);
  vMetade := ((vTamanho-Length(pTexto)) div 2);

  Case pTipo Of
    0 : while length(pTexto) < vTamanho do pTexto := ' ' + pTexto;
    1 : while length(pTexto) < vTamanho do pTexto :=  pTexto + ' ' ;
    2 : while Length(pTexto)+vMetade < vTamanho do pTexto := ' ' + pTexto;
  End;

  Result := pTexto;
end;

function Coalesce(Value1: Variant; Value2: Variant): Variant;
begin
  if (not VarIsNull(Value1)) or (Value1 <> 0) then
    Result := Value1
  else
    Result := Value2
end;

function RetornaSenhaFrete(pCodigoCliente, pPedido: String; pDataLiberacao: TDate; pValorFrete: Double): String;
var
  vValor1, vValor2, vValor3, vValor4, vValor5, vValor6, vValor7, vValor8, vValor9, vValor10, vValor11, vRetorno1, vRetorno2, vRetorno3,
  vRetorno4, vRetorno5, vRetorno6, v_Calculo, vPosVirgula: Integer;
  v_Dia, v_Mes, v_Codigo: String;
  v_Pedido: Double;
begin
  V_Dia := Dia(pDataLiberacao);
  v_Mes := Mes(pDataLiberacao);
  v_Codigo := v_Dia + v_Mes + StrZero(StrToInt(pCodigoCliente),6);
  v_Pedido := (StrToFloat(pPedido) * 2);

  vValor1  := StrToInt(Copy(v_Codigo,1,1));
  vValor2  := StrToInt(Copy(v_Codigo,2,1));
  vValor3  := StrToInt(Copy(v_Codigo,3,1));
  vValor4  := StrToInt(Copy(v_Codigo,4,1));
  vValor5  := StrToInt(Copy(v_Codigo,5,1));
  vValor6  := StrToInt(Copy(v_Codigo,6,1));
  vValor7  := StrToInt(Copy(v_Codigo,7,1));
  vValor8  := StrToInt(Copy(v_Codigo,8,1));
  vValor9  := StrToInt(Copy(v_Codigo,9,1));
  vValor10 := StrToInt(Copy(v_Codigo,10,1));
  vPosVirgula := Pos(',', FloatToStr(pValorFrete));
  vValor11 := StrToInt(Copy(FloatToStr(pValorFrete), vPosVirgula + 1, 2));

  vRetorno1 := vValor1 + vValor10;
  vRetorno2 := vValor2 + vValor9;
  vRetorno3 := vValor3 + vValor8;
  vRetorno4 := vValor4 + vValor7;
  vRetorno5 := vValor5 + vValor6;
  vRetorno6 := vValor11 + vValor11;

  v_Calculo := (((vRetorno1 + vRetorno2 + vRetorno3 + vRetorno4 + vRetorno5 + vRetorno6) * StrToInt(pCodigoCliente)) + Trunc(pValorFrete) + Trunc(v_Pedido));
  Result := IntToStr(v_Calculo);
end;

function retornaCodigoEstado(pEstado: String): Integer;
begin
  case AnsiIndexStr(UpperCase(pEstado), ['RO','AC','AM','RR','PA','AP','TO','MA',
    'PI','CE','RN','PB','PE','AL','SE','BA','MG','ES','RJ','SP','PR','SC','RS','MS','MT','GO','DF']) of
    0: Result := 11;
    1: Result := 12;
    2: Result := 13;
    3: Result := 14;
    4: Result := 15;
    5: Result := 16;
    6: Result := 17;
    7: Result := 21;
    8: Result := 22;
    9: Result := 23;
    10: Result := 24;
    11: Result := 25;
    12: Result := 26;
    13: Result := 27;
    14: Result := 28;
    15: Result := 29;
    16: Result := 31;
    17: Result := 32;
    18: Result := 33;
    19: Result := 35;
    20: Result := 41;
    21: Result := 42;
    22: Result := 43;
    23: Result := 50;
    24: Result := 51;
    25: Result := 52;
    26: Result := 53;
  end;
end;

function calculaDescricaoLoteProducao(pCodProduto, pQtdProduzida : Double ) : String;
var
  vAno : String;
  vProduto : String;
  vQtdProduzida : String;
begin
  vAno := IntToStr(YearOf(now));
  vAno := Copy(vAno, 3, 2);

  vProduto := Copy(FloatToStr(pCodProduto), 1, 2); //segundo Adauto é para bloquear em dois digitos o codigo do produto [data conversa 27/05/2019]
  vProduto := StrZero(StrToInt(vProduto), 2);

  vQtdProduzida := Copy(FloatToStr(pQtdProduzida), 1, 3);
  vQtdProduzida := StrZero(StrToInt(vQtdProduzida), 3);


  result := StrZero(DayOfTheYear(now), 3) + vAno + vProduto + vQtdProduzida;
end;

end.

