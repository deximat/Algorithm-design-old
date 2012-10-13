var niz:array[0..100002] of int64;
    i,j,n,pom,zbir1,zbir2:int64;
    prosek1,prosek2:real;
    f:text;
begin
  assign(f,'puberkas.in'); reset(f);
  readln(f,n);
  for i:=1 to n do
    read(f,niz[i]);
  for i:=1 to n-1 do
    for j:=1 to n-i do
      if niz[j]>niz[j+1]
        then begin
               pom:=niz[j];
               niz[j]:=niz[j+1];
               niz[j+1]:=pom;
             end;
 for i:=2 to n-1 do
   if niz[i]-niz[i-1] > niz[i+1]-niz[i]
     then break;
 for j:=1 to i-1 do
   zbir1:=niz[j]+zbir1;
 prosek1:=zbir1 / (i-1);
 for j:=i to n do
   zbir2:=niz[j]+zbir2;
 prosek2:=zbir2 / (n-i+1);
 close(f);
 assign(f,'puberkas.out'); rewrite(f);
 writeln(f,prosek2-prosek1:0:2);
 close(f);
end.
