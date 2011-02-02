var n,k,i,brojac:longint;
function zbir(a:int64):longint;
var s:string[20];
    i,z:longint;
begin
  str(a,s);
  z:=0;
  for i:=1 to length(s) do
    z:=z+ord(s[i])-ord('0');
  zbir:=z;
end;
begin
  readln(n,k);
  for i:=0 to n do
    if zbir(i)=k
      then brojac:=brojac+1;
  writeln(brojac);
end.