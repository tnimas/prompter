unit UnitObrabotka;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, Grids,Math,SHELLAPI,Registry,activex, ShlObj;

type

  TBrowserInformation = record
    Name: string;
    Path: string;
    Version: string;
  end;
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    MainMenu1: TMainMenu;
    J1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    Memo2: TMemo;
    N4: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    N5: TMenuItem;
    N7: TMenuItem;
    Edit1: TEdit;
    Label3: TLabel;
    N8: TMenuItem;
    MozilaFirefox1: TMenuItem;
    Opera1: TMenuItem;
    IE1: TMenuItem;
    N3: TMenuItem;
    Label4: TLabel;
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  gs:string;
  vartechna:string;
  br:string;
  ab:string;
  spal:string;
  ss,ps:string;
  zemlja,oon,prav:string;
  sp:string;
  spytechna:string;
  nas:string;
  menu:string;
  id:string;
  brows:string;
implementation

uses  Unitinfo;

{$R *.dfm}


procedure TForm1.N1Click(Sender: TObject);
begin
memo1.Lines.Clear;
end;


procedure TForm1.N2Click(Sender: TObject);
begin
Close;
end;
function strtst(var Input: string; EArray: string; Action: integer): string;
begin
  case Action of
    1:
      begin
        while length(Input) <> 0 do
        begin
          if pos(Input[1], EArray) = 0 then
            delete(Input, 1, 1)
          else
          begin
            result := result + Input[1];
            delete(Input, 1, 1);
          end;
        end;
      end;
    2:
      begin
        while length(Input) <> 0 do
        begin
          if pos(Input[1], EArray) <> 0 then
            delete(Input, 1, 1)
          else
          begin
            result := result + Input[1];
            delete(Input, 1, 1);
          end;
        end;
      end;
  else
    messagebox(0, '�� ���������� ����� �������.', '', mb_ok);
  end;
end;


procedure TForm1.Button1Click(Sender: TObject);
var
intss,intps:integer;
intgs:integer;
intvartechna,intspytechna:integer;
intbr,intsp:integer;
intab:integer;
intzemlja,intoon:integer;
r,i:integer;

find:string;
begin
if opera1.Checked then
begin

br:=memo1.Lines.Strings[44];
gs:=memo1.Lines.Strings[42];
ab:=memo1.Lines.Strings[45];
sp:=memo1.Lines.Strings[41];
oon:=memo1.Lines.Strings[23];
zemlja:=memo1.Lines.Strings[11];
prav:=memo1.Lines.Strings[2];
vartechna:=memo1.lines.Strings[57];
spytechna:=memo1.Lines.Strings[59];
nas:=memo1.Lines.Strings[10];

end;

if ie1.Checked then
begin

br:=memo1.Lines.Strings[45];
gs:=memo1.Lines.Strings[43];
ab:=memo1.Lines.Strings[46];
sp:=memo1.Lines.Strings[42];
oon:=memo1.Lines.Strings[24];
zemlja:=memo1.Lines.Strings[12];
prav:=memo1.Lines.Strings[3];
vartechna:=memo1.lines.Strings[58];
spytechna:=memo1.Lines.Strings[60];
nas:=memo1.Lines.Strings[11];

end;

if mozilafirefox1.Checked then
begin

br:=memo1.Lines.Strings[44];
gs:=memo1.Lines.Strings[42];
ab:=memo1.Lines.Strings[45];
sp:=memo1.Lines.Strings[41];
oon:=memo1.Lines.Strings[26];
zemlja:=memo1.Lines.Strings[13];
prav:=memo1.Lines.Strings[3];
vartechna:=memo1.lines.Strings[58];
spytechna:=memo1.Lines.Strings[60];
nas:=memo1.Lines.Strings[11];

end;
begin
id:=memo1.lines.strings[0];
find:='�������������';

If Pos(FIND, Memo1.Lines.Text)<>0
Then  delete(prav, 1, 13);
end;
begin
find:='Government';

If Pos(FIND, Memo1.Lines.Text)<>0
Then  delete(prav, 1, 10);
end;


id:= strtst(id,'#0123456789',1);
id:=copy(id,Pos('#',id),length(id));
prav:=strtst(prav, ' 	', 2);

