var i,j,n,brojac,levi,desni,promena:longint;
    niz:array[1..100000] of longint;
    t:text;
begin
  assign(t,'pniz.in'); reset(t);
  readln(t,n);
  for i:=1 to n do
    read(t,niz[i]);
  i:=1;
  j:=n;
  while i < j do
    if niz[i]=niz[j]
      then begin
             brojac:=brojac+2;
             j:=j-1;
             i:=i+1;
           end
      else if niz[i]< niz[j]
             then begin
                    i:=i+1;
                    niz[i]:=niz[i]+niz[i-1];
                    promena:=promena+1;
                  end
             else begin
                    j:=j-1;
                    niz[j]:=niz[j+1]+niz[j];
                    promena:=promena+1;
                  end;
  if odd(n-promena)
    then writeln(brojac+1)
    else writeln(brojac);
  close(t);
end.
