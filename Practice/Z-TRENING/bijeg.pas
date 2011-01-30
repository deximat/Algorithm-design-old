var matrica:array[0..20,0..20] of int64;
    x,y:longint;

procedure ispis;
  var i,j:longint;
  begin
    for i:=0 to 20 do
      begin
        for j:=0 to 20 do
          write(matrica[i,j]);
        writeln;
      end;
  end;
function bijeg(x,y:longint):int64;
  begin
    if not((x=0) and (y=0))
      then begin
             if (y-1 > x)   and (y-1 >= 0)
               then bijeg:=bijeg(x,y-1);
             if (y > x-1) and (x-1 >= 0)
               then bijeg:=bijeg +bijeg(x-1,y)
           end
      else bijeg:=1;



  end;

begin
  matrica[0,0]:=1;
  readln(x,y);
  writeln(bijeg(x,y));
end.