unit UDataAccessObjectList;

interface

uses Classes, SysUtils, DB, DBTables, UIModel, UIDataAccessObject;

type
  TDataAccessObjectList = class(TList)
  private
    FConnection: IDataAccessObject;
    FModelName: string;
  protected
    function Get(Index: Integer): IModel;
    procedure Put(Index: Integer; Item: IModel);
  public
    property Items[Index: Integer]: IModel read Get write Put; default;
    property ModelName: string read FModelName;

    function Add(Item: IModel): Integer;
    function IndexOf(Item: IModel): Integer;
    procedure Insert(Index: Integer; Item: IModel);
    procedure RetrieveAll;
    function GenerateDataSet: TDataSet; virtual; abstract;

    constructor Create(AConnection: IDataAccessObject; AModelName: string); overload;
  end;

implementation

uses
  UToDoManagerTypes;

{ TDataAccessObjectList }

constructor TDataAccessObjectList.Create(AConnection: IDataAccessObject; AModelName: string);
begin
  inherited Create;
  FConnection := AConnection;
  FModelName := AModelName;
end;

function TDataAccessObjectList.Add(Item: IModel): Integer;
begin
  Result := inherited Add(TInterfacedObject(Item));
end;

function TDataAccessObjectList.Get(Index: Integer): IModel;
begin
  Result := TInterfacedObject(inherited Get(Index)) as IModel;
end;

function TDataAccessObjectList.IndexOf(Item: IModel): Integer;
begin
  Result := inherited IndexOf(TInterfacedObject(Item));
end;

procedure TDataAccessObjectList.Insert(Index: Integer; Item: IModel);
begin
  inherited Insert(Index, TInterfacedObject(Item));
end;

procedure TDataAccessObjectList.Put(Index: Integer; Item: IModel);
begin
  inherited Put(Index, TInterfacedObject(Item));
end;

procedure TDataAccessObjectList.RetrieveAll;
var
  List: TList;
  I: Integer;
begin
  List := FConnection.RetrieveAllFromStructure(FModelName);
  Self.Clear;
  for I := 0 to Pred(List.Count) do
    Self.Add(IModel(List.Items[0]));
end;

end.
