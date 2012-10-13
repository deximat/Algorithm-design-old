uses math;
var n,h,m,s,ss,i,j,brojac:longint;
    v,max:real;
    niz2:array[0..101] of boolean;
    niz:array[0..101] of record
                              s:longint;
                              m,v:real;
                         end;
begin
  //assign(input,'out.txt'); reset(input);
  readln(n,h,m,s);
  s:=h*3600+m*60+s;
  for i:=1 to n do
    begin
      readln(v,h,m,ss);
      niz[i].v:=v;
      niz[i].s:=ss+m*60+h*3600;
    end;
  for i:=1 to s do
    begin
      for j:=1 to n do
        if niz[j].s<=i
          then  niz[j].m:=niz[j].m+niz[j].v;
      max:=0;
      for j:=1 to n do
        if max<=niz[j].m
          then max:=niz[j].m;
      for j:=1 to n do
        if SameValue(max,niz[j].m,1e-6) and (not samevalue(0,max,1e-6))
          then niz2[j]:=true;
    end;


  for i:=1 to n do
    if niz2[i]
      then brojac:=brojac+1;


  writeln(brojac);
end.