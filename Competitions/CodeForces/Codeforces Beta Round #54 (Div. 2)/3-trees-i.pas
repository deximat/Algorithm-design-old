{$m 256000000}
var i,j,k,n,m,pola,brojac,brojac2,poc,poc1,max,kraj,tip,promena,max2:longint;
    niz:array[0..100005] of longint;
begin
  readln(n);
  if n=1
    then begin
            writeln(0);
            halt;
         end;

  for i:=1 to n do
    read(niz[i]);
  {if n=2
    then if niz[1]=niz[2]
           then writeln(0)
           else writeln(1); }
  if n mod 2 <> 0
    then pola:=n div 2+1
    else pola:=n div 2;
  for i:=1 to pola-1 do
    if niz[i]=niz[i+1]-1
      then begin
             if brojac=0
               then  begin
                       brojac:=brojac+1;
                       poc1:=i;
                     end
               else  brojac:=brojac+1;
             if niz[i]=niz[n-i+1]
               then brojac:=brojac+1;
           end
      else begin
             if niz[n-i+1]=niz[i]
               then brojac:=brojac+1;
             if (brojac+1>max)
               then begin
                      if poc1<>0
                        then poc:=poc1
                        else poc:=1;
                      max:=brojac+1;
                      kraj:=i;
                      tip:=1;
                    end;
             brojac:=0;
           end;
  if (niz[n-i+1]=niz[i]) and (brojac<>0)
               then brojac:=brojac+1;
  if (brojac<>0) and (poc1<>0)  and (brojac+1>max)
    then begin
           max:=brojac+1;
           poc:=poc1;
           kraj:=i+1;
           tip:=1;
           brojac:=0;
         end;
  for i:=pola to n-1 do
    if niz[i]=niz[i+1]+1
      then begin
           if brojac=0
             then  begin
                     brojac:=brojac+1;
                     poc1:=i;
                   end
             else brojac:=brojac+1;
             if niz[i]=niz[n-i+1]
               then brojac:=brojac+1;
           end
      else begin
             if niz[n-i+1]=niz[i]
               then brojac:=brojac+1;
             if (brojac+1>max)
               then begin
                      if poc1<>0
                        then poc:=poc1
                        else poc:=1;
                      max:=brojac+1;
                      kraj:=i;
                      tip:=2;
                    end;
             brojac:=0;
           end;
   if (niz[n-i+1]=niz[i]) and (brojac<>0)
               then brojac:=brojac+1;
   if (brojac<>0)  and (poc1<>0) and (max<brojac+1)
    then begin

           max:=brojac+1;
           poc:=poc1;
           kraj:=i+1;
           tip:=1;
           brojac:=0;
         end;

   if (n mod 2 <> 0) and (pola>=poc) and (pola<=kraj)
     then writeln(n-max+1)
     else writeln(n-max);
end.
