unit Vevaiosi;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Vcl.Mask, Vcl.ExtCtrls;

type
  TfrmVevaiosi = class(TForm)
    DBLookupComboBox2: TDBLookupComboBox;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    FDMemTable1: TFDMemTable;
    DBGrid1: TDBGrid;
    dsReport: TDataSource;
    qryErgo: TFDQuery;
    qryLogo: TFDQuery;
    qryPsych: TFDQuery;
    FDConnection1: TFDConnection;
    FDMemTable1ΑΑ: TIntegerField;
    FDMemTable1Psych_Day: TStringField;
    FDMemTable1Psych_Date: TDateField;
    FDMemTable1Ergo_Day: TStringField;
    FDMemTable1Ergo_Date: TDateField;
    FDMemTable1Logo_Day: TStringField;
    FDMemTable1Logo_Date: TDateField;
    edtPlithosPsych: TLabeledEdit;
    edtPlithosErgo: TLabeledEdit;
    edtPlithosLogo: TLabeledEdit;
    btnSearchClick1: TButton;
    qryKidsList: TFDQuery;
    dsKidsList: TDataSource;
    procedure btnSearchClick1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVevaiosi: TfrmVevaiosi;

implementation

{$R *.dfm}
uses System.DateUtils;

// -----------------------------------------------------------------------------
// ΒΟΗΘΗΤΙΚΗ ΣΥΝΑΡΤΗΣΗ: Μετατρέπει την ημερομηνία στην αντίστοιχη Ελληνική Ημέρα
// -----------------------------------------------------------------------------
function GetGreekDay(ADate: TDateTime): string;
begin
  case DayOfTheWeek(ADate) of
    1: Result := 'ΔΕΥΤΕΡΑ';
    2: Result := 'ΤΡΙΤΗ';
    3: Result := 'ΤΕΤΑΡΤΗ';
    4: Result := 'ΠΕΜΠΤΗ';
    5: Result := 'ΠΑΡΑΣΚΕΥΗ';
    6: Result := 'ΣΑΒΒΑΤΟ';
    7: Result := 'ΚΥΡΙΑΚΗ';
  else
    Result := '';
  end;
end;




procedure TfrmVevaiosi.btnSearchClick1Click(Sender: TObject);
var
  i, MaxRows: Integer;
begin
  // Έλεγχος ότι έχει επιλεγεί παιδί στο DBLookupComboBox
  if VarIsNull(DBLookupComboBox2.KeyValue) then
  begin
    ShowMessage('Παρακαλώ επιλέξτε παιδί από τη λίστα.');
    Exit;
  end;

  // 1. Προετοιμασία: Καθαρίζουμε τον εικονικό πίνακα
  FDMemTable1.Close;
  FDMemTable1.Open;

  // 2. Εκτέλεση Query για ΨΥΧΟΘΕΡΑΠΕΙΑ
  qryPsych.Close;
  qryPsych.ParamByName('KID').AsInteger := DBLookupComboBox2.KeyValue;
  qryPsych.ParamByName('DateFrom').AsDate := DateTimePicker1.Date;
  qryPsych.ParamByName('DateTo').AsDate := DateTimePicker2.Date;
  qryPsych.ParamByName('Eidikotita').AsString := 'ΨΥΧΟΛΟΓΟΣ';
  qryPsych.ParamByName('Plithos').AsInteger := StrToIntDef(edtPlithosPsych.Text, 0);
  qryPsych.Open;

  // 3. Εκτέλεση Query για ΕΡΓΟΘΕΡΑΠΕΙΑ
  qryErgo.Close;
  qryErgo.ParamByName('KID').AsInteger := DBLookupComboBox2.KeyValue;
  qryErgo.ParamByName('DateFrom').AsDate := DateTimePicker1.Date;
  qryErgo.ParamByName('DateTo').AsDate := DateTimePicker2.Date;
  qryErgo.ParamByName('Eidikotita').AsString := 'ΕΡΓΟΘΕΡΑΠΕΥΤΗΣ';
  qryErgo.ParamByName('Plithos').AsInteger := StrToIntDef(edtPlithosErgo.Text, 0);
  qryErgo.Open;

  // 4. Εκτέλεση Query για ΛΟΓΟΘΕΡΑΠΕΙΑ
  qryLogo.Close;
  qryLogo.ParamByName('KID').AsInteger := DBLookupComboBox2.KeyValue;
  qryLogo.ParamByName('DateFrom').AsDate := DateTimePicker1.Date;
  qryLogo.ParamByName('DateTo').AsDate := DateTimePicker2.Date;
  qryLogo.ParamByName('Eidikotita').AsString := 'ΛΟΓΟΘΕΡΑΠΕΥΤΗΣ';
  qryLogo.ParamByName('Plithos').AsInteger := StrToIntDef(edtPlithosLogo.Text, 0);
  qryLogo.Open;

  // 5. Βρίσκουμε το "ταβάνι"
  MaxRows := qryPsych.RecordCount;
  if qryErgo.RecordCount > MaxRows then MaxRows := qryErgo.RecordCount;
  if qryLogo.RecordCount > MaxRows then MaxRows := qryLogo.RecordCount;

  // 6. Ενοποίηση: Χώνουμε τα δεδομένα στον FDMemTable1 γραμμή-γραμμή
  qryPsych.First;
  qryErgo.First;
  qryLogo.First;

  for i := 1 to MaxRows do
  begin
    FDMemTable1.Append;
    FDMemTable1.FieldByName('AA').AsInteger := i;

    if not qryPsych.Eof then
    begin
      FDMemTable1.FieldByName('Psych_Date').AsDateTime := qryPsych.FieldByName('Imerominia').AsDateTime;
      FDMemTable1.FieldByName('Psych_Day').AsString := GetGreekDay(qryPsych.FieldByName('Imerominia').AsDateTime);
      qryPsych.Next;
    end;

    if not qryErgo.Eof then
    begin
      FDMemTable1.FieldByName('Ergo_Date').AsDateTime := qryErgo.FieldByName('Imerominia').AsDateTime;
      FDMemTable1.FieldByName('Ergo_Day').AsString := GetGreekDay(qryErgo.FieldByName('Imerominia').AsDateTime);
      qryErgo.Next;
    end;

    if not qryLogo.Eof then
    begin
      FDMemTable1.FieldByName('Logo_Date').AsDateTime := qryLogo.FieldByName('Imerominia').AsDateTime;
      FDMemTable1.FieldByName('Logo_Day').AsString := GetGreekDay(qryLogo.FieldByName('Imerominia').AsDateTime);
      qryLogo.Next;
    end;

    FDMemTable1.Post;
  end;
end;

end.
end.
