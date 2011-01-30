const ii: array[1..8] of longint = (-1, 0, 1,-1, 1,-1, 0, 1);
      jj: array[1..8] of longint = ( 1, 1, 1, 0, 0,-1,-1,-1);
var izmatrica:array[0..101,0..101] of char;
    i,j,n,m,field:longint;
procedure clear();
begin
  for i:=0 to n+1 do
    for j:=0 to m+1 do
      izmatrica[i,j]:='.';


end;
function izracunaj(i,j:longint):char;
var brojac,k:longint;
begin
  brojac:=0;
  if izmatrica[i,j]='*'
    then izracunaj:='*'
    else begin
           for k:=1 to 8 do
             if izmatrica[i+ii[k],j+jj[k]]='*'
               then brojac:=brojac+1;
           izracunaj:=chr(brojac+48);
         end;
end;
begin
  //assign(output,'out.txt');
  //rewrite(output);
  field:=1;
  while not eof do
    begin
      readln(n,m);
      if not((n = 0) and (m=0))
        then begin
               clear;
               if field <> 1
                 then writeln;
               for i:=1 to n do
                 begin
                   for j:=1 to m do
                     read(izmatrica[i,j]);
                 readln;
                 end;
               writeln('Field #',field,':');
               for i:=1 to n do
                 begin
                   for j:=1 to m do
                    write(izracunaj(i,j));
                   writeln;
                 end;
               field:=field+1;
             end
        else exit;
    end;
   //close(output);
end.
