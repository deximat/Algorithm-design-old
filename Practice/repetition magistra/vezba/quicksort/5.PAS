var i,n:longint;
    niz:array[1..100] of longint;
procedure qs(levi,desni:longint);
  var pivot,i,j,pom:longint;
  begin
    pivot:=niz[(levi + desni) div 2];
    i:=levi;
    j:=desni;

    repeat
      while niz[i]<pivot do i:=i+1;
      while niz[j]>pivot do j:=j-1;

      if i <= j
        then begin
               pom:=niz[i];
               niz[i]:=niz[j];
               niz[j]:=pom;
               i:=i+1;
               j:=j-1;
             end;
    until i > j;
    if levi < j then qs(levi,j);
    if i < desni then qs(i,desni);
  end;
begin
  readln(n);
  for i:=1 to n do
    readln(niz[i]);
  qs(1,n);
  for i:=1 to n do
    writeln(niz[i]);
end.