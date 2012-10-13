var aa,bb:array[0..1001] of longint;
    a,b,i:longint;
begin
  readln(a,b);
  aa[a]:=aa[a]+1;
  bb[b]:=bb[b]+1;
  readln(a,b);
  aa[a]:=aa[a]+1;
  bb[b]:=bb[b]+1;
  readln(a,b);
  aa[a]:=aa[a]+1;
  bb[b]:=bb[b]+1;
  for i:=0 to 1000 do
    begin
      if aa[i]=1
        then a:=i;
      if bb[i]=1
        then b:=i;
    end;
  writeln(a,' ',b);
end.