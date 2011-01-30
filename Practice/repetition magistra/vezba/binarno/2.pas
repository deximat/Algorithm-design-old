var i,k,n:longint;
    niz:array[1..100] of longint;
function bt(levi,desni,trazeni:longint):longint;
  var srednji:longint;
  begin
    bt:=0;
    while levi<=desni do
      begin
        srednji:=(levi + desni) shr 1;
        if trazeni<niz[srednji]
          then desni:=srednji-1
          else if trazeni>niz[srednji]
                 then levi:=srednji + 1
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