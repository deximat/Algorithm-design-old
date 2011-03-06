var i:longint;
    a,sum:double;
begin
  for i:=1 to 12 do
    begin
      readln(a);
      sum:=sum+a;
    end;
  writeln('$',sum / 12 :0:2);
end.