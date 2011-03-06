uses strutils;
var s,a,b,c,res:string;
    i,j:longint;
begin
  readln(s);

  for i:=1 to length(s) do
    for j:=i+1 to length(s)-1 do
      begin
        a:=ReverseString(copy(s,1,i));
        b:= ReverseString(copy(s,i+1,j-i));
        c:=ReverseString(copy(s,j+1,length(s)-j));
        if (i=1) and (j=2)
          then res:=a+b+c;
        if res > a+b+c
         then res:=a+b+c;
      end;
 writeln(res);
end.
