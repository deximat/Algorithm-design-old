var a,b,c,d,resenje:longint;
    max:real;
begin
  readln(a,b);
  readln(c,d);
  resenje:=0;
  max:=a/c+b/d+1e-7;
  if max < (c/d + a/b)
    then begin
           max:=(c/d + a/b)+1e-7;
           resenje:=1;
         end;
  if max < (b/a + d/c)
    then begin
           max:=(b/a + d/c)+1e-7;
           resenje:=3;
         end;
  if max<(d/b+c/a)
    then begin
           max:=(b/a + d/c)+1e-7;
           resenje:=2;
         end;
  writeln(resenje);
end.