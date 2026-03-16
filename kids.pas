unit kids;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.DBCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.Imaging.jpeg, RLReport;

type
  TfrmKids = class(TForm)
    FDConnection1: TFDConnection;
    DataSource1: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBNavigator1: TDBNavigator;
    DBLookupComboBox1: TDBLookupComboBox;
    FDQueryParent: TFDQuery;
    DataSourceParent: TDataSource;
    DBGrid1: TDBGrid;
    FDQuery1: TFDQuery;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DateTimePicker1: TDateTimePicker;
    DBEdit3: TDBEdit;
    Label9: TLabel;
    FDQuery1id: TFDAutoIncField;
    FDQuery1parent_id: TIntegerField;
    FDQuery1fistname: TWideStringField;
    FDQuery1lastname: TWideStringField;
    FDQuery1amka: TWideStringField;
    FDQuery1gnomateysi: TIntegerField;
    FDQuery1birthdate: TDateField;
    FDQuery1ergo: TIntegerField;
    FDQuery1cyxo: TIntegerField;
    FDQuery1logo: TIntegerField;
    FDQuery1ParentName: TWideStringField;
    Label5: TLabel;
    btnSearchClick: TButton;
    edtSearch: TEdit;
    GroupBox1: TGroupBox;
    DBCheckBox4: TDBCheckBox;
    DateTimePicker2: TDateTimePicker;
    Label6: TLabel;
    Label7: TLabel;
    DateTimePicker3: TDateTimePicker;
    Label10: TLabel;
    DateTimePicker4: TDateTimePicker;
    FDQuery1start_date: TDateField;
    FDQuery1end_date: TDateField;
    FDQuery1next_date: TDateField;
    DBMemo1: TDBMemo;
    FDQuery1enable_kid: TIntegerField;
    DBCheckBox5: TDBCheckBox;
    FDQuery1end_gnomateysi: TIntegerField;
    FDQuery1opinion: TWideMemoField;
    FDQuery1opinion_2: TWideMemoField;
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DateTimePicker1DropDown(Sender: TObject);
    procedure DBLookupComboBox1DropDown(Sender: TObject);
    procedure btnSearchClickClick(Sender: TObject);
    procedure DateTimePicker2Change(Sender: TObject);
    procedure DateTimePicker3Change(Sender: TObject);
    procedure DateTimePicker4Change(Sender: TObject);
    procedure DateTimePicker2DropDown(Sender: TObject);
    procedure DateTimePicker3DropDown(Sender: TObject);
    procedure DateTimePicker4DropDown(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmKids: TfrmKids;

implementation

{$R *.dfm}

uses logopaignio;

procedure TfrmKids.btnSearchClickClick(Sender: TObject);
var
  SearchText: String;
begin
  // 1. Παίρνουμε το κείμενο και καθαρίζουμε τα κενά γύρω-γύρω
  SearchText := Trim(edtSearch.Text);

  // 2. Αν είναι κενό, καθαρίζουμε το φίλτρο (τα δείχνουμε όλα)
  if SearchText = '' then
  begin
    FDQuery1.Filtered := False;
  end
  else
  begin
    // 3. Φτιάχνουμε το φίλτρο "Combo"
    // ΠΡΟΣΟΧΗ: Χρησιμοποιώ το 'fistname' όπως το έχεις στη βάση σου (χωρίς r)

    FDQuery1.Filter := '(lastname LIKE ' + QuotedStr('%' + SearchText + '%') + ')' +
                       ' OR ' +
                       '(fistname LIKE ' + QuotedStr('%' + SearchText + '%') + ')';

    // 4. Ενεργοποιούμε το φίλτρο
    FDQuery1.Filtered := True;
  end;

end;

procedure TfrmKids.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  // Έλεγχος για να αποφύγουμε σφάλματα όταν δεν υπάρχουν δεδομένα
  if not FDQuery1.FieldByName('birthdate').IsNull then
  begin
    // Πέρνα την τιμή από τη βάση στο DatePicker
    DateTimePicker1.Date := FDQuery1.FieldByName('birthdate').AsDateTime;
  end;
    if not FDQuery1.FieldByName('start_date').IsNull then
  begin
    // Πέρνα την τιμή από τη βάση στο DatePicker
    DateTimePicker2.Date := FDQuery1.FieldByName('start_date').AsDateTime;
  end;
   if not FDQuery1.FieldByName('end_date').IsNull then
  begin
    // Πέρνα την τιμή από τη βάση στο DatePicker
    DateTimePicker3.Date := FDQuery1.FieldByName('end_date').AsDateTime;
  end;
   if not FDQuery1.FieldByName('next_date').IsNull then
  begin
    // Πέρνα την τιμή από τη βάση στο DatePicker
    DateTimePicker4.Date := FDQuery1.FieldByName('next_date').AsDateTime;
  end;
end;

procedure TfrmKids.DateTimePicker1Change(Sender: TObject);
begin
// Έλεγξε αν το query είναι σε κατάσταση επεξεργασίας ή εισαγωγής
  if (FDQuery1.State in [dsEdit, dsInsert]) then
  begin
    // Πέρνα την τιμή από το DatePicker στη βάση
    FDQuery1.FieldByName('birthdate').AsDateTime := DateTimePicker1.Date;
  end;
end;

procedure TfrmKids.DateTimePicker1DropDown(Sender: TObject);
begin
// Αν το query είναι απλά σε "θέαση", βάλ' το σε "επεξεργασία"
  if (FDQuery1.State = dsBrowse) then
  begin
    FDQuery1.Edit;
  end;
end;

procedure TfrmKids.DateTimePicker2Change(Sender: TObject);
begin
// Έλεγξε αν το query είναι σε κατάσταση επεξεργασίας ή εισαγωγής
  if (FDQuery1.State in [dsEdit, dsInsert]) then
  begin
    // Πέρνα την τιμή από το DatePicker στη βάση
    FDQuery1.FieldByName('start_date').AsDateTime := DateTimePicker2.Date;
  end;
end;

procedure TfrmKids.DateTimePicker2DropDown(Sender: TObject);
begin
// Αν το query είναι απλά σε "θέαση", βάλ' το σε "επεξεργασία"
  if (FDQuery1.State = dsBrowse) then
  begin
    FDQuery1.Edit;
  end;
end;

procedure TfrmKids.DateTimePicker3Change(Sender: TObject);
begin
// Έλεγξε αν το query είναι σε κατάσταση επεξεργασίας ή εισαγωγής
  if (FDQuery1.State in [dsEdit, dsInsert]) then
  begin
    // Πέρνα την τιμή από το DatePicker στη βάση
    FDQuery1.FieldByName('end_date').AsDateTime := DateTimePicker3.Date;
  end;
end;

procedure TfrmKids.DateTimePicker3DropDown(Sender: TObject);
begin
// Αν το query είναι απλά σε "θέαση", βάλ' το σε "επεξεργασία"
  if (FDQuery1.State = dsBrowse) then
  begin
    FDQuery1.Edit;
  end;
end;

procedure TfrmKids.DateTimePicker4Change(Sender: TObject);
begin
// Έλεγξε αν το query είναι σε κατάσταση επεξεργασίας ή εισαγωγής
  if (FDQuery1.State in [dsEdit, dsInsert]) then
  begin
    // Πέρνα την τιμή από το DatePicker στη βάση
    FDQuery1.FieldByName('next_date').AsDateTime := DateTimePicker4.Date;
  end;
end;

procedure TfrmKids.DateTimePicker4DropDown(Sender: TObject);
begin
// Αν το query είναι απλά σε "θέαση", βάλ' το σε "επεξεργασία"
  if (FDQuery1.State = dsBrowse) then
  begin
    FDQuery1.Edit;
  end;
end;

procedure TfrmKids.DBLookupComboBox1DropDown(Sender: TObject);
begin
// Κλείνουμε και ξανανοίγουμε το Query για να τραβήξει τα φρέσκα δεδομένα
  FDQueryParent.Close;
  FDQueryParent.Open;
end;

end.
