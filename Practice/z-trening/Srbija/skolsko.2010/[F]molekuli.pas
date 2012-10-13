var niz:array[0..2001,0..2001] of char;
    niz2:array[0..2001,0..2001] of boolean;
    n,j,i,trenutna,max:longint;
function dfs(i,j:longint):longint;
begin
  niz2[i,j]:=true;
  case niz[i,j] of
    'C':trenutna:=trenutna+12;
    'O':trenutna:=trenutna+16;
    'H':trenutna:=trenutna+1;
    'N':trenutna:=trenutna+14;
   else exit;
  end;
  if not niz2[i+1,j] and (niz[i+1,j] = '|')
    then begin
           dfs(i+2,j);
           niz2[i+1,j]:=true;
         end;
  if not niz2[i-1,j] and (niz[i-1,j] = '|')
    then begin
           dfs(i-2,j);
           niz2[i-1,j]:=true;
         end;
  if not niz2[i,j-1] and (niz[i,j-1] = '-')
    then begin
           dfs(i,j-2);
           niz2[i,j-1]:=true;
         end;
  if not niz2[i,j+1] and (niz[i,j+1] = '-')
    then begin
           dfs(i,j+2);
           niz2[i,j+1]:=true;
         end;
end;
begin
   readln(n);
   for i:=1 to n do
    begin
     for j:=1 to n do
       read(niz[i,j]);
     readln;
    end;
   for i:=1 to n do
    for j:=1 to n do
      if not niz2[i,j]
        then begin
               niz2[i,j]:=true;
               trenutna:=0;
               dfs(i,j);
               if trenutna > max
                 then max:=trenutna;
             end;
   writeln(max);
end.