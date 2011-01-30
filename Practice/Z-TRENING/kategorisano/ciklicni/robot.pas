var n,x,y,i,orijentacija:longint;
    c:char;
begin
  readln(n,x,y);
  for i:=1 to n do
    begin
      read(c);
      case c of
        'D': orijentacija:=(orijentacija+90) mod 360;
        'L': begin
               orijentacija:=(orijentacija-90) mod 360;
               if orijentacija<0
                 then orijentacija:=360+orijentacija ;
             end;
        'N': case orijentacija of
               0: x:=x+1;
               90: y:=y-1;
               180: x:=x-1;
               270: y:=y+1;
             end;
      end;
    end;
  writeln(x,' ',y);

end.
