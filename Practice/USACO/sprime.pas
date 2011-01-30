{
ID:deximat1
PROB:sprime
LANG:PASCAL
}
var slozeni:array[0..11000] of boolean;
    prosti:array[0..11000] of longint;
    ostali:array[0..5] of longint;
    i,j,poc,kraj,n,a,kol,k,l,p,o,u,y:longint;
function ifprime(broj:longint):boolean;
var i:longint;
begin
  i:=1;
  if broj<=10000
    then begin
           ifprime:=not slozeni[broj];
           exit;
         end
    else while (prosti[i]<=sqrt(broj)) and (i<=kol) do
          if (broj mod prosti[i]) = 0
              then begin
                     ifprime:=false;
                     exit;
                   end
              else i:=i+1;
    ifprime:=true;
end;
begin
  ostali[1]:=1;
  ostali[2]:=3;
  ostali[3]:=7;
  ostali[4]:=9;
  assign(input,'sprime.in');
  assign(output,'sprime.out');
  reset(input);
  rewrite(output);
  readln(n);
  slozeni[0]:=true;
  slozeni[1]:=true;
  for i:=2 to 5000 do
    if not slozeni[i]
      then begin
             j:=i*2;
             while(j<=10000)do
               begin
                 slozeni[j]:=true;
                 j:=j+i;
               end;
           end;

  j:=0;
  for i:=1 to 10000 do
    if not slozeni[i]
      then begin
             j:=j+1;
             prosti[j]:=i;

           end;
  kol:=j;
  case n of
    1:begin poc:=1;kraj:=9;              end;
    2:begin poc:=10;kraj:=99;            end;
    3:begin poc:=100;kraj:=999;          end;
    4:begin poc:=1000;kraj:=9999;        end;
    5:begin poc:=10000;kraj:=99999;      end;
    6:begin poc:=100000;kraj:=999999;    end;
    7:begin poc:=1000000;kraj:=9999999;  end;
    8:begin poc:=10000000;kraj:=99999999;end;
  end;

  i:=poc+1;
  if n<8

  then while i<=kraj  do
        begin
          i:=i+2;

          if not ifprime(i div poc)
            then continue;
          j:=poc div 10;
          a:=1;
          while(j>=1)do
            if not ifprime(i div j)
              then begin
                     a:=2;
                     break;
                   end
              else j:=j div 10;
          if a=2
            then continue;
          writeln(i);

        end
  else
       for i:=1 to 4 do
         for j:=1 to 4 do
           for k:=1 to 4 do
             for l:=1 to 4 do
               for p:=1 to 4 do
                for u:=1 to 4 do
                  for y:=1 to 4 do
                    for o:=1 to 4 do
                      begin
                        if not ifprime(prosti[i])  then continue;
                        if not ifprime(prosti[i]*10+ostali[j])  then continue;
                        if not ifprime(prosti[i]*100+ostali[j]*10+ostali[k]) then continue;
                        if not ifprime(prosti[i]*1000+ostali[j]*100+ostali[k]*10+ostali[l]) then continue;
                        if not ifprime(prosti[i]*10000+ostali[j]*1000+ostali[k]*100+ostali[l]*10+ostali[p]) then continue;
                        if not ifprime(prosti[i]*100000+ostali[j]*10000+ostali[k]*1000+ostali[l]*100+ostali[p]*10+ostali[u]) then continue;
                        if not ifprime(prosti[i]*1000000+ostali[j]*100000+ostali[k]*10000+ostali[l]*1000+ostali[p]*100+ostali[u]*10+ostali[o]) then continue;
                        if not ifprime(prosti[i]*10000000+ostali[j]*1000000+ostali[k]*100000+ostali[l]*10000+ostali[p]*1000+ostali[u]*100+ostali[o]*10+ostali[y]) then continue;
                        writeln(prosti[i]*10000000+ostali[j]*1000000+ostali[k]*100000+ostali[l]*10000+ostali[p]*1000+ostali[u]*100+ostali[o]*10+ostali[y]);
                      end;
   close(output);
end.
