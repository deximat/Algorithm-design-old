var niz:array[0..10400] of boolean;
    niz2:ansistring;
    niz3:array[0..100000]  of longint;
    i,broj,j,brojac,k:longint;
begin
  i:=0;
  readln(niz2);
  i:=1;
  while(i<=length(niz2))do
    begin
      if niz2[i]=','
        then begin
               niz[broj]:=true;
               broj:=0;
               i:=i+1;
             end
        else begin
               broj:=broj*10+ord(niz2[i])-48;
               i:=i+1;
             end;
    end;
  niz[broj]:=true;
  j:=0;
  for i:=1 to 1000 do
    if niz[i]
      then begin
             j:=j+1;
             niz3[j]:=i;
           end;
  write(niz3[1]);
  for i:=2 to j do
    begin
      if (abs(niz3[i-1]-niz3[i]) =1) and (not (i=j) )
        then begin
               brojac:=1;
               continue;
             end
        else begin
               if brojac=1
                 then begin
                        if not(i=j) or (abs(niz3[i-1]-niz3[i])>1)
                         then   begin
                                  brojac:=0;
                                  write('-',niz3[i-1],',',niz3[i]);
                                end
                         else   begin

                                  brojac:=0;
                                  write('-',niz3[i]);
                                end;
                      end
                 else write(',',niz3[i]);
             end;
    end;
  writeln;
end.
