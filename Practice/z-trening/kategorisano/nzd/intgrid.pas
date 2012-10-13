var a,b:longint;
function nzd(a,b:longint):longint;
  var t:longint;
  begin
    while b <> 0 do
      begin
        t:=b;
        b:=a mod b;
        a:=t;
      end;
    nzd:=a;
  end;
begin
  readln(a,b);
  writeln(((a+1)*(b+1)+nzd(a,b)+1) div 2 );
end.
