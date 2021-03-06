var niz:array[1..1000] of longint;
    n,i:longint ;
procedure quicksort(levi,desni:longint);
var i,j,pivot,pom:longint;
  begin
    pivot:=niz[(levi + desni) div 2];
    i:=levi;
    j:=desni;
    repeat
      while niz[i] < pivot do i:=i+1;
      while niz[j] > pivot do j:=j-1;
      if i <= j
        then begin
               pom:=niz[i];
               niz[i]:=niz[j];
               niz[j]:=pom;
               i:=i+1;
               j:=j-1;
             end;
    until i > j;
    if levi < j then quicksort(levi,j);
    if i < desni then quicksort(i,desni);
  end;
begin
  readln(s);
  readln(n);
  for i:=1 to n do
    readln(niz[i]);
  quicksort(1,n);
  for i:=1 to n do
    writeln(niz[i]);
end.
