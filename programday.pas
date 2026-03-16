unit programday;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.DBCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.Imaging.jpeg, RLReport, System.DateUtils;

type
  TfrmProgramDay = class(TForm)
    FDConnection1: TFDConnection;
    DataSource1: TDataSource;
    Label1: TLabel;
    DBNavigator1: TDBNavigator;
    DBLookupComboBox1: TDBLookupComboBox;
    FDQueryTeacher: TFDQuery;
    DataSourceTeacher: TDataSource;
    DBGrid1: TDBGrid;
    FDQuery1: TFDQuery;
    Label3: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    FDQueryKid: TFDQuery;
    DataSourceKid: TDataSource;
    DBCheckBox4: TDBCheckBox;
    DateTimePicker2: TDateTimePicker;
    DateTimePicker1: TDateTimePicker;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    FDQuery1id: TFDAutoIncField;
    FDQuery1Imerominia: TDateField;
    FDQuery1ora: TTimeField;
    FDQuery1kids_id: TIntegerField;
    FDQuery1teachers_id: TIntegerField;
    FDQuery1Therapeutis_name: TWideStringField;
    FDQuery1Paidi_Eponymo_name: TWideStringField;
    FDQuery1Xreosi: TIntegerField;
    FDQuery1Xreosi2: TIntegerField;
    FDQuery1absence: TIntegerField;
    Label5: TLabel;
    btnSearchClick1: TButton;
    edtSearch: TEdit;
    edtSearch2: TEdit;
    edtSearch3: TEdit;
    RLReport1: TRLReport;
    RLBand2: TRLBand;
    RLLabel2: TRLLabel;
    RLDBText2: TRLDBText;
    RLBand3: TRLBand;
    RLDBText1: TRLDBText;
    RLDraw1: TRLDraw;
    RLBand4: TRLBand;
    RLBand5: TRLBand;
    RLLabel6: TRLLabel;
    RLImage1: TRLImage;
    RLLabel1: TRLLabel;
    RLDBText3: TRLDBText;
    dtsPrint: TDataSource;
    Button1: TButton;
    Button2: TButton;
    RLLabel3: TRLLabel;
    DBCheckBox3: TDBCheckBox;
    FDQueryPrint: TFDQuery;
    Button3: TButton;
    FDQuery1replacement: TIntegerField;
    FDQueryPrintCount: TFDQuery;
    RLReport2: TRLReport;
    RLBand1: TRLBand;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLBand6: TRLBand;
    RLDBText5: TRLDBText;
    RLDraw2: TRLDraw;
    RLDBText6: TRLDBText;
    RLBand7: TRLBand;
    RLBand8: TRLBand;
    RLLabel7: TRLLabel;
    RLImage2: TRLImage;
    RLLabel8: TRLLabel;
    RLDBText4: TRLDBText;
    dtsPrintCount: TDataSource;
    RLDBText7: TRLDBText;
    RLLabel9: TRLLabel;
    CounterAA: TRLSystemInfo;
    Button4: TButton;
    FDQueryProgramKid: TFDQuery;
    dtsProgramKid: TDataSource;
    RLReport3: TRLReport;
    RLBand9: TRLBand;
    RLLabel10: TRLLabel;
    RLDBText8: TRLDBText;
    RLLabel11: TRLLabel;
    RLBand10: TRLBand;
    RLDBText9: TRLDBText;
    RLDraw3: TRLDraw;
    RLDBText10: TRLDBText;
    RLSystemInfo1: TRLSystemInfo;
    RLBand11: TRLBand;
    RLBand12: TRLBand;
    RLLabel12: TRLLabel;
    RLImage3: TRLImage;
    RLLabel13: TRLLabel;
    Button5: TButton;
    FDQueryPrintAbsence: TFDQuery;
    Label6: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    FDQueryDebit_Cat: TFDQuery;
    DataSourceDebit_Cat: TDataSource;
    FDQuery1cat_debit_id: TIntegerField;
    FDQuery1Debit_lesson: TIntegerField;
    RLLabel14: TRLLabel;
    RLDBText12: TRLDBText;
    FDQueryProgramKid_backup: TFDQuery;
    RLLabel15: TRLLabel;
    RLLabel16: TRLLabel;
    RLLabel17: TRLLabel;
    RLDBText11: TRLDBText;
    RLDBText13: TRLDBText;
    RLDBText14: TRLDBText;
    procedure DateTimePicker2Change(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure FDQuery1AfterInsert(DataSet: TDataSet);
    procedure DBCheckBox1Click(Sender: TObject);
    procedure DBCheckBox4Click(Sender: TObject);
    procedure FDQuery1BeforePost(DataSet: TDataSet);
    procedure btnSearchClick1Click(Sender: TObject);
    procedure btnSearchClick2Click(Sender: TObject);
    procedure DBLookupComboBox1DropDown(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FDQuery1NewRecord(DataSet: TDataSet);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure DBLookupComboBox1CloseUp(Sender: TObject);



  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProgramDay: TfrmProgramDay;

implementation

{$R *.dfm}

uses logopaignio;





procedure TfrmProgramDay.btnSearchClick1Click(Sender: TObject);
var
  SearchText: String;
  SearchText2: String;
  SearchText3: String;
begin
  // 1. Παίρνουμε το κείμενο και καθαρίζουμε τα κενά γύρω-γύρω
  SearchText := Trim(edtSearch.Text);
  SearchText2 := Trim(edtSearch2.Text);
  SearchText3 := Trim(edtSearch3.Text);
  if SearchText3 = '' then
    SearchText3 := '%';

  FDQuery1.Filter := '( Therapeutis_name LIKE ' + QuotedStr('%' + SearchText + '%') + ')' +
                       ' AND ' +
                       '(Paidi_Eponymo_name LIKE ' + QuotedStr('%' + SearchText2 + '%') + ')' +
                       ' AND ' +
                       '(Imerominia LIKE ' + QuotedStr(SearchText3) + ')';

      // 4. Ενεργοποιούμε το φίλτρο
    FDQuery1.Filtered := True;

end;

procedure TfrmProgramDay.btnSearchClick2Click(Sender: TObject);
var
  SearchText: String;
begin
  // 1. Παίρνουμε το κείμενο και καθαρίζουμε τα κενά γύρω-γύρω
  SearchText := Trim(edtSearch2.Text);

  // 2. Αν είναι κενό, καθαρίζουμε το φίλτρο (τα δείχνουμε όλα)
  if SearchText = '' then
  begin
    FDQuery1.Filtered := False;
  end
  else
  begin
    // 3. Φτιάχνουμε το φίλτρο "Combo"
    // ΠΡΟΣΟΧΗ: Χρησιμοποιώ το 'fistname' όπως το έχεις στη βάση σου (χωρίς r)

    FDQuery1.Filter := '( Therapeutis_name LIKE ' + QuotedStr('%' + SearchText + '%') + ')' +
                       ' OR ' +
                       '(Paidi_Eponymo_name LIKE ' + QuotedStr('%' + SearchText + '%') + ')' +
                       ' OR ' +
                       '(Imerominia LIKE ' + QuotedStr('%' + SearchText + '%') + ')';

      // 4. Ενεργοποιούμε το φίλτρο
    FDQuery1.Filtered := True;
  end;


end;

procedure TfrmProgramDay.Button1Click(Sender: TObject);
var
 SelectedTeacherID: Integer; // 1. Δηλώνουμε τη μεταβλητή εδώ
 SelectedDateID: TDateTime;
 FirstDay, LastDay: TDateTime;

begin
  SelectedTeacherID := FDQuery1.FieldByName('Teachers_id').AsInteger;
  SelectedDateID := FDQuery1.FieldByName('Imerominia').AsDateTime;
  FDQueryPrint.Close;
  FDQueryPrint.ParamByName('SelectedTeacher').AsInteger := SelectedTeacherID;
  FDQueryPrint.ParamByName('StartDate').AsDate := SelectedDateID;
  FDQueryPrint.ParamByName('EndDate').AsDate   := SelectedDateID;
  //FDQueryPrint.ParamByName('SelectedDate').AsDate := SelectedDateID;
  FDQueryPrint.ParamByName('SelectedAbsence').AsInteger := 0;
  FDQueryPrint.ParamByName('SelectedReplacement').AsInteger := 1;
  dtsPrint.DataSet := FDQueryPrint;
  FDQueryPrint.Open;
  RLLabel3.Caption := 'Χρεωμένα μαθήματα ';
  //ShowMessage('Βρέθηκαν ' + IntToStr(FDQueryPrint.RecordCount) + ' ΕΓΓΡΑΦΕΣ.');
  frmProgramDay.RLReport1.preview;



end;

procedure TfrmProgramDay.Button2Click(Sender: TObject);
var
 SelectedTeacherID: Integer; // 1. Δηλώνουμε τη μεταβλητή εδώ
 SelectedDateID: TDateTime;
 FirstDay, LastDay: TDateTime;
begin
  SelectedTeacherID := FDQuery1.FieldByName('Teachers_id').AsInteger;
  SelectedDateID := FDQuery1.FieldByName('Imerominia').AsDateTime;
  FirstDay := StartOfTheMonth(SelectedDateID);
  LastDay  := EndOfTheMonth(SelectedDateID);
  FDQueryPrintAbsence.Close;
  FDQueryPrintAbsence.ParamByName('SelectedTeacher').AsInteger := SelectedTeacherID;
  FDQueryPrintAbsence.ParamByName('StartDate').AsDate := FirstDay;
  FDQueryPrintAbsence.ParamByName('EndDate').AsDate   := LastDay;
  //FDQueryPrint.ParamByName('SelectedDate').AsDate := SelectedDateID;
  FDQueryPrintAbsence.ParamByName('SelectedAbsence').AsInteger := 1;
  //FDQueryPrintAbsence.ParamByName('SelectedReplacement').AsInteger := 0;
    dtsPrint.DataSet := FDQueryPrintAbsence;
  FDQueryPrintAbsence.Open;
  RLLabel3.Caption := 'Απουσίες για αναπλήρωση ';
  //ShowMessage('Βρέθηκαν ' + IntToStr(FDQueryPrint.RecordCount) + ' ΕΓΓΡΑΦΕΣ.');
  frmProgramDay.RLReport1.preview;



end;

procedure TfrmProgramDay.Button3Click(Sender: TObject);
var
 SelectedTeacherID: Integer; // 1. Δηλώνουμε τη μεταβλητή εδώ
 SelectedDateID: TDateTime;
 FirstDay, LastDay: TDateTime;
begin
  SelectedTeacherID := FDQuery1.FieldByName('Teachers_id').AsInteger;
  SelectedDateID := FDQuery1.FieldByName('Imerominia').AsDateTime;
  FirstDay := StartOfTheMonth(SelectedDateID);
  LastDay  := EndOfTheMonth(SelectedDateID);
  FDQueryPrintCount.Close;
  //FDQueryPrintCount.ParamByName('StartDate').AsDate := FirstDay;
  //FDQueryPrintCount.ParamByName('EndDate').AsDate   := LastDay;
  //FDQueryPrint.ParamByName('SelectedDate').AsDate := SelectedDateID;
  //FDQueryPrint.ParamByName('SelectedAbsence').AsInteger :=0;
  FDQueryPrintCount.Open;
   RLLabel3.Caption := 'Απουσίες για αναπλήρωση ';
  //ShowMessage('Βρέθηκαν ' + IntToStr(FDQueryPrint.RecordCount) + ' ΕΓΓΡΑΦΕΣ.');
  frmProgramDay.RLReport2.preview;

end;

procedure TfrmProgramDay.Button4Click(Sender: TObject);
var
 SelectedTeacherID: Integer; // 1. Δηλώνουμε τη μεταβλητή εδώ
 SelectedDateID: TDateTime;
 FirstDay, LastDay: TDateTime;
begin
  SelectedTeacherID := FDQuery1.FieldByName('Teachers_id').AsInteger;
  SelectedDateID := FDQuery1.FieldByName('Imerominia').AsDateTime;
  FirstDay := StartOfTheMonth(SelectedDateID);
  LastDay  := EndOfTheMonth(SelectedDateID);
  FDQueryPrint.Close;
  FDQueryPrint.ParamByName('SelectedTeacher').AsInteger := SelectedTeacherID;
  FDQueryPrint.ParamByName('StartDate').AsDate := FirstDay;
  FDQueryPrint.ParamByName('EndDate').AsDate   := LastDay;
  //FDQueryPrint.ParamByName('SelectedDate').AsDate := SelectedDateID;
  FDQueryPrint.ParamByName('SelectedReplacement').AsInteger := 1;
  FDQueryPrint.ParamByName('SelectedAbsence').AsInteger :=0;
  FDQueryPrint.Open;
   RLLabel3.Caption := 'αναπλήρωση ';
  //ShowMessage('Βρέθηκαν ' + IntToStr(FDQueryPrint.RecordCount) + ' ΕΓΓΡΑΦΕΣ.');
  frmProgramDay.RLReport1.preview;

end;

procedure TfrmProgramDay.Button5Click(Sender: TObject);
var
 SelectedKidsID: Integer;
begin
  SelectedKidsID := FDQuery1.FieldByName('Kids_id').AsInteger;
  //SelectedDateID := FDQuery1.FieldByName('Imerominia').AsDateTime;
  FDQueryProgramKid.Close;
  FDQueryProgramKid.ParamByName('SelectedKids').AsInteger := SelectedKidsID;
  //FDQueryProgramKid.ParamByName('StartDate').AsDate := SelectedDateID;
  //FDQueryProgramKid.ParamByName('EndDate').AsDate   := SelectedDateID;
  //FDQueryPrint.ParamByName('SelectedDate').AsDate := SelectedDateID;
  //FDQueryProgramKid.ParamByName('SelectedAbsence').AsInteger := 0;
  FDQueryProgramKid.Open;
  RLLabel3.Caption := 'Χρεωμένα μαθήματα ';
  //ShowMessage('Βρέθηκαν ' + IntToStr(FDQueryPrint.RecordCount) + ' ΕΓΓΡΑΦΕΣ.');
  frmProgramDay.RLReport3.preview;
end;

procedure TfrmProgramDay.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  // ΣΗΜΑΝΤΙΚΟ: Ενημερώνουμε τα components ΜΟΝΟ αν είμαστε σε απλή προβολή (Browse).
  if FDQuery1.State = dsBrowse then
  begin

    // 1. Ενημέρωση Ημερομηνίας
    if not FDQuery1.FieldByName('Imerominia').IsNull then
       DateTimePicker1.Date := FDQuery1.FieldByName('Imerominia').AsDateTime;

    // 2. Ενημέρωση Ώρας
    if not FDQuery1.FieldByName('ora').IsNull then
       DateTimePicker2.Time := FDQuery1.FieldByName('ora').AsDateTime;

  end;
end;

procedure TfrmProgramDay.DateTimePicker1Change(Sender: TObject);
begin
   // Αν είμαστε σε κατάσταση επεξεργασίας ή εισαγωγής
  if (FDQuery1.State in [dsEdit, dsInsert]) then
  begin
     FDQuery1.FieldByName('Imerominia').AsDateTime := DateTimePicker1.Date;
  end;
end;

procedure TfrmProgramDay.DateTimePicker2Change(Sender: TObject);
begin
  // Αν είμαστε σε κατάσταση επεξεργασίας ή εισαγωγής
  if (FDQuery1.State in [dsEdit, dsInsert]) then
  begin
     FDQuery1.FieldByName('ora').AsDateTime := DateTimePicker2.Time;
  end;
end;

procedure TfrmProgramDay.DBCheckBox1Click(Sender: TObject);
begin
  // Ασφάλεια: Αν δεν είμαστε σε επεξεργασία, μπες τώρα
  if not (FDQuery1.State in [dsEdit, dsInsert]) then
    FDQuery1.Edit;

  // Η Λογική: Αν τσέκαρα το 1, σβήσε το 4
  if DBCheckBox1.Checked then
    DBCheckBox4.Checked := False;
end;

procedure TfrmProgramDay.DBCheckBox4Click(Sender: TObject);
begin
  // Ασφάλεια: Αν δεν είμαστε σε επεξεργασία, μπες τώρα
  if not (FDQuery1.State in [dsEdit, dsInsert]) then
    FDQuery1.Edit;

  // Η Λογική: Αν τσέκαρα το 4, σβήσε το 1
  if DBCheckBox4.Checked then
    DBCheckBox1.Checked := False;
end;

procedure TfrmProgramDay.DBLookupComboBox1CloseUp(Sender: TObject);
var
  PrevCharge: Integer;
begin
  // Έλεγχος: Προχωράμε ΜΟΝΟ αν έχει επιλεγεί Καθηγητής και Παιδί (να μην είναι κενά)
  // Προσοχή: ’λλαξε τα ονόματα των DBLookupComboBox στα δικά σου
  if (not VarIsNull(DBLookupCombobox2.KeyValue)) and
     (not VarIsNull(DBLookupCombobox1.KeyValue)) then
  begin
    // Στήνουμε το βοηθητικό SQL
    FDQueryDebit_Cat.Close;
    FDQueryDebit_Cat.SQL.Text :=
      'SELECT cat_debit_id FROM program ' +
      'WHERE teachers_id = :TID AND kids_id = :KID ' +
      'ORDER BY date DESC, time DESC LIMIT 1'; // Παίρνουμε την αυστηρά τελευταία φορά

    // Περνάμε ως παραμέτρους αυτά που διάλεξες στα 2 ComboBox
    FDQueryDebit_Cat.ParamByName('TID').AsInteger := DBLookupCombobox2.KeyValue;
    FDQueryDebit_Cat.ParamByName('KID').AsInteger := DBLookupCombobox1.KeyValue;

    // Ανοίγουμε να δούμε αν βρήκε κάτι
    FDQueryDebit_Cat.Open;

    if not FDQueryDebit_Cat.IsEmpty then
    begin
      // Αν βρήκε, αποθηκεύουμε την τιμή
      PrevCharge := FDQueryDebit_Cat.FieldByName('cat_debit_id').AsInteger;

      // Βάζουμε το κεντρικό Query της φόρμας σου σε κατάσταση Επεξεργασίας (ή Προσθήκης)
      // Προσοχή: Βάλε το όνομα του δικού σου κεντρικού FDQuery
      if not (FDQuery1.State in [dsEdit, dsInsert]) then
        FDQuery1.Edit;

      // Ενημερώνουμε αυτόματα το πεδίο της χρέωσης!
      FDQuery1.FieldByName('cat_debit_id').AsInteger := PrevCharge;
    end;

    FDQueryDebit_Cat.Close;
  end;
end;

procedure TfrmProgramDay.DBLookupComboBox1DropDown(Sender: TObject);
begin
// Κλείνουμε και ξανανοίγουμε το Query για να πάρει τα φρέσκα δεδομένα
  FDQueryKid.Close;
  FDQueryKid.Open;
end;

procedure TfrmProgramDay.FDQuery1AfterInsert(DataSet: TDataSet);
begin
 // Μόλις πατηθεί το +, πάρε τις τιμές από τα ημερολόγια και βάλ' τες στη βάση
  FDQuery1.FieldByName('Imerominia').AsDateTime := DateTimePicker1.Date;
  FDQuery1.FieldByName('ora').AsDateTime := DateTimePicker2.Time;
  // Ορίζουμε ότι η απουσία αρχικά είναι 0 (Όχι απουσία)
  FDQuery1.FieldByName('absence').AsInteger := 0;
end;

procedure TfrmProgramDay.FDQuery1BeforePost(DataSet: TDataSet);
begin
// ΠΡΙΝ φύγει η εντολή για τη βάση, βεβαιώσου ότι τα πεδία
  // έχουν τις τιμές που βλέπει ο χρήστης στην οθόνη.

  // 1. Αποθήκευσε σίγουρα την Ημερομηνία
  if FDQuery1.State in [dsEdit, dsInsert] then
     FDQuery1.FieldByName('Imerominia').AsDateTime := DateTimePicker1.Date;

  // 2. Αποθήκευσε σίγουρα την Ώρα
  if Assigned(FindComponent('DateTimePicker2')) and (FDQuery1.State in [dsEdit, dsInsert]) then
     FDQuery1.FieldByName('Ora').AsDateTime := DateTimePicker2.Time;

  // Σημείωση: Τα DBCheckBox αποθηκεύονται αυτόματα, δεν χρειάζονται κώδικα εδώ.
end;

procedure TfrmProgramDay.FDQuery1NewRecord(DataSet: TDataSet);
begin
// Ορίζουμε αρχικές τιμές 0 για να είναι ξε-τικάρισμα τα Checkbox

  // Αναπλήρωση
  FDQuery1.FieldByName('replacement').AsInteger := 0;

  // Απουσία
  FDQuery1.FieldByName('absence').AsInteger := 0;

  // Ακυρώθηκε με χρέωση (Xreosi)
  FDQuery1.FieldByName('Xreosi').AsInteger := 0;

  // Ακυρώθηκε με μισή χρέωση (Xreosi2)
  FDQuery1.FieldByName('Xreosi2').AsInteger := 0;

  // Μπορείς να ορίσεις και προεπιλεγμένη ημερομηνία αν θες (π.χ. σημερινή)
  FDQuery1.FieldByName('Imerominia').AsDateTime := Date;
end;



end.
