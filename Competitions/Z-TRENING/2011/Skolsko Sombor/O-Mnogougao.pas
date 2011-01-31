var n,i,j:longint;
    tren,temp:int64;
    niz2,niz:array[0..6000] of int64;
procedure qs(levi,desni:longint);
  var i,j,pivot:longint;
      pom:int64;
  begin
    i:=levi;
    j:=desni;
    pivot:=niz[(levi + desni) div 2];
    repeat
      while (niz[i] < pivot)  do i:=i+1;
      while (pivot < niz[j]) do j:=j-1;
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
begin
  readln(n);
  for i:=1 to n do
    begin
      readln(niz[i]);
    end;
  qs(1,n);
  for i:=1 to n do
      niz2[i]:=niz[i]+niz2[i-1];

  for i:=1 to n do
    for j:=i to n do
      if (j-i+1 > tren ) and (niz2[j]-niz[j]-niz[i-1]>niz[j])
        then  tren:=j-i+1;
  writeln(tren);
end.
