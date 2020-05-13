unit UFrmTarefa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls;

type
  TFrmTarefa = class(TForm)
    pnlBotoes: TPanel;
    lblGravar: TLabel;
    lblPrioridade: TLabel;
    lblTitulo: TLabel;
    lblDescricao: TLabel;
    lblStatus: TLabel;
    edtTitulo: TEdit;
    memDescricao: TMemo;
    ud1: TUpDown;
    edtPrioridade: TEdit;
    edtStatus: TEdit;
    lblCancelar: TLabel;
    shp1: TShape;
    procedure lblNovoClick(Sender: TObject);
    procedure lblGravarClick(Sender: TObject);
    procedure lblCancelarClick(Sender: TObject);
  private
    { Private declarations }
    FId: Integer;
    function GetId: Integer;
    function GetTitulo: string;
    function GetDescricao: string;
    function GetPrioridade: Integer;
    function GetStatus: Integer;
    procedure SetId(const Value: Integer);
    procedure SetTitulo(const Value: string);
    procedure SetDescricao(const Value: string);
    procedure SetPrioridade(const Value: Integer);
    procedure SetStatus(const Value: Integer);
  public
    { Public declarations }
    property Id: Integer read GetId write SetId;
    property Titulo: string read GetTitulo write SetTitulo;
    property Descricao: string read GetDescricao write SetDescricao;
    property Prioridade: Integer read GetPrioridade write SetPrioridade;
    property Status: Integer read GetStatus write SetStatus;

    class function Inserir: Boolean;
    class function Consultar(const AId: Integer): Boolean;
    class function Excluir(const AId: Integer): Boolean;
  end;

implementation

{$R *.dfm}

uses UTarefa, UTarefaController, UToDoManagerTypes, UToDoManagerUtils, UConexaoSingleton;

///////////////Get's and Set's
function TFrmTarefa.GetId: Integer;
begin
  Result := FId;
end;

procedure TFrmTarefa.SetId(const Value: Integer);
begin
  FId := Value;
end;

function TFrmTarefa.GetDescricao: string;
begin
  Result := memDescricao.Lines.Text;
end;

function TFrmTarefa.GetPrioridade: Integer;
begin
  Result := StrToIntDef(edtPrioridade.Text, 0);
end;

function TFrmTarefa.GetStatus: Integer;
begin
  Result := Integer(StrToStatusTarefa(edtStatus.Text));
end;

function TFrmTarefa.GetTitulo: string;
begin
  Result := edtTitulo.Text;
end;

procedure TFrmTarefa.SetDescricao(const Value: string);
begin
  memDescricao.Lines.Text := Value;
end;

procedure TFrmTarefa.SetPrioridade(const Value: Integer);
begin
  edtPrioridade.Text := IntToStr(Value);
end;

procedure TFrmTarefa.SetStatus(const Value: Integer);
begin
  edtStatus.Text := StatusTarefaToStr(TStatusTarefa(Value));
end;

procedure TFrmTarefa.SetTitulo(const Value: string);
begin
  edtTitulo.Text := Value;
end;

//////////Métodos da Tela

class function TFrmTarefa.Inserir: Boolean;
var
  obj: TTarefa;
begin
  Result := False;
  with Self.Create(nil) do
    try
      if (ShowModal = mrOk) then
      begin
        obj := TTarefa.Create(TConexaoSingleton.GetInstance);
        obj.TipoManutencao := tmInsert;
        obj.Titulo := Titulo;
        obj.Descricao := Descricao;
        obj.Prioridade := Prioridade;

        Result := TTarefaController.GravaTarefa(obj);
        obj.Free;

        if Result then
          ShowMessage('Tarefa cadastrada com sucesso!');
      end;
    finally
      Free;
    end;
end;

class function TFrmTarefa.Consultar(const AId: Integer): Boolean;
var
  obj: TTarefa;
begin
  Result := False;
  with Self.Create(nil) do
    try
      obj := TTarefa.Create(TConexaoSingleton.GetInstance);
      Result := obj.Retrieve(AId);
    finally
      Free;
    end;
end;

class function TFrmTarefa.Excluir(const AId: Integer): Boolean;
var
  obj: TTarefa;
begin
  Result := False;
  with Self.Create(nil) do
    try
      obj := TTarefa.Create(TConexaoSingleton.GetInstance);
      obj.TipoManutencao := tmDelete;
      if obj.Retrieve(AId) then
        Result := obj.Delete(AId);
    finally
      Free;
    end;
end;

///////////////Eventos da Tela
procedure TFrmTarefa.lblNovoClick(Sender: TObject);
begin
  edtTitulo.SetFocus;
end;

procedure TFrmTarefa.lblGravarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFrmTarefa.lblCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
