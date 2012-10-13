var niz1,niz:array[0..20000] of string[101];
    i,j,n,brojac:longint;
procedure qs(levi,desni:longint);
  var i,j:longint;
      pom,pivot:string;
  begin
    j:=desni;
    i:=levi;
    pivot:=niz[(levi + desni) div 2];
    repeat
      while niz[i]<pivot do i:=i+1;
      while niz[j]>pivot do j:=j-1;
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
function bt(trazeni:string):boolean;
  var srednji,levi,desni:longint;
  begin
    levi:=1;
    desni:=n;
    bt:=false;
    while levi<=desni do
      begin
        srednji:=(levi+desni) div 2;
        if trazeni > niz[srednji]
          then levi:=srednji+1
          else if niz[srednji] = trazeni
                 then begin
                        bt:=true;
                        exit;
                      end
                 else desni:=srednji-1;
      end;
  end;
begin
  readln(n);
  for i:=1 to n do
    readln(niz1[i]);
  for i:=1 to n do
    readln(niz[i]);
  qs(1,n);
  for i:=1 to n do
    if bt(niz1[i])
      then brojac:=brojac+1;

  writeln(brojac);

end.