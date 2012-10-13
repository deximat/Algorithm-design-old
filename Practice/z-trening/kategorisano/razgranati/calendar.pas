var dana,resenje:longint;
    dan:string;
begin
  readln(dana);
  readln(dan);
  case dan[1] of
    'm':resenje:=0;
    't':if dan[2]='u'
         then resenje:=1
         else resenje:=3;
    'w':resenje:=2;
    'f':resenje:=4;
    's':if dan[2]='u'
         then resenje:=6
         else resenje:=5;
  end;
  if (dana+resenje) mod 7 = 0
    then writeln(resenje)
    else writeln(7-((dana+resenje) mod 7) + resenje);
end.