var i,z,c,b,trres,resenje:longint;
    niz:array[0..4] of record
                        c,b,z:longint;
                       end;
begin
  for i:=1 to 3 do
    readln(niz[i].z,niz[i].c,niz[i].b);
  resenje:=maxlongint;
  for z:=1 to 3 do
    for c:=1 to 3 do
      for b:=1 to 3 do
        if (z<>c) and (z<>b) and (c<>b)
          then begin
                 trres:=niz[c].z+niz[b].z+niz[z].c+niz[b].c+niz[z].b+niz[c].b;
                 if trres<resenje
                   then resenje:=trres;
               end;
  writeln(resenje);
end.