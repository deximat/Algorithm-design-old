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
    niz:array[0..27] of ansistring;
    dati:array[0..3] of ansistring;
    s:ansistring;
    jel:boolean;
begin
  for i:=1 to 3 do
    begin
      readln(dati[i]);
      dati[i]:=upcase(dati[i]);
      dati[i]:=delchars(dati[i],'-');
      dati[i]:=delchars(dati[i],';');
      dati[i]:=delchars(dati[i],'_');
    end;
  for i:=1 to 3 do
    for j:=1 to 3 do
      for k:=1 to 3 do
        begin
          m:=m+1;
          niz[m]:=dati[i]+dati[j]+dati[k];
        end;

  readln(n);
  for i:=1 to n do
    begin
      readln(s);
      s:=upcase(s);
      s:=delchars(s,'-');
      s:=delchars(s,';');
       s:=delchars(s,'_');
       jel:=false;
      for j:=1 to m do
        if s = niz[j]
          then begin
                 writeln('ACC');
                 jel:=true;
                 break;
               end;
      if not jel
        then writeln('WA');

    end;

end.
