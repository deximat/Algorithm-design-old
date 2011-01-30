var i,f:longint;
begin
f:=2;
  for i:=3 to 8 do
    begin
      f:=f xor i;
    end;
    writeln(f);
end.