br:= strtst(br, '0123456789', 1);
gs := strtst(gs, '0123456789', 1);
ab:=strtst(ab, '01234567890', 1);
sp:=strtst(sp, '01234567890', 1);
oon:=strtst(oon, '01234567890', 1);
zemlja:=strtst(zemlja, '01234567890', 1);

vartechna := strtst(vartechna, '0123456789', 1);
delete(vartechna, 1, Length(vartechna)-3);
spytechna := strtst(spytechna, '0123456789', 1);
delete(spytechna, 1, Length(spytechna)-3);
nas:=strtst(nas, '01234567890', 1);

intgs:=StrToInt(gs);
intbr:=StrToInt(br);
intab:=StrToInt(ab);
intsp:=StrToInt(sp);

Intzemlja:=StrToInt(zemlja);
intoon:=StrToInt(oon);
intspytechna:=StrToInt(spytechna);
intvartechna:=StrToInt(vartechna);

r:=StrToInt(edit1.Text);
if r=0 then r:=1 ;
r:=Round(r/2+50);

gs:=IntToStr(Ceil(intvartechna*intgs/100000*r/100+1));
br:=IntToStr(Ceil(intvartechna*intbr/100000*r/100+1));
ab:=IntToStr(Ceil(intvartechna*intab/100000*r/100+1));
ss:=IntToStr(Ceil(intvartechna*(intgs/2+intbr+intab*2)/100000*r/100+1));
ps:=InttoStr(Ceil(intvartechna*(intgs/2+intbr+intab*2)/150000*r/100+1));
sp:=IntToStr(Ceil(intspytechna*(intsp/intzemlja)/100*r/100));

intgs:=StrToInt(gs);
intbr:=StrToInt(br);
intab:=StrToInt(ab);
intsp:=StrToInt(sp);
intss:=StrToInt(ss);
intps:=StrToInt(ps);
memo2.Lines.Clear;
memo2.Lines.Add('');
memo2.Lines.Add('');
memo2.Lines.Add('');
memo2.Lines.Add('');
memo2.Lines.Add('');
memo2.Lines.Add('');
memo2.Lines.Add('');
memo2.Lines.Add('');
memo2.Lines.Add('');
memo2.Lines.Add('');
memo2.Lines.Add('');
memo2.Lines.Strings[0]:='ID: '+id+'  ('+prav+')';
if intzemlja*3 > intoon  then memo2.Lines.Strings[2]:='������� �� � ���: ���';
if intzemlja*3 = intoon then memo2.Lines.Strings[2]:='������� �� � ���: ��';
if intzemlja*3 < intoon then memo2.Lines.Strings[2]:='������� �� � ���: ?';

if intoon = 0  then memo2.Lines.Strings[3]:='���� �� �����: ���' ;
if intoon > 0  then memo2.Lines.Strings[3]:='���� �� �����: ��' ;
if intzemlja*3 = intoon then memo2.Lines.Strings[3]:='���� �� �����: ���';
if prav = '������'  then memo2.Lines.Strings[1]:='' ;
if prav = '���������'  then memo2.Lines.Strings[1]:='�����������: +20% ������������� ����������' ;
if prav = '��������'  then memo2.Lines.Strings[1]:='';
if prav = '�������'  then memo2.Lines.Strings[1]:='';
if prav = '���������'   then memo2.Lines.Strings[1]:='�����������: -50% �������� ����������, ������� �� ���*2';
if prav = '����������'  then
begin

