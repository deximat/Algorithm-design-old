var a,b,c:array[1..1000] of longint;
    i,n,f:integer;
    broj,ba:longint;
Procedure QuickSort(Levi, Desni:LongInt);
var i, j, D : LongInt;
var   Pom   : LongInt; { Pom je istog tipa kao i clanovi niza }
Begin

  i := Levi;

  j := Desni;

  D := b[(Levi + Desni) div 2]; { PIVOT }

  Repeat

    while b[i] > d do i := i+1;

    while b[j] < d do j := j-1;


    if (i <= j)

      then Begin
             if (b[i]<>b[j]) or (c[j]<c[i])
             then begin
                    Pom    := b[i];

                    b[i] := b[j];

                    b[j] := Pom;

                    Pom    := a[i];

                    a[i] := a[j];

                    a[j] := Pom;
                    Pom    := c[i];

                    c[i] := c[j];

                    c[j] := Pom;
                  end;
             j := j - 1;

             i := i + 1;
           end;

  until i > j;

  if Levi < j     then QuickSort(Levi, j);

  if    i < Desni then QuickSort(i, Desni);

end;
begin
  read(n,broj);
  for i:=1 to n do
   begin
    c[i]:=i;
    read(ba);
    f:=1;
    while (a[f]<>ba) and (a[f]<>0) do
      f:=f+1;
    a[f]:=ba;
    b[f]:=b[f]+1;
   end;
  quicksort(1,n);
  for i:=1 to n do
    for ba:=1 to b[i] do
      write(a[i],' ');
  writeln;
end.
