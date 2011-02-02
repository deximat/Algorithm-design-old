{$m 256000000}
var i,j,k,n,m,c,resenje,brojac,a,b:longint;
    niz:array[0..12] of string;
    s:string;
begin
  //assign(input,'1.in');  reset(input);
  niz[1]:='ABSINTH';
  niz[2]:='BEER';
  niz[3]:='BRANDY';
  niz[4]:='CHAMPAGNE';
  niz[5]:='GIN';
  niz[6]:='RUM';
  niz[7]:='SAKE';
  niz[8]:='TEQUILA';
  niz[9]:='VODKA';
  niz[10]:='WHISKEY';
  niz[11]:='WINE';

  resenje:=0;
  readln(n);
  for i:=1 to n do
    begin
      readln(s);
      val(s,k,n);
      if n=0
        then if k<18
               then resenje:=resenje+1
               else
        else  for j:=1 to 11 do
                if s = niz[j]
                  then resenje:=resenje+1;
    end;

  writeln(resenje);
end.
