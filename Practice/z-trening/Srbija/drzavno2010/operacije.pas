var broj:array[-2000..2000] of longint;
    c:char;
    f,g:text;
    i,pocetak,kraj:longint;
procedure dec;
 var i,bla,pom:longint;
 begin
   bla:=0;
   broj[kraj]:=broj[kraj]-1;
   if broj[kraj] < 0
     then begin
            bla:=10;
            broj[kraj]:=broj[kraj]+bla;
            broj[kraj-1]:=broj[kraj-1]-1;
            i:=1;
            while broj[kraj-i] < 0 do
              begin
                broj[kraj-i-1]:=broj[kraj-i-1]-1;
                bla:=10;
                broj[kraj-i]:=broj[kraj-i]+bla;

                i:=i+1;

              end;
              i:=i-1;
            while (broj[pocetak]=0) and (pocetak < 2000)do
              pocetak:=pocetak+1;
          end

 end;
procedure inc;
 var i,bla,pom:longint;
 begin
   bla:=0;
   broj[kraj]:=broj[kraj]+1;
   if broj[kraj] >= 10
     then begin
            bla:=broj[kraj] div 10;
            broj[kraj]:=broj[kraj] mod 10;
            i:=1;
            while bla > 0 do
              begin
                pom:=broj[kraj-i]+bla;
                if pom >= 10
                  then begin
                         broj[kraj-i]:=pom mod 10;
                         bla:=pom div 10;
                       end
                  else begin
                         broj[kraj-i]:=pom;
                         bla:=0;
                       end;
                i:=i+1;

              end;
              i:=i-1;
            if kraj-i < pocetak
              then pocetak:=kraj-i;
          end

 end;
procedure double;
 var i,bla,pom:longint;
 begin
   bla:=0;
   for i:=pocetak to kraj do
     broj[i]:=broj[i] shl 1;
   for i:=kraj downto pocetak do
     begin
       if broj[i] >= 10
         then begin
                broj[i-1]:=broj[i-1]+(broj[i] div 10);
                broj[i]:=broj[i] mod 10;
              end
     end;

    while broj[pocetak]=0 do
     pocetak:=pocetak+1;
 end;
procedure podeli;
 var i,bla,pom:longint;
 begin
   for i:=pocetak to kraj do
     begin
       broj[i+1]:=broj[i+1] + (broj[i] mod 2)*10;
       broj[i]:=broj[i] shr 1;
     end;
   while (broj[pocetak]=0) and (pocetak < 2000) do
     pocetak:=pocetak+1;
 end;
function cetiri:boolean;
  begin
    cetiri:=false;
    if ((broj[kraj]+broj[kraj-1]*10+1) mod 4) =0
      then cetiri:=true;

  end;
function  paran:boolean;
begin
  paran:=false;
  case broj[kraj] of
    0,2,4,6,8:paran:=true;
    end;
end;
begin
  //assign(input,'mino.in'); reset(input);
  //assign(output,'mino.out'); rewrite(output);
  while not eoln do
    begin
      read(c);
      i:=i+1;
      broj[i]:=ord(c)-48;
    end;
  pocetak:=1;
  kraj:=i;
  i:=0;
  while pocetak<=kraj do
  begin
   if (kraj=pocetak)
     then if (broj[kraj]=1)
           then begin
                 writeln(i+1);

                 halt;
                end
           else begin
                  if paran
                    then podeli
                    else dec;
                  i:=i+1;
                  continue;
                end;

   if paran
    then podeli
    else if cetiri
           then inc
           else dec;

    i:=i+1;
  end;
  close(input);
  close(output);
end.
