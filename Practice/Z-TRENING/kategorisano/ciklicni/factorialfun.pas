var i,j:longint;
    n,a,b:qword;
    s:string;
begin
  readln(n);
  a:=1;
  b:=1;
  for i:=2 to n do
    begin
      a:=a*i;
      b:=a mod 10000000000;
      if b <> 0
        then a:=b
        else a:=a div 10000000000;
    end;
  str(a,s);
  for j:=length(s) downto 1 do
        if s[j]<>'0'
          then begin
                 a:=ord(s[j])-ord('0');
                 break;
               end;
  writeln(a);
end.