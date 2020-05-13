unit UDataAccessObjectBuilder;

interface

uses Classes, SysUtils, UIDataAccessObject, UDataAccessObject, UToDoManagerTypes;

type
  TDataAccessObjectBuilder = class
  public
    class function GetInstance(ATipoConexao: TTipoConexao): IDataAccessObject;
  end;

implementation

uses UDataAccessObjectCDS{, UDataAccessObjectFB, UDataAccessObjectMSSQL, UDataAccessObjectORA};

{ TDataAccessObjectBuilder }

class function TDataAccessObjectBuilder.GetInstance(ATipoConexao: TTipoConexao): IDataAccessObject;
begin
  case ATipoConexao of
    tcCDS: Result := TDataAccessObjectCDS.Create;
    {tcFirebird:   Result := TDataAccessObjectFB.Create;
    tcSQLServer:  Result := TDataAccessObjectMSSQL.Create;
    tcOracle:  Result := TDataAccessObjectORA.Create;}
  else
    raise Exception.Create('Tipo de Conexão não encontrado.');
  end;
end;

end.

