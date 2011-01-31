var a:array[0..9] of byte;
    i,n:byte;

begin
  for i:=1 to 8 do read(a[i]);
  i:=1;
  while(a[i]>a[i+1])and(i<8) do
    begin
      if i = 7
      then begin
             writeln('descending');
             halt;
           end;
      i:=i+1;
    end;
  i:=1;
  while(a[i]<a[i+1])and(i<8) do
    begin
      if i = 7
      then begin
             writeln('ascending');
             halt;
           end;
      i:=i+1;
    end;
  writeln('mixed');
end.
