var i,n,k:longint;
    niz:array[1..1000] of longint;
function bt(levi,desni,trazeni:longint):longint;
  var srednji:longint;
  begin
    while levi<=desni do
      begin
        srednji:=(levi + desni) div 2;
        if trazeni<niz[srednji]
          then desni:=srednji-1
          else if trazeni>niz[srednji]
                 then levi:=srednji+1
                 else begin
                        bt:=srednji;
                        exit;
                      end;
      end;
  end;
begin
  readln(n,k);
  for i:=1 to n do
    readln(niz[i]);
  writeln(bt(1,n,k));
end.