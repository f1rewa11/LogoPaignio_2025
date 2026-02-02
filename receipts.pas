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
  Vcl.Buttons, Vcl.DBCtrls, Vcl.Mask, Vcl.ComCtrls, RLReport, Vcl.Imaging.jpeg;

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
    RLReport1: TRLReport;
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

    procedure DateTimePicker1Change(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure FDQuery1AfterInsert(DataSet: TDataSet);
    procedure FDQuery1BeforePost(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btnSearchClickClick(Sender: TObject);


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

    FDQuery1.Filter := '(Paidi_Eponymo LIKE ' + QuotedStr('%' + SearchText + '%') + ')' +
                       ' OR ' +
                       '(Paidi_Onoma LIKE ' + QuotedStr('%' + SearchText + '%') + ')';

    // 4. Ενεργοποιούμε το φίλτρο
    FDQuery1.Filtered := True;
  end;

end;

procedure TfrmReceipts.Button1Click(Sender: TObject);
var
 SelectedKidID: Integer; // 1. Δηλώνουμε τη μεταβλητή εδώ
begin
  SelectedKidID := FDQuery1.FieldByName('kid_id').AsInteger;
  FDQueryPrint.Close;
  FDQueryPrint.ParamByName('SelectedKid').AsInteger := SelectedKidID;
  FDQueryPrint.Open;
  // ShowMessage('Βρέθηκαν ' + IntToStr(FDQueryPrint.RecordCount) + ' αποδείξεις.');
  frmReceipts.RLReport1.Preview;

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
