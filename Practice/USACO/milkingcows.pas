{
PROG:milk2
ID:deximat1
LANG:PASCAL

}
var n,i,j,a,b,max,maxx,maxx2,j2,min:longint;
    niz:array[1..1000000] of boolean;
begin
  readln(n);
  min:=maxlongint;
  for i:=1 to n do
    begin
      readln(a,b);
      if b > max then max:=b;
      if a < min then min:=a;
      for j:=a to b-1 do
        niz[j]:=true;
    end;
  j:=0;
  for i:=min to max-1 do
    begin
      if niz[i]
        then begin
               j:=j+1;
               if j > maxx
                 then maxx:=j;
             end
        else j:=0;
      if not niz[i]
        then begin
               j2:=j2+1;
               if j2 > maxx2
                 then maxx2:=j2;
             end
        else j2:=0;
    end;
  writeln(maxx,' ',maxx2);
end.
