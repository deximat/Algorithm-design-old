{
PROG:smount
LANG:PASCAL
ID:deximat1
}
var niz,niz2:array[0..100001] of longint;
    i,j,n,max:longint;
function sirina(pocetak:longint):longint;
  var j:longint;
  begin
    j:=pocetak;
    while (niz[j]<=niz[j+1]) and (j+1 <= n) do
      j:=j+1;
    while (niz[j]>=niz[j+1]) and (j+1 <= n) do
      j:=j+1;
    sirina:=j+1-pocetak;
    while niz[j-1]=niz[j] do
      j:=j-1;
    i:=j;

  end;
begin
  assign(input,'smount.in');
  reset(input);
  assign(output,'smount.out');
  rewrite(output);
  readln(n);
  for i:=1 to n do
    readln(niz[i]);
  i:=1;
  if niz[1] > niz[2]
    then begin
           while niz[i] >= niz[i+1] do
             i:=i+1;
           niz2[1]:=i;
           while (niz[i-1] = niz[i]) and (i-1>1) do
             i:=i-1;

         end
    else niz2[1]:=sirina(i);
  j:=2;
  while true do
    begin
      niz2[j]:=sirina(i);
      j:=j+1;
      if i+1 > n
        then break;
    end;
  for i:=1 to j do
    if niz2[i]>max
      then max:=niz2[i];
  writeln(max);
end.
