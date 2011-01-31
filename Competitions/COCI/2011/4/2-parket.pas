var c,s,apb,i:longint;
begin
  readln(c,s);
  apb:=(c+4) div 2;
  for i:=1 to apb do
    if s+c = i*(apb-i)
      then begin
             writeln(apb-i, ' ', i);
             halt;
           end;
end.