program Project1;

uses
  Vcl.Forms,
  logopaignio in 'logopaignio.pas' {Form1},
  teachers in 'teachers.pas' {FrmTeachers},
  parent in 'parent.pas' {FrmParent};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFrmTeachers, FrmTeachers);
  Application.CreateForm(TFrmParent, FrmParent);
  Application.Run;
end.
