{
ID:deximat1
PROB:numtri
LANG:PASCAL
}
var matrica,sume:array[0..1002,0..1002]  of longint;
    n,i,j,max:longint;
begin
  assign(input,'numtri.in');
  reset(input);
  assign(output,'numtri.out');
  rewrite(output);
  readln(n);
  for i:=1 to n do
    for j:=1 to i do
      read(matrica[i,j]);
  sume[1,1]:=matrica[1,1];
  for i:=2 to n do
    sume[i,1]:=sume[i-1,1]+ matrica[i,1];
  for i:=2 to n do
    sume[i,i]:=sume[i-1,i-1]+ matrica[i,i];
  for i:=3 to n do
    for j:=2 to i-1 do
      if sume[i-1,j-1] > sume[i-1,j]
        then sume[i,j]:=sume[i-1,j-1]+matrica[i,j]
        else sume[i,j]:=sume[i-1,j]+matrica[i,j];
  for j:=1 to n do
     if sume[n,j]>max
       then max:=sume[n,j];
  writeln(max);
  close(output);
end.
