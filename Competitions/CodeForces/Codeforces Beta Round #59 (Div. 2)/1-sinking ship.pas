
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
var i,j,k,n,min,max,resenje,brojac,wc,mm,rr:longint;
     clas,ime,s,kap:string;
    wcc,m,rat:array[0..100] of string[20];
begin
  readln(n);
  for i:=1 to n do
    begin
      readln(s);
      ime:=copy(s,1,pos(' ',s)-1);
      clas:=copy(s,pos(' ',s)+1,length(s)-pos(' ',s));
      if clas='captain'
        then kap:=ime;
      if (clas='woman') or (clas='child')
        then begin
               inc(wc);
               wcc[wc]:=ime;
             end;
      if clas='man'
        then begin
                inc(mm);
                m[mm]:=ime;
             end;
      if clas='rat'
        then begin
               inc(rr);
               rat[rr]:=ime;
             end;
    end;
  for i:=1 to  rr do
  writeln(rat[i]);
  for i:=1 to wc do
  writeln(wcc[i]);
  for i:=1 to mm do
    writeln(m[i]);
  writeln(kap);
end.
