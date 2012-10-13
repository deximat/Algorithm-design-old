{
PROG: mnotes
LANG: PASCAL
ID: deximat1
}
var n,q,duzina,i,m,mesto,pocetak:longint;
    niz:array[0..50001] of longint;
    f,g:text;
procedure find(prvi,poslednji:word);
var srednji:word;
begin
  while prvi <= poslednji do
  begin
    srednji:=(prvi + poslednji) div 2;
    if (niz[srednji] <= mesto) and (mesto < niz[srednji+1])
      then begin
             writeln(g,srednji);
             exit;
           end;
    if mesto < niz[srednji]
      then poslednji:=srednji-1
      else if mesto > niz[srednji]
             then prvi:=srednji+1;

  end;
end;
begin
  assign(f,'mnotes.in');
  reset(f);
  assign(g,'mnotes.out');
  rewrite(g);
  readln(f,n,q);
  niz[0]:=-1;
  for i:=1 to n do
    begin
      readln(f,duzina);
      niz[i]:=niz[i-1]+duzina;
    end;
  for i:=1 to q do
    begin
      readln(f,mesto);
      find(1,n);
    end;
  close(f);
  close(g);
end.
