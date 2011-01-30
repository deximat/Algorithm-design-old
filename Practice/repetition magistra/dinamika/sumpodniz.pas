var sum:array[0..10000] of boolean;
    pred:array[0..10000] of longint;
    a:array[0..100000] of longint;
    podniz:array[0..10000] of longint;
    i,k,n,z,s,trsuma:longint;
begin
  readln(n,s);
  for i:=1 to n do
    readln(a[i]);
  for i:=1 to n do
    begin
      sum[i]:=false;
      pred[i]:=-1;
    end;
  sum[0]:=true;
  for k:=1 to n do
    for z:=s downto 0 do
      if sum[z] and (z + a[k] < s)
        then  begin
                sum[s+a[k]]:=true;
                pred[s+a[k]]:=k;
              end;
  if sum[S]
    then  begin
            trsuma:=S;
            i:=0;
            while pred[trsuma] <> -1 do
              begin
                i:=i+1;
                podniz[i]:=pred[trsuma];
                trsuma:=trsuma - a[pred[trsuma]];
              end;
          end
    else begin
           writeln(-1);
           halt;
         end;
  for k:=1 to i do
    write(podniz[k], ' ');
  writeln;
end.