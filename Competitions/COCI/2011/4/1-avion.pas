var k:longint;
    s:string;
    truee:boolean;
begin
  {assign(input,'nesto.in');
  reset(input);}
  truee:=true;
  while not eof do
    begin
      k:=k+1;

      readln(s);
      if pos('FBI',UPCASE(S))<>0
        then begin
               truee:=false;
               if k<>1
                 then write(' ');
               write(k);
             end;
    end;
  if truee
    then writeln('HE GOT AWAY!')
    else writeln;
end.