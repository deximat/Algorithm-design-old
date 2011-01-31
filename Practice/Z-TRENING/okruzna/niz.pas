{$inline on}
var n,m,k,i,j:longint;
    a:qword;

function zbir(a:int64):longint;
var s:string[20];
    i,z:longint;
begin
  str(a,s);
  z:=0;
  for i:=1 to length(s) do
    z:=z+ord(s[i])-ord('0');
  zbir:=z;
end;

function generisi(cifara:longint):qword;
var niz:array[0..22] of longint;
    resenje,temp:qword;
    i:longint;
begin
   niz[cifara]:=m-1;
   niz[1]:=1;
   niz[0]:=0;
   for i:=2 to cifara-1  do
     niz[i]:=0;
   for i:=cifara downto 1 do
     begin
       temp:=niz[i];
       if niz[i]>9
         then begin
                niz[i]:=9;
                niz[i-1]:=niz[i-1]+ temp - 9;
              end;
     end;
   resenje:=0;
   for i:=1 to cifara do
     resenje:=resenje*10+niz[i];
   generisi:=resenje;

end;

function napravi(m:longint):qword;
var s:string;
    min,aa,temp,resenje,raz,z:qword;
    niz:array[0..21] of qword;
    niz2:array[0..21] of boolean;
    i,j:longint;
begin

  str(a,s);
  niz[0]:=0;
  aa:=zbir(a);
  for i:=1 to length(s) do
    niz[i]:=ord(s[i])-ord('0');

  //izracunavam minimalnu duzinu broja u kojoj zbir moze biti m
  if m mod 9 <> 0
    then min:=m div 9 +1
    else min:=m div 9;
  for i:=1 to length(s) do
    niz2[i]:=false;
  //ako je minimalna duzina veca od duzine predhodnog, resenje je najmanji min-ocifreni broj sa zbirom cifara m
  if min > length(s)
    then napravi:=generisi(min)
    else if m>=aa //ako cetvorostruki broj ima veci zbir cifara od jednostrukog, dodajemo mu razliku zbirova
           then begin
                  niz[length(s)]:=niz[length(s)]+m-aa;

                  if m-aa = 0
                    then for i:=length(s) downto 1 do
                           if niz[i]<>0
                              then begin
                                     niz[i]:=niz[i]-1;
                                     niz2[i-1]:=true;
                                     niz[i-1]:=niz[i-1]+1;
                                     break;
                                   end;
                  //sredjivanje

                  for i:=length(s) downto 1 do
                    begin
                      temp:=niz[i];
                      if niz[i]>9
                        then begin
                               niz2[i-1]:=true;
                               niz[i]:=9;
                               niz[i-1]:=niz[i-1]+ temp - 9;
                             end;
                    end;
                   i:=1;
                   while not(niz2[i]) and (i<=length(s)) do
                     i:=i+1;
                   //sredjivanje
                   for j:=i+1 to length(s) do
                     niz[j]:=0;
                   z:=0;
                   if i+1<=length(s)
                     then begin
                            for j:=1 to i+1 do
                              z:=z+niz[j];
                            niz[length(s)]:=m-z;
                          end;
                 for i:=length(s) downto 1 do
                    begin
                      temp:=niz[i];
                      if niz[i]>9
                        then begin
                               niz[i]:=9;
                               niz[i-1]:=niz[i-1]+ temp - 9;
                             end;
                    end;
                  if niz[0]<>0 //ako je uslov ispunjen, broj ima vise od length(s) cifara
                    then napravi:=generisi(length(s)+1)
                    else begin
                           resenje:=0;
                           for i:=1 to length(s) do
                              resenje:=resenje*10+niz[i];
                           napravi:=resenje
                         end;
                end
           else begin
                   raz:=aa-m;
                   i:=length(s);
                   while (raz <> 0) and (i>-1) do
                     begin
                       if niz[i]>=raz+1
                          then begin
                                 niz[i]:=niz[i]-raz-1;
                                 niz[i-1]:=niz[i-1]+1;
                                 raz:=0;
                                 niz2[i-1]:=true;
                               end
                          else begin
                                 raz:=raz-niz[i]+1;
                                 niz[i]:=0;
                                 niz[i-1]:=niz[i-1]+1;
                                 niz2[i-1]:=true;
                               end;
                       i:=i-1;
                     end;

                  for i:=length(s) downto 1 do
                    begin
                      temp:=niz[i];
                      if niz[i]>9
                        then begin
                               niz2[i-1]:=true;
                               niz[i]:=9;
                               niz[i-1]:=niz[i-1]+ temp - 9;
                             end;
                    end;
                  i:=1;
                   while not(niz2[i]) and (i<=length(s)) do
                     i:=i+1;
                   //sredjivanje
                   for j:=i+1 to length(s) do
                     niz[j]:=0;
                   z:=0;
                 if i+1<=length(s)
                     then begin
                            for j:=1 to i+1 do
                              z:=z+niz[j];
                            niz[length(s)]:=m-z;
                          end;
                 for i:=length(s) downto 1 do
                    begin
                      temp:=niz[i];
                      if niz[i]>9
                        then begin
                               niz[i]:=9;
                               niz[i-1]:=niz[i-1]+ temp - 9;
                             end;
                    end;

                 if niz[0]<>0 //ako je uslov ispunjen, broj ima vise od length(s) cifara
                    then napravi:=generisi(length(s)+1)
                    else begin
                           resenje:=0;
                           for i:=1 to length(s) do
                              resenje:=resenje*10+niz[i];
                           napravi:=resenje
                         end;
                end;
end;

begin
  readln(a,n);
  //assign(output,'dd.out'); rewrite(output);
  for i:=1 to n-1 do
    begin

      m:=zbir(4*a);
      a:=napravi(m) ;
      //writeln(a);
    end;

  writeln(a);
end.
