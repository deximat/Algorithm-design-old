uses strutils;
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
  s:ansistring;
  s1:ansistring;
  trenBaza,uBazu,c:longint;
begin
  read(trenBaza);
  readln(s);
  val(s,uBazu,c);
  readln(s1);
  if c = 0
    then begin
           s1:=Dec2Numb(Numb2Dec(s1,trenBaza),1001,uBazu);
           for i:=1 to length(s1) do
             if s1[i]<>'0'
               then break;
           for i:=i to length(s1) do
             write(s1[i]);
           writeln;
         end
    else writeln(IntToRoman(Numb2Dec(s1,trenBaza)))
end.
