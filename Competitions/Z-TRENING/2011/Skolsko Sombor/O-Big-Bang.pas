var s,h,m:qword;
    ss,mm,hh:string;
begin
  readln(s);
  h:=(s div 3600) mod 12;
  if (h=0) and (s>=3600) and (s mod 3600 = 0)
    then h:=12;
  s:=s mod 3600;
  m:=(s div 60) mod 60;
  s:=s mod 60;
  str(h,hh);
  if length(hh)=1
    then hh:='0'+hh;
  str(m,mm);
  if length(mm)=1
    then mm:='0'+mm;
  str(s,ss);
  if length(ss)=1
    then ss:='0'+ss;
  writeln(hh,':',mm,':',ss);
end.
