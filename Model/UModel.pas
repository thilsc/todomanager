unit UModel;

interface

uses Classes, UIModel, UIDataAccessObject, UToDoManagerTypes;

type
  TModel = class(TInterfacedPersistent, IModel)
  private
    FConnection: IDataAccessObject;
    FModelName: string;
    FId: Integer;
    FTipoManutencao: TTipoManutencao;
  protected
    function GetId: Integer;
    procedure SetId(const Value: Integer);
    function GetModelName: string;
    procedure SetModelName(const Value: string);
    property ModelName: string read GetModelName write SetModelName;
  public
    property TipoManutencao: TTipoManutencao read FTipoManutencao write FTipoManutencao;

    function Save: Boolean; virtual;
    function Retrieve(const AId: Integer): Boolean; virtual;
    function Delete(const AId: Integer): Boolean; virtual;
    
    constructor Create(AConnection: IDataAccessObject); overload;
    destructor Destroy; override;
  published
    property Id: Integer read GetId write SetId;
  end;

  TModelClass = class of TModel;

  TFieldValue = class
  private
    FName: string;
    FValue: Variant;
    function GetName: string;
    function GetValue: Variant;
    procedure SetName(const Value: string);
    procedure SetValue(const Value: Variant);
  public
    property Name: string read GetName write SetName;
    property Value: Variant read GetValue write SetValue;
  end;

  TFieldValueList = class(TList)
  protected
    function Get(Index: Integer): TFieldValue;
  public
    property Items[Index: Integer]: TFieldValue read Get; default;

    constructor CreateFromModel(AModel: IModel);
  end;

implementation

uses UDataAccessObject, TypInfo;

constructor TModel.Create(AConnection: IDataAccessObject);
begin
  FConnection := AConnection;
end;

function TModel.GetModelName: string;
begin
  Result := FModelName;
end;

procedure TModel.SetModelName(const Value: string);
begin
  FModelName := Value;
end;

function TModel.GetId: Integer;
begin
  Result := FId;
end;

procedure TModel.SetId(const Value: Integer);
begin
  FId := Value;
end;

function TModel.Save: Boolean;
begin
  if (FTipoManutencao = tmInsert) then
    Result := FConnection.Insert(Self)
  else
    Result := FConnection.Update(Self);
end;

function TModel.Retrieve(const AId: Integer): Boolean;
begin
  Result := FConnection.RetrieveById(Self, AId);
end;

function TModel.Delete(const AId: Integer): Boolean;
begin
  if (FTipoManutencao = tmDelete) then
    Result := FConnection.DeleteById(AId)
  else
    Result := False;
end;

destructor TModel.Destroy;
begin
  //
  inherited Destroy;
end;

{ TFieldValue }

function TFieldValue.GetName: string;
begin
  Result := FName;
end;

function TFieldValue.GetValue: Variant;
begin
  Result := FValue;
end;

procedure TFieldValue.SetName(const Value: string);
begin
  FName := Value;
end;

procedure TFieldValue.SetValue(const Value: Variant);
begin
  FValue := Value;
end;

{ TFieldValueList }

constructor TFieldValueList.CreateFromModel(AModel: IModel);
var
  obj: TModel;
  I, TotalProp: Integer;       //////
  p_PropList: PPropList;
  Item: TFieldValue;
begin
  inherited Create;
  obj := TModel.Create;
  obj.Assign(TInterfacedPersistent(AModel));

  TotalProp := GetPropList(obj, p_PropList);
  for I := 0 to Pred(TotalProp) do
  begin
    Item := TFieldValue.Create;
    Item.Name := p_PropList[I]^.Name;
    Item.Value:= GetPropValue(obj, p_PropList[I]^.Name);
    Self.Add(Item);
  end;
end;

function TFieldValueList.Get(Index: Integer): TFieldValue;
begin
  Result := TFieldValue(inherited Get(Index));
end;

initialization
  RegisterClass(TModel);
finalization
  UnRegisterClass(TModel);
end.

