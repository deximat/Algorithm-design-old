{$m 256000000}
var i,j,k,n,m,l:longint;
    s,h:string;
begin
  h:='hello';
  readln(s);
  k:=1;
  for i:=1 to length(s) do
    if s[i] = 'h'
      then  for j:=i+1 to length(s) do
              if s[j]= 'e'
                then for k:=j+1 to length(s) do
                       if s[k]='l'
                         then for l:=k+1 to length(s) do
                                if s[l]='l'
                                  then for n:=l to length(s) do
                                         if s[n]='o'
                                           then begin
                                                  writeln('YES');
                                                  HALT;
                                                end;
  writeln('NO');
end.
