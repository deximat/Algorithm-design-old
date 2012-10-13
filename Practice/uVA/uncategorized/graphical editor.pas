const xx:array[1..4] of longint = (0,1,-1,0);
      yy:array[1..4] of longint = (1,0,0,-1);
var m,n,i,j,a,b,x1,x2,y1,y2,x,y:longint;
    c,k,o:char;
    s:string;
    matrica:array[0..300,0..300] of char;
procedure dfs(a,b:longint);
VAR i:longint;
begin
  matrica[a,b]:=o;
  for i:=1 to 4 do
    if (matrica[a+xx[i],b+yy[i]] = k)  and (a+xx[i]<=m) and (b+yy[i]<=n) and
       (a+xx[i] > 0) and (b+yy[i] > 0)
      then dfs(a+xx[i],b+yy[i]);
end;

procedure bfs(pocx,pocy:integer);
var pocetak,kraj,f:longint;
    qx,qy:array[1..660000] of integer;
begin
  pocetak:=1;
  kraj:=1;
  qx[1]:=pocx;
  qy[1]:=pocy;
  matrica[pocx,pocy]:=o;
  while pocetak<=kraj do
   begin
     for f:=1 to 4 do
      if (matrica[qx[pocetak]+xx[f],qy[pocetak]+yy[f]]=k)  and (a+xx[i]<=m) and (b+yy[i]<=n) and
       (a+xx[i] > 0) and (b+yy[i] > 0)
        then begin
               kraj:=kraj+1;
               matrica[qx[pocetak]+xx[f],qy[pocetak]+yy[f]]:=o;
               qx[kraj]:=qx[pocetak]+xx[f];
               qy[kraj]:=qy[pocetak]+yy[f];
             end;
     pocetak:=pocetak+1;
   end;
end;

begin
  //assign(input,'input.in');
  //reset(input);
  //assign(output,'bla.txt');
  //rewrite(output);
  read(c);
  while(c<>'X') do
    begin
    case c of
       'I':begin
             readln(m,n);
             fillchar(matrica,sizeof(matrica),'O');
           end;
       'C':  fillchar(matrica,sizeof(matrica),'O');
       'L': begin
              read(a,b);
              readln(s);
              for i:=1 to length(s) do
                if s[i] in ['A'..'Z']
                  then break;
              matrica[a,b]:=s[i];
            end;
       'V': begin
              read(x,y1,y2);
              readln(s);
              for i:=1 to length(s) do
                if s[i] in ['A'..'Z']
                  then break;
              for j:=y1 to y2 do
                matrica[x,j]:=s[i];
              for j:=y2 to y1 do
                matrica[x,j]:=s[i];
            end;
       'H':begin
             read(x1,x2,y);
             readln(s);
             for i:=1 to length(s) do
                if s[i] in ['A'..'Z']
                  then break;
             for j:=x1 to x2 do
                matrica[j,y]:=s[i];
             for j:=x2 to x1 do
                matrica[j,y]:=s[i];
           end;
       'K':begin
             read(x1,y1,x2,y2);
             readln(s);
             for i:=1 to length(s) do
                if s[i] in ['A'..'Z']
                  then break;
             a:=i;
             if x2<x1
               then begin
                     b:=x2;
                     x2:=x1;
                     x1:=b;
                    end;
             if y2<y1
               then begin
                     b:=y2;
                     y2:=y1;
                     y1:=b;
                    end;
             if x2>m
               then x2:=m ;
             if y2>n
               then y2:=n;
             for i:=x1 to x2 do
               for j:=y1  to y2 do
                 matrica[i,j]:=s[a];

           end;
       'F':begin
             read(a,b);
             readln(s);
             for i:=1 to length(s) do
                if s[i] in ['A'..'Z']
                  then break;
             k:=matrica[a,b];
             o:=s[i];
             if (k<>o) and (a<=m) and (b<=n) and (a > 0) and (b > 0)
               then dfs(a,b);
           end;
       'S':begin

             readln(s);
             for i:=1 to length(s) do
                if ORD(s[i]) >= ORD('(')
                  then break;

             while (ORD(s[i]) >= ORD('(')) and (length(s)>=i)  do
               begin
                 write(s[i]);
                 i:=i+1;
               end;
             writeln;
             for i:=1 to n do
             begin
               for j:=1 to m do
                 write(matrica[j,i]);
               writeln;
             end;
           end;
       else readln(s);

    end;
    read(c);
    end;
  close(output);
end.
