{$m 256000000}
var i,j,k,n,m:longint;
    tren:boolean;
    niz:array[0..10000000] of longint;
begin
  readln(n);
  for i:=n downto 1 do
    if n mod i = 0
      then begin
             tren:=true;
             for j:=k downto 1 do
                if niz[j] mod i = 0
                  then tren:=true
                  else begin
                        tren:=false;
                        break;
                       end;
             if tren
               then begin
                      k:=k+1;
                      niz[k]:=i;
                    end;
           end;
  for i:=1 to k-1 do
    write(niz[i],' ');
  writeln(niz[k]);
end.
