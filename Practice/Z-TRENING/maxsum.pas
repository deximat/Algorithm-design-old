var i,j,f,lenght:longint;
    sum,max,n,g,b:int64;
    a:string;
    c:array[1..20] of char;

begin
  readln(n);
  for i:=1 to n do
       begin

         readln(c);
         for j:=1 to 20 do
           if c[j]= #0
             then break;
         lenght:=j-1;
         if c[1]='-'
           then for j:=2 to lenght do
                  begin
                    b:=ord(c[j])-48;
                    case lenght-j of
                      0:;
                      1:b:=b*10;
                      2:b:=b*100;
                      3:b:=b*1000;
                      4:b:=b*10000;
                      5:b:=b*100000;
                      6:b:=b*1000000;
                      7:b:=b*10000000;
                      8:b:=b*100000000;
                      9:b:=b*1000000000;
                      10:b:=b*10000000000;
                      11:b:=b*100000000000;
                     end;
                     sum:=sum-b;
                    end
           else for j:=1 to lenght do
                  begin
                    b:=ord(c[j])-48;
                    case lenght-j of
                      0:;
                      1:b:=b*10;
                      2:b:=b*100;
                      3:b:=b*1000;
                      4:b:=b*10000;
                      5:b:=b*100000;
                      6:b:=b*1000000;
                      7:b:=b*10000000;
                      8:b:=b*100000000;
                      9:b:=b*1000000000;
                      10:b:=b*10000000000;
                      11:b:=b*100000000000;
                     end;
                      sum:=sum+b;
                 end;

         if  sum > -1
           then begin
                  if max < sum
                    then max:=sum
                end
           else sum:=0;
        end;
  writeln(max);
end.
