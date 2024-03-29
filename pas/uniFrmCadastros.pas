unit uniFrmCadastros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, dxGDIPlusClasses,
  Vcl.Buttons;

type
  TfrmCadastros = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Image1: TImage;
    Panel4: TPanel;
    Image2: TImage;
    Panel5: TPanel;
    Image3: TImage;
    Panel6: TPanel;
    Image4: TImage;
    Panel7: TPanel;
    Image5: TImage;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Panel2: TPanel;
    Image6: TImage;
    Shape6: TShape;
    SpeedButton6: TSpeedButton;
    Panel8: TPanel;
    Image7: TImage;
    Shape7: TShape;
    SpeedButton7: TSpeedButton;
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastros: TfrmCadastros;

implementation

uses
  uniFrmCadastroClientes, uniFrmClientes, uniFrmClinicos, uniFrmConsultas, uniFrmFuncionarios;

{$R *.dfm}

procedure TfrmCadastros.SpeedButton1Click(Sender: TObject);
begin
  if not Assigned(frmConsultas) then
    frmConsultas := TfrmConsultas.Create(Application);
  frmConsultas.ShowModal;

  FreeAndNil(frmConsultas);
end;

procedure TfrmCadastros.SpeedButton2Click(Sender: TObject);
begin
  if not Assigned(frmFuncionarios) then
    frmFuncionarios := TfrmFuncionarios.Create(Application);
  frmFuncionarios.ShowModal;

  FreeAndNil(frmFuncionarios);
end;

procedure TfrmCadastros.SpeedButton6Click(Sender: TObject);
begin
  if not Assigned(frmClinicos) then
    frmClinicos := TfrmClinicos.Create(Application);
  frmClinicos.ShowModal;

  FreeAndNil(frmClinicos);
end;

procedure TfrmCadastros.SpeedButton7Click(Sender: TObject);
begin
  if not Assigned(frmClientes) then
    frmClientes := TfrmClientes.Create(Application);
  frmClientes.ShowModal;

  FreeAndNil(frmClientes);
end;

end.
