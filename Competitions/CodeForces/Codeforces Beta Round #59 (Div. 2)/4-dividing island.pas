uses math;
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
const smerx:array[1..4] of shortint = (0, 1, 0,-1);
      smery:array[1..4] of shortint = (1, 0,-1, 0);
var i,j,k,n,m,resenje,brojac,a,b,c,d,x,y,poc,pov,minimal:longint;
    matrica:array[0..101,0..101] of char;
    povrsina:longint;
    direkt:array[0..10000] of char;
    cc:char;
    niz:array[0..101] of longint;
    s:array[0..101] of char;
procedure dfs(pocx,pocy:integer);
var f:longint;
begin
    povrsina:=povrsina+1;
    if povrsina>pov
             then exit;
    matrica[pocx,pocy]:=direkt[povrsina];
    for f:=1 to 4 do
      if matrica[pocx+smerx[f],pocy+smery[f]]='+'
        then dfs(pocx+smerx[f],pocy+smery[f]);
end;
procedure bfs(pocx,pocy:integer);
var pocetak,kraj,f:longint;
    qx,qy:array[1..1000000] of integer;
begin
  pocetak:=1;
  kraj:=1;
  qx[1]:=pocx;
  qy[1]:=pocy;
  while pocetak<=kraj do
   begin
     for f:=1 to 4 do
      if matrica[qx[pocetak]+smerx[f],qy[pocetak]+smery[f]]='+'
        then begin
               povrsina:=povrsina+1;
               if povrsina>pov
                 then exit;
               kraj:=kraj+1;
               matrica[qx[pocetak]+smerx[f],qy[pocetak]+smery[f]]:=direkt[povrsina];
               qx[kraj]:=qx[pocetak]+smerx[f];
               qy[kraj]:=qy[pocetak]+smery[f];
             end;
     pocetak:=pocetak+1;
   end;
end;
begin
  povrsina:=0;
  fillchar(matrica,sizeof(matrica),'.');
  readln(a,b,c,d,n);
  for i:=1 to a do
    for j:=1 to b do
      matrica[i,j]:='+';
  for  i:=a+1 to a+c do
    for j:=1 to d do
      matrica[i,j]:='+';
  x:=a+c;
  y:=max(b,d);
  pov:=a*b+c*d;

  poc:=1;
  cc:=chr(ord('a')-1);
  for i:=1 to n do
    begin
      read(niz[i]);
      inc(cc);
      s[i]:=cc;
      for j:=poc to poc+niz[i]-1 do
        direkt[j]:=cc;
      poc:=poc+niz[i];
    end;
  minimal:=min(min(a,b),min(c,d));

  if minimal = a
    then dfs(1,b)
    else if minimal = b
           then dfs(1,1)
           else if minimal = c
                  then dfs(a+c,d)
                  else if minimal = d
                       then dfs(a+c,1);
  if povrsina>=pov
   then begin
          writeln('YES');
          for j:=1 to y do
          begin
            for i:=1 to x do
              write(matrica[i,j]);
            writeln;
          end;
        end
   else writeln('NO');
end.
