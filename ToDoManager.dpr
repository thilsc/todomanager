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
Desafio de Programação (OPCIONAL)
=================================

"Crie uma aplicação (em qualquer linguagem) que mostre o ótimo desenvolvedor que você é.
Nosso objetivo é entender seu nível de maturidade em implementar soluções com o uso das melhores práticas.
Você é quem decide o tamanho da aplicação e quais funcionalidade ela terá, mas não se preocupe,
"os menores frascos podem conter os melhores perfumes".
O importante será demonstrar ao máximo o seu potencial em inovar e implementar.
O único requisito é que esteja dentro de um dos temas abaixo:
• Aviação
• Esportes
• Vestibular

#Não são requisitos obrigatórios, mas adoraríamos ver sua familiaridade em:
• Utilizar OO;
• Aplicar design patterns;
• Trabalhar com integrações modernas (API's / WebServices / Webhooks);
• Organização do código (indentação, comentários etc.)

#Sempre são bem-vindos, mas não é fundamental na aplicação:
• Design;
• Login (a menos que seja inerente à ideia);
• Persistência de dados.


*)
