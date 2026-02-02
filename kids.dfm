object frmKids: TfrmKids
  Left = 0
  Top = 0
  Caption = #928#945#953#948#943
  ClientHeight = 847
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
    Width = 84
    Height = 30
    Alignment = taCenter
    Caption = #928' '#913' '#921' '#916' '#921
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
    Left = 399
    Top = 475
    Width = 55
    Height = 17
    Caption = #917#960#974#957#965#956#959
  end
  object Label3: TLabel
    Left = 55
    Top = 475
    Width = 40
    Height = 17
    Caption = #908#957#959#956#945
  end
  object Label4: TLabel
    Left = 31
    Top = 536
    Width = 95
    Height = 17
    Caption = #917#960#974#957#965#956#959' '#947#959#957#941#945
  end
  object Label8: TLabel
    Left = 625
    Top = 536
    Width = 76
    Height = 17
    Caption = #919#956'. '#915#941#957#957#951#963#951#962
  end
  object Label9: TLabel
    Left = 711
    Top = 475
    Width = 36
    Height = 17
    Caption = #913#924#922#913
  end
  object Label5: TLabel
    Left = 56
    Top = 67
    Width = 70
    Height = 17
    Caption = #936#940#967#957#969' '#947#953#945' '
  end
  object DBEdit1: TDBEdit
    Left = 151
    Top = 472
    Width = 185
    Height = 25
    DataField = 'fistname'
    DataSource = DataSource1
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 478
    Top = 472
    Width = 185
    Height = 25
    DataField = 'lastname'
    DataSource = DataSource1
    TabOrder = 1
  end
  object DBNavigator1: TDBNavigator
    Left = 56
    Top = 688
    Width = 850
    Height = 25
    DataSource = DataSource1
    TabOrder = 2
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 151
    Top = 536
    Width = 209
    Height = 25
    DataField = 'parent_id'
    DataSource = DataSource1
    KeyField = 'id'
    ListField = 'FullName'
    ListSource = DataSourceParent
    TabOrder = 3
    OnDropDown = DBLookupComboBox1DropDown
  end
  object DBGrid1: TDBGrid
    Left = 48
    Top = 128
    Width = 857
    Height = 273
    DataSource = DataSource1
    ReadOnly = True
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
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'parent_id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fistname'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'lastname'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'amka'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'gnomateysi'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'birthdate'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ergo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cyxo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'logo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ParentName'
        Visible = True
      end>
  end
  object DBCheckBox1: TDBCheckBox
    Left = 145
    Top = 599
    Width = 97
    Height = 17
    Caption = #904#961#947#959
    DataField = 'ergo'
    DataSource = DataSource1
    TabOrder = 5
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object DBCheckBox2: TDBCheckBox
    Left = 399
    Top = 599
    Width = 97
    Height = 17
    Caption = #923#972#947#959
    DataField = 'logo'
    DataSource = DataSource1
    TabOrder = 6
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object DBCheckBox3: TDBCheckBox
    Left = 625
    Top = 599
    Width = 97
    Height = 17
    Caption = #936#973#967#959
    DataField = 'cyxo'
    DataSource = DataSource1
    TabOrder = 7
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object DateTimePicker1: TDateTimePicker
    Left = 719
    Top = 528
    Width = 186
    Height = 25
    Date = 45968.000000000000000000
    Time = 0.636714594904333400
    TabOrder = 8
    OnChange = DateTimePicker1Change
    OnDropDown = DateTimePicker1DropDown
  end
  object DBEdit3: TDBEdit
    Left = 784
    Top = 472
    Width = 121
    Height = 25
    DataField = 'amka'
    DataSource = DataSource1
    TabOrder = 9
  end
  object DBCheckBox4: TDBCheckBox
    Left = 399
    Top = 537
    Width = 97
    Height = 17
    Caption = #915#957#969#956#940#964#949#965#963#951
    DataField = 'gnomateysi'
    DataSource = DataSource1
    TabOrder = 10
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object btnSearchClick: TButton
    Left = 479
    Top = 64
    Width = 75
    Height = 25
    Caption = #913#957#945#950#942#964#951#963#951
    DragCursor = crHandPoint
    TabOrder = 11
    OnClick = btnSearchClickClick
  end
  object edtSearch: TEdit
    Left = 132
    Top = 64
    Width = 301
    Height = 25
    TabOrder = 12
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=MYDB'
      'User_Name=root'
      'Password=69296929'
      'Server=127.0.0.1'
      'DriverID=MySQL')
    Connected = True
    Left = 360
    Top = 736
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    OnDataChange = DataSource1DataChange
    Left = 472
    Top = 736
  end
  object FDQueryParent: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT id, CONCAT(lastname, '#39' '#39', firstname) AS FullName '
      'FROM parent '
      'ORDER BY lastname ASC')
    Left = 128
    Top = 736
  end
  object DataSourceParent: TDataSource
    DataSet = FDQueryParent
    Left = 560
    Top = 736
  end
  object FDQuery1: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT'
      '  T.*,'
      '  S.lastname as ParentName'
      'FROM'
      '  kids  T'
      'LEFT JOIN'
      '  parent S ON T.parent_id = S.id order by lastname')
    Left = 248
    Top = 736
    object FDQuery1id: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object FDQuery1parent_id: TIntegerField
      FieldName = 'parent_id'
      Origin = 'parent_id'
      Required = True
    end
    object FDQuery1fistname: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'fistname'
      Origin = 'fistname'
      Size = 60
    end
    object FDQuery1lastname: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'lastname'
      Origin = 'lastname'
      Size = 60
    end
    object FDQuery1amka: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'amka'
      Origin = 'amka'
      Size = 14
    end
    object FDQuery1gnomateysi: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'gnomateysi'
      Origin = 'gnomateysi'
    end
    object FDQuery1birthdate: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'birthdate'
      Origin = 'birthdate'
    end
    object FDQuery1ergo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ergo'
      Origin = 'ergo'
    end
    object FDQuery1cyxo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cyxo'
      Origin = 'cyxo'
    end
    object FDQuery1logo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'logo'
      Origin = 'logo'
    end
    object FDQuery1ParentName: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'ParentName'
      Origin = 'lastname'
      ProviderFlags = []
      ReadOnly = True
      Size = 26
    end
  end
end
