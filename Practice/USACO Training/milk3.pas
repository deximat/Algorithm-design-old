{
PROB:milk3
LANG:PASCAL
ID:deximat1
}
var jel:array[-1..21,-1..21,-1..21] of boolean;
    a,b,c,broj,i:longint;
    resenje:array[0..100] of longint;
procedure rekurzija(aa,bb,cc,aaa,bbb,ccc:longint);
begin
  //writeln(aa,' ',bb,' ',cc);
  //readln;
  jel[aa,bb,cc]:=true;
  if jel[aaa,bbb,ccc]
    then exit;
  //c to a
  if ccc>(a-aaa)
    then rekurzija(aaa,bbb,ccc,a,bbb,ccc-(a-aaa))
    else rekurzija(aaa,bbb,ccc,aaa+ccc,bbb,0);
  //c to b
  if ccc>(b-bbb)
    then rekurzija(aaa,bbb,ccc,aaa,b,ccc-(b-bbb))
    else rekurzija(aaa,bbb,ccc,aaa,bbb+ccc,0);
  //b to a
  if bbb>(a-aaa)
    then rekurzija(aaa,bbb,ccc,a,bbb-(a-aaa),ccc)
    else rekurzija(aaa,bbb,ccc,aaa+bbb,0,ccc);
  //b to c
  if bbb>(c-ccc)
    then rekurzija(aaa,bbb,ccc,aaa,bbb-(c-ccc),c)
    else rekurzija(aaa,bbb,ccc,aaa,0,ccc+bbb);
  //a to c
  if aaa>(c-ccc)
    then rekurzija(aaa,bbb,ccc,aaa-(c-ccc),bbb,c)
    else rekurzija(aaa,bbb,ccc,0,bbb,ccc+aaa);
  //a to b

  if aaa>(b-bbb)
    then rekurzija(aaa,bbb,ccc,aaa-(b-bbb),b,ccc)
    else rekurzija(aaa,bbb,ccc,0,bbb+aaa,ccc);
end;
begin
  assign(input,'milk3.in' );
  reset(input);
  assign(output,'milk3.out');
  rewrite(output);
  readln(a,b,c);
  //C to A
  if c>a
    then rekurzija(0,0,c,a,0,c-a)
    else rekurzija(0,0,c,c,0,0);
  //C to B
  if c>b
    then rekurzija(0,0,c,0,b,c-b)
    else rekurzija(0,0,c,0,c,0);
  for b:=20 downto 0 do
    for c:=0 to 20 do
      if jel[0,b,c]
        then begin
               broj:=broj+1;
               resenje[broj]:=c;
             end;
for i:=1 to broj-1 do
  write(resenje[i],' ');
writeln(resenje[broj]);
close(input);
close(output);
end.
