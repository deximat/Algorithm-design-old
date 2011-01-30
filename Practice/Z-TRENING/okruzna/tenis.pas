var i,j,k,s,p,n,sett,temp:longint;
    c:char;
    teniser:array[1..2] of longint;
    gemovi:array[1..2,1..50] of longint;
begin
  s:=1;
  p:=2;
  sett:=1;
  while not eoln do
    begin
      read(c);
      if c = 'S'
        then begin
               teniser[s]:=teniser[s]+1;
               if (teniser[s] >= 4) and (teniser[s] - teniser[p] >= 2)
                 then begin
                        gemovi[s,sett]:=gemovi[s,sett]+1;
                        teniser[p]:=0;
                        teniser[s]:=0;
                        temp:=s;
                        s:=p;
                        p:=temp;
                        if (gemovi[p,sett] >= 6) and (gemovi[p,sett]-gemovi[s,sett] >= 2)
                          then sett:=sett+1;
                      end;
             end
        else begin
               teniser[p]:=teniser[p]+1;
               if (teniser[p] >= 4) and (teniser[p] - teniser[s] >= 2)
                 then begin
                        gemovi[p,sett]:=gemovi[p,sett]+1;
                        teniser[p]:=0;
                        teniser[s]:=0;
                        temp:=s;
                        s:=p;
                        p:=temp;
                        if (gemovi[s,sett] >= 6) and (gemovi[s,sett]-gemovi[p,sett] >= 2)
                          then sett:=sett+1;
                      end;
             end;

    end;
  for i:=1 to sett do
      writeln(gemovi[1,i],' ',gemovi[2 ,i]);

end.
