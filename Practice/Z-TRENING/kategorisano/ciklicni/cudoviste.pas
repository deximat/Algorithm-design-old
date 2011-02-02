var niz:array[-2..5] of longint;
    mat:array[0..51,0..51] of char;
    i,x,y,a,b,j,r,s:longint;
function probaj:longint;
var tren:longint;
begin
tren:=0;
for a:=0 to 1 do
  for b:=0 to 1 do
    case mat[i+a,j+b] of
       'X': tren:=tren+1;
       '#': begin
              probaj:=-1;
              exit;
            end;
    end;
  probaj:=tren;
end;
begin
  readln(r,s);
  for i:=1 to r do
    begin
      for j:=1 to s do
        read(mat[i,j]);
      readln;
    end;
  for i:=1 to r-1 do
    for j:=1 to s-1 do
      begin
        inc(niz[probaj]);
      end;
  for i:=0 to 4 do
    writeln(niz[i]);

end.