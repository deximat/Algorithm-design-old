var s:string;
    i:longint;
begin
  readln(s);
  i:=1;
  while i<=length(s) do
    if s[i] in ['a','e','i','o','u']
      then begin
             write(s[i]);
             inc(i,3);
           end
      else begin
             write(s[i]);
             inc(i);
           end;
  writeln;

end.