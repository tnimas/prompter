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
    messagebox(0, 'Не корректный вызов функции.', '', mb_ok);
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
find:='Правительство';

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
if intzemlja*3 > intoon  then memo2.Lines.Strings[2]:='Состоит ли в ООН: Нет';
if intzemlja*3 = intoon then memo2.Lines.Strings[2]:='Состоит ли в ООН: Да';
if intzemlja*3 < intoon then memo2.Lines.Strings[2]:='Состоит ли в ООН: ?';

if intoon = 0  then memo2.Lines.Strings[3]:='Есть ли союзы: Нет' ;
if intoon > 0  then memo2.Lines.Strings[3]:='Есть ли союзы: Да' ;
if intzemlja*3 = intoon then memo2.Lines.Strings[3]:='Есть ли союзы: Нет';
if prav = 'Фашизм'  then memo2.Lines.Strings[1]:='' ;
if prav = 'Коммунизм'  then memo2.Lines.Strings[1]:='Особенности: +20% эффективность технологий' ;
if prav = 'Монархия'  then memo2.Lines.Strings[1]:='';
if prav = 'Тирания'  then memo2.Lines.Strings[1]:='';
if prav = 'Теократия'   then memo2.Lines.Strings[1]:='Особенности: -50% действия технологий, расходы на ООН*2';
if prav = 'Республика'  then
begin

memo2.Lines.Strings[1]:='Особенности: -10% сила войск, +20% освоение';
gs:=IntToStr(Ceil(intgs*0.9));
br:=IntToStr(Ceil(intbr*0.9));
ab:=IntToStr(Ceil(intab*0.9));
ss:=IntToStr(Ceil(intss*0.9));
ps:=IntToStr(Ceil(intps*0.9));
end;
if prav = 'Демократия' then memo2.Lines.Strings[1]:='Особенности: 3 хода на атаку, 0% комиссия рынка';
if prav = 'Диктатура' then begin memo2.Lines.Strings[1]:='Особенности: +25% сила войск, +30% эффективность шпионов';
gs:=IntToStr(Ceil(intgs*1.25));
br:=IntToStr(Ceil(intbr*1.25));
ss:=IntToStr(Ceil(intss*1.25));
ps:=IntToStr(Ceil(intps*1.25));
ab:=IntToStr(Ceil(intab*1.25));
sp:=IntToStr(Ceil(intsp*1.3)); end;
if prav = 'Fascism' then memo2.Lines.Strings[1]:='' ;
if prav = 'Communism' then memo2.Lines.Strings[1]:='Особенности: +20% эффективность технологий' ;
if prav = 'Monarchy' then memo2.Lines.Strings[1]:='' ;
if prav = 'Tyranny' then memo2.Lines.Strings[1]:='';
if prav = 'Theocracy' then memo2.Lines.Strings[1]:='Особенности: -50% действия технологий, расходы на ООН*2';
if prav = 'Republic' then
begin
memo2.Lines.Strings[1]:='Особенности: -10% сила войск, +20% освоение';
gs:=IntToStr(Ceil(intgs*0.9));
br:=IntToStr(Ceil(intbr*0.9));
ab:=IntToStr(Ceil(intab*0.9));
ss:=IntToStr(Ceil(intss*0.9));
ps:=IntToStr(Ceil(intps*0.9));
end;
if prav = 'Democracy' then memo2.Lines.Strings[1]:='Особенности: 3 хода - атака, 0% комиссия рынка';
if prav = 'Dictatorship' then begin memo2.Lines.Strings[1]:='Особенности: +25% сила войск, +30% эффективность шпионов';
gs:=IntToStr(Ceil(intgs*1.25));
br:=IntToStr(Ceil(intbr*1.25));
ss:=IntToStr(Ceil(intss*1.25));
ps:=IntToStr(Ceil(intps*1.25));
ab:=IntToStr(Ceil(intab*1.25));
sp:=IntToStr(Ceil(intsp*1.3));
end;
memo2.Lines.Strings[4]:='Спал: '+sp ;
memo2.Lines.Strings[5]:='Пробой для SS: '+ss+' 000 самолетов' ;
memo2.Lines.Strings[6]:='Пробой для PS: '+ps+' 000 самолетов' ;
memo2.Lines.Strings[7]:='Пробой для GS: '+gs+' 000 пехоты' ;
memo2.Lines.Strings[8]:='Пробой для BR: '+br+' 000 самолетов' ;
memo2.Lines.Strings[9]:='Пробой для AB: '+ab+' 000 танков' ;
memo2.Lines.Strings[10]:='ID:'+id+'|Земля:'+zemlja+'|Спал:'+sp+'|SS/PS:'+ss+'k/'+ps+'k| GS:'+gs+'k| BR:'+br+'k| AB:'+ab+'k' ;


end;

procedure TForm1.N3Click(Sender: TObject);
begin
showmessage(
'Словарь терминов:'+#13#10+#13#10+
'Спал - отношение количества шпионов к земле (Шпионы/Земля), влияющее на защиту страны от шпионских атак.'+#13#10+
'Пробой - количество войск необходимых для успешной атаки.'+#13#10+
'SS- стандартная атака: захват земли и построек.'+#13#10+
'PS- спланированная атака: захват земли и построек, размер захвата в 1.5 раза больше SS, НО(!) войска из такой атаки вернутся только через 20 часов.'+#13#10+
'GS - пехотная атака: убивает население, уничтожает еду. Используется для убийства стран. Т.к. для убийства средней страны необходимо более 100 атак, не пользуйтесь этой атакой, играя в одиночку.'+#13#10+
'BR - авианалет: убивает население, уничтожает небольшое количество построек. Используется для убийства стран, так же как GS не эффективна для одиночной игры.'+#13#10+
'AB - танковый удар, уничтожает постройки и небольшое количество населения, применяется для уничтожения экономики.'+#13#10
+#13#10+
'Для начала работы скопируйте spy (общий шпионаж) в верхнее окно программы, начиная с'+#13#10+
'"The status" ("Детальный отчет..."), заканчивая "SDI ХХХХ ХХ%" ("...Противоракетная  ХХХХ  ХХ%")'+#13#10+#13#10+

'При запуске программы выставляется ваш браузер по умолчанию.'+#13#10+
'ВНИМАНИЕ! Для корректной работы программы необходимо, чтобы в меню "Ваш браузер" был указан браузер из которого вы копировали шпионаж. '+#13#10+
#13#10+
'ВАЖНО! Помните, что при наличии защитных союзов у цели, к пробою цели'+#13#10+
'добавится часть пробоя союзника (25% к каждому виду войск).'+#13#10+
#13#10+

'Пробой для атак и спал выдаются с учетом технологий и'+#13#10+
'бонусов правительства  страны.'+#13#10#13#10+
'Поддерживаются английский и русский интерфейс.'+#13#10+#13#10+
'О всех недочетах и пожеланиях вы можете сообщить, послав письмо на ящик'+#13#10+
'tnimas@gmail.com или с помощью  irc: сеть rusnet, в приват Nimas.');
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
Showmessage(#13#10+'Для корректной работы - скопировать скан страны, начиная с "Детальный отчет...", заканчивая "...Противоракетная  ХХ%" (в английском интерфейсе - соответственно).');
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
