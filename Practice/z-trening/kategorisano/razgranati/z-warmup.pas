var a,b:longint;
begin
  readln(a,b);
  if (b=0)
    then begin
           writeln(1);
           halt;
         end;
  case a mod 10 of
    0,1,5,6:writeln(a mod 10);
    2:case b mod 4 of
         1:writeln(2);
         2:writeln(4);
         3:writeln(8);
         0:writeln(6);
       end;
    3: case b mod 4 of
         1:writeln(3);
         2:writeln(9);
         3:writeln(7);
         0:writeln(1);
       end;
    4:if b mod 2 = 0
        then writeln(6)
        else writeln(4);
    7:case b mod 4 of
         1:writeln(7);
         2:writeln(9);
         3:writeln(3);
         0:writeln(1);
       end;
    8:case b mod 4 of
        1:writeln(8);
        2:writeln(4);
        3:writeln(2);
        0:writeln(6);
      end;
    9:if b mod 2 = 0
        then writeln(1)
        else writeln(9);
  end;
end.