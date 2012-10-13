uses math;
var s:array[0..5000001] of char;
    c:char;
    brojac,length:longint;
function palindrom(janko:longint):longint;
  var i:longint;
  begin
    for i:=1 to (length div 2) do
      if not(s[i]=s[length-i+1])
        then begin
               palindrom:=0;
               exit;
             end;
    palindrom:=1;

  end;
begin
  //assign(input,'test.in');  reset(input);
  read(c);
  while c<>chr(26) do
   if UpCase(c) in ['A'..'Z','0'..'9']
     then begin
            while UpCase(c) in ['A'..'Z','0'..'9'] do
              begin
                inc(length);
                s[length]:=UpCase(c);
                read(c);
              end;
            inc(brojac,palindrom(1));
            length:=0;

          end
     else read(c);
   writeln(brojac);
end.
