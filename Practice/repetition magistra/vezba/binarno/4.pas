var n,i,trazeni:longint;
    niz:array[1..10] of longint;

function bt(levi,desni,trazeni:longint):longint;
var srednji:longint;
begin
  bt:=0;

  while levi <= desni do
    begin
      srednji:=(levi + desni) div 2;
      if trazeni < niz[srednji]
        then desni:=srednji-1
        else if trazeni=niz[srednji]
               then begin
                      bt:=srednji;
                      exit;
                    end
               else levi:=srednji+1;
    end;
end;
begin
  readln(n,trazeni);
  for i:=1 to n do
    readln(niz[i]);
  writeln(bt(1,n,trazeni));
end.
