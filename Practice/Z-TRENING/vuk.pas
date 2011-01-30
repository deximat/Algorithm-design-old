const smerx:array[1..4] of shortint =(1, 0, 0,-1);
      smery:array[1..4] of shortint =(0, 1,-1, 0);
var qx,qy,daljina:array[0..300000] of longint;
    matrica   :array[-1..502,-1..502] of char;
    poseta     :array[-1..502,-1..502]  of boolean;
    razdaljina:array[-1..502,-1..502] of longint;
    i,j,n,m,g,vi,vj,ji,jj,levi,desni,srednji,rezultat:longint;
procedure razdaljine;
var pocetak,kraj:longint;
begin
  pocetak:=1;
  kraj:=g;
  while pocetak <= kraj do
    begin
      for i:=1 to 4 do
        begin
          if (razdaljina[qx[pocetak]+smerx[i],qy[pocetak]+smery[i]] > daljina[pocetak]+1) and not(poseta[qx[pocetak]+smerx[i],qy[pocetak]+smery[i]])
            then begin
                   razdaljina[qx[pocetak]+smerx[i],qy[pocetak]+smery[i]]:=daljina[pocetak]+1;

                   kraj:=kraj+1;
                   qx[kraj]:=qx[pocetak]+smerx[i];
                   qy[kraj]:=qy[pocetak]+smery[i];
                   daljina[kraj]:=daljina[pocetak]+1;
                 end;
        end;
      pocetak:=pocetak+1;
    end;
end;
function bfsfind(ogranicenje:longint):boolean;
  var pocetak,kraj:longint;
  begin
    qx[1]:=vi;
    qy[1]:=vj;
    pocetak:=1;
    kraj:=1;
    for i:=1 to m do
      for j:=1 to n do
        poseta[i,j]:=false;
    poseta[vi,vj]:=true;
    if razdaljina[vi,vj]< ogranicenje
      then begin
             bfsfind:=false;
             exit;
           end;
    while pocetak<=kraj do
      begin
        for i:=1 to 4 do
          if (razdaljina[qx[pocetak]+smerx[i],qy[pocetak]+smery[i]]>=ogranicenje) and not(poseta[qx[pocetak]+smerx[i],qy[pocetak]+smery[i]])
            then begin
                   if (qx[pocetak]+smerx[i]=ji) and (qy[pocetak]+smery[i]=jj)
                     then begin
                            bfsfind:=true;
                            exit;
                          end;
                   poseta[qx[pocetak]+smerx[i],qy[pocetak]+smery[i]]:=true;
                   kraj:=kraj+1;
                   qx[kraj]:=qx[pocetak]+smerx[i];
                   qy[kraj]:=qy[pocetak]+smery[i];
                 end;
        pocetak:=pocetak+1;
      end;
    bfsfind:=false;
  end;
begin
  readln(n,m);
  for j:=1 to n do
    begin
      for i:=1 to m do
        begin
          read(matrica[i,j]);
          razdaljina[i,j]:=maxlongint;
          if matrica[i,j] = '+'
            then begin
                   g:=g+1;
                   qx[g]:=i;
                   qy[g]:=j;
                   daljina[g]:=0;
                   razdaljina[i,j]:=0;
                 end
            else if matrica[i,j] = 'V'
                   then begin
                          vi:=i;
                          vj:=j;
                        end
                   else if matrica[i,j]='J'
                          then begin
                                 ji:=i;
                                 jj:=j;
                               end;

        end;
      readln;
    end;
  for i:=-1 to m+1 do
   poseta[i,0]:=true;
    for i:=-1 to m+1 do
   poseta[i,m+1]:=true;
  for j:=-1 to n+1 do
    poseta[0,j]:=true;
  for j:=-1 to n+1 do
    poseta[n+1,j]:=true;
  razdaljine;
  levi:=1;
  desni:=1000;
  while levi<=desni do
    begin
      srednji:=(levi+desni) div 2;
      if bfsfind(srednji)
        then begin
               rezultat:=srednji;
               levi:=srednji+1;
             end
        else desni:=srednji-1;
    end;
  writeln(rezultat);
end.
