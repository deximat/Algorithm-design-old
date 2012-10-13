var s:string;
    i,n,dario,marko:longint;
begin
  readln(n);
  for i:=1 to n do
    readln(s);
  delete(s,pos(':',s),1);
  val(s,marko);
  for i:=1 to n do
    readln(s);
  delete(s,pos(':',s),1);
  val(s,dario);
  if dario<marko
    then writeln('Dario')
    else writeln('Marko');
end.
