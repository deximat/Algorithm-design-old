{$m 256000000}
var i,j,k,n,m,c,resenje,brojac,a,b:longint;
    niz,niz2:array[0..1012] of longint;

begin
  //assign(input,'2.in');  reset(input);
  resenje:=0;
  readln(n);
  for i:=1 to n do
       read(niz[i]);
  i:=1;
  while (niz[i]=i) and
        (i<=n)   do
    i:=i+1;
  a:=i;
  j:=n;
  while (niz[j]=j) and
        (j>0)  do
    j:=j-1;
  b:=j;
  if (j<0) or (i>=n)
    then begin
           writeln('0 0');
           halt;
         end;
  for i:=1 to n do
    niz2[i]:=i;
  for i:=a to b do
    niz2[b-i+a]:=niz[i];
  for i:=1 to n do
    if niz2[i]<>i
      then begin
             writeln('0 0');
             halt;
           end;
  writeln(a,' ',b);
end.
