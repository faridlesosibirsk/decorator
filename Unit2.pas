unit Unit2;

interface

type
  TAbstractPage = class
    function Print: string; virtual; abstract;
  end;

  TPage = class(TAbstractPage)
    function Print: string; override;
  end;

  TDecoratorPage = class(TAbstractPage)
    /// <link>aggregation</link>
    wrap: TAbstractPage;
    function Print: string; override;
    constructor create(Page: TAbstractPage); virtual; abstract;
  end;

  TNamberPage = class(TDecoratorPage)
    function Print: string; override;
    constructor create(Page: TAbstractPage); override;
  end;

  TLaterPage = class(TDecoratorPage)
    function Print: string; override;
    constructor create(Page: TAbstractPage); override;
  end;

implementation

{ TNamberPage }

constructor TNamberPage.create(Page: TAbstractPage);
begin
  wrap := Page;
end;

function TNamberPage.Print: string;
begin
  result := 'TNamberPage'+wrap.Print;
end;

{ TDecoratorPage }

function TDecoratorPage.Print: string;
begin
  result := 'TDecoratorPage';
end;

{ TPage }

function TPage.Print: string;
begin
  result := 'TPage';
end;

{ TLaterPage }

constructor TLaterPage.create(Page: TAbstractPage);
begin
  wrap := Page;
end;

function TLaterPage.Print: string;
begin
  result := 'TLaterPage'+wrap.Print;
end;

end.
