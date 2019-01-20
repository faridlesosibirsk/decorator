unit Unit1;

interface

uses
  Vcl.ExtCtrls {TPanel},
  Unit2,
  Vcl.Forms;

type
  TForm1 = class(TForm)
  private
    /// <link>aggregation</link>
    Controler1: IControler;
  public
  published
    procedure FormCreate(Sender: TObject);
  end;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Controler1:=Controler.create;
  Controler1.getPanel.Parent:=self;
end;

end.
