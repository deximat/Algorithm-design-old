{$inline on}
var k1,n1,i,nzd,j,k:longint;
    res:qword;
    gore,dole:array[0..100] of longint;
function gdc(a,b:qword):qword;
var t:qword;
begin
  while b<>0 do
    begin
      t:=b;
      b:=a mod b;
      a:=t;
    end;
  gdc:=a;
end;
begin
  readln(k1,n1);

  for i:=1 to n1-k1 do
    dole[i]:=1;
  for i:=k1+1 to n1 do
    gore[i]:=1;
  for k:=1 to n1 do
  for i:=2 to n1 do
    for j:=2 to n1 do
      if (dole[i]>0) and (gore[j]>0) and (gdc(i,j) <> 1)
        then begin
              nzd:=gdc(i,j);
              dole[i]:=dole[i]-1;
              gore[j]:=gore[j]-1;
              gore[j div nzd]:=gore[j div nzd]+1;
              dole[i div nzd]:=dole[i div nzd]+1;
              break;
             end;
  res:=1;
  for i:=2 to n1 do
    for j:=1 to gore[i] do
      res:=res*i;
  writeln(res);
end.
