unit UIDataAccessObject;

interface

uses Classes, UToDoManagerTypes, UIModel;

type
  IDataAccessObject = interface
    ['{71A71EC2-B449-4B52-87EC-4C1360AF709E}']
    function GetBaseConectada: Boolean;
    procedure SetBaseConectada(const Value: Boolean);
    function GetTipoConexao: TTipoConexao;
    function Insert(AModel: IModel): Boolean;
    function Update(AModel: IModel): Boolean;
    function RetrieveById(AModel: IModel; const AId: Integer): Boolean;
    function RetrieveAllFromStructure(AModelName: string): TList;
    function DeleteById(const AId: Integer): Boolean;
    procedure Connect;
    procedure Disconnect;

    property BaseConectada: Boolean read GetBaseConectada write SetBaseConectada;
    property TipoConexao: TTipoConexao read GetTipoConexao;
  end;

implementation

end.
