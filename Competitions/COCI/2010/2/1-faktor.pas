var i,f,c,rezultat:longint;
begin
read(c);
read(f);
rezultat:=maxlongint;
for i:=c*f downto c*(f-1) do
  begin
    if not((i div c) = 0)
    then if (rezultat>i) and (trunc(i / c)=(f-1)) then rezultat:=i
    else if (rezultat>i)   and ((i div c)=f) then rezultat:=i
  end;
writeln(rezultat+1);
end.