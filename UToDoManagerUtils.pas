unit UToDoManagerUtils;

interface

uses Classes, TypInfo, DB, DBTables, DBClient, UToDoManagerTypes;

function TypeKindToDataType(ATypeKind: TTypeKind): TFieldType;
function TypeKindToSize(ATypeKind: TTypeKind): Integer;
function CreateDataSetFromModel(ATableName: string): TClientDataSet;
function StrToStatusTarefa(AStr: string): TStatusTarefa;
function StatusTarefaToStr(AItem: TStatusTarefa): string;

implementation

uses UModel, UToDoManagerConsts;

function TypeKindToDataType(ATypeKind: TTypeKind): TFieldType;
begin
  case ATypeKind of
    tkInteger,
    tkInt64: Result := ftInteger;
    tkChar,
    tkString: Result := ftString;
    tkEnumeration: Result := ftSmallint;
    tkFloat: Result := ftFloat;
    tkLString: Result := ftBlob;
  else
    Result := ftUnknown;
  end;
end;

function TypeKindToSize(ATypeKind: TTypeKind): Integer;
begin
  case ATypeKind of
    tkChar,
    tkString: Result := 255;
    tkLString: Result := 4096;
  else
    Result := 0;
  end;
end;

function CreateDataSetFromModel(ATableName: string): TClientDataSet;
var
  I, TotalProp: Integer;
  cds: TClientDataSet;
  obj: TObject;
  p_PropList: PPropList;
  Prop: TPropInfo;
begin
  cds := TClientDataSet.Create(nil);

  obj := TModel(GetClass(ATableName).NewInstance);
  TotalProp := GetPropList(obj, p_PropList);

  for I := 0 to Pred(TotalProp) do
  begin
    Prop := p_PropList[I]^;
    cds.FieldDefs.Add(Prop.Name,
                      TypeKindToDataType(Prop.PropType^.Kind),
                      TypeKindToSize(Prop.PropType^.Kind),
                      False{Required});
  end;

  Result := cds;
end;

function StrToStatusTarefa(AStr: string): TStatusTarefa;
var
  I: TStatusTarefa;
begin
  Result := stNone;
  for I := Low(TStatusTarefa) to High(TStatusTarefa) do
    if (ArrayStrStatusTarefa[I] = AStr) then
    begin
      Result := I;
      Break;
    end;
end;

function StatusTarefaToStr(AItem: TStatusTarefa): string;
begin
  Result := ArrayStrStatusTarefa[AItem];
end;

end.
