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
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, RLReport;

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
    qryPsych: TFDQuery;
    RLReport3: TRLReport;
    RLBand9: TRLBand;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel14: TRLLabel;
    RLBand10: TRLBand;
    RLDraw3: TRLDraw;
    RLBand11: TRLBand;
    RLBand12: TRLBand;
    RLLabel12: TRLLabel;
    RLImage3: TRLImage;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel4: TRLLabel;
    Button1: TButton;
    qryReportHeader: TFDQuery;
    RLLabel15: TRLLabel;
    RLLabel16: TRLLabel;
    RLLabel17: TRLLabel;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText6: TRLDBText;
    lblTherapists1: TRLLabel;
    lblEidikotites1: TRLLabel;
    lblAdeies1: TRLLabel;
    lblKidName: TRLLabel;
    lblDuration: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText5: TRLDBText;
    RLDraw1: TRLDraw;
    RLDraw2: TRLDraw;
    lblTherapists2: TRLLabel;
    lblEidikotites2: TRLLabel;
    lblAdeies2: TRLLabel;
    RLDraw4: TRLDraw;
    RLDraw5: TRLDraw;
    lblTherapists3: TRLLabel;
    lblEidikotites3: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel18: TRLLabel;
    RLLabel19: TRLLabel;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    lblAdeies3: TRLLabel;
    edtPsych: TLabeledEdit;
    procedure btnSearchClick1Click(Sender: TObject);
    procedure DBLookupComboBox2CloseUp(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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
  qryPsych.ParamByName('Plithos').AsInteger := StrToIntDef(edtPlithosPsych.Text, 0);
  qryPsych.Open;

  // 3. Εκτέλεση Query για ΕΡΓΟΘΕΡΑΠΕΙΑ
  qryErgo.Close;
  qryErgo.ParamByName('KID').AsInteger := DBLookupComboBox2.KeyValue;
  qryErgo.ParamByName('DateFrom').AsDate := DateTimePicker1.Date;
  qryErgo.ParamByName('DateTo').AsDate := DateTimePicker2.Date;
  qryErgo.ParamByName('Plithos').AsInteger := StrToIntDef(edtPlithosErgo.Text, 0);
  qryErgo.Open;

  // 4. Εκτέλεση Query για ΛΟΓΟΘΕΡΑΠΕΙΑ
  qryLogo.Close;
  qryLogo.ParamByName('KID').AsInteger := DBLookupComboBox2.KeyValue;
  qryLogo.ParamByName('DateFrom').AsDate := DateTimePicker1.Date;
  qryLogo.ParamByName('DateTo').AsDate := DateTimePicker2.Date;
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

procedure TfrmVevaiosi.Button1Click(Sender: TObject);
var TherapistsStr1, EidikotitesStr1, AdeiesStr1, TherapistsStr2, EidikotitesStr2, AdeiesStr2, TherapistsStr3, EidikotitesStr3, AdeiesStr3: string;
// Συνάρτηση για να μεταφράζουμε το ID της ειδικότητας σε κείμενο
  function GetSpecializationName(ID: Integer): string;
  begin
    case ID of
      1: Result := 'ΛΟΓΟΘΕΡΑΠΕΥΤΡΙΑ';
      2: Result := 'ΨΥΧΟΛΟΓΟΣ';
      3: Result := 'ΕΡΓΟΘΕΡΑΠΕΥΤΡΙΑ/ΤΗΣ';
      else Result := '';
    end;
  end;
begin
// 1. Ανοίγουμε το Query για να φέρει τα στοιχεία του συγκεκριμένου παιδιού
  qryReportHeader.Close;
  // Σιγουρέψου ότι το DBLookupComboBox2 είναι αυτό που έχει το ID του παιδιού
  qryReportHeader.ParamByName('KidID').value := DBLookupComboBox2.KeyValue;
  qryReportHeader.Open;

  // 2. Αρχικοποιούμε τα Strings για να χτίσουμε τις λίστες
  TherapistsStr1 := '';
  EidikotitesStr1 := '';
  AdeiesStr1 := '';
  TherapistsStr2 := '';
  EidikotitesStr2 := '';
  AdeiesStr2 := '';
  TherapistsStr3 := '';
  EidikotitesStr3 := '';
  AdeiesStr3 := '';

  // --- ΕΛΕΓΧΟΣ ΓΙΑ ΕΡΓΟΘΕΡΑΠΕΙΑ ---
  if not qryReportHeader.FieldByName('ErgoName').IsNull then
  begin
    TherapistsStr1 := qryReportHeader.FieldByName('ErgoName').AsString;
    EidikotitesStr1 := GetSpecializationName(qryReportHeader.FieldByName('ErgoEidikotitaID').AsInteger);
    AdeiesStr1 := qryReportHeader.FieldByName('ErgoAdeia').AsString;
  end;

  // --- ΕΛΕΓΧΟΣ ΓΙΑ ΨΥΧΟΛΟΓΙΑ ---
  if not qryReportHeader.FieldByName('PsyName').IsNull then
  begin
    TherapistsStr2 := qryReportHeader.FieldByName('PsyName').AsString;
    EidikotitesStr2 := GetSpecializationName(qryReportHeader.FieldByName('PsyEidikotitaID').AsInteger);
    AdeiesStr2 := qryReportHeader.FieldByName('PsyAdeia').AsString;
  end;

  // --- ΕΛΕΓΧΟΣ ΓΙΑ ΛΟΓΟΘΕΡΑΠΕΙΑ ---
  if not qryReportHeader.FieldByName('LogoName').IsNull then
  begin
    TherapistsStr3 := qryReportHeader.FieldByName('LogoName').AsString;
    EidikotitesStr3 := GetSpecializationName(qryReportHeader.FieldByName('LogoEidikotitaID').AsInteger);
    AdeiesStr3 := qryReportHeader.FieldByName('LogoAdeia').AsString;
  end;

  // 3. Ενημερώνουμε τα Labels στο FortesReport
  lblTherapists1.Caption := TherapistsStr1;
  lblEidikotites1.Caption := EidikotitesStr1;
  lblAdeies1.Caption := AdeiesStr1;
  lblTherapists2.Caption := TherapistsStr2;
  lblEidikotites2.Caption := EidikotitesStr2;
  lblAdeies2.Caption := AdeiesStr2;
  lblTherapists3.Caption := TherapistsStr3;
  lblEidikotites3.Caption := EidikotitesStr3;
  lblAdeies3.Caption := AdeiesStr3;
  RLLabel5.CAPTION := edtPsych.Text;

  // Περνάμε το όνομα του παιδιού
  lblKidName.Caption := qryReportHeader.FieldByName('name_for_receipt').AsString;

  // Περνάμε τις ημερομηνίες από τα 2 ημερολόγια
  lblDuration.Caption := DateToStr(DateTimePicker1.Date) + ' ΕΩΣ ' +
                         DateToStr(DateTimePicker2.Date);

  // 4. Εμφανίζουμε την αναφορά!
 frmvevaiosi.RLReport3.preview;
end;

procedure TfrmVevaiosi.DBLookupComboBox2CloseUp(Sender: TObject);
begin
// Ελέγχουμε αν όντως επιλέχθηκε κάποιο παιδί (να μην είναι κενό)
  if not VarIsNull(DBLookupComboBox2.KeyValue) then
  begin
    // Ελέγχουμε αν υπάρχει καταχωρημένη ημερομηνία ΑΠΥ στη βάση
    if not qryKidsList.FieldByName('next_date').IsNull then
    begin
      // 1. Βάζουμε στο "Έως" (Picker2) την ημερομηνία της επόμενης ΑΠΥ
      DateTimePicker2.Date := qryKidsList.FieldByName('next_date').AsDateTime;

      // 2. Βάζουμε στο "Από" (Picker1) την ημερομηνία του Picker2 ΜΕΙΟΝ 30 ημέρες!
      DateTimePicker1.Date := DateTimePicker2.Date - 29;
    end
    else
    begin
      // Προαιρετικά: Αν το παιδί ΔΕΝ έχει καταχωρημένη ημερομηνία ΑΠΥ,
      // βάζουμε ως "Έως" το σημερινό και ως "Από" 30 μέρες πίσω για ασφάλεια.
      DateTimePicker2.Date := Date;
      DateTimePicker1.Date := Date - 29;
    end;
  end;
end;
end.
