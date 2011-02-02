var code,b,c,brojac,resenje,i:longint;
    a,m:int64;
    aa,cc,isti:string;
function reverse(ss:string):string;
var bb:string;
var i:longint;
begin
  bb:='';
  for i:=length(ss) downto 1 do
    bb:=bb+ss[i];
  reverse:=bb;
end;
begin
  readln(a,b,c);
  str(c,cc);
  a:=a*b;
  str(a,aa);
  cc:=reverse(cc);
  aa:=reverse(aa);
  m:=1;
  for i:=1 to length(cc) do
    m:=m*10;
  brojac:=1;
  {if a=c
    then begin
           writeln(0);
           halt;
         end;  }
  resenje:=pos(cc,aa);
  while pos(cc,aa)<>1  do
    begin
      a:=(a*b) mod m;
      str(a,aa);
      aa:=reverse(aa);
      resenje:=pos(cc,aa);
      brojac:=brojac+1;
      if brojac> (2 shl 20)
         then break;
    end;
 
  if resenje<>0
 
    then writeln(brojac)
 
    else writeln('NIKAD'); 
end.