var aa,bb:string;
    a,b,i,pneparni,pparni,brojn,brojp,lneparni,lparni,c,prvi,poslednji,srednji:longint;
function zbircifara(i:longint):longint;
 var s:string[4];
     z:longint;
 begin
   str(i,s);
   z:=0;
   for i:=1 to length(s) do
     inc(z,ord(s[i])-ord('0'));
   zbircifara:=z;
 end;
begin
  readln(a,b);
  str(a,aa);
  str(b,bb);



   if (length(bb)>1) and ((copy(aa,1,length(aa)-1) <> copy(bb,1,length(bb)-1)) or (length(bb)>length(aa)))
    then begin
           //obradi prvi
           for i:=ord(aa[length(aa)])-ord('0') to 9 do
             if odd(i)
               then inc(pneparni)
               else inc(pparni);
           //obradi poslednji
           for i:=ord(bb[length(bb)])-ord('0') downto 0 do
              if odd(i)
                then inc(lneparni)
                else inc(lparni);
             //izracunaj broj brojeva bez poslednje cifre
            delete(aa,length(aa),1);
            delete(bb,length(bb),1);
            val(aa,a,c);
            val(bb,b,c);

           if odd(zbircifara(a))
             then prvi:=pneparni
             else prvi:=pparni;
           if odd(zbircifara(b))
             then poslednji:=lneparni
             else poslednji:=lparni;
         end
    else begin
           for i:=a to b do
             if odd(zbircifara(i))
               then inc(pneparni)
               else inc(pparni);
           prvi:=pparni;
         end;

  //obradi sredinu
  if b-a-1 > 0
    then begin
           brojn:=(b-a-1) div 2;
           brojp:=(b-a-1) div 2;

           if (b-a-1) mod 2 = 1
             then  begin
                     if odd(b-a-1)
                       then if odd(zbircifara(a+1))
                              then inc(brojn)
                              else inc(brojp)
                       else if odd(zbircifara(a+1))
                              then inc(brojp)
                              else inc(brojn);
                   end;
         end;

  srednji:=brojn*5 + brojp*5;
  writeln(prvi+poslednji+srednji);
end.