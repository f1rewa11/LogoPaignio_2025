object frmVevaiosi: TfrmVevaiosi
  Left = 0
  Top = 0
  Caption = #904#954#948#959#963#951' '#914#949#946#945#943#969#963#951#962' '#928#945#961#945#954#959#955#959#973#952#951#963#951#962
  ClientHeight = 678
  ClientWidth = 958
  Color = clActiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 20
    Top = 24
    Width = 209
    Height = 23
    DataField = 'teachers_id'
    KeyField = 'id'
    ListField = 'FullNameTeacher'
    TabOrder = 0
  end
  object DateTimePicker1: TDateTimePicker
    Left = 20
    Top = 64
    Width = 186
    Height = 25
    Date = 45981.000000000000000000
    Time = 0.640056898148031900
    TabOrder = 1
  end
  object DateTimePicker2: TDateTimePicker
    Left = 270
    Top = 64
    Width = 186
    Height = 25
    Date = 45981.000000000000000000
    Time = 0.640056898148031900
    TabOrder = 2
  end
  object btnSearchClick1: TButton
    Left = 719
    Top = 47
    Width = 75
    Height = 25
    Caption = #913#957#945#950#942#964#951#963#951
    DragCursor = crHandPoint
    TabOrder = 3
  end
  object DBGrid1: TDBGrid
    Left = 20
    Top = 213
    Width = 857
    Height = 252
    DataSource = dsReport
    ReadOnly = True
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = #913#913
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Psych_Day'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Psych_Date'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Ergo_Day'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Ergo_Date'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Logo_Day'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Logo_Date'
        Visible = True
      end>
  end
  object edtPlithosPsych: TLabeledEdit
    Left = 56
    Top = 144
    Width = 25
    Height = 23
    EditLabel.Width = 32
    EditLabel.Height = 15
    EditLabel.Caption = #936#933#935#927
    TabOrder = 5
    Text = ''
  end
  object edtPlithosErgo: TLabeledEdit
    Left = 178
    Top = 144
    Width = 28
    Height = 23
    EditLabel.Width = 28
    EditLabel.Height = 15
    EditLabel.Caption = #917#929#915#927
    TabOrder = 6
    Text = ''
  end
  object edtPlithosLogo: TLabeledEdit
    Left = 296
    Top = 144
    Width = 25
    Height = 23
    EditLabel.Width = 32
    EditLabel.Height = 15
    EditLabel.Caption = #923#927#915#927
    TabOrder = 7
    Text = ''
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 56
    Top = 520
    object FDMemTable1ΑΑ: TIntegerField
      FieldName = #913#913
    end
    object FDMemTable1Psych_Day: TStringField
      FieldName = 'Psych_Day'
    end
    object FDMemTable1Psych_Date: TDateField
      FieldName = 'Psych_Date'
    end
    object FDMemTable1Ergo_Day: TStringField
      FieldName = 'Ergo_Day'
    end
    object FDMemTable1Ergo_Date: TDateField
      FieldName = 'Ergo_Date'
    end
    object FDMemTable1Logo_Day: TStringField
      FieldName = 'Logo_Day'
    end
    object FDMemTable1Logo_Date: TDateField
      FieldName = 'Logo_Date'
    end
  end
  object dsReport: TDataSource
    DataSet = FDMemTable1
    Left = 312
    Top = 518
  end
  object qryErgo: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'WITH RECURSIVE AllDates AS ('
      '    SELECT DATE(:DateFrom) AS Imerominia'
      '    UNION ALL'
      '    SELECT DATE_ADD(Imerominia, INTERVAL 1 DAY)'
      '    FROM AllDates'
      '    WHERE Imerominia < :DateTo'
      '),'
      'ValidDates AS ('
      '    SELECT Imerominia '
      '    FROM AllDates '
      '    WHERE DAYOFWEEK(Imerominia) NOT IN (1, 7)'
      '),'
      'ActualDates AS ('
      '    SELECT DISTINCT p.date AS Imerominia, 0 AS IsDummy'
      '    FROM program p'
      '    JOIN teachers t ON p.teachers_id = t.id'
      '    WHERE p.kids_id = :KID '
      '      AND t.eidikotita = :Eidikotita'
      '      AND p.date >= :DateFrom '
      '      AND p.date <= :DateTo '
      '      AND p.absence = 0'
      '),'
      'DummyDates AS ('
      '    SELECT v.Imerominia, 1 AS IsDummy'
      '    FROM ValidDates v'
      '    LEFT JOIN ActualDates a ON v.Imerominia = a.Imerominia'
      '    WHERE a.Imerominia IS NULL'
      '),'
      'Combined AS ('
      '    SELECT Imerominia, IsDummy FROM ActualDates'
      '    UNION ALL'
      '    SELECT Imerominia, IsDummy FROM ('
      
        '        SELECT Imerominia, IsDummy FROM DummyDates ORDER BY RAND' +
        '()'
      '    ) AS ShuffledDummies'
      '),'
      'FinalSelection AS ('
      '    SELECT Imerominia '
      '    FROM Combined'
      '    ORDER BY IsDummy ASC '
      '    LIMIT :Plithos'
      ')'
      'SELECT Imerominia '
      'FROM FinalSelection'
      'ORDER BY Imerominia ASC;')
    Left = 544
    Top = 512
    ParamData = <
      item
        Name = 'DATEFROM'
        ParamType = ptInput
      end
      item
        Name = 'DATETO'
        ParamType = ptInput
      end
      item
        Name = 'KID'
        ParamType = ptInput
      end
      item
        Name = 'EIDIKOTITA'
        ParamType = ptInput
      end
      item
        Name = 'PLITHOS'
        ParamType = ptInput
      end>
  end
  object qryLogo: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'WITH RECURSIVE AllDates AS ('
      '    SELECT DATE(:DateFrom) AS Imerominia'
      '    UNION ALL'
      '    SELECT DATE_ADD(Imerominia, INTERVAL 1 DAY)'
      '    FROM AllDates'
      '    WHERE Imerominia < :DateTo'
      '),'
      'ValidDates AS ('
      '    SELECT Imerominia '
      '    FROM AllDates '
      '    WHERE DAYOFWEEK(Imerominia) NOT IN (1, 7)'
      '),'
      'ActualDates AS ('
      '    SELECT DISTINCT p.date AS Imerominia, 0 AS IsDummy'
      '    FROM program p'
      '    JOIN teachers t ON p.teachers_id = t.id'
      '    WHERE p.kids_id = :KID '
      '      AND t.eidikotita = :Eidikotita'
      '      AND p.date >= :DateFrom '
      '      AND p.date <= :DateTo '
      '      AND p.absence = 0'
      '),'
      'DummyDates AS ('
      '    SELECT v.Imerominia, 1 AS IsDummy'
      '    FROM ValidDates v'
      '    LEFT JOIN ActualDates a ON v.Imerominia = a.Imerominia'
      '    WHERE a.Imerominia IS NULL'
      '),'
      'Combined AS ('
      '    SELECT Imerominia, IsDummy FROM ActualDates'
      '    UNION ALL'
      '    SELECT Imerominia, IsDummy FROM ('
      
        '        SELECT Imerominia, IsDummy FROM DummyDates ORDER BY RAND' +
        '()'
      '    ) AS ShuffledDummies'
      '),'
      'FinalSelection AS ('
      '    SELECT Imerominia '
      '    FROM Combined'
      '    ORDER BY IsDummy ASC '
      '    LIMIT :Plithos'
      ')'
      'SELECT Imerominia '
      'FROM FinalSelection'
      'ORDER BY Imerominia ASC;')
    Left = 480
    Top = 512
    ParamData = <
      item
        Name = 'DATEFROM'
        ParamType = ptInput
      end
      item
        Name = 'DATETO'
        ParamType = ptInput
      end
      item
        Name = 'KID'
        ParamType = ptInput
      end
      item
        Name = 'EIDIKOTITA'
        ParamType = ptInput
      end
      item
        Name = 'PLITHOS'
        ParamType = ptInput
      end>
  end
  object qryPsych: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'WITH RECURSIVE AllDates AS ('
      '    SELECT DATE(:DateFrom) AS Imerominia'
      '    UNION ALL'
      '    SELECT DATE_ADD(Imerominia, INTERVAL 1 DAY)'
      '    FROM AllDates'
      '    WHERE Imerominia < :DateTo'
      '),'
      'ValidDates AS ('
      '    SELECT Imerominia '
      '    FROM AllDates '
      '    WHERE DAYOFWEEK(Imerominia) NOT IN (1, 7)'
      '),'
      'ActualDates AS ('
      '    SELECT DISTINCT p.date AS Imerominia, 0 AS IsDummy'
      '    FROM program p'
      '    JOIN teachers t ON p.teachers_id = t.id'
      '    WHERE p.kids_id = :KID '
      '      AND t.eidikotita = :Eidikotita'
      '      AND p.date >= :DateFrom '
      '      AND p.date <= :DateTo '
      '      AND p.absence = 0'
      '),'
      'DummyDates AS ('
      '    SELECT v.Imerominia, 1 AS IsDummy'
      '    FROM ValidDates v'
      '    LEFT JOIN ActualDates a ON v.Imerominia = a.Imerominia'
      '    WHERE a.Imerominia IS NULL'
      '),'
      'Combined AS ('
      '    SELECT Imerominia, IsDummy FROM ActualDates'
      '    UNION ALL'
      '    SELECT Imerominia, IsDummy FROM ('
      
        '        SELECT Imerominia, IsDummy FROM DummyDates ORDER BY RAND' +
        '()'
      '    ) AS ShuffledDummies'
      '),'
      'FinalSelection AS ('
      '    SELECT Imerominia '
      '    FROM Combined'
      '    ORDER BY IsDummy ASC '
      '    LIMIT :Plithos'
      ')'
      'SELECT Imerominia '
      'FROM FinalSelection'
      'ORDER BY Imerominia ASC;')
    Left = 416
    Top = 512
    ParamData = <
      item
        Name = 'DATEFROM'
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATETO'
        ParamType = ptInput
      end
      item
        Name = 'KID'
        ParamType = ptInput
      end
      item
        Name = 'EIDIKOTITA'
        ParamType = ptInput
      end
      item
        Name = 'PLITHOS'
        ParamType = ptInput
      end>
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=MYDB'
      'User_Name=root'
      'Password=69296929'
      'Server=127.0.0.1'
      'DriverID=MySQL')
    Connected = True
    Left = 176
    Top = 517
  end
end
