// treeact_xx_1.pp            ��쬥��� �.�.  ��५�, 2008 �.
//                       ������஢���:  ��५�  2011,2012 ��.
// �ਬ�� ����஥���, ������஭���� ��室�  
//  ��ॢ� ���᪠.  
// �������: ������� � ᮮ⢥�����騬 ���஢�- 
//       ���� �믮������ ᫥����� �㭪権:  
//  1) ��।������ ����� ��ॢ� (�����誠 htree) - treeact_xx_2.pp
//  2) ��।������ ������⢠ 㧫�� � ��ॢ� (�����誠 countNodes) -treeact_xx_3.pp
//  3) ��।������ ������⢠ ����쥢 � ��ॢ� (�����誠 countLeaves) - treeact_xx_4.pp 
//  3) ��室 ��ॢ� ᢥ��� ���� (�����誠 walk_top_down)
//  4) ��室 ��ॢ� ᭨�� ����� (�����誠 walk_bottom_up) - treeact_xx_5.pp 
//  5) ��।������ �ਭ� ��ॢ� (�����誠 wtree) - treeact_xx_6.pp 
//     ����砭��: �) �� ��।������ �ਭ� ��ॢ� ��ॢ� ������ ��室�����
//                   ������⭮!!! 
//                �) ��᫥ �믮������ �㭪樨 �� ������ ���� 㢥��祭� ������⢮
//                   ����⮩ �����.
//  6) �뢮� �� ��࠭ ��ॢ� �� �஢�� ("��ᨢ�" �뢮� ��ॢ�) 
//     (����䨪��� ��楤��� treeOut) - treeact_xx_7.pp 

uses crt;

type TInfo    = integer;
     TRefNode = ^TNode;
        TNode =
          record
            s: TInfo;
            left,right: TRefNode
          end;
     TTree    = TRefNode;

procedure intree(var t: TTree; a: TInfo);
  begin
    if t=nil then
      begin  new(t);
        t^.s:=a; t^.left:=nil; t^.right:=nil;
      end
    else
      if  a< t^.s then intree(t^.left,a)
      else
      if a > t^.s then intree(t^.right,a)
  end;

{---- ��� treeact_xx_2.pp: ��।������ ����� ��ॢ� ---}
function htree(t: TTree):integer;
  begin {�� �����誠}
    htree:=0
  end;

{---- ��� treeact_xx_3.pp: ������⢮ 㧫�� � ��ॢ� ---}
function countNodes(t: TTree):integer;
  begin {�� �����誠}
    countNodes:=0
  end;
  
{---- ��� treeact_xx_4.pp: ������⢮ ����쥢 � ��ॢ� -}
function countLeaves(t: TTree):integer;
  begin {�� �����誠}
    countLeaves:=0;
  end {countLeaves};  

{---- ��室 ��ॢ� ᫥�� -----------}
procedure walk_lft(t: TTree);
begin
  if t<>nil then
    begin
      walk_lft(t^.left);
      write(t^.s,' ');
      walk_lft(t^.right);
    end
end;

{---- ��� treeact_xx_5.pp: ��室 ��ॢ� ᢥ��� ���� ---}
procedure walk_top_down(t: TTree);
begin {�� �����誠}
end;

{---- ��� treeact_xx_5.pp: ��室 ��ॢ� ᭨�� ����� ---}
procedure walk_bottom_up(t: TTree);
begin {�� �����誠}
end;

{---- ��� treeact_xx_7.pp: �뢮� ��ॢ� �� ��࠭ ------}
procedure treeOut(t:TTree);
  begin
    window(1,1,79,13);
    ClrScr;
    walk_lft(t);
    writeln
  end;

{---- ��� treeact_xx_6.pp: ��ਭ� ��ॢ� --------------}
function wtree(t:TTree):integer;
  {-------------------------------------}
  begin  {�� �����誠}
    wtree:=0
  end {wtree};

{---- ������ �����樨 ��ॢ� ���᪠ -----------}
procedure gentree(var t: TTree);
  var a: integer;
  begin
    writeln;
    writeln('*** treeact_xx_1.pp     ��쬥��� ��, ��५� 2008,2012 ��');
    writeln('*** ������� ��ॢ� ���᪠, ��᫥����⥫쭮');
    writeln('***  ������ � ���� ������� 楫� ����-');
    writeln('***  ��� �⫨�� �� 0 (0-����� �����!)  ');
    writeln;
    write('������ 楫� ���祭�� (0-�����): ');
    read(a);
    while a<>0 do
      begin  intree(t,a);
        treeOut(t);
        window(1,14,79,24); ClrScr;
        gotoXY(1,1);
        writeln;
        writeln('*** treeact_xx_1.pp     ��쬥��� ��, ��५� 2008,2012 ��');
        writeln('*** ������� ��ॢ� ���᪠, ��᫥����⥫쭮');
        writeln('***  ������ � ���� ������� 楫� ����-');
        writeln('***  ��� �⫨�� �� 0 (0-����� �����!)  ');
        writeln;
        write('������ 楫� ���祭�� (0-�����): ');
        read(a);
      end;
    writeln('! ��ॢ� ᮧ���� !');
    readln;
    treeOut(t)
  end;

var tree: TRefNode;
      ok: byte;

begin tree:=nil; ok:=1;
  ClrScr;
  while ok<>0 do begin
    window(1,14,79,24); ClrScr;
    gotoXY(1,1);
    gentree(tree);
    writeln;
    window(1,14,79,24); ClrScr;
    gotoXY(1,1);
    writeln('��� -����祭��� ��ॢ�!');
    writeln('���� ��ॢ�: ',htree(tree));
    writeln('������⢮ 㧫�� � ��ॢ�: ',countNodes(tree));
    writeln('������⢮ ����쥢 � ��ॢ�: ',countLeaves(tree));
    write('���諨 ᫥�� ���ࠢ�: '); walk_lft(tree); writeln;
    write('���諨 ᢥ��� ����: '); walk_top_down(tree); writeln;
    write('���諨 ᭨�� �����: '); walk_bottom_up(tree); writeln;
    writeln('��ਭ� ��ॢ�: ',wtree(tree));
    write('������ (1 -�த�����; 0 -�����稫�): ');
    readln(ok);
  end;
end.
