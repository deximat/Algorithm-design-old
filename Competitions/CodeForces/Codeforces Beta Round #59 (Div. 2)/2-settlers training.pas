
{$m 256000000}
{
1. Procitaj zadatak još jednom i obrati pažnju na donje granice podataka.
2. Procitaj zadatak još jednom i obrati pažnju na gornje granice podataka.
3. Procitaj zadatak još jednom i obrati pažnju na najekstremnije slucajeve
   koji se mogu desiti.
4. Napravi test primere sa donje granice. Za -1, 0, 1 i sl. To su i oni
   slucajevi, kada opšti algoritam ne radi ili ima anomalije.
5. Napravi test primer sa najvecim mogucim brojem podataka,
   i sa njihovim najvecim mogucim vrednostima.
6. Uvek deklariši niz, da ima 1-2% nego sto se traži. I to sa obe strane.
7. Ako je matrica u kojoj se radi "complete search" BSF/DSF, opši je sa još
   1-2 reda ili kolone.
}
var i,j,k,n,m,min,max,resenje,brojac,a:longint;
    niz:array[0..101] of longint;
begin
  readln(n,k);


  for i:=1 to n do
    begin
      read(a);
      inc(niz[a]);
    end;
  while niz[k]<>n do
    begin
      for i:=k-1 downto 1 do
        begin
          if niz[i]>0
            then begin
                   dec(niz[i]);
                   inc(niz[i+1]);
                 end;
        end;
      inc(brojac);
    end;
  writeln(brojac);
end.
