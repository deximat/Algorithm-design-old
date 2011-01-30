var i,j,n,m,max:longint;
    w,d:array[0..4000] of longint;
    niz:array[-1..13000] of longint;
begin
  readln(n,m);
  for i:=1 to n do
    readln(w[i],d[i]);
  for i:=1 to n do
    for j:=m-w[i]+1 downto 0 do
      if niz[j+w[i]] < niz[j]+d[i]
        then niz[j+w[i]]:=niz[j]+d[i];
  for i:=0 to m do
    if niz[i]>max
      then max:=niz[i];
  writeln(max);

end.
