{$inline on}
var i,j,k,n,m:longint;
begin
  readln(n);
  i:=1;
  j:=n;
  while i<j do
    begin
      write(i,' ',j);
      i:=i+1;
      j:=j-1;
      if odd(n) or (i<j)
        then write(' ');
    end;
  if odd(n)
    then writeln(i)
    else writeln;
end.
