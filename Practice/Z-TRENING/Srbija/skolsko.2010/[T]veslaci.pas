var dani,ukupno,brzinav,brzina,n,brzinar,sekunde,minuti,sati,i:longint;
    smer:string[6];
    c:char;
begin
  readln(dani);
  for i:=1 to dani do
    begin
      readln(sati,minuti,sekunde,n,brzina,brzinar,brzinav,smer);
      sekunde:=sekunde+minuti*60+sati*3600;
      if smer[2] = 'f' then brzinav:=-brzinav;
      ukupno:=ukupno + sekunde *(brzina * n + brzinar + brzinav);
    end;
  if ukupno < 0
    then begin
           ukupno:=abs(ukupno);
           writeln('-(',ukupno div 1000,' km ', ukupno mod 1000 ,' m)');
         end
    else begin
           writeln('(',ukupno div 1000,' km ', ukupno mod 1000 ,' m)')
         end;
end.
