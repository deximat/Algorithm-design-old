var n,k,i,j,l:longint;
    brojevi,sumeb,sumer:array[0..100001] of longint;
Procedure QuickSort(Levi, Desni:LongInt);
var i, j, D : LongInt;
var   Pom   : LongInt;
Begin
  i := Levi;
  j := Desni;
  D := brojevi[(Levi + Desni) div 2];
  Repeat
    while brojevi[i] < d do i := i+1;
    while brojevi[j] > d do j := j-1;
    if i <= j
      then Begin
             Pom    := brojevi[i];
             brojevi[i] := brojevi[j];
             brojevi[j] := Pom;
             j := j - 1;
             i := i + 1;
           end;
  until i > j;
  if Levi < j     then QuickSort(Levi, j);
  if    i < Desni then QuickSort(i, Desni);
end;
begin
  read(n);
  readln(k);
  for i:=1 to n do
    read(brojevi[i]);
  QuickSort(1,n);
  for i:=1 to n-k+1 do
     begin
       for j:=0 to k-1 do
         begin
           sumeb:=sumeb+brojevi[i+j]
           for l:=j to k do
             begin
               sumer:=abs(brojevi[i+j]-brojevi[i+l]);
             end;
         end;
     end;


end.
