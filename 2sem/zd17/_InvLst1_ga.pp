{ InvLst1_ga.pp                 2012 �.  ��㫨� �.�. }
{ ����஥��� ���ᨪ�㯮�冷祭���� ᯨ᪠ ᫮�, ��������  �   }
{   �ந����쭮� ���浪� � ����������. ��᫥ ����� �������    }
{   ᫮�� �뢮����� ����稢訩�� ᯨ᮪.                      }
{ ������஢���� (��ॢ��稢����) ����稢襣��� ᯨ᪠ �     }
{   ������ �ணࠬ�� �।�⠢���� �����誮�.                  }
{ ���������� �������:                                         }
{ 1)�������� ������ ��ॢ��稢����(������஢����)ᯨ᪠.}
{   �� �⮬ ������஢���� ᯨ᮪ ��ࠧ���� �� ������⮢   }
{   ��室���� ᯨ᪠, �.�. ������ new �� �ᯮ������!!!    }
{ 2) �������: invLst1_nn.pp � invLst1_nn.exe,               }
{    ��� nn -��� ���䨪�, ���������� � zip-䠩� Zd06_nn.zip � }
{    ��ࠢ��� �� ���� �� kvg@star.math.spbu.ru              }

type TPItemList=^TItemList;
     TInfo=string;
     TItemList= record
       info: TInfo;
       nxt:  TPItemList
     end;
     TList=TPItemList;


procedure addItem2List1(var list: TList; s: TInfo);
   var ppItemList: ^TPItemList;
       p:           TPItemList;
   begin ppItemList:=@list;
     while ppItemList^ <> nil do begin
       if   s<=ppItemList^^.info then break
       else ppItemList:=@(ppItemList^^.nxt)
     end;
     if (ppItemList^ = nil) or (s<>ppItemList^^.info) then begin
       new(p); p^.info:=s; p^.nxt:=ppItemList^; ppItemList^:=p
     end
   end;

procedure putlist(list: TList);
  begin
    if list=nil then write('���᮪ ����!')
    else
      while list<>nil do begin write(list^.info,' '); list:=list^.nxt end;
    writeln
  end;

procedure getlist(var lst: TList);
  var s: TInfo; again: boolean;
  begin   lst:=nil;
    repeat
      again:=false;
      write('  ������ ᫮�� (����� ��ப� - �����!): ');
      readln(s);
      if length(s)<>0 then begin writeln;
        addItem2List1(lst,s); write('���᮪: ');
        putlist(lst); writeln; again:=true
      end
    until not again;
    writeln
  end;

procedure invertList(var list: TList);
  var a, b, c: TPItemList;
  begin
    a := list^.nxt;
    b := list;
    c := list^.nxt^.nxt;
    while c <> nil do begin
      a^.nxt := b;
      b := a;
      a := c;
      c := c^.nxt;
    end;
    a^.nxt := b;
    list^.nxt := nil;
    list := a;
  end;

var l: TList;
   ok: byte;

begin   l:=nil; writeln; writeln;
  writeln('*** ����஥��� �易����� 㯮�冷祭����   ***');
  writeln('***   ᯨ᪠ ᫮�  � ��� ������஢����.   ***');
  writeln('*** ���������: ������஢����  ᯨ᪠     ***');
  writeln('***             ��楤�ன invertList      ***');
  writeln('***              ��㫨� �.�., ��५� 2012 ***');
  writeln;
  repeat
    writeln('��ந� ᯨ᮪ ᫮�:'); writeln;
    getlist(l);
    write('����� ᯨ᮪:        '); putlist(l);
    write('��ॢ����� ᯨ᮪: ');
    invertList(l);
    putlist(l); writeln;
    write('��ந� ���� ᯨ᮪ ᫮�? (1 -��, 0 -���): ');
    readln(ok);
  until ok=0
end.
