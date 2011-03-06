//{$inline on}
uses math;
var niz:array[0..5] of int64;
    n,f,i,ii,jj,value:longint;
    x,c:char;
    mat:array[0..101,0..101] of INT64;
procedure ispis;
var max:int64;
    i:longint;
begin
  max:=-maxlongint-1;
  for i:=1 to 4 do
    if niz[i]>max
      then max:=niz[i];
  for i:=1 to 4 do
    if niz[i]=max
      then write(i);
  writeln;
end;
procedure operacija(x,y,value:longint;c:char);
  var a:set of byte;
      pom,raz:int64;
      I:LONGINT;
  begin
    a:=[];
    if (x-1)*(n-1)-(y-1)*(n-1) <= 0
      then a:=a+[1];
    if (x-1)*(n-1)-(y-1)*(n-1) >= 0
      then a:=a+[3];
    if (x-n)*(1-n)-(y-1)*(n-1) >= 0
      then a:=a+[4];
    if (x-n)*(1-n)-(y-1)*(n-1) <= 0
      then a:=a+[2];
    case c of
      'S':begin
            pom:=mat[x,y]-value;
            raz:=pom-mat[x,y];
            mat[x,y]:=pom;
          end;
      'M':begin
            pom:=mat[x,y]*value;
            raz:=pom-mat[x,y];
            mat[x,y]:=pom;
          end;
      'A':begin
            pom:=mat[x,y]+value;
            raz:=pom-mat[x,y];
            mat[x,y]:=pom;
          end;
      'P':begin
            pom:=value;
            raz:=pom-mat[x,y];
            mat[x,y]:=pom;
          end;
    end;
    for i:=1 to 4 do
      if i in a
        then niz[i]:=niz[i]+raz;
  end;
begin
  //assign(input,'pera.in'); reset(input);
  //assign(output,'pera.out'); rewrite(output);
  readln(n,f);
  for i:=1 to f do
    begin
      read(c);
      read(x);
      while X in ['A'..'Z'] do
        read(x);
      if c='Q'
        then begin
               ispis;
               readln;
             end
        else begin
               readln(ii,jj,value);
               operacija(ii,jj,value,c);
             end;
    end;
  close(output);
end.
