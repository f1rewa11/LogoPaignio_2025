object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 444
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 128
    Top = 67
    Width = 52
    Height = 15
    Caption = #917#960#974#957#965#956#959
  end
  object Label2: TLabel
    Left = 128
    Top = 123
    Width = 37
    Height = 15
    Caption = #908#957#959#956#945
  end
  object Label3: TLabel
    Left = 128
    Top = 192
    Width = 58
    Height = 15
    Caption = #917#953#948#953#954#972#964#951#964#945
  end
  object DBEdit1: TDBEdit
    Left = 216
    Top = 64
    Width = 121
    Height = 23
    DataSource = DataSourceEdit
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 216
    Top = 120
    Width = 121
    Height = 23
    DataSource = DataSourceEdit
    TabOrder = 1
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 216
    Top = 192
    Width = 145
    Height = 23
    DataSource = DataSourceEdit
    TabOrder = 2
  end
  object FDQueryedit: TFDQuery
    ConstraintsEnabled = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM teachers WHERE id = :teacher_id')
    Left = 456
    Top = 256
    ParamData = <
      item
        Name = 'TEACHER_ID'
        ParamType = ptInput
      end>
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'User_Name=root'
      'Database=mydb'
      'Password=69296929'
      'Server=127.0.0.1'
      'DriverID=MySQL')
    Connected = True
    Left = 120
    Top = 296
  end
  object DataSourceEdit: TDataSource
    DataSet = FDQueryedit
    Left = 408
    Top = 344
  end
  object FDQuerySpecializations: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'SELECT id, specialization FROM specialization ORDER BY specializ' +
        'ation')
    Left = 248
    Top = 336
  end
  object DataSourceSpecializations: TDataSource
    DataSet = FDQuerySpecializations
    Left = 336
    Top = 280
  end
end
