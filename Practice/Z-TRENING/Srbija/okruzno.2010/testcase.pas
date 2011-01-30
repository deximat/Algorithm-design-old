var i,j,k,l:longint;
    t:text;
begin
  assign(t,'pniz.in'); rewrite(t);
  writeln(t,12);
  {write(t,1,' ');}
  for i:=12 downto 1 do
    write(t,i,' ');

  writeln(t);
  close(t);
end.
