var rec:ansistring;
    odda:boolean;
    srednji,i,j,koji:longint;
begin
  readln(rec);
  if length(rec) = 1
    then begin
           writeln(rec);
           halt;
         end;

  srednji:=length(rec) div 2 + 1;
  for j:=srednji to length(rec) do
     begin
      for i:=1 to length(rec)-j do
        if rec[j-i] = rec[j+i]
          then koji:=1
          else begin
                 koji:=0;
                 break;
               end;

        if koji=1 then break;
      for i:=1 to length(rec)-j+1 do
        if rec[j-i] = rec[j+i-1]
          then koji:=2
          else begin
                 koji:=0;
                 break;
               end;

        if koji=2 then break;
     end;
   case koji of
     0,1:begin
         for i:=1 to j do
           write(rec[i]);
         for i:=j-1 downto 1 do
           write(rec[i]);
       end;
     2:begin
         for i:=1 to j-1 do
           write(rec[i]);
         for i:=j-1 downto 1 do
           write(rec[i]);
        end;

   end;
  writeln;
end.
