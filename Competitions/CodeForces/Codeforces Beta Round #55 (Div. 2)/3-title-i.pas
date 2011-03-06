
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
var i,j,k,n,m,min,max,resenje,brojac:longint;
    s:String;
    c:CHAR;
    niz:array['a'..'z'] of boolean;
    niz2:array[0..101]  of char;
begin
  readln(n);
  readln(s);
  for i:=1 to length(s) do
      if s[i]<>'?'
        then niz[s[i]]:=true;
  for i:=1 to length(s) div 2 do
    if (s[i]<>'?') and (s[length(s)-i+1]<>'?') and (s[length(s)-i+1]<>s[i])
      then begin
             writeln('IMPOSSIBLE');
             halt;
           end;
  for c:=chr(96+n) downto 'a' do
    if not niz[c]
      then begin
             k:=k+1;
             niz2[k]:=c;

           end;
  for i:=1 to length(s) div 2  do
    if s[i]='?'
      then s[i]:=s[length(s)-i+1]
      else s[length(s)-i+1]:=s[i];

  for i:=1 to length(s) div 2 do
    if s[i]='?'
      then begin
             if k>0
               then begin
                      s[i]:=niz2[k];
                      s[length(s)-i+1]:=niz2[k];
                      k:=k-1;
                    end
               else begin
                      s[i]:='a';
                      s[length(s)-i+1]:='a';
                    end;
           end;
  if length(s) mod 2 = 1
    then if s[length(s) div 2 + 1] = '?'
           then if k>0
                  then s[length(s) div 2 + 1]:=niz2[k]
                  else s[length(s) div 2 + 1]:='a';
  for i:=1 to length(s) do
      if s[i]<>'?'
        then niz[s[i]]:=true;
  for c:='a' to  chr(96+n) do
    if not niz[c]
      then begin
             writeln('IMPOSSIBLE');
             HALT;
           end;
  writeln(s);
end.
