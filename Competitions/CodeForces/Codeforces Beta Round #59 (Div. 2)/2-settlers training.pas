
{$m 256000000}
{
1. Procitaj zadatak jo� jednom i obrati pa�nju na donje granice podataka.
2. Procitaj zadatak jo� jednom i obrati pa�nju na gornje granice podataka.
3. Procitaj zadatak jo� jednom i obrati pa�nju na najekstremnije slucajeve
   koji se mogu desiti.
4. Napravi test primere sa donje granice. Za -1, 0, 1 i sl. To su i oni
   slucajevi, kada op�ti algoritam ne radi ili ima anomalije.
5. Napravi test primer sa najvecim mogucim brojem podataka,
   i sa njihovim najvecim mogucim vrednostima.
6. Uvek deklari�i niz, da ima 1-2% nego sto se tra�i. I to sa obe strane.
7. Ako je matrica u kojoj se radi "complete search" BSF/DSF, op�i je sa jo�
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
