{
PROG:ttime
LANG:PASCAL
ID:deximat1
}
type sl1 = record
             kontura,fs,ls:longint;
           end;
    sl2 = record
            cvor1,cvor2:longint;
          end;
var grane:array[0..2001] of sl2;
    cvorovi:array[0..2001] of sl1;
    n,m,q,i,a,b,kontura:longint;
procedure qs(levi,desni:longint);
  var i,j,pivot:longint;
      pom:sl2;
  begin
    i:=levi;
    j:=desni;
    pivot:=grane[(levi+desni) div 2].cvor1;
    repeat
      while grane[i].cvor1 < pivot do i:=i+1;
      while pivot  < grane[j].cvor1 do j:=j-1;
      if i<=j
        then begin
               pom:=grane[j];
               grane[j]:=grane[i];
               grane[i]:=pom;
               i:=i+1;
               j:=j-1;
             end;
    until i>j;
    if levi < j then qs(levi,j);
    if i < desni then qs(i,desni);
  end;
procedure dfs(cvor:longint);
  var i:longint;
  begin
    cvorovi[cvor].kontura:=kontura;
    for i:=cvorovi[cvor].fs to cvorovi[cvor].ls do
      if cvorovi[grane[i].cvor2].kontura=0
        then dfs(grane[i].cvor2);
  end;
begin
  assign(input,'ttime.in'); reset(input);
  assign(output,'ttime.out'); rewrite(output);
  readln(n,m,q);
  for i:=1 to m do
    begin
      readln(grane[i].cvor1,grane[i].cvor2);
      grane[i+m].cvor1:=grane[i].cvor2;
      grane[i+m].cvor2:=grane[i].cvor1;
    end;
  qs(1,m*2);
  for i:=1 to m*2 do
    cvorovi[grane[i].cvor1].ls:=i;
  for i:=m*2 downto 1 do
    cvorovi[grane[i].cvor1].fs:=i;

  for i:=1 to n do
    begin

      if cvorovi[i].kontura=0
        then begin
               kontura:=kontura+1;
               dfs(i);
             end;
    end;
  for i:=1 to q do
    begin
      readln(a,b);
      if cvorovi[a].kontura = cvorovi[b].kontura
        then writeln('Y')
        else writeln('N');
    end;
  close(input);
  close(output);
end.
