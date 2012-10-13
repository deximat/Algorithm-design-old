var b:array[1..1000] of char;
    n,brojac,i:longint;
begin
  readln(n);
  readln(b);
  for i:=1 to n do
    if b[i] in ['a','e','i','o','u']
      then brojac:=brojac+1;
  writeln(brojac);
end.
