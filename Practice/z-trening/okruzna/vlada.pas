var stranke:array[1..20] of longint;
    pola,zbir,resenje,i,n,na,f,j:longint;
begin
  readln(n);
  na:=2;
  for i:=1 to n do
   begin
    readln(stranke[i]);
    pola:=pola+stranke[i];
   end;
  for i:=1 to n-1 do
    na:=2*na;
   pola:=pola div 2;
  for i:=1 to na-1 do
    begin
      zbir:=0;
      f:=i;
      for j:=1 to n do
        begin
          if f and 1 = 1
            then zbir:=zbir+stranke[j];
          f:=f shr 1;
        end;
      if zbir > pola
        then resenje:=resenje+1;

    end;
  writeln(resenje);
end.