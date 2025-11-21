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
  Vcl.Buttons, Vcl.DBCtrls, Vcl.Mask, Vcl.ComCtrls;

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
    procedure DateTimePicker2Change(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure FDQuery1AfterInsert(DataSet: TDataSet);
    procedure DBCheckBox1Click(Sender: TObject);
    procedure DBCheckBox4Click(Sender: TObject);
    procedure FDQuery1BeforePost(DataSet: TDataSet);


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

end.
