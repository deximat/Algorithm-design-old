var niz:array[0..32000] of boolean;
    i,a:longint;
begin
  for i:=1 to 7 do
    begin
      read(a);
      niz[a]:=true;
    end;
  readln;
  for i:=1 to 7 do
    begin
      read(a);
      if not niz[a]
       then begin
             writeln('Lost');
             halt;
            end;
    end;

  writeln('Won');

end.