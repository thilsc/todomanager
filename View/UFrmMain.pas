unit UFrmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Grids, DBGrids, DB, DBClient;

type
  TFrmMain = class(TForm)
    pnlBotoes: TPanel;
    lblNovaTarefa: TLabel;
    ds: TDataSource;
    dbgrd: TDBGrid;
    lbEditar: TLabel;
    cds: TClientDataSet;
    cdsId: TIntegerField;
    cdsTitulo: TStringField;
    cdsDescricao: TStringField;
    cdsPrioridade: TIntegerField;
    cdsStatus: TIntegerField;
    cdsDescStatus: TStringField;
    procedure lblNovaTarefaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgrdDblClick(Sender: TObject);
    procedure lbEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure NovaTarefa;
    procedure ConsultaTarefa(const AId: Integer);
    procedure AtualizaGrid;
  end;

var
  FrmMain: TFrmMain;

implementation

uses
  UFrmTarefa, UTarefa, UToDoManagerTypes, UDataAccessObjectBuilder, UTarefaList, UConexaoSingleton;

{$R *.dfm}

////////////Métodos da tela

procedure TFrmMain.NovaTarefa;
begin
  if TFrmTarefa.Inserir then
    Self.AtualizaGrid;
end;

procedure TFrmMain.ConsultaTarefa(const AId: Integer);
begin
  with TFrmTarefa.Create(Self) do
    try
      Id := AId;
      if (ShowModal = mrOk) then
        Self.AtualizaGrid;
    finally
      Free;
    end;
end;

procedure TFrmMain.AtualizaGrid;
var
  bk: TBookmark;
begin
  bk := cds.GetBookmark;
  cds.Close;
  cds.Open;
  cds.GotoBookmark(bk);
end;

//////////////Eventos da tela

procedure TFrmMain.FormCreate(Sender: TObject);
var
  TarefaList: TTarefaList;
begin
  TarefaList := TTarefaList.Create(TConexaoSingleton.GetInstance);
  ds.DataSet := TarefaList.GenerateDataSet;
end;

procedure TFrmMain.lblNovaTarefaClick(Sender: TObject);
begin
  lblNovaTarefa.Enabled := False;
  try
    Self.NovaTarefa;
  finally
    lblNovaTarefa.Enabled := True;
  end;                           
end;

procedure TFrmMain.dbgrdDblClick(Sender: TObject);
var
  Id: Integer;
begin
  if (dbgrd.SelectedRows.Count > 0) then
  begin
    Id := 0;
    Self.ConsultaTarefa(Id);
  end
  else
    ShowMessage('Deve selecionar uma tarefa.');
end;

procedure TFrmMain.lbEditarClick(Sender: TObject);
begin
//
end;

end.
