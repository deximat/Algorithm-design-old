const veznici:array[1..10] of string = ('i','pa','te','ni','niti','a','ali','nego','no','ili');
var s,rec:string;
    i:longint;
    jel:boolean;
begin
  readln(s);
  s:=s+' ';
  write(UpCase(s[1]));
  delete(s,1,pos(' ',s));
  while s<>'' do
    begin
      rec:=copy(s,1,pos(' ',s)-1);
      delete(s,1,pos(' ',s));
      jel:=true;
      for i:=1 to 10 do
        if rec = veznici[i]
          then jel:=false;
      if jel
        then write(UpCase(rec[1]));
    end;
  writeln;
end.