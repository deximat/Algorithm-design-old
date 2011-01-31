var a,b:array[0..10000] of longint;
    suma,i,minb,sumb,n,m,bb,aa,bm,am,brojac:longint;
begin
  readln(n,m);
  for i:=1 to n do
    begin
      read(a[i]);
      suma:=suma+a[i];
    end;
  readln;
  minb:=maxlongint;
  for i:=1 to m do
    begin
       read(b[i]);
       if b[i]<minb
         then minb:=b[i];
       sumb:=sumb+b[i];
    end;
  aa:=suma div n;
  am:=suma mod n;
  bb:=sumb div m;
  bm:=sumb mod m;
  for i:=1 to n do
    if ((a[i]<aa) or ((a[i]=aa) and (am>0))) and (a[i]>bb)
       then brojac:=brojac+1;
  writeln(brojac);
end.