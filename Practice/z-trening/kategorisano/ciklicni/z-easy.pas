var s:string;
    a,b,c,d:string[15];
    aa,bb,cc,dd,n:int64;
    gore,dole:int64;
    i:longint;
function nzd(a,b:int64):int64;
begin
  if a=0
    then nzd:=b;
  while b<>0 do
    if a>b
      then a:=a-b
      else b:=b-a;
  nzd:=a;
end;
begin
  readln(s);
  i:=1;
  while s[i] <> '/' do
    begin
      a:=a+s[i];
      i:=i+1;
    end;
  i:=i+1;
  while s[i] <> ' ' do
    begin
      b:=b+s[i];
      i:=i+1;
    end;
  i:=i+1;
  while s[i] <> '/' do
    begin
      c:=c+s[i];
      i:=i+1;
    end;
  i:=i+1;
  while i<=length(s) do
    begin
      d:=d+s[i];
      i:=i+1;
    end;
  val(a,aa);
  val(b,bb);
  val(c,cc);
  val(d,dd);

  dole:=bb*dd;
  gore:=aa*dd+cc*bb;
  writeln(gore div nzd(gore,dole),'/',dole div nzd(gore,dole))
end.
