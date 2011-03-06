var s,res:ansistring;
   niz:array[0..1000] of ansistring;
   c:char;
   k,i,j,trenbrojac,max:longint;
begin
  read(c);
  while not eof do
    begin
      If UpCase(c) in ['A'..'Z']
        then s:=s+UpCase(c)
        else if s<>''
               then begin
                      inc(k);
                      niz[k]:=s;
                      s:='';
                    end;
      read(c);
    end;
  for i:=1 to k do
    begin
      trenbrojac:=0;
      for j:=i to k do
        if niz[i]=niz[j]
          then inc(trenbrojac);

      if trenbrojac>max
         then begin
                max:=trenbrojac;
                res:=niz[i];
              end;
    end;
  writeln(LowerCase(res),' ',max);
end.