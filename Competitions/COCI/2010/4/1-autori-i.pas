var c:char;
begin
  while not eoln do
    begin
      read(c);
      if (c > 'A') and (c < '[')
        then write(c);
    end;
  writeln;
end.