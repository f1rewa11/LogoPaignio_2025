object frmProgramDay: TfrmProgramDay
  Left = 0
  Top = 0
  Caption = #928#961#972#947#961#945#956#956#945
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
    Width = 316
    Height = 30
    Alignment = taCenter
    Caption = #928' '#929' '#927' '#915' '#929' '#913' '#924' '#924' '#913'  '#919' '#924' '#917' '#929' '#913' '#931
    Color = clAqua
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label3: TLabel
    Left = 48
    Top = 259
    Width = 72
    Height = 17
    Caption = #920#949#961#945#960#949#965#964#942#962
  end
  object Label4: TLabel
    Left = 48
    Top = 304
    Width = 31
    Height = 17
    Caption = #928#945#953#948#943
  end
  object Label8: TLabel
    Left = 618
    Top = 304
    Width = 70
    Height = 17
    Caption = #919#956#949#961#959#956#951#957#943#945
  end
  object Label9: TLabel
    Left = 618
    Top = 259
    Width = 27
    Height = 17
    Caption = #911#961#945
  end
  object DBNavigator1: TDBNavigator
    Left = 48
    Top = 440
    Width = 850
    Height = 25
    DataSource = DataSource1
    TabOrder = 0
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 138
    Top = 304
    Width = 209
    Height = 25
    DataField = 'kids_id'
    DataSource = DataSource1
    KeyField = 'id'
    ListField = 'FullName'
    ListSource = DataSourceKid
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 48
    Top = 55
    Width = 857
    Height = 186
    DataSource = DataSource1
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Imerominia'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ora'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'kids_id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'teachers_id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Therapeutis_name'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Paidi_Eponymo_name'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Xreosi'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Xreosi2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'absence'
        Visible = True
      end>
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 138
    Top = 259
    Width = 209
    Height = 25
    DataField = 'teachers_id'
    DataSource = DataSource1
    KeyField = 'id'
    ListField = 'FullNameTeacher'
    ListSource = DataSourceTeacher
    TabOrder = 3
  end
  object DBCheckBox4: TDBCheckBox
    Left = 304
    Top = 373
    Width = 177
    Height = 17
    Caption = '  '#913#954#965#961#974#952#951#954#949' '#956#949' '#967#961#941#969#963#951
    DataField = 'Xreosi'
    DataSource = DataSource1
    TabOrder = 4
    ValueChecked = '1'
    ValueUnchecked = '0'
    OnClick = DBCheckBox4Click
  end
  object DateTimePicker2: TDateTimePicker
    Left = 712
    Top = 259
    Width = 186
    Height = 25
    Date = 45968.000000000000000000
    Format = 'hh:mm'
    Time = 0.636714594904333400
    Kind = dtkTime
    TabOrder = 5
    OnChange = DateTimePicker2Change
  end
  object DateTimePicker1: TDateTimePicker
    Left = 712
    Top = 304
    Width = 186
    Height = 25
    Date = 45981.000000000000000000
    Time = 0.640056898148031900
    TabOrder = 6
    OnChange = DateTimePicker1Change
  end
  object DBCheckBox1: TDBCheckBox
    Left = 618
    Top = 373
    Width = 225
    Height = 17
    Caption = '  '#913#954#965#961#974#952#951#954#949' '#956#949' '#956#953#963#942' '#967#961#941#969#963#951
    DataField = 'Xreosi2'
    DataSource = DataSource1
    TabOrder = 7
    ValueChecked = '1'
    ValueUnchecked = '0'
    OnClick = DBCheckBox1Click
  end
  object DBCheckBox2: TDBCheckBox
    Left = 48
    Top = 373
    Width = 113
    Height = 17
    Caption = #913#960#959#965#963#943#945
    DataField = 'absence'
    DataSource = DataSource1
    TabOrder = 8
    ValueChecked = '1'
    ValueUnchecked = '0'
    OnClick = DBCheckBox1Click
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=MYDB'
      'User_Name=root'
      'Password=69296929'
      'Server=127.0.0.1'
      'DriverID=MySQL')
    Connected = True
    Left = 352
    Top = 488
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    OnDataChange = DataSource1DataChange
    Left = 464
    Top = 488
  end
  object FDQueryTeacher: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      
        'SELECT id, CONCAT(lastname, '#39'  '#39', firstname) AS FullNameTeacher ' +
        ' FROM teachers')
    Left = 120
    Top = 488
  end
  object DataSourceTeacher: TDataSource
    DataSet = FDQueryTeacher
    Left = 672
    Top = 488
  end
  object FDQuery1: TFDQuery
    Active = True
    AfterInsert = FDQuery1AfterInsert
    BeforePost = FDQuery1BeforePost
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT'
      '  P.id,'
      '  P.date AS Imerominia,'
      '  P.time AS ora,'
      '  P.kids_id as kids_id,'
      '  p.teachers_id as teachers_id,'
      '  T.lastname AS Therapeutis_name,'
      '  K.lastname AS Paidi_Eponymo_name,'
      '  P.debit AS Xreosi,'
      '  P.debit2 AS Xreosi2,'
      '  P.absence AS absence'
      'FROM'
      '  PROGRAM P'
      'LEFT JOIN'
      '  teachers T ON P.teachers_id = T.id'
      'LEFT JOIN'
      '  kids K ON P.kids_id = K.id;')
    Left = 240
    Top = 488
    object FDQuery1id: TFDAutoIncField
      FieldName = 'id'
      ReadOnly = False
    end
    object FDQuery1Imerominia: TDateField
      FieldName = 'Imerominia'
      Required = True
    end
    object FDQuery1ora: TTimeField
      FieldName = 'ora'
      Required = True
    end
    object FDQuery1kids_id: TIntegerField
      FieldName = 'kids_id'
      Required = True
    end
    object FDQuery1teachers_id: TIntegerField
      FieldName = 'teachers_id'
      Required = True
    end
    object FDQuery1Therapeutis_name: TWideStringField
      FieldName = 'Therapeutis_name'
      ReadOnly = True
      Size = 26
    end
    object FDQuery1Paidi_Eponymo_name: TWideStringField
      FieldName = 'Paidi_Eponymo_name'
      ReadOnly = True
      Size = 60
    end
    object FDQuery1Xreosi: TIntegerField
      FieldName = 'Xreosi'
    end
    object FDQuery1Xreosi2: TIntegerField
      FieldName = 'Xreosi2'
    end
    object FDQuery1absence: TIntegerField
      FieldName = 'absence'
    end
  end
  object FDQueryKid: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT id, CONCAT(lastname, '#39' '#39', fistname) AS FullName FROM kids')
    Left = 104
    Top = 552
  end
  object DataSourceKid: TDataSource
    DataSet = FDQueryKid
    Left = 560
    Top = 488
  end
end
