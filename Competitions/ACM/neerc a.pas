uses strutils;
var poc:ansistring;
    pravi:array[0..1001,0..100] of string[81];
    i,j,maxj,jj,ii,max:longint;
    c:char;
    niz2:array[0..1001] of longint;
begin
  //assign(input,'pera.in'); reset(input);
  //assign(output,'pero.out'); rewrite(output);
  while not eof do
    begin
      inc(i);
      read(c);
      while c=' ' do
        read(c);
      readln(poc);
      poc:=c+poc;
      poc:=delspace1(poc);
      j:=0;
      while poc<>'' do
        begin
          j:=j+1;
          pravi[i,j]:=copy2spacedel(poc);
        end;
      niz2[i]:=j;
      if j>maxj
        then maxj:=j;
    end;
  for jj:=1 to maxj do
    begin
      max:=0;
      for ii:=1 to  i do
        if max<length(pravi[ii,jj])
          then max:=length(pravi[ii,jj]);
      for ii:=1 to  i do
        begin
          if niz2[ii]>jj
            then pravi[ii,jj]:=PadRight(pravi[ii,jj],max+1);
        end;
    end;
  for ii:=1 to i do
    begin
      for jj:=1 to niz2[ii] do
        write(pravi[ii,jj]);
      writeln;
    end;
  //close(output);
end.
