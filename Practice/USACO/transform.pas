{
PROG:transform
ID:deximat1
LANG:PASCAL
}
var n,i,j:longint;
    matrica,matrica2:array[0..11,0..11] of char;
    f:text;
procedure r90();
begin
  for i:=1 to n do
    for j:=1 to n do
      if not(matrica[n-j+1,i] = matrica2[i,j])
        then exit;
  writeln(f,1);
  close(f);
  halt;
end;
procedure r180();
begin
  for i:=1 to n do
    for j:=1 to n do
      if not(matrica[n-i+1,n-j+1] = matrica2[i,j])
        then exit;
  writeln(f,2);
  close(f);
  halt;
end;
procedure r270();
begin
  for i:=1 to n do
    for j:=1 to n do
      if not(matrica[j,n-i+1] = matrica2[i,j])
        then exit;
  writeln(f,3);
  close(f);
  halt;
end;
procedure rr();
begin
  for i:=1 to n do
    for j:=1 to n do
      if not(matrica[n-i+1,j] = matrica2[i,j])
        then exit;
  writeln(f,4);
  close(f);
  halt;
end;
procedure r5();
begin
  for i:=1 to n do
    for j:=1 to n do
      if not((matrica2[n-i+1,j] = matrica[n-j+1,j]) or
         (matrica2[n-i+1,j] = matrica[n-i+1,n-j+1]) or
         (matrica2[n-i+1,j] = matrica[j,n-1+1]))
        then exit;
  writeln(f,5);
  close(f);
  halt;
end;
begin
  assign(f,'transform.in'); reset(f);
  readln(f,n);
  for i:=1 to n do
    begin
      for j:=1 to n do
        read(f,matrica[i,j]);
      readln(f);
    end;
  for i:=1 to n do
    begin
      for j:=1 to n do
        read(f,matrica2[i,j]);
      readln(f);
    end;
  close(f);
  assign(f,'transform.out'); rewrite(f);
  r270;
  r180;
  r90;
  rr;
  r5;
  for i:=1 to n do
    for j:=1 to n do
      if not(matrica[i,j] = matrica2[i,j])
        then begin
               writeln(f,7);
               close(f);
               halt;
             end;
  writeln(f,6);
  close(f)
end.
