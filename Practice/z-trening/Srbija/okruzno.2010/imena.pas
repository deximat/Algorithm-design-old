var f:text;
    niz:array[1..1000,'A'..'Z'] of boolean;
    niz2:array[1..1000] of longint;
    max,broj,i,j,n:longint;
    c:char;
begin
  assign(f,'imena.in'); reset(f);
  readln(f,n);
  for i:=1 to n do
   begin
    while not eoln(f) do
      begin
        read(f,c);
        niz[i,upcase(c)]:=true;
      end;
    readln(f);
   end;
  close(f);
  for i:=1 to n do
    for c:='A' to 'Z' do
      if niz[i,c]
        then niz2[i]:=niz2[i]+1;
  for i:=1 to n do
    if niz2[i]>max
      then max:=niz2[i];
  for i:=1 to n do
    if niz2[i]=max
      then broj:=broj+1;
  writeln(max,' ',broj);

end.
