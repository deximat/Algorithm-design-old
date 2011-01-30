var niz:array[1..1001] of double;
    n,i,j,b:longint;
    sum,razlika,razlika2,rezultat:double;
begin
  readln(n);
  while n<> 0 do
    begin
      sum:=0;
      rezultat:=0;
      razlika:=0;
      razlika2:=0;
      for i:=1 to n do
        begin
          readln(niz[i]);
          sum:=sum+niz[i];
        end;
      sum:=sum / n;
      //writeln(sum);
      for i:=1 to n do
          if (niz[i]-sum)<0
            then razlika:=razlika+trunc((niz[i]-sum)*100)/100
            else razlika2:=razlika2+trunc((niz[i]-sum)*100)/100;

      if razlika2<-razlika
        then rezultat:=-razlika
        else rezultat:=razlika2;
      writeln('$',rezultat:0:2);
      readln(n);

    end;
end.
