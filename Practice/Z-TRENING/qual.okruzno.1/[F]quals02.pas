var niz:array[0..1002,0..2002] of char;
    lenght:array[0..1002] of longint;
    i,n,j,temp:longint;
    zamena:boolean;
    f:text;
function compare(n:longint):boolean;
var srednji1,srednji2,pomeraj,i:longint;
  begin
    compare:=false;
    srednji2:=lenght[j+1] div 2 +1;
    srednji1:=lenght[j] div 2 +1;
    if srednji1 < srednji2
      then pomeraj:=srednji1
      else pomeraj:=srednji2;
    if niz[j,srednji1] > niz[j+1,srednji2]
      then begin
             compare:=true;
             exit;
           end;
    if niz[j,srednji1] < niz[j+1,srednji2]
      then exit;

    for i:=1 to pomeraj-1 do
      begin
        if niz[j,srednji1+i] > niz[j+1,srednji2+i]
          then begin
                 compare:=true;
                 exit;
               end
          else if niz[j,srednji1+i] < niz[j+1,srednji2+i]
                 then exit;
        if niz[j,srednji1-i] > niz[j+1,srednji2-i]
          then begin
                 compare:=true;
                 exit;
               end
          else if niz[j,srednji1+i] < niz[j+1,srednji2+i]
                 then exit;
      end;
   if srednji1 > srednji2
     then  compare:=true;
  end;
begin
  assign(f,'sort.in');
  reset(f);
  readln(f,n);
//ucitavanje i formiranje specificnog stringa
  for j:=1 to n do
   begin
    i:=1;
    while not eoln(f) do
      begin
        read(f,niz[j,i]);
        i:=i+1;
      end;
    readln(f);
    lenght[j]:=i-1;
   end;
   close(f);
//sort
  for i:=n-1 downto 1 do
    begin
      zamena:=False;
      for j:=1 to i do
        if compare(j)
          then begin
                 niz[n+1]:=niz[j];
                 niz[j]:=niz[j+1];
                 niz[j+1]:=niz[n+1];
                 temp:=lenght[j];
                 lenght[j]:=lenght[j+1];
                 lenght[j+1]:=temp;
                 zamena:=true;
               end;
      if not zamena then break;
    end;
//ispis
  for i:=1 to n do
   begin
    for j:=1 to lenght[i] do
      write(niz[i,j]);
    writeln;
   end;
end.
