var a,b:string;
    i,j:longint;
begin
  readln(a);
  readln(b);
  j:=j+1;
  for i:=1 to length(a) do
   if UpCase(a[i])='X'
     then begin
            write(b[j]);
            inc(j);
          end
     else write('-');
  writeln();
end.