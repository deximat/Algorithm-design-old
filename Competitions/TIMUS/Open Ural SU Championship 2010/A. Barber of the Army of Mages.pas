type slog = record
             trenutak,i,strpljenje:longint;
           end;
     slog2 = record
              kolko:longint;
              niz2:array[0..3] of longint;
             end;
var niz:array[0..100002] of slog;
    obrijani:array[0..100002] of slog2;
    obrijanih:array[0..100002] of longint;
    j,i,n,k,brojac,zakazano,strpljenje,z:longint;
procedure qs(levi,desni:longint);
  var i,j,pivot2,pivot1:longint;
      pom:slog;
  begin
    i:=levi;
    j:=desni;
    pivot1:=niz[(levi + desni) div 2].trenutak;
    pivot2:=niz[(levi + desni) div 2].strpljenje;
    repeat
      while (niz[i].trenutak < pivot1) or ( (niz[i].trenutak=pivot1) and (niz[i].strpljenje<pivot2) ) do i:=i+1;
      while (pivot1 < niz[j].trenutak) or ( (niz[j].trenutak=pivot1) and (pivot2 < niz[j].strpljenje)) do j:=j-1;
      if i<=j
        then begin
               pom:=niz[i];
               niz[i]:=niz[j];
               niz[j]:=pom;
               i:=i+1;
               j:=j-1;
             end;
    until i>j;
    if levi < j then qs(levi,j);
    if i < desni then qs(i,desni);
  end;
procedure minisort(pocetak,kraj:longint);
var i,j:longint;
    pom:slog;
begin
   for i:=kraj-1 downto pocetak do
     for j:=pocetak to i do
       if (obrijani[niz[j].i].kolko > obrijani[niz[j+1].i].kolko) and
          (niz[j].trenutak = niz[j+1].trenutak ) and
          (niz[j].strpljenje = niz[j+1].strpljenje)
         then begin
                pom:=niz[j];
                niz[j]:=niz[j+1];
                niz[j+1]:=pom;
              end;
end;
begin
  readln(n,k);
  brojac:=0;
  for i:=1 to n do
    begin
      readln(zakazano,strpljenje);
      for j:=1 to strpljenje do
        begin
          niz[brojac+j].i:=i;
          niz[brojac+j].strpljenje:=strpljenje;
          niz[brojac+j].trenutak:=zakazano+(j-1);
        end;
      brojac:=brojac+strpljenje;
    end;
  QS(1,brojac);
  for i:=1 to brojac do
    begin
      if (obrijani[niz[i].i].kolko < 2) and (obrijanih[niz[i].trenutak]<k)
        then begin
               obrijani[niz[i].i].kolko:=obrijani[niz[i].i].kolko+1;
               obrijanih[niz[i].trenutak]:=obrijanih[niz[i].trenutak]+1;
               obrijani[niz[i].i].niz2[obrijani[niz[i].i].kolko]:=niz[i].trenutak;
               z:=i;
               while(niz[z].trenutak = niz[i].trenutak) do
                 if z+1<=brojac
                   then  z:=z+1
                   else break;
               minisort(i+1,z);

             end

    end;
  for i:=1 to n do
    if not(obrijani[i].kolko = 2)
      THEN begin
             writeln('No');
             exit;
           end;
  writeln('Yes');
  for i:=1 to n do
   writeln(obrijani[i].niz2[1],' ',obrijani[i].niz2[2]);

end.
