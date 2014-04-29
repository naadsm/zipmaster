object Form1: TForm1
  Left = 192
  Top = 114
  Width = 678
  Height = 520
  Caption = 'Update ZipMsgXX.rc from ZipMsgUS.rc'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010002002020100000000000E80200002600000010101000000000002801
    00000E0300002800000020000000400000000100040000000000800200000000
    0000000000000000000000000000000000000000800000800000008080008000
    0000800080008080000080808000C0C0C0000000FF0000FF000000FFFF00FF00
    0000FF00FF00FFFF0000FFFFFF00000000000000000000000000000000000000
    0000000066666666666666666600000000000000077777777777777777007000
    00000070700FFFFFFFFFFFFFF7007FF00000F8708F7FFFFFFFFFFFFFF7007FFF
    FFFFF87077FFFFFFFFFFFFFFF7007FFFFFFFF87077FFF4444444444FF7007FFF
    FFFFF870700FFFFFFFFFFFFFF7007FFFFFFFF8708F7FF4444444444FF7007FFF
    FFFFF87077FFFFFFFFFFFFFFF7007FFFFFFFF87077FFF4444444444FF7007FFF
    FFFFF870700FFFFFFFFFFFFFF7007FFFFFFFF8708F7FF4444444444FF7007FFF
    FFFFF87077FFFFFFFFFFFFFFF7007FFFFFFFF87077FFF4444444444FF7007FFF
    FFFFF870700FFFFFFFFFFFFFF7007FFFFFFFF8708F7FF4444444444FF7007FFF
    FFFFF87077FFFFFFFFFFFFFFF7007FFFFFFFF87077FFF4444444444FF7007FFF
    FFFFF870700FFFFFFFFFFFFFF7007FFFFFFFF8708F7FFFFFFFFF0000F7007FFF
    FFFFF87077FFFFFFFF00888800007FFFFFFFF8707FFFFFFFF788888888007FFF
    FFFFF87077777777778FFFFF88007FFFFFFFF800000000007FFFFFFFF880077F
    FFFF0000000000007FFFF0000880000777770000000000007FFFF0FFF8800000
    00000000000000007FFFF0FFFF800000000000000000000007FFF0FFFF700000
    000000000000000007FFFFFFF870000000000000000000000077FFFF77000000
    0000000000000000000077770000FFF00001FFE000017FC000011F0000010000
    0001000000010000000100000001000000010000000100000001000000010000
    0001000000010000000100000001000000010000000100000001000000010000
    0001000000010000000100000001001FF000803FF000E0FFF000FFFFF000FFFF
    F801FFFFF801FFFFFC03FFFFFF0F280000001000000020000000010004000000
    0000C00000000000000000000000000000000000000000000000000080000080
    000000808000800000008000800080800000C0C0C000808080000000FF0000FF
    000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0000000000000000000000
    00000000000000000007777777008000008F74444F008F000707FFFFFF008FFF
    778F74444F008FFF7707FFFFFF008FFF778F74444F008FFF7707FF0000008FFF
    778F787777008FFF770F8F7F77708FFF78088FF0007008FF78008F707F700088
    80008FF0F7F00000000008FFFF000000000000888800FFFF0000FE0100007C01
    0000380100000001000000010000000100000001000000010000000100000000
    00000200000083000000C7000000FF810000FFC30000}
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 670
    Height = 42
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    object RC_Info: TLabel
      Left = 204
      Top = 3
      Width = 459
      Height = 15
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Layout = tlCenter
    end
    object Msg: TLabel
      Left = 204
      Top = 22
      Width = 459
      Height = 17
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = 'No file Selected'
      Color = clMaroon
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object RcLoad: TButton
      Left = 4
      Top = 3
      Width = 45
      Height = 36
      Caption = 'Load'
      TabOrder = 0
      OnClick = RcLoadClick
    end
    object RcUpdate: TButton
      Left = 49
      Top = 3
      Width = 45
      Height = 36
      Caption = 'Update'
      Enabled = False
      TabOrder = 1
      OnClick = RcUpdateClick
    end
    object RcSave: TButton
      Left = 95
      Top = 3
      Width = 45
      Height = 36
      Caption = 'Save'
      Enabled = False
      TabOrder = 2
      OnClick = RcSaveClick
    end
    object RcAll: TButton
      Left = 150
      Top = 3
      Width = 45
      Height = 36
      Caption = 'All'
      TabOrder = 3
      OnClick = RcAllClick
    end
  end
  object EditRC: TMemo
    Left = 0
    Top = 42
    Width = 670
    Height = 444
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      'Help'
      '----'
      
        'This program may be used to update any ZipMsgXX.rc file by compa' +
        'ring with ZipMsgUS.rc'
      
        'If ZipMsgUS.rc is selected no changes will found but file is for' +
        'mated to take a fany look.'
      
        'Unic requeriment is ZipMsgXX.rc and ZipMsgUS.rc should be at sam' +
        'e directory.'
      ''
      'Steps to use and update ZipMsgXX.rc file'
      ''
      '1 - Press button "Load" to load desidered RC file.'
      '    Current state of file is shown in edit window.'
      '    At this moment you do manual modifications.'
      ''
      '2 - Press button "Update" to execute in order:'
      '    1 - Remove string codes on tarjet not found in source.'
      '    2 - Comment/Uncomment existing string codes on both files.'
      '    3 - Add new string codes also those are currently commented.'
      '    4 - Format string table.'
      ''
      '3 - Press button "Save" to update file on disc.'
      ''
      '4 - Modify what you want and save pressing button "Save RC".'
      ''
      '"All" button update all ZipMsgXX.rc in a selected folder. '
      ''
      'Notes: Edit window uses font Courier New with size 9.'
      '       To format lines are use tabs (char 9).'
      
        '       If you want to include tab characters press Ctrl-I insted' +
        ' of Tab key.')
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 1
    OnChange = EditRCChange
  end
  object OpenRC: TOpenDialog
    DefaultExt = '.rc'
    Filter = 'Zip RC files|ZipMsg*.rc'
    Options = [ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Title = 'Zip RC files'
    Left = 341
    Top = 7
  end
end
