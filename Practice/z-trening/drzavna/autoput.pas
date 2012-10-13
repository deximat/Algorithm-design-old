var gradovi,g:int64;
    max,maxif:int64;
    x,y,maxx,gradjani:int64;
    m:array[0..100001] of int64;
    i,b:longint;
begin
  readln(gradovi,g);

  maxx:=0;
  for i:=1 to gradovi do
    begin
      readln(x,y,gradjani);
      m[x]:=m[x]+gradjani;
      if x>maxx then maxx:=x;
    end;
  max:=0;
  if 2*g > maxx
    then for i:=1 to maxx do
            max:=m[i]+max

    else for i:=g+1 to (maxx-g+1) do
           begin
             maxif:=0;
             for b:=i-g to (i+g) do maxif:=maxif+m[b];
             if maxif>max then max:=maxif;
           end;
  writeln(max);
end.
