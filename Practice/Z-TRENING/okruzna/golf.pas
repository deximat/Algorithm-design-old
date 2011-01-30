var i,j:longint;
    a,b,c,d,e,f,minx,miny:real;
begin
   readln(a,b);
   readln(c,d);
   readln(j);
   for i:=1 to j do
    begin
     readln(e,f);
     if ((e-a)*(e-a)+(f-b)*(f-b))*4 < ((e-c)*(e-c)+(f-d)*(f-d))
       then begin
              writeln(i);
              halt;
            end;
    end;
   writeln('Nadrljao je!');
end.
