var absx,absy:real;
    ax,ay,bx,by,cx,cy:longint;
begin
  readln(Ax,Ay);
  readln(Bx,By);
  readln(Cx,Cy);
  absx:=(ax+bx)/2;
  absy:=(ay+by)/2;
  writeln((cx+absx*2)/3:0:5,' ',(cy+absy*2)/3:0:5);
end.
