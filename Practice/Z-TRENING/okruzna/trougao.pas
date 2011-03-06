var i,j,k,l,a,f:longint;
    n,tren,max,povrsina:qword;
    niz:array[0..61] of record
                           x,y:longint;
                        end;
begin
  readln(n);
  for i:=1 to n do
    readln(niz[i].x,niz[i].y);
  for i:=1 to n do
    for j:=1 to n do
      for k:=1 to n do
        begin
          povrsina:=abs(niz[i].x*(niz[j].y-niz[k].y)+niz[j].x*(niz[k].y-niz[i].y)+niz[k].x*(niz[i].y-niz[j].y));
          tren:=0;
          a:=(niz[k].x-niz[i].x)*(niz[j].y-niz[i].y)-(niz[k].y-niz[i].y)*(niz[j].x-niz[i].y);
          if a<>0
            then for f:=1 to n do
                   if povrsina=abs(niz[f].x*(niz[j].y-niz[k].y)+niz[j].x*(niz[k].y-niz[f].y)+niz[k].x*(niz[f].y-niz[j].y))+
                               abs(niz[i].x*(niz[f].y-niz[k].y)+niz[f].x*(niz[k].y-niz[i].y)+niz[k].x*(niz[i].y-niz[f].y))+
                               abs(niz[i].x*(niz[j].y-niz[f].y)+niz[j].x*(niz[f].y-niz[i].y)+niz[f].x*(niz[i].y-niz[j].y))
                     then inc(tren);
          if tren > max
            then max:=tren;
        end;

  writeln(max);
end.
