var i,n,m,unizu,suma,broj,j,pom:longint;
    niz:array[-1..10000] of longint;

begin
  readln(n,m);
  niz[0]:=-maxlongint;
  for i:=1 to n do
    begin
      read(broj);
      if broj<0
        then begin
               unizu:=unizu+1;
               niz[unizu]:=broj;
             end;
    end;
  For i := unizu-1 downto 1 do

    For j := 1 to i do

      if niz[j] > niz[j+1]

        then Begin

               Pom    := niz[j];

               niz[j]   := niz[j+1];

               niz[j+1] := Pom;

             end;
  if unizu>m
    then unizu:=m;
  for i:=1 to unizu do
    suma:=suma+niz[i];
  write(abs(suma));
end.
