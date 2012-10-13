var i,n,sum,razlika1,razlika2:longint;
    niz:array[0..1000] of longint;
begin
  readln(n);
  for i:=1 to n do
    begin
      readln(niz[i]);
      sum:=sum+niz[i];
    end;
  sum:=sum div n;
  for i:=1 to n do
    if (niz[i]-sum)>0
      then razlika1:=razlika1+ niz[i]-sum
      else razlika2:=razlika2+niz[i]-sum;
  if razlika1>-razlika2
    then writeln(razlika1)

end.
