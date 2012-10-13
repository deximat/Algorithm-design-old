{
PROG:transform
ID:deximat1
LANG:PASCAL
}
var n,i,j:longint;
    matrica,matrica2:array[0..11,0..11] of char;
   // f:text;
procedure r90;
begin
  for i:=1 to n do
    for j:=1 to n do
      if not(matrica[n-j+1,i] = matrica2[i,j])
        then exit;
  writeln({f,}1);
 // close(f);
  halt;
end;
procedure r180;
begin
  for i:=1 to n do
    for j:=1 to n do
      if not(matrica[n-i+1,n-j+1] = matrica2[i,j])
        then exit;
  writeln({f,}2);
 // close(f);
  halt;
end;
procedure r270;
begin
  for i:=1 to n do
    for j:=1 to n do
      if not(matrica[j,n-i+1] = matrica2[i,j])
        then exit;
  writeln({f,}3);
 // close(f);
  halt;
end;
procedure rr;
begin
  for i:=1 to n do
    for j:=1 to n do
      if not(matrica2[i,n-j+1] = matrica[i,j])
        then exit;
  writeln({f,}4);
 // close(f);
  halt;
end;
function rr1:boolean;
begin
  rr1:=false;
  for i:=1 to n do
    for j:=1 to n do
      if not(matrica2[i,j] = matrica[(n-j+1),n-i+1])
        then exit;
  rr1:=true;
end;
function rr2:boolean;
begin
  rr2:=false;
  for i:=1 to n do
    for j:=1 to n do
      if not(matrica2[i,j] = matrica[(n-i+1),n-(n-j+1)+1])
        then exit;
  rr2:=true;
end;
function rr3:boolean;
begin
  rr3:=false;
  for i:=1 to n do
    for j:=1 to n do
      if not(matrica2[i,j] = matrica[j,n-(n-i+1)+1])
        then exit;
  rr3:=true;
end;
procedure r5;
begin
  if rr1 or rr2 or rr3
    then begin
           writeln({f,}5);
          // close(f);
           halt;
         end;
end;
begin
 // assign(f,'transform.in'); reset(f);
  readln({f,}n);
  for i:=1 to n do
    begin
      for j:=1 to n do
        read({f,}matrica[i,j]);
      readln{(f)};
    end;
  for i:=1 to n do
    begin
      for j:=1 to n do
        read({f,}matrica2[i,j]);
      readln{(f)};
    end;
 // close(f);
 // assign(f,'transform.out'); rewrite(f);
  r90;
  r180;
  r270;
  rr;
  r5;
  for i:=1 to n do
    for j:=1 to n do
      if not(matrica[i,j] = matrica2[i,j])
        then begin
               writeln({f,}7);
              // close(f);
               halt;
             end;
  writeln({f,}6);
 // close(f)
end.
