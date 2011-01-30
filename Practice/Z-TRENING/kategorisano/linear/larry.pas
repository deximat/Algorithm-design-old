var a:real;
    q:real;
    i:integer;
begin
  for i:=1 to 12 do
   begin
   readln(a);
   q:=q+a;
   end;

  q:=q/12;
  writeln('$',q:3:2);
end.
