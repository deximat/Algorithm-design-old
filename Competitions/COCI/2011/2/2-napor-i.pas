var niz:array[0..601] of string[101];
    niza:string;
    c:char;
    i,j,n,b,m:longint;
    broja:boolean;
function broj(c:char):boolean;
  begin
    if (c>='0') and (c<='9')
      then broj:=true
      else broj:=false;
  end;

begin
   //assign(input,'a.in'); reset(input);
   readln(n);
   for i:=1 to 100 do
     niz[i]:='0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';

   read(c);
   b:=0;
   m:=100;
   while not EOF do
     begin
       if broj(c)
         then begin
                niza:=niza+c;
                broja:=true;
              end
         else begin
                if broja
                   then b:=b+1;
                for i:=length(niza) downto 1 do
                  begin
                    niz[b][m]:=niza[i];
                    m:=m-1;
                  end;

                niza:='';
                broja:=false;
                m:=100;
              end;
       read(c);
     end;
     if broja
       then begin
              b:=b+1;
              for i:=length(niza) downto 1 do
                  begin
                    niz[b][m]:=niza[i];
                    m:=m-1;
                  end;
            end;
   For i := b-1 downto 1 do
    For j := 1 to i do
      if niz[j] > niz[j+1]
        then Begin
               niza    := niz[j];
               niz[j]   := niz[j+1];
               niz[j+1] := niza;

             end;
   for j:=1 to b do
     begin
       for i:=1 to 101 do
         if niz[j][i] <> '0'
           then break;
       if i=101
         then begin
                writeln('0');
                continue;
              end
         else m:=i;
       for i:=m to 100 do
         write(niz[j][i]);
       writeln;
     end;
end.
