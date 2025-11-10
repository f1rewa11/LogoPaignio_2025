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
    DBCheckBox4: TDBCheckBox;
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
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DateTimePicker1DropDown(Sender: TObject);


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
  // Έλεγχος για να αποφύγουμε σφάλματα όταν δεν υπάρχουν δεδομένα
  if not FDQuery1.FieldByName('birthdate').IsNull then
  begin
    // Πέρνα την τιμή από τη βάση στο DatePicker
    DateTimePicker1.Date := FDQuery1.FieldByName('birthdate').AsDateTime;
  end;
end;
procedure TfrmProgramDay.DateTimePicker1Change(Sender: TObject);
begin
// Έλεγξε αν το query είναι σε κατάσταση επεξεργασίας ή εισαγωγής
  if (FDQuery1.State in [dsEdit, dsInsert]) then
  begin
    // Πέρνα την τιμή από το DatePicker στη βάση
    FDQuery1.FieldByName('birthdate').AsDateTime := DateTimePicker1.Date;
  end;
end;

procedure TfrmProgramDay.DateTimePicker1DropDown(Sender: TObject);
begin
// Αν το query είναι απλά σε "θέαση", βάλ' το σε "επεξεργασία"
  if (FDQuery1.State = dsBrowse) then
  begin
    FDQuery1.Edit;
  end;
end;

end.
