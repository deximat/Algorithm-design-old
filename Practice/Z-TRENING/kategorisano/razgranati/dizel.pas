var v,d,c,cc:longint;
begin
  readln(v,d,c);
  if (v>d) and (c>d)
    then begin
          if v>c
            then begin
                   v:=v-c;
                   cc:=c;
                 end
            else begin
                   cc:=v;
                   v:=0
                 end;
          if c<=2*d
            then writeln(cc-d,' ',v)
            else begin
                   if v mod c > 2*d
                     then writeln(cc-2*d+(v div c)*(c-2*d)+(v mod c)-d,' ',0)
                     else writeln(cc-2*d+d+(v div c)*(c-d*2),' ',v mod c);
                 end;
         end
    else writeln(0,' ',v)


end.
