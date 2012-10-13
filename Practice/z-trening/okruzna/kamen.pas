type sl1 = record
             fs,ls:longint;
           end;
var slovo:array[0..50001] of char;
    tezina:array[0..50001] of longint;
    susedi:array['A'..'Z'] of sl1;
    i,resenje,n,m:longint;
    c:char;
procedure qs(levi,desni:longint);
  var i,j,pom2,pivot2:longint;
      pom1,pivot1:char;
  begin
    i:=levi;
    j:=desni;
    pivot1:=slovo[(levi + desni) div 2];
    pivot2:=tezina[(levi + desni) div 2];
    repeat
      while (slovo[i] < pivot1) or ( (slovo[i]=pivot1) and (tezina[i]<pivot2) ) do i:=i+1;
      while (pivot1 < slovo[j]) or ( (slovo[j]=pivot1) and (pivot2 < tezina[j])) do j:=j-1;
      if i<=j
        then begin
               pom1:=slovo[i];
               pom2:=tezina[i];
               slovo[i]:=slovo[j];
               tezina[i]:=tezina[j];
               slovo[j]:=pom1;
               tezina[j]:=pom2;
               i:=i+1;
               j:=j-1;
             end;
    until i>j;
    if levi < j then qs(levi,j);
    if i < desni then qs(i,desni);
  end;
begin
  readln(n,m);
  for i:=1 to n do
    readln(slovo[i],tezina[i]);
  qs(1,n);
  for i:=1 to n do
    susedi[slovo[i]].ls:=i;
  for i:=n downto 1 do
    susedi[slovo[i]].fs:=i;
  for i:=1 to m do
    begin
      readln(c);
      if susedi[c].fs > 0
        then begin
               resenje:=resenje+tezina[susedi[c].fs];
               if susedi[c].fs+1 <= susedi[c].ls
                 then susedi[c].fs:=susedi[c].fs+1
                 else susedi[c].fs:=0;
             end
        else begin
               writeln(-1);
             end;
    end;
  writeln(resenje);
end.