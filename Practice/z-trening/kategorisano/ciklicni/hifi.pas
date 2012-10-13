var i,j,n,k,z,sum:longint;
begin
  readln(n);
  for i:=1 to n do
    begin
      read(k);
      sum:=0;
      for j:=1 to k do
        begin
          read(z);
          sum:=sum+z;
        end;
      readln;
      writeln(sum-(k-1));
    end;
end.