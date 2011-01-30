const smerx:array[1..4] of shortint = ( 0, 0, 1,-1);
      smery:array[1..4] of shortint = (-1, 1, 0, 0);
var n,m,x,y,b,i,j,pocetak,kraj,resenje:longint;
    matrica:array[-1..200,-1..200] of byte;
    qx,qy,k:array[1..60000] of integer;
    niz:array[1..200] of longint;
begin
  readln(n,m,x,y);
  fillchar(matrica,sizeof(matrica),1);
  for i:=1 to n do
   begin
    for j:=1 to m do
      read(matrica[i,j]);
    readln;
   end;
  readln(b);
  for i:=1 to b do
    read(niz[i]);
  pocetak:=1;
  kraj:=1;
  qx[1]:=x;
  qy[1]:=y;
  while kraj >= pocetak do
   begin
    for i:=1 to 4 do
      if (matrica[qx[pocetak]+smerx[i],qy[pocetak]+smery[i]] = 0)
        then if (k[pocetak]<niz[pocetak])
             then
                 begin
                   kraj:=kraj+1;
                   qx[kraj]:=qx[pocetak]+smerx[i];
                   qy[kraj]:=qy[pocetak]+smery[i];
                   k[kraj]:=k[pocetak]+1;
                 end
             else resenje:=resenje+1;
    pocetak:=pocetak+1;
   end;
   writeln(resenje);

end.
