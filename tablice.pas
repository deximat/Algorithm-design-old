uses crt,wincrt;
var resenje,a,b,c,rezultat:longint;
begin
  clrscr;
  Writeln('Dobrodosli u tablicu mnozenja, sabiranja i oduzimanja, da izadjete ukucajte 1000 i pritisnite enter');
  Writeln('Ja sam glupav, Copyright 2010');
  writeln();
  while resenje<1000 do
    begin
      a:=random(9);
      b:=random(9);
      c:=1+random(3);
      textcolor(white);
      case c of
        1:begin
            rezultat:=a+b;
            writeln('Koliko je ',a,' + ',b,'?');
          end;
        2:begin
            rezultat:=a-b;
            writeln('Koliko je ',a,' - ',b,'?');
          end;
        3:begin
            rezultat:=a*b;
            writeln('Koliko je ',a,' * ',b,' ?');
          end;
        4:begin
            rezultat:=0;
            writeln('Koliko je ',a,' / ',b,'?');
          end;
      end;
      readln(resenje);
      if resenje=rezultat
        then begin
               textcolor(green);
               writeln('Tacno!');
             end
        else begin
               textcolor(red);
               writeln('NE! Rezultat je: ',rezultat);
               sound(9000);
               delay(100);
               nosound;
             end;
    end;
end.