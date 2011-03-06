
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

var i,j,k,n,m,min,max,resenje,brojac,sum,a,p,na:longint;
    paran,neparan:array[0..101] of longint;
procedure quicksort(levi,desni:longint);
var i,j,pivot,pom:longint;
  begin
    pivot:=neparan[(levi + desni) div 2];
    i:=levi;
    j:=desni;
    repeat
      while neparan[i] > pivot do i:=i+1;
      while neparan[j] < pivot do j:=j-1;
      if i <= j
        then begin
               pom:=neparan[i];
               neparan[i]:=neparan[j];
               neparan[j]:=pom;
               i:=i+1;
               j:=j-1;
             end;
    until i > j;
    if levi < j then quicksort(levi,j);
    if i < desni then quicksort(i,desni);
  end;
begin
  readln(na);


  for i:=1 to na do
    begin
      read(a);
      sum:=sum+a;
      if a mod 2 = 0
        then begin
                p:=p+1;
                paran[p]:=a;
             end
        else begin
                n:=n+1;
                neparan[n]:=a;
             end;
    end;
  quicksort(1,n);
  while (sum and 1 = 0) and (n>0) do
    begin
      sum:=sum-neparan[n];
      n:=n-1;
    end;
  if sum mod 2 = 0
    then writeln(0)
    else writeln(sum);
end.
