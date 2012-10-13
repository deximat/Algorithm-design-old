uses strutils,math;
var niz:array[1..3] of string;
    niz2:array[1..3] of longint;
    s:string;
    n,j,i:longint;
begin
  niz[1]:=DupeString('ABC',40);
  niz[2]:=DupeString('BABC',30);
  niz[3]:=DupeString('CCAABB',30);
  readln(n);
  readln(s);
  for j:=1 to 3 do
      for i:=1 to length(s) do
        if s[i]=niz[j][i]
          then inc(niz2[j]);
  writeln(maxintvalue(niz2));
  for i:=1 to 3 do
    if niz2[i]=maxintvalue(niz2)
      then case i of
             1:writeln('Adrian');
             2:writeln('Bruno');
             3:writeln('Goran');
            end;
end.