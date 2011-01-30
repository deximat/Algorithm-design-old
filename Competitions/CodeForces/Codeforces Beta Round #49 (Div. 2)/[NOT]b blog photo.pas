{$inline on}
var i,j,k,n,m,h,w,wp,hp:longint;
begin
  readln(h,w);
  hp:=1;
  wp:=1;
  while hp*2<=h do
    hp:=hp*2;
  while wp*2<=w do
    wp:=wp*2;
  if ((hp=h) or (wp=p)) and (0.8 - 1e-5 < h/w) and (1.25 + 1e-5 > h/w)
    then begin
           writeln(h,' ',w);
           halt;
         end;
  if (0.8 - 1e-5 < h/w)
    then begin
           h:=hp
           if (0.8 - 1e-5 < h/w) and (1.25 + 1e-5 > h/w)
             then writeln(h,' ',w)
             else if (0.8 - 1e-5 < h/w)
                   then begin
                    while (0.8 - 1e-5 < h/w) and (1.25 + 1e-5 > h/w)
         end
end.
