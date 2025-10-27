unit edit_TEACHERS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Comp.DataSet, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls;

type
  TForm3 = class(TForm)
    FDQueryedit: TFDQuery;
    FDConnection1: TFDConnection;
    DataSourceEdit: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label3: TLabel;
    FDQuerySpecializations: TFDQuery;
    DataSourceSpecializations: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
    function LoadAndShowTeacher(const ATeacherID: Integer): TModalResult;
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

uses Unit2;

function TForm3.LoadAndShowTeacher(const ATeacherID: Integer): TModalResult;
begin
  // (Προαιρετικό) Βεβαιώσου ότι τα queries είναι κλειστά στην αρχή
  FDQueryedit.Active := False;
  FDQuerySpecializations.Active := False;

  // 1. Ενεργοποιούμε το query που φέρνει τη λίστα των ειδικοτήτων
  FDQuerySpecializations.Active := True;

  // 2. Δίνουμε τιμή στην παράμετρο του καθηγητή ΠΡΩΤΑ
  FDQueryedit.ParamByName('teacher_id').AsInteger := ATeacherID;

  // 3. Και ΜΕΤΑ εκτελούμε το query για να φέρει τα δεδομένα
  FDQueryedit.Active := True;

  // 4. Εμφανίζουμε τη φόρμα
  Result := ShowModal;
end;


end.

