var n:longint;
    r,l:double;
begin
  readln(n,r);
  l:=2*3.14159265358979324/n;
  writeln(n*2*r*sin(l/2):0:5);
  writeln(0.5*n*sqr(r)*(sin(l)):0:5);
end.