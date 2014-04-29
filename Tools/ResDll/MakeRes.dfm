object Form1: TForm1
  Left = 205
  Top = 154
  Width = 391
  Height = 272
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 383
    Height = 176
    Align = alClient
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 176
    Width = 383
    Height = 62
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      383
      62)
    object Label1: TLabel
      Left = 104
      Top = 16
      Width = 60
      Height = 13
      Caption = 'Path of Dlls :'
    end
    object Label2: TLabel
      Left = 96
      Top = 40
      Width = 67
      Height = 13
      Caption = 'Path for Files :'
    end
    object btnMakeBin: TButton
      Left = 8
      Top = 5
      Width = 80
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Make Bin Files'
      TabOrder = 0
      OnClick = btnMakeBinClick
    end
    object Button2: TButton
      Left = 8
      Top = 37
      Width = 80
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Make Res File'
      TabOrder = 1
      OnClick = Button2Click
    end
    object edDll: TEdit
      Left = 176
      Top = 8
      Width = 161
      Height = 21
      TabOrder = 2
      Text = '..\..\Dll\'
    end
    object edFiles: TEdit
      Left = 176
      Top = 32
      Width = 161
      Height = 21
      TabOrder = 3
      Text = '..\..\VCL\'
    end
    object btnHelp: TButton
      Left = 344
      Top = 8
      Width = 33
      Height = 41
      Caption = 'Help'
      TabOrder = 4
      OnClick = btnHelpClick
    end
  end
end