memo2.Lines.Strings[1]:='�����������: -10% ���� �����, +20% ��������';
gs:=IntToStr(Ceil(intgs*0.9));
br:=IntToStr(Ceil(intbr*0.9));
ab:=IntToStr(Ceil(intab*0.9));
ss:=IntToStr(Ceil(intss*0.9));
ps:=IntToStr(Ceil(intps*0.9));
end;
if prav = '����������' then memo2.Lines.Strings[1]:='�����������: 3 ���� �� �����, 0% �������� �����';
if prav = '���������' then begin memo2.Lines.Strings[1]:='�����������: +25% ���� �����, +30% ������������� �������';
gs:=IntToStr(Ceil(intgs*1.25));
br:=IntToStr(Ceil(intbr*1.25));
ss:=IntToStr(Ceil(intss*1.25));
ps:=IntToStr(Ceil(intps*1.25));
ab:=IntToStr(Ceil(intab*1.25));
sp:=IntToStr(Ceil(intsp*1.3)); end;
if prav = 'Fascism' then memo2.Lines.Strings[1]:='' ;
if prav = 'Communism' then memo2.Lines.Strings[1]:='�����������: +20% ������������� ����������' ;
if prav = 'Monarchy' then memo2.Lines.Strings[1]:='' ;
if prav = 'Tyranny' then memo2.Lines.Strings[1]:='';
if prav = 'Theocracy' then memo2.Lines.Strings[1]:='�����������: -50% �������� ����������, ������� �� ���*2';
if prav = 'Republic' then
begin
memo2.Lines.Strings[1]:='�����������: -10% ���� �����, +20% ��������';
gs:=IntToStr(Ceil(intgs*0.9));
br:=IntToStr(Ceil(intbr*0.9));
ab:=IntToStr(Ceil(intab*0.9));
ss:=IntToStr(Ceil(intss*0.9));
ps:=IntToStr(Ceil(intps*0.9));
end;
if prav = 'Democracy' then memo2.Lines.Strings[1]:='�����������: 3 ���� - �����, 0% �������� �����';
if prav = 'Dictatorship' then begin memo2.Lines.Strings[1]:='�����������: +25% ���� �����, +30% ������������� �������';
gs:=IntToStr(Ceil(intgs*1.25));
br:=IntToStr(Ceil(intbr*1.25));
ss:=IntToStr(Ceil(intss*1.25));
ps:=IntToStr(Ceil(intps*1.25));
ab:=IntToStr(Ceil(intab*1.25));
sp:=IntToStr(Ceil(intsp*1.3));
end;
memo2.Lines.Strings[4]:='����: '+sp ;
memo2.Lines.Strings[5]:='������ ��� SS: '+ss+' 000 ���������' ;
memo2.Lines.Strings[6]:='������ ��� PS: '+ps+' 000 ���������' ;
memo2.Lines.Strings[7]:='������ ��� GS: '+gs+' 000 ������' ;
memo2.Lines.Strings[8]:='������ ��� BR: '+br+' 000 ���������' ;
memo2.Lines.Strings[9]:='������ ��� AB: '+ab+' 000 ������' ;
memo2.Lines.Strings[10]:='ID:'+id+'|�����:'+zemlja+'|����:'+sp+'|SS/PS:'+ss+'k/'+ps+'k| GS:'+gs+'k| BR:'+br+'k| AB:'+ab+'k' ;


end;

procedure TForm1.N3Click(Sender: TObject);
begin
showmessage(
'������� ��������:'+#13#10+#13#10+
'���� - ��������� ���������� ������� � ����� (������/�����), �������� �� ������ ������ �� ��������� ����.'+#13#10+
'������ - ���������� ����� ����������� ��� �������� �����.'+#13#10+
'SS- ����������� �����: ������ ����� � ��������.'+#13#10+
'PS- �������������� �����: ������ ����� � ��������, ������ ������� � 1.5 ���� ������ SS, ��(!) ������ �� ����� ����� �������� ������ ����� 20 �����.'+#13#10+
'GS - �������� �����: ������� ���������, ���������� ���. ������������ ��� �������� �����. �.�. ��� �������� ������� ������ ���������� ����� 100 ����, �� ����������� ���� ������, ����� � ��������.'+#13#10+
'BR - ���������: ������� ���������, ���������� ��������� ���������� ��������. ������������ ��� �������� �����, ��� �� ��� GS �� ���������� ��� ��������� ����.'+#13#10+
'AB - �������� ����, ���������� ��������� � ��������� ���������� ���������, ����������� ��� ����������� ���������.'+#13#10
+#13#10+
'��� ������ ������ ���������� spy (����� �������) � ������� ���� ���������, ������� �'+#13#10+
'"The status" ("��������� �����..."), ���������� "SDI ���� ��%" ("...���������������  ����  ��%")'+#13#10+#13#10+

'��� ������� ��������� ������������ ��� ������� �� ���������.'+#13#10+
'��������! ��� ���������� ������ ��������� ����������, ����� � ���� "��� �������" ��� ������ ������� �� �������� �� ���������� �������. '+#13#10+
#13#10+
'�����! �������, ��� ��� ������� �������� ������ � ����, � ������ ����'+#13#10+
'��������� ����� ������ �������� (25% � ������� ���� �����).'+#13#10+
#13#10+

'������ ��� ���� � ���� �������� � ������ ���������� �'+#13#10+
'������� �������������  ������.'+#13#10#13#10+
'�������������� ���������� � ������� ���������.'+#13#10+#13#10+
'� ���� ��������� � ���������� �� ������ ��������, ������ ������ �� ����'+#13#10+
'tnimas@gmail.com ��� � �������  irc: ���� rusnet, � ������ Nimas.');
end;

