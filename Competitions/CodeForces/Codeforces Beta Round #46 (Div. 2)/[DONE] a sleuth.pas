var s:string;
    c:char;
    i:longint;
begin
  readln(s);
  for i:=length(s) downto 1 do
    if (s[i]<='z') and (s[i]>='A')
      then  begin
              c:=s[i];
              break;
            end;
  if UpCase(c) in ['A','E','I','O','U','Y']
    then writeln('YES')
    else writeln('NO');
end.