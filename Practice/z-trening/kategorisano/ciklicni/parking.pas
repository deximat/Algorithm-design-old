var a,b,c,i,tren,resenje,aa,bb:longint;
    niz:array[0..1000] of longint;
begin
  readln(a,b,c);
  for i:=1 to 3 do
    begin
      readln(aa,bb);
      niz[aa]:=niz[aa]+1;
      niz[bb]:=niz[bb]-1;
    end;
  for i:=1 to 101 do
    begin
      tren:=niz[i]+tren;
      case tren of
        1: resenje:=resenje+a;
        2: resenje:=resenje+2*b;
        3: resenje:=resenje+3*c;
      end;

    end;
  writeln(resenje);
end.
