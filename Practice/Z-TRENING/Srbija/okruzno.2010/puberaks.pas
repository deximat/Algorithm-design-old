var i,n:longint;
    niz:array[1..100] of longint;
begin
  readln(n);
  for i:=1 to n do
    read(niz[i]);
  for i:=1 to n do
    if niz[i+1]-niz[i] > niz[i+2]-niz[i+1]
      then break;
  for j:=1 to i do
    first:=first+niz[i];


end.