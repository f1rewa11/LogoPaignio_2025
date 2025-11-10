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
    procedure N3Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses teachers, parent, kids;

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

end.
