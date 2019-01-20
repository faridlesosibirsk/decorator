unit Unit3;

interface

uses
  Vcl.Controls {TAlign} ,
  Vcl.StdCtrls {TButton} ,
  classes {TNotifyEvent} ,
  Vcl.ExtCtrls {TPanel};

type
  Builder = interface
    procedure reset;
    procedure parent(AOwner: TWinControl);
    procedure onClick(onClick1: TNotifyEvent);
    procedure free;
  end;

  Director = class
  private
    /// <link>aggregation</link>
    Builder1: Builder;
    Panel1: TPanel;
    procedure AssignedPanel1;
    procedure buttonClick(Sender: TObject);
    procedure PanelClick(Sender: TObject);
  public
    procedure makePanel;
    procedure makeButton;
    function getPanel: TPanel;
  end;

  Panel = class(TInterfacedObject, Builder)
  private
    p: TPanel;
  public
    procedure reset;
    function getResult: TPanel;
    procedure parent(AOwner: TWinControl);
    procedure onClick(onClick1: TNotifyEvent);
    procedure free;
  end;

  Button = class(TInterfacedObject, Builder)
  private
    b: TButton;
  public
    procedure reset;
    function getResult: TButton;
    procedure parent(AOwner: TWinControl);
    procedure onClick(onClick1: TNotifyEvent);
    procedure free;
  end;

implementation

{ Director }

procedure Director.AssignedPanel1;
begin
  if not assigned(Panel1) then
  begin
    Panel1 := TPanel.Create(nil);
    Panel1.Caption := 'Panel1';
    Panel1.Align := alClient;
  end;
end;

procedure Director.makeButton;
begin
  AssignedPanel1;
  Builder1 := Button.Create;
  Builder1.reset;
  Builder1.onClick(buttonClick);
  Builder1.parent(Panel1);
end;

procedure Director.makePanel;
begin
  AssignedPanel1;
  Builder1 := Panel.Create;
  Builder1.reset;
  Builder1.onClick(PanelClick);
  Builder1.parent(Panel1);
end;

procedure Director.PanelClick(Sender: TObject);
begin
  Builder1.free;
  makeButton;
end;

procedure Director.buttonClick(Sender: TObject);
begin
  Builder1.free;
  makePanel;
end;

function Director.getPanel: TPanel;
begin
  AssignedPanel1;
  result := Panel1;
end;

{ Button }

procedure Button.free;
begin
  b.free;
end;

function Button.getResult: TButton;
begin
  result := b;
end;

procedure Button.onClick(onClick1: TNotifyEvent);
begin
  b.onClick := onClick1;
end;

procedure Button.parent(AOwner: TWinControl);
begin
  b.parent := AOwner;
end;

procedure Button.reset;
begin
  b := TButton.Create(nil);
end;

{ Panel }

procedure Panel.free;
begin
  p.free;
end;

function Panel.getResult: TPanel;
begin
  result := p;
end;

procedure Panel.onClick(onClick1: TNotifyEvent);
begin
  p.onClick := onClick1;
end;

procedure Panel.parent(AOwner: TWinControl);
begin
  p.parent := AOwner;
end;

procedure Panel.reset;
begin
  p := TPanel.Create(nil);
end;

end.
