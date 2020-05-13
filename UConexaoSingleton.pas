unit UConexaoSingleton;

interface

uses UIDataAccessObject;

type
  TConexaoSingleton = class
  public
    class function GetInstance: IDataAccessObject;
    class procedure CreateInstance;
  end;

implementation

uses UDataAccessObjectBuilder, UToDoManagerTypes;

var
  Conexao: IDataAccessObject;

{ TConexaoSingleton }

class procedure TConexaoSingleton.CreateInstance;
begin
  Conexao := TDataAccessObjectBuilder.GetInstance(tcCDS);
  Conexao.Connect;
end;

class function TConexaoSingleton.GetInstance: IDataAccessObject;
begin
  if not Assigned(Conexao) then
    TConexaoSingleton.CreateInstance;
  Result := Conexao;
end;

initialization
  TConexaoSingleton.GetInstance;
finalization
  if Assigned(Conexao) then
    TConexaoSingleton.GetInstance.Disconnect;
end.
