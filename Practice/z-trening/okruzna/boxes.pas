var a,b:array[1..3] of longint;
    i,j,k,pom:longint;
begin
  readln(a[1],a[2],a[3]);
  readln(b[1],b[2],b[3]);
  for i:=2 downto 1 do
    for j:=1 to i do
     if a[j]<a[j+1]
       then begin
              pom:=a[j];
              a[j]:=a[j+1];
              a[j+1]:=pom;
            end;
  for i:=2 downto 1 do
    for j:=1 to i do
     if b[j]<b[j+1]
       then begin
              pom:=b[j];
              b[j]:=b[j+1];
              b[j+1]:=pom;
            end;
  if ((a[1] < b[1]) and (a[2] < b[2]) and (a[3] < b[3])) or
     ((b[1] < a[1]) and (b[2] < a[2]) and (b[3] < a[3]))
    then writeln('DA')
    else writeln('NE');

end.