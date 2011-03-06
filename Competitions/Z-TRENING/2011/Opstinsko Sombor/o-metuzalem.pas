var c:char;
    s,era1,era2:string;
    niz,niz2:array[0..3] of string;
    month:array[0..13] of longint;
    prva,druga,hh,mm,ss,code,birthday,j,birthmonth,i,resenje,vremerodja,trenutak1,trenutak2:longint;

begin
  //sati
  read(c);
  for i:=1 to 3 do
    niz[i]:='00000000000000000';

  while c<>':' do
    begin
      s:=s+c;
      read(c);
    end;

  for i:=length(s) downto 1 do
    niz[1][14-i]:=s[length(s)-i+1];
  s:='';

  //minuti
  read(c);
  while c<>':' do
    begin
      s:=s+c;
      read(c);
    end;
  for i:=length(s) downto 1 do
   niz[1][16-i]:=s[length(s)-i+1];
  s:='';
  //sekundi
  read(c);
  while c<>',' do
    begin
      s:=s+c;
      read(c);
    end;
  for i:=length(s) downto 1 do
   niz[1][18-i]:=s[length(s)-i+1];
  s:='';
  read(c);
  read(c);
  while c<> '-' do
    begin
      s:=s+c;
      read(c);
    end;
  for i:=length(s) downto 1 do
    niz[1][12-i]:=s[length(s)-i+1];
  s:='';
  read(c);
  while c in ['0'..'9'] do
    begin
      s:=s+c;
      read(c);
    end;
  for i:=length(s) downto 1 do
    niz[1][10-i]:=s[length(s)-i+1];
  s:='';
  readln;
  read(c);
  for i:=1 to 6 do
    begin

      while c in ['0'..'9'] do
        begin
          s:=s+c;
          read(c);
        end;
      for j:=length(s) downto 1 do
        case i of
          1:niz[2][14-j]:=s[length(s)-j+1];
          2:niz[2][16-j]:=s[length(s)-j+1];
          3:niz[2][18-j]:=s[length(s)-j+1];
          4:niz[2][12-j]:=s[length(s)-j+1];
          5:niz[2][10-j]:=s[length(s)-j+1];
          6:niz[2][8-j]:=s[length(s)-j+1];
        end;
      s:='';
      while NOT(c in ['0'..'9']) and not eoln and not (c in ['A','C','B']) do
        read(c);
    end;
  if c='A'
    then niz[2][1]:='1';
  read(c);
  readln;
  s:='';
  read(c);
  for i:=1 to 6 do
    begin

      while c in ['0'..'9'] do
        begin
          s:=s+c;
          read(c);
        end;
      for j:=length(s) downto 1 do
        case i of
          1:niz[3][14-j]:=s[length(s)-j+1];
          2:niz[3][16-j]:=s[length(s)-j+1];
          3:niz[3][18-j]:=s[length(s)-j+1];
          4:niz[3][12-j]:=s[length(s)-j+1];
          5:niz[3][10-j]:=s[length(s)-j+1];
          6:niz[3][8-j]:=s[length(s)-j+1];
        end;
      s:='';
      while NOT(c in ['0'..'9']) and not eoln and not (c in ['A','C','B']) do
        read(c);
    end;
  if c='A'
    then niz[3][1]:='1';
  if (niz[2][1]=niz[3][1]) and (niz[2][1]='0')
    then if niz[2]<niz[3]
           then begin
                 s:=niz[2];
                 niz[2]:=niz[3];
                 niz[3]:=s;
                end
           else
    else if niz[2]>niz[3]
           then begin
                 s:=niz[2];
                 niz[2]:=niz[3];
                 niz[3]:=s;
                end
           else ;

  if copy(niz[2],8,10)<=copy(niz[1],8,10)
     then resenje:=resenje+1;
  if copy(niz[3],8,10)>=copy(niz[1],8,10)
     then resenje:=resenje+1;

  val(copy(niz[2],2,6),prva,code);
  val(copy(niz[3],2,6),druga,code);
  if niz[2][1]='0'
    then prva:=-prva;
  if niz[3][1]='0'
    then druga:=-druga;
  if niz[2][1]<>niz[3][1]
    then resenje:=resenje-1;
  writeln(resenje+abs(prva-druga)-1);
end.
