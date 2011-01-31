var s,s2,sm,smm:string;
    i,j,prvi,drugi,code:longint;
begin
  readln(s);
  s2:='';
  sm:='';
  smm:='';

  for i:=1 to length(s) do
   if s[i]='6'
     then sm:=sm+'5'
     else sm:=sm+s[i];
  for i:=1 to length(s) do
   if s[i]='5'
     then smm:=smm+'6'
     else smm:=smm+s[i];
  i:=1;
  while sm[i] <> ' ' do
    begin
      s2:=s2+sm[i];
      i:=i+1;
    end;
  delete(sm,1,i);
  val(s2,prvi,code);
  val(sm,drugi,code);
  write(prvi+drugi);
  s2:='';
  i:=1;
  while smm[i] <> ' ' do
    begin
      s2:=s2+smm[i];
      i:=i+1;
    end;
  delete(smm,1,i);
  val(s2,prvi,code);
  val(smm,drugi,code);
  writeln(' ',prvi+drugi);
end.