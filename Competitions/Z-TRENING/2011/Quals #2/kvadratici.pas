const moda = 1000000007;
var sumSquare,prvi,sumCube,sumLine,temp,m,n,np1:int64;
    a,b,resenje:int64;
begin
  readln(n,m);
  if n>m
    then begin
           temp:=m;
           m:=n;
           n:=temp;
         end;
  n:=n-1;
  np1:=n+1;

  sumLine:=(n*np1 div 2) mod moda;
  prvi:=n*(n+1) div 2;
  if prvi mod 3 = 0
    then sumSquare:=(((prvi div 3) mod moda)  *  (2*n+1))  mod moda
    else sumSquare:=((prvi mod moda)  *  ((2*n+1) div 3))  mod moda;

  if odd(n)
    then sumCube:=(((n*n) mod moda) * (((n+1)*(n+1) div 4) mod moda) ) mod moda
    else sumCube:=((((n*n) div 4) mod moda) * (((n+1)*(n+1)) mod moda) ) mod moda;

  n:=n+1;
  a:=((n*m mod moda)*n mod moda + ((sumLine*m mod moda)*n) mod moda + sumCube + sumSquare) mod moda;
  b:=(((sumLine*(m+n)) mod moda)+(sumSquare*(n+m))mod moda ) mod moda;
  resenje:=((a-b) mod  moda + moda) mod moda;
  writeln(resenje);
end.
