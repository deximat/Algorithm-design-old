var n,i,j:integer;
    ukupne,iste:longint;
begin
  readln(n);
  for i:=1 to n do iste:=2*i+iste;
  for i:=0 to n do
    for j:=i+1 to n do
      ukupne:=i+j+ukupne;
  ukupne:=iste + ukupne;
  writeln(ukupne);
end.