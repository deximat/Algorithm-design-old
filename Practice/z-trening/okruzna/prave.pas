uses math;
var niz:array[0..11000] of record
                            x,y:longint;
                          end;
    n,i,j,t,max,tren,a,b,c,t1,k:longint;
begin
  {readln(t1);
  for k:=1 to t1 do  }
  begin
      max:=0;
      //readln;
      readln(n);
      for i:=1 to n do
        readln(niz[i].x,niz[i].y);

      for i:=1 to n-1 do
        for j:=i+1 to n do
          begin
            tren:=0;
            a:= niz[j].y-niz[i].y;
            b:= -(niz[j].x-niz[i].x);
            c:= niz[i].y*niz[j].x-niz[i].x*niz[j].y;
            for t:=1 to n do
              if a*niz[t].x+b*niz[t].y +c = 0
                then begin
                       tren:=tren+1;
                       if (tren>max)
                         then max:=tren;
                     end;
          end;
      if n=1
        then writeln(1)
        else writeln(max);

  end;
end.
