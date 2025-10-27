object FrmParent: TFrmParent
  Left = 0
  Top = 0
  Caption = #915#959#957#941#945#962
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
    Width = 857
    Height = 30
    Alignment = taCenter
    Caption = #915' '#927' '#925' '#917' '#913' '#931
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
    Width = 64
    Height = 17
    Caption = #917#960#940#947#947#949#955#956#945
  end
  object Label5: TLabel
    Left = 512
    Top = 328
    Width = 31
    Height = 17
    Caption = 'email'
  end
  object Label6: TLabel
    Left = 512
    Top = 395
    Width = 61
    Height = 17
    Caption = #932#951#955#941#966#969#957#959
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
    DataField = 'jobs_id'
    DataSource = DataSource1
    KeyField = 'id'
    ListField = 'job'
    ListSource = DataSourceJobs
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
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'firstname'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'lastname'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'phone'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'email'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'jobs_id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JobName'
        Visible = True
      end>
  end
  object DBEdit3: TDBEdit
    Left = 623
    Top = 325
    Width = 121
    Height = 25
    DataField = 'email'
    DataSource = DataSource1
    TabOrder = 5
  end
  object DBEdit4: TDBEdit
    Left = 623
    Top = 392
    Width = 121
    Height = 25
    DataField = 'phone'
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
  object FDQueryJobs: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT id, job FROM jobs')
    Left = 72
    Top = 496
  end
  object DataSourceJobs: TDataSource
    DataSet = FDQueryJobs
    Left = 552
    Top = 512
  end
  object FDQuery1: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT'
      '  T.*,'
      '  S.job AS JobName'
      'FROM'
      '  parent  T'
      'LEFT JOIN'
      '  jobs S ON T.jobs_id = S.id')
    Left = 208
    Top = 488
  end
end
