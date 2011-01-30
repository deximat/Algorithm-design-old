
var i,j,k,cifara:longint;
    brojeva,last:int64;
    cifrica:array[0..3] of longint;
    niza:array[0..21] of longint;
begin
  readln(k);
  brojeva:=2;
  for i:=1 to 31 do
    if k>=brojeva
      then if k=brojeva
           then begin
                  for j:=1 to i do
                    write(7);
                  writeln;
                  exit;
                end
           else begin
                  last:=brojeva;
                  brojeva:=brojeva shl 1 + brojeva;

                end
      else break;
  cifrica[1]:=4;
  cifrica[2]:=7;
  cifara:=i;
  last:=last+1;
  for i:=1 to 20 do
    niza[i]:=1;
  while niza[1]<=2 do
  while niza[2]<=2 do
  while niza[3]<=2 do
  while niza[4]<=2 do
  while niza[5]<=2 do
  while niza[6]<=2 do
  while niza[7]<=2 do
  while niza[8]<=2 do
  while niza[9]<=2 do
  while niza[10]<=2 do
  while niza[11]<=2 do
  while niza[12]<=2 do
  while niza[13]<=2 do
  while niza[14]<=2 do
  while niza[15]<=2 do
  while niza[16]<=2 do
  while niza[17]<=2 do
  while niza[18]<=2 do
  while niza[19]<=2 do
  while niza[20]<=2 do
  if last = k
      then begin
             for i:=cifara downto 1 do
               write(cifrica[niza[i]]);
             writeln;
             exit;
           end
      else last:=last+1;
  writeln;
end.
