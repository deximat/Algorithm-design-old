var mat:array[0..1001,0..1001] of boolean;
    n,x,y,s,i,j,k,brojac:longint;
begin
  readln(n);
  for i:=1 to n do
    begin
      readln(x,y,s);
      for k:=x to x+s-1 do
        for j:=y to y+s-1  do
          if not mat[k,j]
            then begin
                   mat[k,j]:=true;
                   brojac:=brojac+1;
                 end;
    end;
  writeln(brojac);

end.