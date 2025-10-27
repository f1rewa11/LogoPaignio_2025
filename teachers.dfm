object FrmTeachers: TFrmTeachers
  Left = 0
  Top = 0
  Caption = #952#949#961#945#960#949#965#964#941#962
  ClientHeight = 634
  ClientWidth = 950
  Color = clActiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 17
  object Label1: TLabel
    Left = 48
    Top = 19
    Width = 190
    Height = 30
    Alignment = taCenter
    Caption = #920' '#917' '#929' '#913' '#928' '#917' '#933' '#932' '#917' '#931' '
    Color = clAqua
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label2: TLabel
    Left = 512
    Top = 267
    Width = 55
    Height = 17
    Caption = #917#960#974#957#965#956#959
  end
  object Label3: TLabel
    Left = 48
    Top = 272
    Width = 40
    Height = 17
    Caption = #908#957#959#956#945
  end
  object Label4: TLabel
    Left = 48
    Top = 328
    Width = 63
    Height = 17
    Caption = #917#953#948#953#954#972#964#951#964#945
  end
  object Label5: TLabel
    Left = 512
    Top = 328
    Width = 45
    Height = 17
    Caption = #937#961#940#961#953#959
  end
  object Label6: TLabel
    Left = 512
    Top = 395
    Width = 91
    Height = 17
    Caption = #902#948#949#953#945' '#917#961#947#945#963#943#945#962
  end
  object DBEdit1: TDBEdit
    Left = 144
    Top = 264
    Width = 185
    Height = 25
    DataField = 'firstname'
    DataSource = DataSource1
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 623
    Top = 264
    Width = 185
    Height = 25
    DataField = 'lastname'
    DataSource = DataSource1
    TabOrder = 1
  end
  object DBNavigator1: TDBNavigator
    Left = 48
    Top = 440
    Width = 850
    Height = 25
    DataSource = DataSource1
    TabOrder = 2
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 144
    Top = 328
    Width = 209
    Height = 25
    DataField = 'specialization_id'
    DataSource = DataSource1
    KeyField = 'id'
    ListField = 'specialization'
    ListSource = DataSourceSpecializations
    TabOrder = 3
  end
  object DBGrid1: TDBGrid
    Left = 48
    Top = 55
    Width = 857
    Height = 186
    DataSource = DataSource1
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'lastname'
        Title.Caption = #908#957#959#956#945
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'firstname'
        Title.Caption = #917#960#974#957#965#956#959
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SpecializationName'
        Title.Caption = #917#953#948#953#954#972#964#951#964#945
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'opening_hours_id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'license'
        Visible = True
      end>
  end
  object DBEdit3: TDBEdit
    Left = 623
    Top = 325
    Width = 121
    Height = 25
    DataField = 'opening_hours_id'
    DataSource = DataSource1
    TabOrder = 5
  end
  object DBEdit4: TDBEdit
    Left = 623
    Top = 392
    Width = 121
    Height = 25
    DataField = 'license'
    DataSource = DataSource1
    TabOrder = 6
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=MYDB'
      'User_Name=root'
      'Password=69296929'
      'Server=127.0.0.1'
      'DriverID=MySQL')
    Connected = True
    Left = 304
    Top = 512
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 416
    Top = 504
  end
  object FDQuerySpecializations: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT id, specialization FROM SPECIALIZATION')
    Left = 72
    Top = 496
  end
  object DataSourceSpecializations: TDataSource
    DataSet = FDQuerySpecializations
    Left = 552
    Top = 512
  end
  object FDQuery1: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT'
      '  T.*,'
      '  S.specialization AS SpecializationName'
      'FROM'
      '  TEACHERS T'
      'LEFT JOIN'
      '  SPECIALIZATION S ON T.specialization_id = S.id')
    Left = 208
    Top = 488
  end
end
