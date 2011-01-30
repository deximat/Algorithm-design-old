var matrica:array[0..101,0..101]  of int64;
    zbir:array[1..4] of longint;
    x,c:char;
    max, value:int64;
    i,j,k,f,n,ii,jj,a:longint;
procedure querry;
var i1,j1:longint;
begin
  max:=0;
  for i1:=1 to 4 do
    zbir[i1]:=0;
  for i1:=1 to n do
    for j1:=i1 to n do
      zbir[1]:=zbir[1]+matrica[i1,j1];
  for i1:=1 to n do
    for j1:=n downto n-i1+1 do
      zbir[2]:=zbir[2]+matrica[i1,j1];
  for i1:=1 to n do
    for j1:=1 to i1 do
      zbir[3]:=zbir[3]+matrica[i1,j1];
  for i1:=1 to n do
    for j1:=1 to n-i1+1 do
      zbir[4]:=zbir[4]+matrica[i1,j1];
  for i1:=1 to 4 do
    if zbir[i1] > max
      then max:=zbir[i1];
  for i1:=1 to 4 do
    if max = zbir[i1]
      then write(i1);
  writeln;
  readln;
end;

begin
  readln(n,f);
  for i:=1 to f do
    begin
      read(c);
      read(x);
      while not (x<=' ' ) do
        read(x);
      if c='Q'
        then querry
        else readln(ii,jj,value);
      case c of
        'S':matrica[ii,jj]:=matrica[ii,jj] - value;
        'A':matrica[ii,jj]:=matrica[ii,jj] + value;
        'M':matrica[ii,jj]:=matrica[ii,jj] * value;
        'P':matrica[ii,jj]:=value;
       end;
    end;
end.
