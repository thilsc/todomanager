object FrmTarefa: TFrmTarefa
  Left = 1895
  Top = 275
  BorderStyle = bsNone
  Caption = 'Tarefa'
  ClientHeight = 340
  ClientWidth = 512
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poOwnerFormCenter
  DesignSize = (
    512
    340)
  PixelsPerInch = 96
  TextHeight = 13
  object shp1: TShape
    Left = 0
    Top = 33
    Width = 512
    Height = 307
    Align = alClient
  end
  object lblPrioridade: TLabel
    Left = 15
    Top = 308
    Width = 62
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Prioridade'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblTitulo: TLabel
    Left = 15
    Top = 39
    Width = 34
    Height = 17
    Caption = 'T'#237'tulo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblDescricao: TLabel
    Left = 16
    Top = 86
    Width = 57
    Height = 17
    Caption = 'Descri'#231#227'o'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblStatus: TLabel
    Left = 340
    Top = 308
    Width = 38
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Status'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 0
    Width = 512
    Height = 33
    Align = alTop
    BevelOuter = bvLowered
    Color = 14803925
    TabOrder = 0
    object lblGravar: TLabel
      Left = 16
      Top = 8
      Width = 40
      Height = 17
      Cursor = crHandPoint
      Caption = 'Gravar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = lblGravarClick
    end
    object lblCancelar: TLabel
      Left = 72
      Top = 8
      Width = 51
      Height = 17
      Cursor = crHandPoint
      Caption = 'Cancelar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = lblCancelarClick
    end
  end
  object edtTitulo: TEdit
    Left = 15
    Top = 56
    Width = 486
    Height = 25
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object memDescricao: TMemo
    Left = 15
    Top = 107
    Width = 486
    Height = 186
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object ud1: TUpDown
    Left = 136
    Top = 303
    Width = 16
    Height = 25
    Anchors = [akLeft, akBottom]
    Associate = edtPrioridade
    TabOrder = 3
  end
  object edtPrioridade: TEdit
    Left = 87
    Top = 303
    Width = 49
    Height = 25
    Anchors = [akLeft, akBottom]
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
    Text = '0'
  end
  object edtStatus: TEdit
    Left = 384
    Top = 303
    Width = 119
    Height = 25
    Anchors = [akLeft, akRight, akBottom]
    Color = clBlack
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
  end
end
