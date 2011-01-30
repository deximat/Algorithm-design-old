var n,m,f,max:longint;
    niz:array[0..100001] of longint;
    g:text;
    resenje:int64;
function kombinacije(interval:longint):int64;
  var res,a:int64;
  begin
    if interval=-1
      then begin
             kombinacije:=0;
             exit;
           end;
    res:=1;
    a:=2;
    while interval > 0 do
      begin
        if odd(interval)
          then res := res*a mod 1000000007;
        interval:= interval shr 1;
        a:=a*a mod 1000000007;
      end;
    if res <> 0
      then kombinacije:=res
      else kombinacije:=1;
  end;
procedure qs(levi,desni:longint);
  var i,j,D:longint;
      pom:longint;
  begin
    i:=levi;
    j:=desni;
    D:=niz[(levi+desni) div 2];
    repeat
      while niz[i]<d do i:=i+1;
      while niz[j]>d do j:=j-1;
      if i <= j
        then begin
               pom:=niz[i];
               niz[i]:=niz[j];
               niz[j]:=pom;
               i:=i+1;
               j:=j-1;
             end;
    until i>j;
    if levi<j then qs(levi,j);
    if i<desni then qs(i,desni)
  end;
function interval(trazeni:longint):longint;
  var srednji,prvi,poslednji:longint;
  begin
             prvi:=f+1;
             poslednji:=n;
             srednji:=(prvi+poslednji) div 2;
             while (prvi<=poslednji) and (niz[srednji]<>trazeni) do
              begin
               if trazeni>niz[srednji]
                 then prvi:=srednji+1
                 else poslednji:=srednji-1;
               srednji:=(prvi + poslednji) div 2;
              end;
             if niz[srednji]=trazeni
               then interval:=srednji-f-1
               else interval:=-1;
  end;
begin
 {assign(g,'skupovi.in'); reset(g);   }
 readln({g,}n,m);
 for f:=1 to n do
   read({g,}niz[f]);
 qs(1,n);
 for f:=1 to n do
   if m = niz[f]*2
     then resenje:=resenje+1;
 f:=1;

  while (m-niz[f]) > niz[f] do
    begin
     resenje:=resenje+kombinacije(interval(m-niz[f]));
     f:=f+1;
    end;
  writeln(resenje mod 1000000007);
end.
