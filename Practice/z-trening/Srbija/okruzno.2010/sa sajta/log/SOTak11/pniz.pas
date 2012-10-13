var f:text;
    i,j,n,brojac,promena:longint;
    niz:array[0..100001] of int64;
begin
  assign(f,'pniz.in'); reset(f);
  readln(f,n);
  for i:=1 to n do
    read(f,niz[i]);
  readln(f);
  close(f);
  i:=1;
  j:=n;
  while i<j do
    if niz[i]=niz[j]
      then begin
             i:=i+1;
             j:=j-1;
             brojac:=brojac+2;
           end
      else if niz[i]<niz[j]
             then begin
                    i:=i+1;
                    niz[i]:=niz[i]+niz[i-1];
                    promena:=promena+1;
                  end
             else begin
                    j:=j-1;
                    niz[j]:=niz[j]+niz[j+1];
                    promena:=promena+1;
                  end;
  assign(f,'pniz.out'); rewrite(f);
  if odd(n-promena)
    then writeln(f,brojac+1)
    else writeln(f,brojac);

  close(f);
end.
