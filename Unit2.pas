unit Unit2;

interface

uses
  Vcl.ExtCtrls {TPanel},
  unit3;

type
  IControler = interface
    function getPanel: TPanel;
  end;

  Controler = class(TInterfacedObject, IControler)
  private
    /// <link>aggregation</link>
    Director1: Director;
    /// <link>aggregation</link>
    //Panel1: Panel;
    //Button1: Button;
  public
    function getPanel: TPanel;
  published
    constructor create;
  end;

implementation

{ Controler }

constructor Controler.create;
begin
  Director1:= Director.Create;

  //Panel1:= Panel.Create;
  //Director1.makeLab1(Panel1);

  //Button1:= Button.Create;
  Director1.makeButton;
end;

function Controler.getPanel: TPanel;
begin
  //result:=Panel1.getResult;
  result:=Director1.getPanel;
end;

end.
