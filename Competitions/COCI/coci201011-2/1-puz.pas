var a,b,v:longint;
begin
  readln(a,b,v);
  v:=v-a;
  if v mod (a-b) = 0
    then writeln(v div (a-b)+1)
    else writeln(v div (a-b)+2);
end.
