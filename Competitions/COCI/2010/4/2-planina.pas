var n,a,ukupno:int64;
    i,j:longint;
begin
  readln(n);
  ukupno:=2;
  for i:=1 to n do
      ukupno:=ukupno+ukupno-1;
  writeln(ukupno*ukupno);
end.