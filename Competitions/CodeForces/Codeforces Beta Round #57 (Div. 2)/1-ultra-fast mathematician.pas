uses math;
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
var i,j,k,n,m,min,max,resenje,brojac:longint;
    s,s1:string;
begin
  readln(s);
  readln(s1);

  for i:=1 to length(s) do
    if s[i]<>s1[i]
     then write(1)
     else write(0);
  writeln;

end.
