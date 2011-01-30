var i,n,resenje:longint;
    niz:array[0..30001] of longint;
procedure qs(levi,desni:longint);
  var pom,pivot,i,j:longint;
  begin
    pivot:=niz[(levi+desni) div 2];
    j:=desni;
    i:=levi;
    repeat
      while niz[i] < pivot do i:=i+1;
      while pivot < niz[j] do j:=j-1;
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
    if i<desni then qs(i,desni);
  end;
begin
  readln(n);
  for i:=1 to n do
    readln(niz[i]);

  qs(1,n);

  for i:=n downto 3 do
    resenje:=(resenje+((((niz[i] mod 10007)+10007) mod 10007)*(((i-1)*(i-2) div 2) mod 10007))) mod 10007;

  writeln(resenje mod 10007);
end.