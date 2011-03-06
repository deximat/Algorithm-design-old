uses math;
var i:longint;
    a,b,c,brojac:qword;
    niz:array[0..4] of qword;
procedure swap(a1,b1,c1:longint);
var max,k,i:longint;
begin
  max:=0;
  k:=0;
  for i:=1 to 3 do
    if niz[i]>max
      then max:=niz[i];


  for i:=1 to 3 do
    if niz[i]<>max
      then begin
             k:=k+1;
             niz[k]:=niz[i];
           end;

  c:=max;
end;
begin

  for i:=1 to 3 do
    begin
      readln(niz[1],niz[2],niz[3]);
      swap(a,b,c);
      if niz[1]**2+niz[2]**2=c**2
        then brojac:=brojac+1;
    end;
  writeln(brojac);
end.