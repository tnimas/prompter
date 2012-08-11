unit Unitinfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,SHELLAPI;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure Label5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Label5Click(Sender: TObject);
begin
ShellExecute(Application.Handle,PChar('open'),'http://sfunion.ru/forum/viewforum.php?f=7',PChar(0),nil,SW_NORMAL);
end;

end.
