var dan, mesec, resenje:longint;
begin
  readln(dan,mesec);
  case mesec of
    2: resenje:=31;
    3: resenje:=59;
    4: resenje:=90;
    5: resenje:=120;
    6: resenje:=151;
    7: resenje:=181;
    8: resenje:=212;
    9: resenje:=243;
   10: resenje:=273;
   11: resenje:=304;
   12: resenje:=334;
  end;
  resenje:=resenje+dan;
  case resenje mod 7 of
    0:writeln('Wednesday');
    1:writeln('Thursday');
    2:writeln('Friday');
    3:writeln('Saturday');
    4:writeln('Sunday');
    5:writeln('Monday');
    6:writeln('Tuesday');
  end;
end.
