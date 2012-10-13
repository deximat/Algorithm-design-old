var niz:array[0..1001] of longint;
    mgcd,i,j,n,temp:longint;
function nzd(a,b:longint):longint;
begin
  if a=0
    then begin
           nzd:=b;
           exit;
         end;
  while b<>0 do
    if a>b
      then a:=a-b
      else b:=b-a;
  nzd:=a;

end;
procedure quicksort(levi,desni:longint);
var i,j,pivot,pom:longint;
  begin
    pivot:=niz[(levi + desni) div 2];
    i:=levi;
    j:=desni;
    repeat
      while niz[i] < pivot do i:=i+1;
      while niz[j] > pivot do j:=j-1;
      if i <= j
        then begin
               pom:=niz[i];
               niz[i]:=niz[j];
               niz[j]:=pom;
               i:=i+1;
               j:=j-1;
             end;
    until i > j;
    if levi < j then quicksort(levi,j);
    if i < desni then quicksort(i,desni);
  end;
function nzd2(a,b:longint):longint;
var t:longint;
begin
   while b<>0 do
   begin
      t:=b;
      b:=a mod b;
      a:=t;
   end;
   nzd2:=a;
end;
begin
  readln(n);
  for i:=1 to n do
    readln(niz[i]);
  quicksort(1,n);
  for i:=1 to n-1 do
    if niz[i]>mgcd
    then for j:=i+1 to n do
          if niz[j]>mgcd
          then begin
                 temp:=nzd2(niz[i],niz[j]);
                 if temp>mgcd
                   then mgcd:=temp;
               end
          else break
    else break;
  writeln(mgcd);
end.
