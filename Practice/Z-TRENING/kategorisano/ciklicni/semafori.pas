type slog = record
               t,g,r:longint;
            end;
var niz:array[0..1001] of slog;
    i,n,l,j,time:longint;
begin
  readln(n,l);
  for i:=1 to n do
    begin
      read(j);
      readln(niz[j].r,niz[j].g);
      niz[j].t:=1;
    end;
  for i:=1 to l do
    if niz[i].t=1
      then begin
             time:=time+1;
             if time mod (niz[i].g+niz[i].r) > niz[i].r
               then
               else time:=time+niz[i].r - (time mod (niz[i].g+niz[i].r))
           end
      else time:=time+1;
  writeln(time);
end.
