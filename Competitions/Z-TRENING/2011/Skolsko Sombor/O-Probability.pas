var slozen:array[0..70000] of boolean;
    prosti:array[0..20000] of longint;
    i,j,nzd,k,n,a,b,brojac:longint;
function gcd(a,b:longint):longint;
var t:longint;
begin
  while b<>0 do
    begin
      t:=b;
      b:=a mod b;
      a:=t;
    end;
  gcd:=a;
end;
function prost(a:longint):boolean;
var k:longint;
begin
  k:=1;
  if a< 60000
    then prost:=not slozen[a]
    else begin
           while (prosti[k]<=round(sqrt(a))) and (k<=n) do
             begin
               if a mod prosti[k] = 0
                 then begin
                         prost:=false;
                         exit;
                      end;
               k:=k+1;
             end;
           prost:=true;
         end;
end;
begin
  slozen[1]:=true;
  slozen[0]:=true;
  for i:=2 to 60000 do
    if not slozen[i]
      then begin

             k:=i*2;
             while  k<60000 do
               begin
                 slozen[k]:=true;
                 k:=k+i;
               end;
           end;

  k:=0;
  for i:=1 to 60000 do
    if not slozen[i]
      then begin
             k:=k+1;
             prosti[k]:=i;
           end;
  n:=k;
  readln(a,b);
  if odd(a)
    then i:=a
    else i:=a+1;
  while i<=b do
    begin
      if prost(i)
        then brojac:=brojac+1;
      i:=i+2;
    end;
 if a<=2
   then brojac:=brojac+1;
 nzd:=gcd(brojac,b-a+1);
 writeln(brojac div nzd,'/',(b-a+1) div nzd);
end.
