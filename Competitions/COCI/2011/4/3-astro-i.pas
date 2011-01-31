var s,s1,s2:string;
    t1h,t2h,d1,d2,t1m,t2m,r1h,r1m,r2h,r2m,i,d,cc:longint;
begin
  readln(s);
  val(copy(s,1,2),t1h,cc);
  val(copy(s,4,2),t1m,cc);
  readln(s);
  val(copy(s,1,2),t2h,cc);
  val(copy(s,4,2),t2m,cc);
  readln(s);
  val(copy(s,1,2),r1h,cc);
  val(copy(s,4,2),r1m,cc);
  readln(s);
  val(copy(s,1,2),r2h,cc);
  val(copy(s,4,2),r2m,cc);

  while not((t1h=t2h) and (t1m=t2m) and (d1=d2)) do
    begin
      i:=i+1;
      if i>=20000000
        then begin
               writeln('Never');
               halt;
             end;
      if (d1*10000+t1h*100+t1m)<(d2*10000+t2h*100+t2m)
        then begin
               t1h:=t1h+r1h;
               t1m:=t1m+r1m;
               if not(t1m div 60 = 0)
                 then begin
                        t1m:=t1m mod 60;
                        t1h:=t1h+1;
                      end;
               if not(t1h div 24 = 0)
                 then begin
                        t1h:=t1h mod 24;
                        d1:=d1+1;
                        d1:=d1 mod 7;
                      end;

             end
        else begin
               t2h:=t2h+r2h;
               t2m:=t2m+r2m;
               if not(t2m div 60 = 0)
                 then begin
                        t2m:=t2m mod 60;
                        t2h:=t2h+1;
                      end;
               if not(t2h div 24 = 0)
                 then begin
                        t2h:=t2h mod 24;
                        d2:=d2+1;
                        d2:=d2 mod 7;
                      end;

             end;
    end;
  case d1 of
    0:writeln('Saturday');
    1:writeln('Sunday');
    2:writeln('Monday');
    3:writeln('Tuesday');
    4:writeln('Wednesday');
    5:writeln('Thursday');
    6:writeln('Friday');
  end;
  str(t1h,s1);
  str(t1m,s2);
  if t1h<10
    then s1:='0'+s1;
  if t1m<10
    then s2:='0'+s2;
  writeln(s1,':',s2);

end.