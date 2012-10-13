var slozeni:array[1..45000] of boolean;
    prosti:array[1..4500] of longint;
    i,j:longint;
    a,b,g,f:int64;
    pom,pom2:string[30];
function prost(broj:int64):boolean;
var i:longint;
begin
  if broj < 40000
    then prost:=not slozeni[broj]
    else begin
           i:=1;
           while prosti[i]< sqrt(broj) do
            begin
             if broj mod prosti[i] = 0
               then begin
                      prost:=false;
                      exit;
                    end;
              i:=i+1;
            end;
           prost:=true;
         end;

end;
begin
  for i:=2 to 20000 do
    if not slozeni[i]
      then begin
             j:=i*2;
             while j<=40000 do
               begin
                 slozeni[j]:=true;
                 j:=j+i;
               end;
           end;
  j:=0;
  prosti[4203]:=2000000000;
  prosti[4204]:=2000000000;
  for i:=2 to 40000 do
    if not slozeni[i]
      then begin
             j:=j+1;
             prosti[j]:=i;
           end;

  readln(a,b);
  for i:=a to b do
    if prost(i)
      then begin
             str(i,pom);
             pom2:='';
             for j:=length(pom) downto 1 do
             pom2:=pom2+pom[j];
             val(pom2,f,g);
             if prost(f)
               then writeln(i);
           end;
end.