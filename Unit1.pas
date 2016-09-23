unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Ani,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm1 = class(TForm)
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    FloatAnimation1: TFloatAnimation;
    FloatAnimation2: TFloatAnimation;
    Rectangle3: TRectangle;
    Label1: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    FloatAnimation3: TFloatAnimation;
    procedure FloatAnimation1Finish(Sender: TObject);
    procedure FloatAnimation2Finish(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private

  public
    { public êÈåæ }
  end;
const
  car_left: array[0..2] of Integer = (32,80,125);

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.FloatAnimation1Finish(Sender: TObject);
begin
  //Background scroll 1
  Rectangle1.Visible  := False;
  FloatAnimation1.Enabled := False;
  Rectangle2.Visible  := True;
  FloatAnimation2.Enabled := True;
end;

procedure TForm1.FloatAnimation2Finish(Sender: TObject);
begin
  //Background scroll 2
  Rectangle2.Visible  := False;
  FloatAnimation2.Enabled := False;
  Rectangle1.Visible  := True;
  FloatAnimation1.Enabled := True;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Rectangle1.Position.X := 0;   //Background 1
  Rectangle2.Position.X := 0;   //Background 2
  Rectangle2.Visible  := False;
  Label1.Text := Format('x=%d, y=%d', [Self.Width, Self.Height]);
  Rectangle3.Position.Y := Self.Height /2; //The position of the car
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  //The background scroll, slowdown
  FloatAnimation1.Duration  := FloatAnimation1.Duration - 0.1;
  FloatAnimation2.Duration  := FloatAnimation2.Duration - 0.1;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
  //The background scroll, speed up
  FloatAnimation1.Duration  := FloatAnimation1.Duration + 0.1;
  FloatAnimation2.Duration  := FloatAnimation2.Duration + 0.1;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
  //Move to the left.(Lane change)
  case Round(Rectangle3.Position.X) of
  80: begin
    FloatAnimation3.StartValue  := car_left[1];
    FloatAnimation3.StopValue   := car_left[0];
    FloatAnimation3.Start;
  end;
  125: begin
    FloatAnimation3.StartValue  := car_left[2];
    FloatAnimation3.StopValue   := car_left[1];
    FloatAnimation3.Start;
  end;
  end;
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
  //Move to the right.(Lane change)
  case Round(Rectangle3.Position.X) of
  32: begin
    FloatAnimation3.StartValue  := car_left[0];
    FloatAnimation3.StopValue   := car_left[1];
    FloatAnimation3.Start;
  end;
  80: begin
    FloatAnimation3.StartValue  := car_left[1];
    FloatAnimation3.StopValue   := car_left[2];
    FloatAnimation3.Start;
  end;
  end;
end;

end.
