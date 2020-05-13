unit UITarefa;

interface

uses UIModel;

type
  ITarefa = interface(IModel)
    ['{5E805DFA-2DA0-4BF4-8F93-F7DCD6F44B9E}']
    function GetTitulo: string;
    function GetDescricao: string;
    function GetPrioridade: Integer;
    function GetStatus: Integer;
    procedure SetTitulo(const Value: string);
    procedure SetDescricao(const Value: string);
    procedure SetPrioridade(const Value: Integer);
    procedure SetStatus(const Value: Integer);
    property Titulo: string read GetTitulo write SetTitulo;
    property Descricao: string read GetDescricao write SetDescricao;
    property Prioridade: Integer read GetPrioridade write SetPrioridade;
    property Status: Integer read GetStatus write SetStatus;
  end;

implementation

end.
 