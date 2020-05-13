unit UIModel;

interface

type
  IModel = interface
    ['{DE325B95-7247-4AB6-8897-FD4E96A4E64D}']

    function GetId: Integer;
    function GetModelName: string;
    procedure SetId(const Value: Integer);
    procedure SetModelName(const Value: string);

    function Save: Boolean;
    function Retrieve(const AId: Integer): Boolean;
    function Delete(const AId: Integer): Boolean;

    property Id: Integer read GetId write SetId;
    property ModelName: string read GetModelName write SetModelName;
  end;

implementation

end.
 