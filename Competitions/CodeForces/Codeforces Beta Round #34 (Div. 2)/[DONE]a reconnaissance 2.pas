var a,b,min,i,n:longint;
    niz:array[0..10000] of longint;
begin
  readln(n);
  min:=maxlongint;
  read(niz[1]);
  for i:=2 to n do
   begin
     read(niz[i]);
     if abs(niz[i]-niz[i-1])<min
       then begin
              min:=abs(niz[i]-niz[i-1]);
              a:=i;
              b:=i-1;
            end;
   end;
   if abs(niz[1]-niz[n])< min
     then begin
            min:=abs(niz[1]-niz[n]);
            b:=n;
            a:=1
          end;
   writeln(b,' ',a);
end.