unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Memo, FMX.Effects, FMX.Filter.Effects, FMX.Ani;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    StyleBook1: TStyleBook;
    ColorAnimation1: TColorAnimation;
    Label1: TLabel;
    GlowEffect1: TGlowEffect;
    FloatAnimation2: TFloatAnimation;
    DirectionalBlurEffect1: TDirectionalBlurEffect;
    FloatAnimation1: TFloatAnimation;
    GlowEffect2: TGlowEffect;
    ColorKeyAnimation1: TColorKeyAnimation;
    RadioButton1: TRadioButton;
    procedure FloatAnimation1Finish(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Memo1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Single);
    procedure Memo1MouseLeave(Sender: TObject);
    procedure Memo1KeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure FormResize(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  ww: set of char = [#33..#126];
  last  : integer = 0;
  last1 : integer =0 ;
    i  : integer;
  c  : integer;
  text : string;

implementation

{$R *.fmx}

procedure TForm1.FloatAnimation1Finish(Sender: TObject);
begin


if (memo1.Lines.Count > 2) and (memo1.Lines.Strings[2] = 'BECCA')  then
begin
label1.Text := 'BECCA';
GlowEffect1.Enabled := false;
DirectionalBlurEffect1.Enabled := false;
FloatAnimation1.enabled := false;
FloatAnimation2.Enabled := false;


GlowEffect2.Enabled := true;
ColorKeyAnimation1.Enabled := true;
ColorKeyAnimation1.Start;
end
else
begin

GlowEffect1.Enabled := true;
FloatAnimation2.Start;
end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   text := memo1.Text;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
if form1.Width  = 176 then form1.Width  := 176;
if form1.height < 447 then form1.height := 447;
form1.ResizeHandle;
end;

procedure TForm1.Memo1KeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin

  c := 0;
  if (memo1.Lines.Count > 0) and (memo1.Lines.Strings[0] <> 'BECCA()') then
    begin

      for  i := 1 to Length(memo1.text) do if (memo1.Text[i] in ww) then inc(c);

      if last <> c then
        begin
          GlowEffect1.Enabled := false;
          DirectionalBlurEffect1.Enabled := true;

          FloatAnimation1.Start;
        end;
      last := c;
      label1.Text := inttostr(c);
    end;

    if (memo1.Lines.Count > 2) and (memo1.Lines.Strings[2] = 'BECCA')  then
begin
label1.Text := 'BECCA';

end;
end;

procedure TForm1.Memo1MouseLeave(Sender: TObject);
begin
  if memo1.Text = '' then memo1.Text := text;

end;

procedure TForm1.Memo1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Single);
begin
  if (memo1.Lines.Count > 0) and (memo1.Lines.Strings[0] = 'BECCA()') then
     memo1.Lines.Clear;
end;

end.
