var i,j,n,a:longint;
    slozen:array[1..1000105] of boolean;
    prosti:array[1..100000]  of longint;
    broj:int64;
begin
  for i:=2 to 500045 do
    if not slozen[i]
      then begin
             j:=i * 2;
             while j <= 1000000 do
               begin
                 slozen[j]:=true;
                 j:=j+i;
               end;
           end;
  j:=1;
  for i:=2 to 1000100 do
    if not slozen[i]
      then begin
             prosti[j]:=i;
             j:=j+1;
           end;
  readln(n);
  for i:=1 to n do
    begin
      readln(broj);
      j:=1;
      a:=1;
      if broj <= 1000000
        then begin
               if slozen[broj]
                 then writeln('DA')
                 else writeln('NE');
               continue;
             end
        else while prosti[j] <= sqrt(broj) do
               begin
                 if broj mod prosti[j] = 0
                   then begin
                          writeln('DA');
                          a:=1;
                          break;
                        end
                   else  a:=0;
                 j:=j+1;
               end;
      if a=0 then writeln('NE');
    end;

end.
