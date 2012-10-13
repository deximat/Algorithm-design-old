uses strutils;
var s,s2,pored1,pored2,resenje:string;
    pocetak,i,j,koef,pocres,jres:longint;
begin
  readln(s);
  {if s[1]<>'0'
    then begin
           assign(output,'input.txt'); rewrite(output);
         end;   }
  koef:=maxlongint;
  pocetak:=pos(',',s)+1;
  for i:=pocetak to length(s) do
      for j:=1 to  length(s)-i+1 do
        begin
          s2:='';
          s2:=copy(s,i,j);
          pored1:=copy(s2,1,length(s)-i-j+1);
          pored2:=copy(s,i+j,length(s)-i-j+1);
          if length(pored1)<length(pored2)
            then begin
                   pored1:=dupestring(pored1,length(pored2) div length(pored1) + length(pored2) mod length(pored1));
                   pored1:=copy(pored1,1,length(pored2));
                 end;
          if (pored1 = pored2 ) and ((koef > i + j) or ((koef = i + j) and (length(resenje)>length(pored1)) ))
            then begin
                   resenje:=s2;
                   pocres:=i;
                   jres:=j;
                   koef:=i+j;
                 end;
        end;
  for i:=1 to pocres-1 do
    write(s[i]);
  writeln('(',resenje,')');

end.
