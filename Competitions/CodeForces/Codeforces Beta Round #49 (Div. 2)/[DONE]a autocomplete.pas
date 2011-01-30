{$inline on}
var i,j,k,n,m:longint;
    s:string;
    niz:array[0..150] of string;
procedure quicksort(levi,desni:longint);
var i,j:longint;
    pom,pivot:string;
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
    if copy(niz[i],1,length(s)) = s
      then begin
             writeln(niz[i]);
             halt;
           end;
  writeln(s);
end.
