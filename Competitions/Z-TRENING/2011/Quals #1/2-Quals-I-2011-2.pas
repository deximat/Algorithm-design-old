var sum:array[0..4000] of longint;
    direktan:array[0..10000000] of longint;
	i,poc,kraj,n,max,maxs,pos:longint;
begin
  readln(n);
  for i:=1 to n do
    begin
      read(sum[i]);
      sum[i]:=sum[i]+sum[i-1];
    end;

  for poc:=1 to n do
    for kraj:=n downto poc do
	  begin
            pos:=sum[kraj]-sum[poc-1];
            direktan[pos]:=direktan[pos]+1;
          end;
   for i:=9000001 downto 0 do
     if direktan[i]>max
	   then begin
	          max:=direktan[i];
		  maxs:=i;
	        end;
   writeln(maxs,' ',max);
end.
