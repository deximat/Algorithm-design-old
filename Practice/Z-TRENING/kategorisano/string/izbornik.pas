uses strutils;
var  i,n,j:longint;
     s:string;
     skup:set of char;
     jel:boolean;
begin
   readln(n);
   for i:=1 to n do
     begin
       readln(s);
       jel:=false;
       s:=' '+s;
       for j:=1 to 5 do
         if not (UpCase(s[NPos(' ',s,j)+1]) in  skup )   and (NPos(' ',s,j)<>0)
           then begin
                  jel:=true;
                  skup:=skup+[UpCase(s[NPos(' ',s,j)+1])];
                  break;
                end;
       if jel
         then begin
                write(copy(s,2,NPos(' ',s,j)-1));
                write('[',s[NPos(' ',s,j)+1],']');
                writeln(copy(s,NPos(' ',s,j)+2,length(s)-(NPos(' ',s,j)+1)));
                continue;
              end;
       delete(s,1,1);
       for j:=1 to length(s) do
         if UpCase(s[j]) in skup
           then write(s[j])
           else begin
                  skup:=skup + [UpCase(s[j])];
                  write('[',s[j],']');
                  break;
                end;
         writeln(copy(s,j+1,length(s)-j))
     end;
 end.