var f,i,j,k,c:longint;
    z:boolean;
    bla,blaa:string;
    broj:array[0..4] of longint;
begin
   readln(bla);
   i:=1;
   while i<=length(bla) do
       if (bla[i] >= '0') and (bla[i]<='9')
         then begin
                blaa:=blaa + bla[i];
                i:=i+1;
              end
         else begin
                j:=j+1;
                val(blaa,broj[j],c);
                I:=I+2;
                blaa:='';
              end;
   while true do
     begin
       f:=f+1;
       if ((broj[1]*3600 + broj[2]*60 + broj[3]) mod f) <> 0
         then begin
                writeln(f);
                halt;
              end;
     end;
end.
