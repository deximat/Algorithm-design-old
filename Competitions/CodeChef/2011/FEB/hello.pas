uses math;
type slog = record
              c,h:longint;
            end;

var niz:array[0..11000] of record
                            x,y:longint;
                          end;
    direktni:array[-6..6,-1000000..1000000] of longint;
    pok:array[0..100001] of slog;
    n,i,j,t,max,tren,a,b,c,t1,k,z,l:longint;
    h,null:slog;
function hash(a:real):slog;
var z:boolean;
    mesto:slog;
begin

  if round(trunc(a)) = 0
    then begin
           a:=a*1000000;
           z:=false;
         end
    else z:=true;
  case round(trunc(a)) of
                      -9..9: begin
                               mesto.c:=1;
                               mesto.h:=round(trunc(a*100000));
                             end;
            10..99,-99..-10: begin
                               mesto.c:=2;
                               mesto.h:=round(trunc(a*10000));
                             end;
        100..999,-999..-100: begin
                               mesto.c:=3;
                               mesto.h:=round(trunc(a*1000));
                             end;
    1000..9999,-9999..-1000: begin
                               mesto.c:=4;
                               mesto.h:=round(trunc(a*100));
                             end;
10000..99999,-99999..-10000: begin
                               mesto.c:=5;
                               mesto.h:=round(trunc(a*10));
                             end;
100000..999999,-999999..-100000: begin
                               mesto.c:=6;
                               mesto.h:=round(trunc(a));
                             end
  end;
 if not z
   then mesto.c:=-mesto.c;

 hash:=mesto;
end;
begin
  readln(t1);
  for k:=1 to t1 do
  //assign(input,'prave.in'); reset(input);
  //assign(output,'prave.out'); rewrite(output);
  begin
      max:=0;
      //readln;
      readln(n);
      for i:=1 to n do
        readln(niz[i].x,niz[i].y);

      for i:=1 to n-1 do
        begin

          z:=0;
          for j:=i+1 to n do
            begin
              if (niz[j].x=niz[i].x)
                then begin
                       h.c:=0;
                       h.h:=1000000;
                     end
                else h:=hash((niz[j].y-niz[i].y)/(niz[j].x-niz[i].x));
              inc(direktni[h.c,h.h]);
              if max< (direktni[h.c,h.h]+1)
                then begin
                       max:=direktni[h.c,h.h]+1;
                     end;
              inc(z);
              pok[z]:=h;
            end;
          for j:=1 to z do
            direktni[pok[j].c,pok[j].h]:=0;
        end;
      if n=1
        then writeln(1)
        else writeln(max);
  end;
end.
