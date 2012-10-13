var i,j,n,max,broj:longint;
    rec:string;
    niz:array[0..1001,'@'..']'] of boolean;
    niz2:array[0..1001] of longint;
    c:char;
    f:text;
begin
  assign(f,'imena.in'); reset(f);
  readln(f,n);
  for i:=1 to n do
    begin
      readln(f,rec);
      rec:=upcase(rec);
      for j:=1 to length(rec) do
        niz[i,rec[j]]:=true;
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
  assign(f,'imena.out'); rewrite(f);
  writeln(f,max,' ',broj);
  close(f);
end.
