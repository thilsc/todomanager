program ToDoManager;

uses
  Forms,
  UDataAccessObject in 'DAO\UDataAccessObject.pas',
  UIDataAccessObject in 'DAO\UIDataAccessObject.pas',
  UDataAccessObjectBuilder in 'DAO\UDataAccessObjectBuilder.pas',
  UDataAccessObjectCDS in 'DAO\UDataAccessObjectCDS.pas',
  UDataAccessObjectList in 'DAO\UDataAccessObjectList.pas',
  UIModel in 'Model\Interface\UIModel.pas',
  UModel in 'Model\UModel.pas',
  UTarefa in 'Model\Tarefa\UTarefa.pas',
  UTarefaList in 'Model\Tarefa\UTarefaList.pas',
  UITarefa in 'Model\Tarefa\Interface\UITarefa.pas',
  UFrmMain in 'View\UFrmMain.pas' {FrmMain},
  UFrmTarefa in 'View\UFrmTarefa.pas' {FrmTarefa},
  UTarefaController in 'Controller\UTarefaController.pas',
  UController in 'Controller\UController.pas',
  UToDoManagerTypes in 'UToDoManagerTypes.pas',
  UToDoManagerUtils in 'UToDoManagerUtils.pas',
  UToDoManagerConsts in 'UToDoManagerConsts.pas',
  UConexaoSingleton in 'UConexaoSingleton.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.

(*
=================================
Desafio de Programa��o (OPCIONAL)
=================================

"Crie uma aplica��o (em qualquer linguagem) que mostre o �timo desenvolvedor que voc� �.
Nosso objetivo � entender seu n�vel de maturidade em implementar solu��es com o uso das melhores pr�ticas.
Voc� � quem decide o tamanho da aplica��o e quais funcionalidade ela ter�, mas n�o se preocupe,
"os menores frascos podem conter os melhores perfumes".
O importante ser� demonstrar ao m�ximo o seu potencial em inovar e implementar.
O �nico requisito � que esteja dentro de um dos temas abaixo:
� Avia��o
� Esportes
� Vestibular

#N�o s�o requisitos obrigat�rios, mas adorar�amos ver sua familiaridade em:
� Utilizar OO;
� Aplicar design patterns;
� Trabalhar com integra��es modernas (API's / WebServices / Webhooks);
� Organiza��o do c�digo (indenta��o, coment�rios etc.)

#Sempre s�o bem-vindos, mas n�o � fundamental na aplica��o:
� Design;
� Login (a menos que seja inerente � ideia);
� Persist�ncia de dados.


*)
