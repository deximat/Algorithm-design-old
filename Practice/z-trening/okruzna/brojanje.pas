var direktno:array[0..66000] of longint;
    niz:array[0..401] of longint;
    n,a,b,i,f,j,z,temp,h:longint;
    input:text;
begin
  {assign(input,'c:\deximat\brojanje2.in'); reset(input);  }
  readln({input,}n);
  readln({input,}b,niz[1]);
  direktno[niz[1]]:=1;
  f:=1;
  h:=1;
  for i:=2 to n do
    begin
      read({input,}a);
      if a = 1
        then begin
               readln({input,}b);
               h:=h+1;
               if direktno[b] = 0
                 then begin
                        direktno[b]:=1;
                        f:=f+1;
                        for j:=f-1 downto 1 do
                          if b < niz[j]
                            then begin
                                   niz[j+1]:=niz[j];
                                   niz[j]:=b;
                                 end
                            else begin
                                   niz[j+1]:=b;
                                   break;
                                 end;

                      end
                 else direktno[b]:=direktno[b]+1;
             end
        else begin
               readln({input,}b);
               z:=h;
               j:=f;
               while z >= b do
                 begin

                  z:=z-direktno[niz[j]];
                  j:=j-1;
                 end;
               writeln(niz[j+1]);
             end;
    end;
end.
