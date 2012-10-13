var a,b,i,max:longint;//pocetak i kraj
    bioje:array[0..1000001] of longint;
    obrni:boolean;
function izracunaj(broj:qword):longint; //trazi duzinu niza
var brojac:longint;
begin
  brojac:=1;
  while broj<>1 do
    if (broj<=1000000) and (bioje[broj]>0)
      then begin
             izracunaj:=bioje[broj]+brojac-1;
             exit;
           end
      else if odd(broj)
             then begin
                    broj:=broj*3+1;
                    brojac:=brojac+1;
                  end
             else begin
                    broj:=broj div 2;
                    brojac:=brojac+1;
                  end;
  izracunaj:=brojac;
end;
begin

  while not EOF do
     begin
        max:=0;
        obrni:=false;
        readln(a,b);
        if a>b
          then begin
                 i:=a;
                 a:=b;
                 b:=i;
                 obrni:=true;
               end;
       //za sve od a do b
        for i:=a to b do
          begin
            bioje[i]:=izracunaj(i);
            if bioje[i]>max
              then max:=bioje[i];
          end;
        if obrni
          then writeln(b,' ',a,' ',max)
          else writeln(a,' ',b,' ',max);
     end;
end.
