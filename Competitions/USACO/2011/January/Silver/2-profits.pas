{
ID:deximat
PROG:profits
LANG:PASCAL
}
{$inline on}
var i,j,k,n,m,suma,resenje,max:longint;
    niz:array[0..150000] of longint;
    nesto:boolean;
begin
  assign(input,'profits.in');
  reset(input);
  assign(output,'profits.out');
  rewrite(output);


  readln(n);
  for i:=1 to n do
    readln(niz[i]);
  for i:=1 to n do
    if niz[i]<0
      then nesto:=true
      else begin
             nesto:=false;
             break;
           end;
  max:=-maxlongint;
  if nesto
  then  for i:=1 to n do
          if max<niz[i]
            then max:=niz[i];

  if nesto
    then begin
           writeln(max);
           halt;
         end;
  for i:=1 to n do
    begin
      suma:=suma+niz[i];
      if resenje< suma
        then resenje:=suma;
      if suma<0
        then suma:=0;
    end;


  writeln(resenje);
  close(output);
end.
