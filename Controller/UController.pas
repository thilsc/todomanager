unit UController;

interface

uses Classes, UModel;

type
  TController = class(TInterfacedPersistent)
  protected
    function ValidaCampos(AModel: TModel): Boolean; virtual; abstract;
  public
    constructor Create; overload;
    destructor Destroy; override;

    function Save(AModel: TModel; bValidarCampos: Boolean = True): Boolean; virtual;
  end;

implementation

{ TController }

constructor TController.Create;
begin
//
end;

destructor TController.Destroy;
begin
  //
  inherited Destroy;
end;

function TController.Save(AModel: TModel; bValidarCampos: Boolean = True): Boolean;
begin
  Result := ((not bValidarCampos) or (bValidarCampos and ValidaCampos(AModel))) and AModel.Save;
end;

end.
 