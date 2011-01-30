type bla = record
             broj,prvi,poslednji:longint;
           end;
var niz:array[0..100010,1..5] of boolean;
    max:array[0..5] of bla;
    i,ocena,n,a,b,first,brojac,resenje:longint;
begin
  readln(n);
  for i:=1 to n do
    begin
      readln(a,b);
      niz[i,a]:=true;
      niz[i,b]:=true;
    end;
 for ocena:=1 to 5 do
  for i:=1 to n+1 do
     if niz[i,ocena]
       then if first<>0
              then brojac:=brojac+1
              else begin
                     first:=i;
                     brojac:=brojac+1
                   end
       else if brojac>max[ocena].broj
              then begin
                     max[ocena].broj:=brojac;
                     max[ocena].prvi:=first;
                     max[ocena].poslednji:=i-1;
                     brojac:=0;
                     first:=0;
                   end
              else begin
                     brojac:=0;
                     first:=0;
                   end;
  for i:=5 downto 1 do
    if max[i].broj>=resenje
      then begin
             resenje:=max[i].broj;
             a:=i;
           end;
  writeln(resenje,' ',a);

end.
