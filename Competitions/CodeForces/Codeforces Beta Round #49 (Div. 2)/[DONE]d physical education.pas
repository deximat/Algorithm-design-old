{$inline on}
var i,j,k,n,m,brojac,tren:longint;
    nesto:boolean;
    niz1,niz2:array[0..400] of longint;
    a,b:array[0..100000] of longint;
function prvirazlicit(i:longint):longint;
begin
  while(i<=n) and (niz1[i]=niz2[i]) do
      i:=i+1;
  if i>n
    then prvirazlicit:=-1
    else prvirazlicit:=i;
end;
function find(trazen:longint):longint;
var i:longint;
begin
  for i:=tren to n do
    if niz2[i]=trazen
      then begin
             find:=i;
             exit;
           end;
end;
procedure swap(aa,bb:longint);
var temp:longint;
begin
   brojac:=brojac+1;
   a[brojac]:=aa;
   b[brojac]:=bb;
   temp:=niz2[aa];
   niz2[aa]:=niz2[bb];
   niz2[bb]:=temp;
end;
begin
  readln(n);
  for i:=1 to n do
    read(niz1[i]);
  for i:=1 to n do
    read(niz2[i]);
  brojac:=0;
  for i:=1 to n do
    if niz1[i] = niz2[i]
      then nesto:=true
      else begin
             nesto:=false;
             break;
           end;
  if nesto
    then begin
           writeln(0);
           halt;
         end;
  tren:=1;
  tren:=prvirazlicit(tren);
  while tren<>-1 do
    begin
      for i:=find(niz1[tren]) downto tren+1 do
        swap(i,i-1);
      tren:=prvirazlicit(tren+1);
    end;

  writeln(brojac);
  for i:=1 to brojac do
    writeln(b[i],' ',a[i]);
end.
