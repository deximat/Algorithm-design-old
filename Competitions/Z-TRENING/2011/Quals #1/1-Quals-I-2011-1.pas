var a,b,c,p:qword;
begin
  readln(a,b,c);
  p:=b*c;
  if p > a
    then begin
           p:=p-a;
           writeln('-',p)
         end
    else writeln(a-p);
end.