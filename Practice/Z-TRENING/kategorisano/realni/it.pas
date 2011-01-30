const epsi=1e-6;
var n,brojac,i:longint;
    m,b,y,x:real;
begin
  readln(m,b);
  readln(n);
  for i:=1 to n do
    begin
      readln(x,y);
      if ( x < -epsi) //or (x<0)
        then continue;
      if ((m*x+b-y) < epsi) and ((m*x+b-y) > -epsi)
        then brojac:=brojac+1;
    end;

  writeln(brojac);
end.
