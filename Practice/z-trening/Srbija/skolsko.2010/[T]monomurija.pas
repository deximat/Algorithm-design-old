var majka:array[0..10000001] of longint;
var i,mater,n:longint;

begin
  read(n);
  i:=1;
  while i <= n do
    begin
      read(mater);
      majka[mater]:=i;
      i:=i+1;
    end;
  read(n);
  i:=1;
  while i <= n do
    begin
      read(mater);
      writeln(majka[mater]);
      i:=i+1;
    end;
end.
