const atomi:set of char = ['C','O','H','N'];
var matrica:array[-1..2002,-1..2002] of char;
    i,n,j,b,atoma,max:longint;
procedure bfs(i,j:longint);
  var pocetak,kraj,f:longint;
      qx,qy:array[1..1000000] of longint;

  begin
    atoma:=1;
    pocetak:=1;
    kraj:=1;
    qx[1]:=i;
    qy[1]:=j;
    while pocetak<=kraj do
      begin
          if matrica[qx[pocetak]+1,qy[pocetak]]='|'
            then begin
                   atoma:=atoma+1;
                   kraj:=kraj+1;
                   matrica[qx[pocetak]+1,qy[pocetak]]:='X';
                   qx[kraj]:=qx[pocetak]+2;
                   qx[kraj]:=qy[pocetak];
                 end;
          if matrica[qx[pocetak]-1,qy[pocetak]]='|'
            then begin
                   atoma:=atoma+1;
                   kraj:=kraj+1;
                   matrica[qx[pocetak]-1,qy[pocetak]]:='X';
                   qx[kraj]:=qx[pocetak]-2;
                   qx[kraj]:=qy[pocetak];
                 end;
          if matrica[qx[pocetak],qy[pocetak]-1]='-'
            then begin
                   atoma:=atoma+1;
                   kraj:=kraj+1;
                   matrica[qx[pocetak],qy[pocetak]-1]:='X';
                   qx[kraj]:=qx[pocetak];
                   qx[kraj]:=qy[pocetak]-2;
                 end;
          if matrica[qy[pocetak],qy[pocetak]+1]='-'
            then begin
                   atoma:=atoma+1;
                   kraj:=kraj+1;
                   matrica[qx[pocetak],qy[pocetak]+1]:='X';
                   qx[kraj]:=qx[pocetak];
                   qx[kraj]:=qy[pocetak]+2;
                 end;
          pocetak:=pocetak+1;
      end;
  end;
begin
  readln(n);
  for i:=1 to n do
   begin
    for j:=1 to n do
      read(matrica[i,j]);
    readln;
   end;
   for i:=1 to n do
    for j:=1 to n do
      if matrica[i,j] in atomi
        then begin
               matrica[i,j]:='X';
               BFS(i,j);
               if atoma > max then max:=atoma;
             end;
   writeln(atoma);
end.
