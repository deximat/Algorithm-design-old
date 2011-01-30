{
ID:deximat1
PROB:pprime
LANG:PASCAL
}
var prosti,ppal:array[0..1100000] of longint;
    slozeni:array[0..1000000] of boolean;
    i,j,a,b,k,y,u,o,p,paran:longint;
procedure sort(levi,desni:longint);
  var i,j,pivot:longint;
      pom:longint;
  begin
    i:=levi;
    j:=desni;
    pivot:=ppal[(levi + desni) div 2];
    repeat
      while (ppal[i] < pivot) do i:=i+1;
      while (pivot < ppal[j])  do j:=j-1;
      if i<=j
        then begin
               pom:=ppal[i];
               ppal[i]:=ppal[j];
               ppal[j]:=pom;
               i:=i+1;
               j:=j-1;
             end;
    until i>j;
    if levi < j then sort(levi,j);
    if i < desni then sort(i,desni);
  end;
function ifprime(broj:longint):boolean;
var i:longint;
begin
  i:=1;
  if broj<100000
     then begin
            ifprime:=not slozeni[broj];
            exit;
          end
     else while(prosti[i]<=sqrt(broj)) and (i<=j) do
            if (broj mod prosti[i]) = 0
              then begin
                     ifprime:= false;
                     exit;
                   end
              else i:=i+1;
  ifprime:=true;
end;
begin
  assign(input,'pprime.in');
  assign(output,'pprime.out');
  reset(input);
  rewrite(output);
  readln(a,b);
  slozeni[1]:=true;
  slozeni[0]:=true;
  for i:=2 to 50000 do
    if not slozeni[i]
      then begin
             j:=i*2;
             while(j<=100000) do
               begin
                 slozeni[j]:=true;
                 j:=j+i;
               end;
            end;
  j:=0;
  for i:=1 to 100000 do
    if not slozeni[i]
      then begin
             j:=j+1;
             prosti[j]:=i;
           end;
  //parnocifreni brojevi
  for y:=1 to 9 do
    for u:=0 to 9 do
      for o:=0 to 9 do
        for p:=0 to 9 do
           begin
             //8-cifara
             paran:=y*10000000 + u*1000000+ o*100000+ p*10000  + p*1000 + o*100+ u*10 + y;
             if (paran<=b) and (paran>=a)
               then if ifprime(paran)
                      then begin
                             k:=k+1;
                             ppal[k]:=paran;
                           end;
             //7-cifara
             paran:=y*1000000+ o*100000+ p*10000  + u*1000 + p*100+ o*10 + y;
             if (paran<=b) and (paran>=a)
               then if ifprime(paran)
                      then begin
                             k:=k+1;
                             ppal[k]:=paran;
                           end;
             //6-cifara
             paran:= y*100000+ o*10000+ p*1000  + p*100 + o*10+ y*1;
             if (paran<=b) and (paran>=a)
               then if ifprime(paran)
                      then begin
                             k:=k+1;
                             ppal[k]:=paran;
                           end;
             //5-cifara
             paran:=y*10000+  p*1000  + u*100 + p*10+ y;
             if (paran<=b) and (paran>=a)
               then if ifprime(paran)
                      then begin
                             k:=k+1;
                             ppal[k]:=paran;
                           end;
             //4 - cifre
             paran:= y*1000+ p*100  + p*10 +y*1;
             if (paran<=b) and (paran>=a)
               then if ifprime(paran)
                      then begin
                             k:=k+1;
                             ppal[k]:=paran;
                           end;
             //3 - cifre
             paran:=y*100  + u*10 +  y;
             if (paran<=b) and (paran>=a)
               then if ifprime(paran)
                      then begin
                             k:=k+1;
                             ppal[k]:=paran;
                           end;
             //2 - cifre
             paran:=y*10+ y;
             if (paran<=b) and (paran>=a)
               then if ifprime(paran)
                      then begin
                             k:=k+1;
                             ppal[k]:=paran;
                           end;
             //1 - cifra
             paran:=y;
             if (paran<=b) and (paran>=a)
               then if ifprime(paran)
                      then begin
                             k:=k+1;
                             ppal[k]:=paran;
                           end;
           end;

  sort(1,k);
  writeln(ppal[1]);
  for i:=2 to k do
    if ppal[i]<>ppal[i-1]
      then writeln(ppal[i]);
    close(output);
end.
