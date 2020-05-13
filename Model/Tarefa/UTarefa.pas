unit UTarefa;

interface

uses Classes, UModel, UIDataAccessObject, UITarefa;

type
  TTarefa = class(TModel, ITarefa)
  private
    FTitulo: string;
    FDescricao: string;
    FPrioridade: Integer;
    FStatus: Integer;
    
    function GetTitulo: string;
    function GetDescricao: string;
    function GetPrioridade: Integer;
    function GetStatus: Integer;
    procedure SetTitulo(const Value: string);
    procedure SetDescricao(const Value: string);
    procedure SetPrioridade(const Value: Integer);
    procedure SetStatus(const Value: Integer);
  public
    constructor Create(AConnection: IDataAccessObject) overload;
  published
    property Titulo: string read GetTitulo write SetTitulo;
    property Descricao: string read GetDescricao write SetDescricao;
    property Prioridade: Integer read GetPrioridade write SetPrioridade;
    property Status: Integer read GetStatus write SetStatus;
  end;

implementation

constructor TTarefa.Create(AConnection: IDataAccessObject);
begin
  ModelName := Self.ClassName;
  inherited Create(AConnection);
  FTitulo     := 'Nova Tarefa';
  FDescricao  := '';
  FPrioridade := 1;
  FStatus     := 0;
end;

function TTarefa.GetTitulo: string;
begin
  Result := FTitulo;
end;

function TTarefa.GetDescricao: string;
begin
  Result := FDescricao;
end;

function TTarefa.GetPrioridade: Integer;
begin
  Result := FPrioridade;
end;

function TTarefa.GetStatus: Integer;
begin
  Result := FStatus;
end;

procedure TTarefa.SetTitulo(const Value: string);
begin
  FTitulo := Value;
end;

procedure TTarefa.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TTarefa.SetPrioridade(const Value: Integer);
begin
  FPrioridade := Value;
end;

procedure TTarefa.SetStatus(const Value: Integer);
begin
  FStatus := Value;
end;

initialization
  RegisterClass(TTarefa);
finalization
  UnRegisterClass(TTarefa);
end.
