var n,m,i,j,k,ucenik:longint;
    niz:array[0..101] of real;
    pom,zbir,ocena:real;
begin
  readln(n,m,k);
  for i:=1 to m do
    begin
    for j:=1 to n do
      begin
        read(ucenik,ocena);
        if niz[ucenik]+1e-7 < ocena
          then niz[ucenik]:=ocena;
      end;
      readln;
    end;
  for i:=99 downto 1 do
    for j:=1 to i do
      if niz[j] < niz[j+1]
        then begin
               pom:=niz[j];
               niz[j]:=niz[j+1];
               niz[j+1]:=pom;
             end;
  for i:=1 to k do
    zbir:=zbir+niz[i];
  writeln(zbir:0:1);
end.