var e,f,c,imasoda,prazne,popio:longint;
begin
  readln(e,f,c);
  imasoda:=(e+f) div c;
  prazne:=(e+f) mod c;
  popio:=0;
  while (imasoda > 0) do
    begin

      popio:=popio+imasoda;
      prazne:=prazne+imasoda;
      imasoda:=prazne div c;
      prazne:=prazne mod c;
    end;
  writeln(popio+imasoda);
end.