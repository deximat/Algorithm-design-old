uses math;
var niz:array[0..101] of double;
    i,poc,kraj,a,b,dubina,rdubina:longint;
    trazeni,max:double;
function razlika(tre:double):double;
begin
  razlika:=abs(trazeni-tre);
end;
begin
  readln(niz[1]);
  readln(trazeni);
  kraj:=1;
  max:=maxlongint;
  while true do
    begin
      for i:=1 to kraj do
        if razlika(niz[i]) < razlika(max)
          then begin
                 max:=niz[i];
                 rdubina:=kraj-1;
               end;
      if niz[kraj] < trazeni
        then break
        else begin
               kraj:=kraj+1;
               niz[1]:=niz[1]/3;
               for i:=2 to kraj do
                 niz[i]:=niz[i-1]*2;
             end;
    end;
  writeln(rdubina);
  writeln(max:0:5)
end.
