uses math;
var m,n,i,j,min,maxj:longint;
    w,d:array[0..100] of longint;
    niz:array[-1..1500000]  of longint;
begin
  readln(m,n);

  for i:=1 to n do
    readln(d[i],w[i]);

  for i:=0 to m do
    niz[i]:=1000000000;

  niz[m]:=0;
  for i:=1 to n do
    for j:=m downto d[i] do
       if (niz[j-d[i]] > w[i]+niz[j]) and (niz[j]<>1000000000)
         then niz[j-d[i]]:=w[i]+niz[j];


  writeln(niz[0]);
end.
