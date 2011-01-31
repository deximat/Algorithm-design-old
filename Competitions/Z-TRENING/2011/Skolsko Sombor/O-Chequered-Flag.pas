function min(a,b:qword):qword;
begin
  if a<b
    then min:=a
    else min:=b;
end;
var mat:array[-1..3001,-1..3001] of char;
    r,c,i,j:longint;
    res:array[-1..1,'B'..'C'] of qword;
begin
  readln(r,c);
  for i:=1 to r do
    BEGIN
      FOR J:=1 TO C DO
        read(mat[i,J]);
      READLN;
    END;
  for i:=1 to R do
    for j:=1 to C do
      inc(res[ (i+j) and 1,mat[I,J]]);
  writeln(Min(res[0 ,'C']+res[1,'B'],res[0,'B']+res[1,'C']));
end.
