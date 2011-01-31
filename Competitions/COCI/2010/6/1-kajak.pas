var i,r,c,j:longint;
    s:string;
    niz,niz2:array[0..10] of longint;
    bul:array[0..50] of boolean;
begin
  readln(r,c);
  for i:=1 to r do
    begin
      readln(s);
      j:=c-1;
      while not(s[j] in ['1'..'9']) and (j>0) do
          j:=j-1;
      if j<>0
        then begin
               niz[ord(s[j])-48]:=c-j;
               bul[c-j]:=true;
             end;
    end;


  for j:=1 to 9 do
    for i:=1 to niz[j]-1 do
       if bul[i]
        then niz2[j]:=niz2[j]+1;
  for i:=1 to 9 do
    writeln(niz2[i]+1);
end.
