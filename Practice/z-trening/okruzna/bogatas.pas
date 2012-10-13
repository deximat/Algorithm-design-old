var n,d,i,x,y,max,k:longint;
    mat:array[0..250,0..250] of longint;
begin
  readln(n);

  readln(d);

  for i:=1 to d do
    begin
      readln(x,y);
      mat[x,y]:=1;
    end;
  for x:=1 to n do
    for y:=1 to n do
      mat[x,y]:=mat[x,y]+mat[x-1,y]+mat[x,y-1]-mat[x-1,y-1];

  {for x:=1 to n do
    begin
    for y:=1 to n do
      write(mat[x,y]);
    writeln;
    end;  }
  for x:=1 to n do
    for y:=1 to n do
      begin
        i:=n;
        while not(i=0) do
          if (x+i-1<=n) and (y+i-1<=n) and
             (mat[x+i-1,y+i-1]-mat[x+i-1,y-1]-mat[x-1,y+i-1]+mat[x-1,y-1]=0) and
             (max < i)
            then max:=i
            else i:=i-1;
      end;
  writeln(max);
end.
