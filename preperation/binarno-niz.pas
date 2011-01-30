var i,n,k:longint;
    niz:array[1..100] of longint;
function bt(levi,desni,trazeni:longint):longint;
  var srednji:longint;
  begin
    bt:=0;
    while levi<=desni do
     begin
       srednji:=(levi + desni) div 2;
       if trazeni>niz[srednji]
         then levi:=srednji+1
         else if trazeni<niz[srednji]
              then desni:=srednji-1
              else begin
                     bt:=srednji;
                     exit;
                   end;
     end;
    bt:=-1;
  end;
begin
  readln(n,k);
  for i:=1 to n do
    readln(niz[i]);
  writeln(bt(1,n,k));
end.
