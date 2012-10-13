var niz:array[1..1001] of longint;
    n,i,j,b:longint;
    sum,razlika,razlika2,rezultat:longint;
    tren:real;
begin
  readln(n);
  while n<> 0 do
    begin
      sum:=0;
      rezultat:=0;
      for i:=1 to n do
        begin
          readln(tren);
          niz[i]:=round(tren*100);
          sum:=sum+niz[i];
        end;
      b:=1;
      if (sum mod n) = 0
        then b:=0;

      sum:=b+(sum div n);

      //writeln(sum);
      for i:=1 to n do
        begin
          razlika:=niz[i]-sum;
          if razlika<0 then continue;
          for j:=1 to n do
            begin
              if not(razlika>0)  then break;
              razlika2:=sum-niz[j];
              if razlika2<=0 then continue;
              if  (razlika2<razlika)
                then begin
                       rezultat:=rezultat+razlika2;
                       niz[j]:=niz[j]+razlika2;
                       niz[i]:=niz[i]-razlika2;
                       razlika:=razlika-razlika2;
                     end
                else begin
                       rezultat:=rezultat+razlika;
                       niz[j]:=niz[j]+razlika;
                       niz[i]:=niz[i]-razlika;
                       razlika:=0;
                     end;
            end;
        end;
      writeln('$',rezultat);
      readln(n);

    end;
end.
