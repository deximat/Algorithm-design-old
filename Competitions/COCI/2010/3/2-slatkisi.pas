var i,a,b,c:longint;
begin
  read(a,b);
  c:=1;
  for i:=1 to b do
    c:=c*10;
  if b=0
   then writeln(a)
   else writeln(round(a / c) * c);
end.
