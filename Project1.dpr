program Project1;

uses
  Vcl.Forms,
  logopaignio in 'logopaignio.pas' {Form1},
  teachers in 'teachers.pas' {FrmTeachers},
  programday in 'programday.pas' {frmProgramDay},
  parent in 'parent.pas' {FrmParent},
  kids in 'kids.pas' {frmKids},
  receipts in 'receipts.pas' {frmReceipts};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFrmTeachers, FrmTeachers);
  Application.CreateForm(TfrmProgramDay, frmProgramDay);
  Application.CreateForm(TFrmParent, FrmParent);
  Application.CreateForm(TfrmKids, frmKids);
  Application.CreateForm(TfrmReceipts, frmReceipts);
  Application.Run;
end.
