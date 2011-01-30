var i,n,j,lenght,b:longint;
    s:string;
    c:array[1..100] of char;
    f:int64;
    niz:array[0..100001] of longint;
begin
   {//////////////////////////
   readln(n);
   for i:=1 to n do
     readln(j);}
   {/////////////////////////
   readln(n);
   for i:=1 to n do
     begin
      readln(s);
      val(s,niz[i],f) ;
     end;
   }
   readln(n);
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
    end;
   writeln(100000);
   for i:=1 to n do
     writeln(niz[i]);
end.