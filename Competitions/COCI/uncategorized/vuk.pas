const smerx:array[1..4] of shortint =(1, 0, 0,-1);
      smery:array[1..4] of shortint =(0, 1,-1, 0);
var qx,qy,daljina:array[0..300000] of longint;
    matrica   :array[0..501,0..501] of char;
    razdaljina:array[0..501,0..501] of longint;
    i,j,n,m,g :longint;
procedure razdaljine;
var pocetak,kraj:longint;
begin
  pocetak:=1;
  kraj:=1;
  while pocetak <= kraj do
    begin
      for i:=1 to 4 do
        begin
          if razdaljina[qx[pocetak]+smerx[i],qy[pocetak]+smery[i]] > daljina[pocetak]
            then begin

                   kraj:=kraj+1;

                   qy[]
                 end;
        end;
    end;
end.
begin
  readln(n,m);
  for j:=1 to n do
    begin
      for i:=1 to m do
        read(matrica[i,j]);
      if matrica[i,j] = '+'
        then begin
               g:=g+1;
               qx[g]:=i;
               qy[g]:=j;
             end;
      readln;
    end;
  razdaljine;
end.