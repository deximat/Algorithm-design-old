var n,b:int64;
    i:longint;
    s:STRING;
begin
  readln(n);
  b:=1;
  for i:=2 to n do
    if (b*i) mod 1000000000 = 0
      then b:=(b*i) div  1000000000
      else b:=(b*i) mod 1000000000;
  str(b,s);
  for i:=length(S)  downto 1 do
    if s[i]<>'0'
      then BEGIN
             writeln(s[i]);
             halt;
           END;
end.
