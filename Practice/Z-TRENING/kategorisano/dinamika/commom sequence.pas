uses math;
var mat:array[0..1001,0..1001] of longint;
    s,s1:ansistring;
    i,j:longint;
begin
  readln(s);
  readln(s1);
  for i:=1 to length(s)   do
    for j:=1 to length(s1) do
      if s[i]=s1[j]
        then mat[i,j]:=mat[i-1,j-1] + 1
        else mat[i,j]:=max(mat[i-1,j],mat[i,j-1]);
  writeln(mat[length(s),length(s1)]);
end.