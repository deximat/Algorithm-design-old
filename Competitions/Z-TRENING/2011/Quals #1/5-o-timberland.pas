var n,q,p,k,i,j,x,m,y:longint;
    matrica,matrica2:array[-5..105,-5..105] of longint;
    fak:array[0..250] of longint;
    c,b:char;
function jelmoze:boolean;
begin
  k:=0;
  for i:=1 to round(sqrt(p)) do
    if (p mod i) = 0
      then begin
             k:=k+1;
             fak[k]:=i;
             k:=k+1;
             fak[k]:=p div i;
           end;
  for x:=1 to n do
    for y:=1 to n do
     begin
       matrica2[x,y]:=matrica[x,y]+matrica2[x-1,y]+matrica2[x,y-1]-matrica2[x-1,y-1];
       i:=1;
       while i<k do
         begin
           if ((fak[i]<=y) and (fak[i+1]<=x)) and
              (matrica2[x,y]-matrica2[x,y-fak[i]]-matrica2[x-fak[i+1],y]+matrica2[x-fak[i+1],y-fak[i]]=0)
           then begin
                  jelmoze:=true;
                  exit;
                end;
           if ((fak[i]<=x) and (fak[i+1]<=y)) and
              (matrica2[x,y]-matrica2[x,y-fak[i+1]]-matrica2[x-fak[i],y]+matrica2[x-fak[i],y-fak[i+1]]=0)
           then begin
                  jelmoze:=true;
                  exit;
                end;
           i:=i+2;
         end;
     end;
  jelmoze:=false;
end;
begin
 readln(n,q);//n(2..100) , q(1..50000)
 for m:=1 to q do
   begin
     read(c);
     read(b);
     while b<>' ' do
       read(b);
     case c of
       'g':begin
             readln(x,y);
             matrica[x,y]:=1;
           end;
       'c':begin
             readln(x,y);
             matrica[x,y]:=0;
           end;
       'v':begin
              readln(p); //p(1..n*n)
              if jelmoze
                then writeln('yes')
                else writeln('no');
            end;
     end;
   end;
end.