unit UDataAccessObjectCDS;

interface

uses Classes, UDataAccessObject, UIModel, DB, DBClient, SysUtils, TypInfo;

type
  TDataAccessObjectCDS = class(TDataAccessObject)
  private
    FBaseConectada: Boolean;
    FTableList: TStrings;
    function ConnectTable(ATableName: string): TClientDataSet;
  protected
    function GetBaseConectada: Boolean; override;
    procedure SetBaseConectada(const Value: Boolean); override;
  public
    function Insert(AModel: IModel): Boolean; override;
    function Update(AModel: IModel): Boolean; override;
    function RetrieveById(AModel: IModel; const AId: Integer): Boolean; override;
    function RetrieveAllFromStructure(AModelName: string): TList; override;
    function DeleteById(const AId: Integer): Boolean; override;
    procedure Connect; override;
    procedure Disconnect; override;

    constructor Create; overload;
    destructor Destroy; override;
  end;

implementation

uses UModel, UToDoManagerUtils;

{ TDataAccessObjectCDS }

constructor TDataAccessObjectCDS.Create;
begin
  inherited Create;
  FTableList := TStringList.Create;
end;

function TDataAccessObjectCDS.GetBaseConectada: Boolean;
begin
  Result := FBaseConectada;
end;

procedure TDataAccessObjectCDS.SetBaseConectada(const Value: Boolean);
begin
  FBaseConectada := Value;
end;

procedure TDataAccessObjectCDS.Connect;
begin
  FBaseConectada := True;
end;

function TDataAccessObjectCDS.ConnectTable(ATableName: string): TClientDataSet;
var
  Index: Integer;
  cds: TClientDataSet;
begin
  Index := FTableList.IndexOfName(ATableName);

  if (Index >= 0) then
  begin
    cds := (FTableList.Objects[Index] as TClientDataSet);
    
    if FileExists(cds.FileName) then
      cds.LoadFromFile
    else
    begin
      cds.CreateDataSet;
      cds.FileName := ATableName + '.bin';
      cds.SaveToFile;
    end;
  end
  else
  begin
    cds := CreateDataSetFromModel(ATableName);
    cds.CreateDataSet;
    cds.FileName := ATableName + '.bin';
    cds.SaveToFile;
    FTableList.AddObject(ATableName, cds);
  end;
  Result := cds;
end;

function TDataAccessObjectCDS.RetrieveAllFromStructure(AModelName: string): TList;
var
  I: Integer;
  List: TList;
  obj: TModel;
  cds: TClientDataSet;
begin
  List := TList.Create;
  try
    cds := Self.ConnectTable(AModelName);
    if not Assigned(cds) then
      raise Exception.Create('Tabela não encontrada.');

    cds.Open;
    cds.First;
    while (not cds.Eof) do
    begin
      obj := TModel(GetClass(AModelName).NewInstance);
      for I := 0 to Pred(cds.FieldCount) do
        SetPropValue(obj, cds.Fields[I].FieldName, cds.Fields[I].Value);

      List.Add(TModel(obj));
      cds.Next;
    end;
  finally
    Result := List;
  end;
end;

function TDataAccessObjectCDS.Insert(AModel: IModel): Boolean;
var
  cds: TClientDataSet;
  FieldList: TFieldValueList;
  I: Integer;
begin
  FieldList := TFieldValueList.CreateFromModel(AModel);
  cds := Self.ConnectTable(AModel.ModelName);
  cds.Insert;
  for I := 0 to Pred(FieldList.Count) do
    cds.FieldByName(FieldList[I].Name).Value := FieldList[I].Value;
  cds.Post;
  cds.ApplyUpdates(0);
  Result := True;
end;

function TDataAccessObjectCDS.RetrieveById(AModel: IModel; const AId: Integer): Boolean;
begin

end;

function TDataAccessObjectCDS.Update(AModel: IModel): Boolean;
begin

end;

function TDataAccessObjectCDS.DeleteById(const AId: Integer): Boolean;
begin

end;

procedure TDataAccessObjectCDS.Disconnect;
var
  cds: TClientDataSet;
begin
  while (FTableList.Count > 0) do
  begin
    cds := TClientDataSet(FTableList.Objects[0]);
    cds.Close;
    cds.SaveToFile;
    FTableList.Delete(0);
  end;

  FBaseConectada := False;
end;

destructor TDataAccessObjectCDS.Destroy;
begin
  //
  inherited Destroy;
end;

end.

