var a,n,m,k,i,cst:longint;
function zbir(a:longint):longint;
var s:string[20];
    i,z:longint;
begin
  str(a,s);
  z:=0;
  for i:=1 to length(s) do
    z:=z+ord(s[i])-cst;
  zbir:=z;
end;
begin
  cst := ord('0');
  readln(a,n);
  assign(output,'d.out'); rewrite(output);
  k:=0;
  m:=zbir(4*a);
  i:=a+1;
  k:=1;
  while (k<>n)  do
    begin

      if zbir(i)=m
        then begin
               writeln(i);
               k:=k+1;
               m:=zbir(4*i);
               i:=i+1;
             end
        else i:=i+1;
    end;
  writeln(i-1);
end.
