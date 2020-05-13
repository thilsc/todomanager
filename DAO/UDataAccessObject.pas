unit UDataAccessObject;

interface

uses Classes, SysUtils, UIDataAccessObject, UIModel, UToDoManagerTypes;

type
  TDataAccessObject = class(TInterfacedPersistent, IDataAccessObject)
  private
    FTipoConexao: TTipoConexao;
    function GetTipoConexao: TTipoConexao;
  protected
    function GetBaseConectada: Boolean; virtual; abstract;
    procedure SetBaseConectada(const Value: Boolean); virtual; abstract;
  public
    property BaseConectada: Boolean read GetBaseConectada write SetBaseConectada;
    property TipoConexao: TTipoConexao read GetTipoConexao;
    function Insert(AModel: IModel): Boolean; virtual; abstract;
    function Update(AModel: IModel): Boolean; virtual; abstract;
    function RetrieveById(AModel: IModel; const AId: Integer): Boolean; virtual; abstract;
    function RetrieveAllFromStructure(AModelName: string): TList; virtual; abstract;
    function DeleteById(const AId: Integer): Boolean; virtual; abstract;
    procedure Connect; virtual; abstract;
    procedure Disconnect; virtual; abstract;
  end;

implementation

{ TDataAccessObject }

function TDataAccessObject.GetTipoConexao: TTipoConexao;
begin
  Result := FTipoConexao;
end;

end.
