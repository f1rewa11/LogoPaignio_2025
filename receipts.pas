unit receipts;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.DBCtrls, Vcl.Mask, Vcl.ComCtrls, RLReport, Vcl.Imaging.jpeg, System.DateUtils;

type
  TfrmReceipts = class(TForm)
    FDConnection1: TFDConnection;
    DataSource1: TDataSource;
    Label1: TLabel;
    DBNavigator1: TDBNavigator;
    DBLookupComboBox1: TDBLookupComboBox;
    DBGrid1: TDBGrid;
    FDQuery1: TFDQuery;
    Label4: TLabel;
    Label8: TLabel;
    FDQueryKid: TFDQuery;
    DataSourceKid: TDataSource;
    DateTimePicker1: TDateTimePicker;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    Label5: TLabel;
    DBMemo1: TDBMemo;
    RLPayments: TRLReport;
    RLBand2: TRLBand;
    RLLabel2: TRLLabel;
    RLLabel4: TRLLabel;
    RLBand3: TRLBand;
    Button1: TButton;
    dtsPrint: TDataSource;
    RLDBText1: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText2: TRLDBText;
    RLBand4: TRLBand;
    RLDBResult1: TRLDBResult;
    RLDraw1: TRLDraw;
    RLLabel5: TRLLabel;
    RLBand5: TRLBand;
    RLLabel6: TRLLabel;
    RLImage1: TRLImage;
    Label6: TLabel;
    btnSearchClick: TButton;
    edtSearch: TEdit;
    FDQueryPrint: TFDQuery;
    edtSearch3: TEdit;
    RLReport2: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel9: TRLLabel;
    RLBand6: TRLBand;
    RLDBText5: TRLDBText;
    RLDraw2: TRLDraw;
    RLDBText6: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText7: TRLDBText;
    RLBand7: TRLBand;
    RLBand8: TRLBand;
    RLLabel7: TRLLabel;
    RLImage2: TRLImage;
    RLLabel8: TRLLabel;
    Button3: TButton;
    FDQueryPrintSum: TFDQuery;
    dtsPrintSum: TDataSource;
    RLDBText8: TRLDBText;
    RLDBResult2: TRLDBResult;

    procedure DateTimePicker1Change(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure FDQuery1AfterInsert(DataSet: TDataSet);
    procedure FDQuery1BeforePost(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btnSearchClickClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReceipts: TfrmReceipts;

implementation

{$R *.dfm}

uses logopaignio;



procedure TfrmReceipts.btnSearchClickClick(Sender: TObject);
var
  SearchText: String;
  SearchText3: String;
begin
  // 1. Παίρνουμε το κείμενο και καθαρίζουμε τα κενά γύρω-γύρω
  SearchText := Trim(edtSearch.Text);
  SearchText3 := Trim(edtSearch3.Text);

  // 2. Αν είναι κενό, καθαρίζουμε το φίλτρο (τα δείχνουμε όλα)
 // if SearchText = ''  then
  //begin
    //FDQuery1.Filtered := False;
  //end
  //else
  //begin
    // 3. Φτιάχνουμε το φίλτρο "Combo"
    // ΠΡΟΣΟΧΗ: Χρησιμοποιώ το 'fistname' όπως το έχεις στη βάση σου (χωρίς r)

    FDQuery1.Filter := '(Paidi_Eponymo LIKE ' + QuotedStr('%' + SearchText + '%') + ')' +
                       ' AND ' +
                       '(Payment_date LIKE ' + QuotedStr('%' + SearchText3 + '%') + ')';

    // 4. Ενεργοποιούμε το φίλτρο
    FDQuery1.Filtered := True;
  //end;

end;

procedure TfrmReceipts.Button1Click(Sender: TObject);
var
 SelectedKidID: Integer; // 1. Δηλώνουμε τη μεταβλητή εδώ
begin
  SelectedKidID := FDQuery1.FieldByName('kid_id').AsInteger;
  FDQueryPrint.Close;
  FDQueryPrint.ParamByName('SelectedKid').AsInteger := SelectedKidID;
  FDQueryPrint.Open;
  //ShowMessage('Βρέθηκαν ' + IntToStr(FDQueryPrint.RecordCount) + ' αποδείξεις.');
  frmReceipts.RLPayments.Preview;

 end;

procedure TfrmReceipts.Button3Click(Sender: TObject);
var
 SelectedTeacherID: Integer; // 1. Δηλώνουμε τη μεταβλητή εδώ
 SelectedDateID: TDateTime;
 FirstDay, LastDay: TDateTime;
begin
  SelectedTeacherID := FDQuery1.FieldByName('Kid_id').AsInteger;
  SelectedDateID := FDQuery1.FieldByName('Payment_Date').AsDateTime;
  FirstDay := StartOfTheMonth(SelectedDateID);
  LastDay  := EndOfTheMonth(SelectedDateID);
  FDQueryPrintSum.Close;
  FDQueryPrintSum.ParamByName('StartDate').DataType := ftDate;
  FDQueryPrintSum.ParamByName('EndDate').DataType   := ftDate;
  FDQueryPrintSum.ParamByName('StartDate').AsDate := FirstDay;
  FDQueryPrintSum.ParamByName('EndDate').AsDate   := LastDay;
  //FDQueryPrint.ParamByName('SelectedDate').AsDate := SelectedDateID;
  //FDQueryPrint.ParamByName('SelectedAbsence').AsInteger :=0;
  FDQueryPrintSum.Open;
  //ShowMessage('Βρέθηκαν ' + IntToStr(FDQueryPrintSum.RecordCount) + ' ΕΓΓΡΑΦΕΣ.');
  frmReceipts.RLReport2.preview;


end;

procedure TfrmReceipts.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  // ΣΗΜΑΝΤΙΚΟ: Ενημερώνουμε τα components ΜΟΝΟ αν είμαστε σε απλή προβολή (Browse).

 if FDQuery1.State = dsBrowse then
  begin

    if not FDQuery1.FieldByName('payment_date').IsNull then
       DateTimePicker1.Date := FDQuery1.FieldByName('payment_date').AsDateTime;

  end;
end;

procedure TfrmReceipts.DateTimePicker1Change(Sender: TObject);
begin
   if (FDQuery1.State in [dsEdit, dsInsert]) then
  begin
      FDQuery1.FieldByName('payment_date').AsDateTime := DateTimePicker1.Date;
  end;
end;



procedure TfrmReceipts.DBGrid1CellClick(Column: TColumn);
begin
  // label6.Caption := FDQuery1.FieldByName('kid_id').AsInteger;
end;

procedure TfrmReceipts.FDQuery1AfterInsert(DataSet: TDataSet);
begin
 FDQuery1.FieldByName('payment_date').AsDateTime := DateTimePicker1.Date;

    FDQuery1.FieldByName('amount').AsFloat := 0.0;
end;

procedure TfrmReceipts.FDQuery1BeforePost(DataSet: TDataSet);
begin
if FDQuery1.State in [dsEdit, dsInsert] then
       FDQuery1.FieldByName('payment_date').AsDateTime := DateTimePicker1.Date;
end;

procedure TfrmReceipts.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
  frmReceipts := nil; // <--- ΠΟΛΥ ΣΗΜΑΝΤΙΚΟ
end;

end.
