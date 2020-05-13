unit UTarefaList;

interface

uses Classes, SysUtils, DB, DBTables, DBClient, UITarefa, UIDataAccessObject, UDataAccessObjectList;

type
  TTarefaList = class(TDataAccessObjectList)
  protected
    function Get(Index: Integer): ITarefa;
    procedure Put(Index: Integer; Item: ITarefa);
  public
    property Items[Index: Integer]: ITarefa read Get write Put; default;
    constructor Create(AConnection: IDataAccessObject); overload;

    function Add(Item: ITarefa): Integer;
    function IndexOf(Item: ITarefa): Integer;
    procedure Insert(Index: Integer; Item: ITarefa);
    function GenerateDataSet: TDataSet; override;
  end;

implementation

uses UToDoManagerUtils;

{ TTarefaList }

constructor TTarefaList.Create(AConnection: IDataAccessObject);
begin
  inherited Create(AConnection, 'TTarefa');
end;

function TTarefaList.Add(Item: ITarefa): Integer;
begin
  Result := inherited Add(Item);
end;

function TTarefaList.Get(Index: Integer): ITarefa;
begin
  Result := ITarefa(inherited Get(Index));
end;

function TTarefaList.IndexOf(Item: ITarefa): Integer;
begin
  Result := inherited IndexOf(Item);
end;

procedure TTarefaList.Insert(Index: Integer; Item: ITarefa);
begin
  inherited Insert(Index, Item);
end;

procedure TTarefaList.Put(Index: Integer; Item: ITarefa);
begin
  inherited Put(Index, Item);
end;

function TTarefaList.GenerateDataSet: TDataSet;
var
  cds: TClientDataSet;
begin
  Self.RetrieveAll;

  cds := CreateDataSetFromModel('TTarefa');
  cds.CreateDataSet;
  Result := cds;
end;

end.
