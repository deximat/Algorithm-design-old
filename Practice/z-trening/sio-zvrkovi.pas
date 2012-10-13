var i,j,n,a,min,max:longint;
    niz:array[0..30001] of integer;
begin
  readln(n);
  min:=maxlongint;
  for i:=1 to n do
    begin
      readln(j);
      niz[j]:=1;
      if j>max then max:=j;
      if j<min then min:=j;
    end;
  for i:=min to max do
    if niz[i] = 1
      then begin
           j:=i;
           while i+j<=max do
             if niz[i+j] > 0
                then begin
                       niz[i]:=niz[i]-1;
                       niz[i+j]:=2;
                       break;
                     end
                else j:=j+1;
          end;
  a:=0;
  for i:=1 to 100 do
   if niz[i]>0 then a:=a+1;
  writeln(a);
end.
