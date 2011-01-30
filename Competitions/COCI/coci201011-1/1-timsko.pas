var n,m,k,resenje,i:longint;
begin
  readln(n,m,k);
  resenje:=0;
  for i:=1 to n div 2 do
      if ((n+m - (i*2+i)) >= k) and (i<=m)
        then resenje:=i
        else begin
               writeln(resenje);
               exit;
             end;
  writeln(resenje);
end.
