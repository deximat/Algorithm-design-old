type sl1 = record
            c:char;
            number:longint;
           end;
var qu:array[0..80001] of sl1;
    krava,krava2:array[0..80000] of longint;
    i,j,f,n,poslednji,f2:longint;
begin
  assign(input,'ttravel.in'); reset(input);
  readln(n);
  for i:=1 to n do
    begin
      read(qu[i].c);
      if qu[i].c = 's'
        then readln
        else if qu[i].c='t'
               then begin
                      readln(qu[i].number);
                      bekapuj[qu[i].number]:=true;
                    end
               else  readln(qu[i].number);
    end;
  i:=1;
  poslednji:=1;
  f:=0;
  while i<=n do
    if qu[i].c = 't'
      then begin
             for j:=poslednji to qu[i].number-1 do
               begin
                 case qu[j].c of
                   's':f:=f-1;
                   'a':begin
                         f:=f+1;
                         krava[f]:=qu[j].number;
                       end;
                   't':i:=i+1;
                   end;
                 if f=0
                    then writeln(-1)
                    else writeln(krava[f]);


               end;
              krava2:=krava;
              f2:=f;

              for j:=qu[i].number to i do
               begin
                 case qu[j].c of
                   's':f2:=f2-1;
                   'a':begin
                         f2:=f2+1;
                         krava2[f2]:=qu[j].number;
                       end;
                   't':begin
                         i:=i+1;
                         writeln(krava[f]);
                         break;
                       end;
                   end;
                 if f2=0
                    then writeln(-1)
                    else writeln(krava2[f2]);


               end;
             poslednji:=i;
           end
      else i:=i+1;
  for i:=poslednji to n do
    begin
      case qu[j].c of
        's':f:=f-1;
        'a':begin
              f:=f+1;
              krava[f]:=qu[j].number;
            end
        end;
      if f=0
         then writeln(-1)
         else writeln(krava[f]);

    end
end.
