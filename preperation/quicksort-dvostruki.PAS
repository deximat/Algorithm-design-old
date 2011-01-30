var i,n:longint;
    niz,niz2:array[1..1000] of longint;
procedure quicksort(levi,desni:longint);
var i,j,pom,pivot,pivot2:longint;
  begin
    i:=levi;
    j:=desni;
    pivot:=niz[(levi+desni) div 2];
    pivot2:=niz2[(levi+desni) div 2];
    repeat
      while (niz[i] > Pivot) OR ((Niz[i] = Pivot) and (Niz2[i] > Pivot2)) do i:=i+1;
      while (niz[j] < Pivot) OR ((Niz[j] = Pivot) and (Niz2[j] < Pivot2)) do j:=j-1;

      if i<=j
        then begin
               pom:=niz[i];
               niz[i]:=niz[j];
               niz[j]:=pom;

               pom:=niz2[i];
               niz2[i]:=niz2[j];
               niz2[j]:=pom;

               i:=i+1;
               j:=j-1;
             end;
    until i > j;
    if levi<j then quicksort(levi,j);
    if i<desni then quicksort(i,desni);
  end;
begin
  readln(n);
  for i:=1 to n do
    readln(niz[i],niz2[i]);

  quicksort(1,n);
  for i:=1 to n do
    writeln(niz[i],' ',niz2[i]);
end.
