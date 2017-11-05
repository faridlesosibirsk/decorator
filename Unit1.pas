unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  unit2;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AbstractPage: TAbstractPage;
  LaterPage1, NamberPage1, LaterPage2, NamberPage2: TDecoratorPage;


implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  a, b, c: string;
begin
  AbstractPage := TPage.Create;

  //LaterPage1:= TLaterPage.Create(AbstractPage);
  //NamberPage1:= TNamberPage.Create(LaterPage1);
  NamberPage1:= TNamberPage.Create(TLaterPage.Create(TPage.Create));

  //NamberPage2:= TNamberPage.Create(AbstractPage);
  //LaterPage2:= TLaterPage.Create(NamberPage2);
  LaterPage2:= TLaterPage.Create(TNamberPage.Create(TLaterPage.Create(TPage.Create)));

  a := LaterPage2.Print;
  b := NamberPage1.Print;
  c := AbstractPage.Print;

  label1.Caption := a;
  label2.Caption := b;
  label3.Caption := c;

end;

end.
