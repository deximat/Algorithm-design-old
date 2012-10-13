var c:array[1..11] of char;
    niz:array[1..2100] of longint;
    i,j,k,m,n,b,lenght,srednji,f,prvi,poslednji,max:longint;
begin
  readln(n,k,m);
  if m*k > n
    then begin
           writeln(0);
           halt;
         end;
  for i:=1 to n do
    begin
      readln(c);
      for j:=1 to 20 do
        if c[j]= #0
          then break;
      lenght:=j-1;
      for j:=1 to lenght do
                      begin
                        b:=ord(c[j])-48;
                        case lenght-j of
                           1:b:=b*10;
                           2:b:=b*100;
                           3:b:=b*1000;
                           4:b:=b*10000;
                           5:b:=b*100000;
                           6:b:=b*1000000;
                           7:b:=b*10000000;
                           8:b:=b*100000000;
                           9:b:=b*1000000000;
                           10:b:=b*10000000000;
                           11:b:=b*100000000000;
                        end;
                          niz[i]:=niz[i]+b;
                     end;
      if niz[i]>max then max:=niz[i];
    end;
    prvi:=1;
    poslednji:=max;
    while prvi <= poslednji do
      begin
        j:=0;
        f:=0;
        srednji:=(prvi+poslednji) shr 1;
        i:=1;
        while i<=n do
          begin
            if niz[i] > srednji
              then begin
                     i:=i+k;
                     f:=f+1;
                   end
              else i:=i+1;
          end;
           if (f<=m)
             then poslednji:=srednji -1
             else prvi:=srednji + 1;

      end;
  if f<=m
    then writeln(srednji)
    else writeln(prvi);
end.
