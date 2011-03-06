var mat:array[0..1001,0..1001] of char;
    a,b,brojac1,brojac2,brojac3,i,j:longint;
procedure proveri(i,j:longint);
var boja1,boja2,boja3:char;
begin
  //figura 1
  boja1:=mat[i-2,j-1];
  boja2:=mat[i-1,j];

  if //prva sara
     (boja2=mat[i,j+1]) and
     (boja2=mat[i+1,j]) and
     (boja2=mat[i,j-1]) and
     //druga sara
     (boja1=mat[i-2,j+1]) and
     (boja1=mat[i-1,j+2]) and
     (boja1=mat[i+1,j+2]) and
     (boja1=mat[i+2,j+1]) and
     (boja1=mat[i+2,j-1]) and
     (boja1=mat[i+1,j-2]) and
     (boja1=mat[i-1,j-2])
    then brojac1:=brojac1+1;
  boja2:=mat[i,j];
  boja1:=mat[i+2,j-1];
  if //prva sara
     (boja1=mat[i+2,j+1]) and
     (boja1=mat[i+1,j+2]) and
     (boja1=mat[i-1,j+2]) and
     (boja1=mat[i-2,j+1]) and
     (boja1=mat[i-2,j-1]) and
     (boja1=mat[i-1,j-2]) and
     (boja1=mat[i+1,j-2]) and
     //druga sara
     (boja2=mat[i+2,j]) and
     (boja2=mat[i-2,j]) and
     (boja2=mat[i,j+2]) and
     (boja2=mat[i,j-2])
    then brojac2:=brojac2+1;
  boja2:=mat[i+2,j];
  if (boja2=mat[i+1,j+1]) and
     (boja2=mat[i-1,j+1]) and
     (boja2=mat[i-1,j-1]) and
     (boja2=mat[i+1,j-1]) and
     (boja2=mat[i-2,j])   and
     (boja2=mat[i,j+2])   and
     (boja2=mat[i,j-2])
    then brojac3:=brojac3+1;
end;
begin
  readln(a,b);
  for i:=1 to a do
    begin
      for j:=1 to b do
        read(mat[i,j]);
      readln;
    end;
  for i:=3 to a-2 do
    for j:=3 to b-2 do
      proveri(i,j);
  writeln(brojac1);
  writeln(brojac2);
  writeln(brojac3);
end.
