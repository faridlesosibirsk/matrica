unit Unit2;

interface

uses
  Vcl.Forms, unit3,
  Generics.Collections, Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Dialogs, IniFiles, Vcl.StdCtrls, Vcl.ExtCtrls;

type

  Myclass = class
  private
    columns: integer;
    lines: integer;
    ScrollBox1: TScrollBox;
    Image1: TImage;
    OneLabels: TList<TLabel>;
    procedure createLabel;
    procedure createLine;
  published
    constructor create(Image1: TImage; ScrollBox1: TScrollBox; columns: integer;
      lines: integer);
  end;

implementation

{ Myclass }

constructor Myclass.create(Image1: TImage; ScrollBox1: TScrollBox;
  columns: integer; lines: integer);
begin
  self.Image1 := Image1;
  OneLabels := TList<TLabel>.create;
  self.ScrollBox1 := ScrollBox1;
  self.columns := columns;
  self.lines := lines;
  createLabel;
  createLine;
end;

procedure Myclass.createLabel;
const
  Left = 100;
  Top = 100;
  Width = 25;
  Height = 25;
  Caption = 'Caption';
var
  I, J: integer;
  OneLabel: TLabel;
begin
  for I := 0 to columns - 1 do
    for J := 0 to lines - 1 do
    begin
      OneLabel := TLabel.create(ScrollBox1);
      OneLabel.Left := Left + I * 100;
      OneLabel.Top := Top + J * 100;
      OneLabel.Width := Width;
      OneLabel.Height := Height;
      OneLabel.Caption := 'I: ' + IntToStr(I) + '; J: ' + IntToStr(J);
      OneLabel.Parent := ScrollBox1;
      OneLabel.Visible := true;
      OneLabel.OnClick := form3.OnClick;
      OneLabels.Add(OneLabel);
    end;
end;

procedure Myclass.createLine;
const
  Left = 100;
  Top = 100;
var
  I, J, K: integer;
begin
  for I := 0 to columns - 1 do
    for J := 0 to lines - 2 do
      for K := 0 to columns - 1 do
      begin
        Image1.Canvas.MoveTo(OneLabels[J+I*lines].Left, OneLabels[J+I*lines].Top);
        Image1.Canvas.LineTo(OneLabels[J+I*lines].Left+K*100-I*100, OneLabels[J+I*lines].Top+100);
      end;
end;

end.
