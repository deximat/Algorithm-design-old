var nis:array[0..200] of string;
    niz:array[0..200] of longint;
    i,j,resenje,n,k,svi:longint;
    s:string;
begin
  readln(n);
  k:=0;
  for i:=1 to n do
    begin
      j:=0;

      readln(s);
      while(j<=k)do
        begin
          if nis[j]=s
            then break;
          j:=j+1;
        end;
      if j>k
        then begin
               k:=j;
               nis[k]:=s;
               niz[k]:=niz[k]+1;
               svi:=svi+1;
             end
        else begin
               if niz[j]>(svi-niz[j])
                 then resenje:=resenje+1;
               niz[j]:=niz[j]+1;
               svi:=svi+1;


             end;
    end;
  writeln(resenje);
end.