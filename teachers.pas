unit teachers;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.DBCtrls, Vcl.Mask;

type
  TFrmTeachers = class(TForm)
    FDConnection1: TFDConnection;
    DataSource1: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBNavigator1: TDBNavigator;
    DBLookupComboBox1: TDBLookupComboBox;
    FDQuerySpecializations: TFDQuery;
    DataSourceSpecializations: TDataSource;
    DBGrid1: TDBGrid;
    FDQuery1: TFDQuery;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit4: TDBEdit;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTeachers: TFrmTeachers;

implementation

{$R *.dfm}

uses logopaignio;


end.
