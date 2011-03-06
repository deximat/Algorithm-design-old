var mat:array[-501..501,-501..501] of boolean;
    n,i,j,x,y,brojac,a:longint;
    niz:array[0..101] of record
                           x,y,yraz,xraz:longint;
                         end;
   jel:boolean;
begin
  //assign(input,'hehe.txt'); reset(input);
  readln(n);
  for i:=1 to n do
    readln(niz[i].x,niz[i].y);
  i:=3;
  for i:=1 to n-1 do
    begin
      niz[i].xraz:=niz[i+1].x-niz[i].x;
      niz[i].yraz:=niz[i+1].y-niz[i].y;
    end;
  a:=(niz[i].x-niz[1].x)*(niz[2].y-niz[1].y) - (niz[2].x-niz[1].x)*(niz[i].y-niz[1].y);

  while a=0 do
     begin
       a:=(niz[i].x-niz[1].x)*(niz[2].y-niz[1].y) - (niz[2].x-niz[1].x)*(niz[i].y-niz[1].y);
       i:=i+1;
     end;

  if a>0
  then
      for x:=-500 to 500 do
        for y:=-500 to 500 do
          begin
            jel:=true;
            for i:=1 to n-1 do
               if (x-niz[i].x)*(niz[i].yraz) < (niz[i].xraz)*(y-niz[i].y)
                 then begin
                        jel:=false;
                        break;
                      end;
               if (x-niz[n].x)*(niz[1].y-niz[n].y) < (niz[1].x-niz[n].x)*(y-niz[n].y)
                  then jel:=false;
            mat[x,y]:=jel;
          end
  else
      for x:=-500 to 500 do
        for y:=-500 to 500 do
          begin
            jel:=true;
            for i:=1 to n-1 do
               if (x-niz[i].x)*(niz[i].yraz) > (niz[i].xraz)*(y-niz[i].y)
                 then begin
                        jel:=false;
                        break;
                      end;
               if (x-niz[n].x)*(niz[1].y-niz[n].y) > (niz[1].x-niz[n].x)*(y-niz[n].y)
                  then jel:=false;
            mat[x,y]:=jel;
          end;
  for x:=-500 to 500 do
    for y:=-500 to 500 do
      if mat[x,y] and mat[x+1,y+1] and mat[x,y+1] and mat[x+1,y]
        then brojac:=brojac+1;

  writeln(brojac);
end.
