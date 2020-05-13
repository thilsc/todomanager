object FrmMain: TFrmMain
  Left = 1942
  Top = 154
  Width = 630
  Height = 482
  Caption = 'To-Do Manager'
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBotoes: TPanel
    Left = 0
    Top = 0
    Width = 622
    Height = 33
    Align = alTop
    BevelOuter = bvLowered
    Color = clWhite
    TabOrder = 0
    object lblNovaTarefa: TLabel
      Left = 24
      Top = 8
      Width = 81
      Height = 17
      Cursor = crHandPoint
      Caption = 'Nova Tarefa...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = lblNovaTarefaClick
    end
    object lbEditar: TLabel
      Left = 120
      Top = 8
      Width = 35
      Height = 17
      Cursor = crHandPoint
      Caption = 'Editar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = lbEditarClick
    end
  end
  object dbgrd: TDBGrid
    Left = 0
    Top = 33
    Width = 622
    Height = 418
    Align = alClient
    DataSource = ds
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgrdDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Id'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI Semibold'
        Title.Font.Style = [fsBold]
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Titulo'
        Title.Caption = 'T'#237'tulo'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI Semibold'
        Title.Font.Style = [fsBold]
        Width = 306
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI Semibold'
        Title.Font.Style = [fsBold]
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Prioridade'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI Semibold'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Status'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI Semibold'
        Title.Font.Style = [fsBold]
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DescStatus'
        Title.Caption = 'Status'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI Semibold'
        Title.Font.Style = [fsBold]
        Width = 144
        Visible = True
      end>
  end
  object ds: TDataSource
    DataSet = cds
    Left = 348
    Top = 61
  end
  object cds: TClientDataSet
    Active = True
    Aggregates = <>
    FileName = 'todomanager.bin'
    Params = <>
    Left = 376
    Top = 64
    Data = {
      800000009619E0BD010000001800000005000000000003000000800002496404
      0001000000000006546974756C6F010049000000010005574944544802000200
      78000944657363726963616F0200490000000100055749445448020002000004
      0A5072696F726964616465040001000000000006537461747573040001000000
      00000000}
    object cdsId: TIntegerField
      DisplayWidth = 12
      FieldName = 'Id'
    end
    object cdsTitulo: TStringField
      DisplayWidth = 47
      FieldName = 'Titulo'
      Size = 120
    end
    object cdsDescricao: TStringField
      DisplayWidth = 28
      FieldName = 'Descricao'
      Size = 1024
    end
    object cdsPrioridade: TIntegerField
      DisplayWidth = 12
      FieldName = 'Prioridade'
    end
    object cdsStatus: TIntegerField
      DisplayWidth = 12
      FieldName = 'Status'
    end
    object cdsDescStatus: TStringField
      DisplayWidth = 24
      FieldKind = fkCalculated
      FieldName = 'DescStatus'
      Calculated = True
    end
  end
end
