unit logopaignio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ToolWin, Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N4: TMenuItem;
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    N7: TMenuItem;
    N8: TMenuItem;
    procedure N3Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses teachers, parent, kids, programday, receipts;

procedure TForm1.N3Click(Sender: TObject);
begin
 frmTeachers.Show;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
  frmKids.show;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
 frmParent.Show;
end;

procedure TForm1.N7Click(Sender: TObject);
begin
  frmProgramDay.show
end;

procedure TForm1.N8Click(Sender: TObject);
begin
    // Έλεγχος: Αν η φόρμα δεν υπάρχει (είναι nil), τότε τη δημιουργούμε.
  if frmReceipts = nil then
    frmReceipts := TfrmReceipts.Create(Application);

  // Την εμφανίζουμε
      frmReceipts.show
end;

end.
