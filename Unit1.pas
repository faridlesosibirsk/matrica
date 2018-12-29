unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  unit2, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    linesNumber: TEdit;
    columnsNumber: TEdit;
    ScrollBox1: TScrollBox;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
  private
    my: Myclass;
  public
    procedure clickOnLabel(Sender:TObject);
  published
    constructor create;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  lines, columns: integer;
begin
  lines := StrToInt(linesNumber.Text);
  columns := StrToInt(columnsNumber.Text);
  my := Myclass.create(Image1, ScrollBox1, columns, lines);
end;

procedure TForm1.clickOnLabel(Sender: TObject);
begin
//
end;

constructor TForm1.create;
begin

end;

end.