procedure TForm1.N4Click(Sender: TObject);
begin
Memo1.Perform(WM_CLEAR, 0, 0);
Memo1.Lines.Clear;
Memo1.Perform(WM_PASTE, 0, 0);
end;

procedure TForm1.N7Click(Sender: TObject);
begin
Form2.ShowModal;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
Showmessage(#13#10+'��� ���������� ������ - ����������� ���� ������, ������� � "��������� �����...", ���������� "...���������������  ��%" (� ���������� ���������� - ��������������).');
end;
procedure TForm1.Label4Click(Sender: TObject);
begin
ShellExecute(Application.Handle,PChar('open'),'http://sfunion.ru/forum/viewforum.php?f=7',PChar(0),nil,SW_NORMAL);
end;

function LongPathName(ShortPathName: string): string;
var
  PIDL: PItemIDList;
  Desktop: IShellFolder;
  WidePathName: WideString;
  AnsiPathName: AnsiString;
begin
  Result := ShortPathName;
  if Succeeded(SHGetDesktopFolder(Desktop)) then
  begin
    WidePathName := ShortPathName;
    if Succeeded(Desktop.ParseDisplayName(0, nil, PWideChar(WidePathName),
      ULONG(nil^), PIDL, ULONG(nil^))) then

    try
      SetLength(AnsiPathName, MAX_PATH);
      SHGetPathFromIDList(PIDL, PChar(AnsiPathName));
      Result := PChar(AnsiPathName);

    finally
      CoTaskMemFree(PIDL);
    end;
  end;
end;

function GetDefaultBrowser: TBrowserInformation;
var
  tmp: PChar;
  res: LPTSTR;
  Version: Pointer;
  VersionInformation: Pointer;
  VersionInformationSize: Integer;
  Dummy: DWORD;
begin
  tmp := StrAlloc(255);
  res := StrAlloc(255);
  Version := nil;
  try
    GetTempPath(255, tmp);
    if FileCreate(tmp + 'htmpl.htm') <> -1 then
    begin
      if FindExecutable('htmpl.htm', tmp, res) > 32 then
      begin
        Result.Name := ExtractFileName(res);
        Result.Path := LongPathName(ExtractFilePath(res));
        // Try to determine the Browser Version
        VersionInformationSize := GetFileVersionInfoSize(Res, Dummy);
        if VersionInformationSize > 0 then
        begin
          GetMem(VersionInformation, VersionInformationSize);
          GetFileVersionInfo(Res, 0, VersionInformationSize,
            VersionInformation);
          VerQueryValue(VersionInformation,
            ('StringFileInfo040904E4ProductVersion'),
            Pointer(Version), Dummy);
          if Version <> nil then
            Result.Version := PChar(Version);
          FreeMem(VersionInformation);
        end;
      end
      else
        ShowMessage('Cannot determine the executable.');
      SysUtils.DeleteFile(tmp + 'htmpl.htm');
    end;

  finally
    StrDispose(tmp);
    StrDispose(res);
  end;
end;


procedure TForm1.FormCreate(Sender: TObject);
begin

brows:=GetDefaultBrowser.Name;

if brows = 'iexplore.exe' then
ie1.Checked:=true;
if brows = 'Opera.exe' then
opera1.Checked:=true;
if brows = 'firefox.exe' then
MozilaFirefox1.Checked:=true;
end;

end.
