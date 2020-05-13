unit UToDoManagerTypes;

interface

type
  TTipoConexao = (tcNone, tcCDS{, tcFirebird, tcSQLServer, tcOracle});
  TTipoManutencao = (tmNone, tmInsert, tmUpdate, tmDelete);
  TStatusTarefa = (stNone, stAtivo, stConcluido, stCancelado);

implementation

end.
