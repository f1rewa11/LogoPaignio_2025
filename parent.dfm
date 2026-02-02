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
    Width = 112
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
    Left = 528
    Top = 315
    Width = 55
    Height = 17
    Caption = #917#960#974#957#965#956#959
  end
  object Label3: TLabel
    Left = 64
    Top = 320
    Width = 40
    Height = 17
    Caption = #908#957#959#956#945
  end
  object Label4: TLabel
    Left = 64
    Top = 376
    Width = 64
    Height = 17
    Caption = #917#960#940#947#947#949#955#956#945
  end
  object Label5: TLabel
    Left = 552
    Top = 438
    Width = 31
    Height = 17
    Caption = 'email'
  end
  object Label6: TLabel
    Left = 67
    Top = 443
    Width = 61
    Height = 17
    Caption = #932#951#955#941#966#969#957#959
  end
  object Label7: TLabel
    Left = 308
    Top = 438
    Width = 61
    Height = 17
    Caption = #932#951#955#941#966#969#957#959
  end
  object Label8: TLabel
    Left = 552
    Top = 376
    Width = 29
    Height = 17
    Caption = #913#934#924
  end
  object Label9: TLabel
    Left = 56
    Top = 67
    Width = 70
    Height = 17
    Caption = #936#940#967#957#969' '#947#953#945' '
  end
  object DBEdit1: TDBEdit
    Left = 160
    Top = 312
    Width = 185
    Height = 25
    DataField = 'firstname'
    DataSource = DataSource1
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 639
    Top = 312
    Width = 185
    Height = 25
    DataField = 'lastname'
    DataSource = DataSource1
    TabOrder = 1
  end
  object DBNavigator1: TDBNavigator
    Left = 48
    Top = 504
    Width = 850
    Height = 25
    DataSource = DataSource1
    TabOrder = 2
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 160
    Top = 376
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
    Top = 127
    Width = 857
    Height = 162
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
        FieldName = 'afm'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'phone'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'phone2'
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
    Left = 639
    Top = 435
    Width = 121
    Height = 25
    DataField = 'email'
    DataSource = DataSource1
    TabOrder = 5
  end
  object DBEdit4: TDBEdit
    Left = 160
    Top = 435
    Width = 121
    Height = 25
    DataField = 'phone'
    DataSource = DataSource1
    TabOrder = 6
  end
  object DBEdit5: TDBEdit
    Left = 384
    Top = 435
    Width = 121
    Height = 25
    DataField = 'phone2'
    DataSource = DataSource1
    TabOrder = 7
  end
  object DBEdit6: TDBEdit
    Left = 639
    Top = 373
    Width = 121
    Height = 25
    DataField = 'afm'
    DataSource = DataSource1
    TabOrder = 8
  end
  object btnSearchClick: TButton
    Left = 479
    Top = 64
    Width = 75
    Height = 25
    Caption = #913#957#945#950#942#964#951#963#951
    DragCursor = crHandPoint
    TabOrder = 9
    OnClick = btnSearchClickClick
  end
  object edtSearch: TEdit
    Left = 132
    Top = 64
    Width = 301
    Height = 25
    TabOrder = 10
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=MYDB'
      'User_Name=root'
      'Password=69296929'
      'Server=127.0.0.1'
      'DriverID=MySQL')
    Connected = True
    Left = 312
    Top = 560
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 424
    Top = 552
  end
  object FDQueryJobs: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT id, job FROM jobs')
    Left = 80
    Top = 544
  end
  object DataSourceJobs: TDataSource
    DataSet = FDQueryJobs
    Left = 560
    Top = 560
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
    Left = 216
    Top = 536
  end
end
