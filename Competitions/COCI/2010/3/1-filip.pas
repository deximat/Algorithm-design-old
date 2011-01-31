var a,b:array[1..3] of char;
    i:integer;
    f:char;
begin
  for i:=3 downto 1 do
    read(a[i]);
  read(f);
  for i:=3 downto 1 do
    read(b[i]);
  if a>b
   then writeln(a)
   else writeln(b);
end.