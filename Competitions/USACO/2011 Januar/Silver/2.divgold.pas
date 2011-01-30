{
ID:deximat1
PROG:divgold
LANG:PASCAL
}
var n,i,j,pola,suma:longint;
    niz:array[0..400] of longint;
    ways:array[0..300000] of longint;
    moze:array[0..300000] of boolean;
begin
  assign(input,'divgold.in');
  reset(input);
  assign(output,'divgold.out');
  rewrite(output);
  readln(n);
  suma:=0;
  for i:=1 to n do
    begin
      readln(niz[i]);
      suma:=suma+niz[i];
    end;
  ways[0]:=1;
  moze[0]:=true;

  for i:=1 to n do
    for j:=suma div 2 downto niz[i] do
      begin
        ways[j]:= (ways[j]+ways[j-niz[i]]) mod 1000000;
        if moze[j-niz[i]]
          then moze[j]:=true;
      end;
  pola:=suma div 2;
  while not moze[pola] do
    pola:=pola-1;

  writeln(abs(suma - 2*pola ));
  writeln(ways[pola]);
  close(output);
end.
