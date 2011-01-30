{$m 256000000}
var a,b,i,min,resenje:longint;
    s:string;
begin
  readln(a,b);
  str(a,s);
  for i:=1 to length(s) do
    if min < ord(s[i])-48
      then min:=ord(s[i])-48;
  str(b,s);
  for i:=1 to length(s) do
    if min < ord(s[i])-48
      then min:=ord(s[i])-48;
  min:=min+1;
  a:=a+b;
  b:=min;
  min:=1;
  while (a mod min) <> a do
    begin
      resenje:=resenje+1;
      min:=min*b;
    end;
 writeln(resenje);
end.