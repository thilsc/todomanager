unit UTarefaController;

interface

uses Classes, SysUtils, UController, UModel, UTarefa;

type
  TTarefaController = class(TController)
  protected
    function ValidaCampos(AModel: TModel): Boolean; override;
  public
    class function GravaTarefa(AModel: TTarefa): Boolean;
  end;

implementation

{ TTarefaController }

class function TTarefaController.GravaTarefa(AModel: TTarefa): Boolean;
begin
  with Self.Create do
    try
      Result := Save(AModel);
    finally
      Free;
    end;
end;

function TTarefaController.ValidaCampos(AModel: TModel): Boolean;
begin
  if ((AModel as TTarefa).Titulo = EmptyStr) then
    raise Exception.Create('Necessário informar um Título.');

  //(AModel as TTarefa).Prioridade
  //(AModel as TTarefa).Status

  Result := True;
end;

end.
