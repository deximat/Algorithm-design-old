var a:longint;
begin
  readln(a);
  while a<>0 do
    begin

      writeln((sqr(a)/Pi)/2:0:2);
      readln(a);
    end;

end.
