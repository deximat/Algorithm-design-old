var izbaze,ubazu,ubazu2:qword;
    broj,broj2:string;
function cifra(c:char):longint;
begin
  if ((ord(c)>=48) and (ord(c)<=57)) or ((ord(c)<=90) and (ord(c)>=65) )
    then    case c of
               '0'..'9': cifra:=ord(c)-48;
               'A': cifra:=10;
               'B': cifra:=11;
               'C': cifra:=12;
               'D': cifra:=13;
               'E': cifra:=14;
               'F': cifra:=15;
               'G': cifra:=16;
            end
    else cifra:=maxlongint;
end;
function rcifra(broja:longint):char;
begin
  case broja of
    0..9: rcifra:=chr(broja+48);
    10: rcifra:='A';
    11: rcifra:='B';
    12: rcifra:='C';
    13: rcifra:='D';
    14: rcifra:='E';
    15: rcifra:='F';
    16: rcifra:='G';
 end;
end;
procedure proveri();
var i,j,pocetak,kraj:longint;
    dekadni:qword;
begin
  read(izbaze,ubazu);
  BROJ2:='';
  readln(broj);
  pocetak:=1;
  dekadni:=0;
  while((broj[pocetak]=' ') {or (broj[pocetak]='0')})do pocetak:=pocetak+1;
  kraj:=length(broj);
  while(broj[kraj]=' ') do kraj:=kraj-1;
  for i:=pocetak to kraj do
    if cifra(broj[i]) < izbaze
      then dekadni:=dekadni*izbaze+cifra(broj[i])
      else begin
             for j:=pocetak to kraj do
               write(broj[j]);
             writeln(' is an illegal base ',izbaze,' number');

             exit;
           end;
  ubazu2:=ubazu;
  while(dekadni div ubazu2)<> 0 do
    ubazu2:=ubazu*ubazu2;
  ubazu2:=ubazu2 div ubazu;
  while(ubazu2>1) do
    begin
      broj2:=broj2+rcifra(dekadni div ubazu2);
      dekadni:=dekadni - (dekadni div ubazu2) * ubazu2;
      ubazu2:=ubazu2 div ubazu;
    end;
  broj2:=broj2+rcifra(dekadni div ubazu2);
  for i:=pocetak to kraj do
    write(broj[i]);
  write(' base ',izbaze,' = ');
  for i:=1 to length(broj2) do
    write(broj2[i]);
  writeln(' base ',ubazu);
end;
begin
  {assign(input,'input.txt');
  reset(input);}
  while not(EOF) do
    proveri;
end.
