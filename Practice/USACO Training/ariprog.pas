{
PROB:ariprog
ID:deximat1
LANG:PASCAL
}
type slog = record
               a,b:longint;
            end;
var n,m,p,q,a,nn,b,i,max,brs,brojac,brojaca,bisq,bb:longint;
    niz:array[-1..150000] of boolean;
    niz2:array[-1..100000] of longint;
    ijedan,trenutan:boolean;
    niz3:array[-1..1000] of slog;

procedure qs(levi,desni:longint);
  var i,j,pivot:longint;
      pom:longint;
  begin
    i:=levi;
    j:=desni;
    pivot:=niz2[(levi + desni) div 2];
    repeat
      while (niz2[i] < pivot)  do i:=i+1;
      while (pivot < niz2[j])  do j:=j-1;
      if i<=j
        then begin
               pom:=niz2[i];
               niz2[i]:=niz2[j];
               niz2[j]:=pom;
               i:=i+1;
               j:=j-1;
             end;
    until i>j;
    if levi < j then qs(levi,j);
    if i < desni then qs(i,desni);
  end;
procedure qs2(levi,desni:longint);
  var i,j,pivot2,pivot1:longint;
      pom:slog;
  begin
    i:=levi;
    j:=desni;
    pivot1:=niz3[(levi + desni) div 2].b;
    pivot2:=niz3[(levi + desni) div 2].a;
    repeat
      while (niz3[i].b < pivot1) or ( (niz3[i].b=pivot1) and (niz3[i].a<pivot2) ) do i:=i+1;
      while (pivot1 < niz3[j].b) or ( (niz3[j].b=pivot1) and (pivot2 < niz3[j].a)) do j:=j-1;
      if i<=j
        then begin
               pom:=niz3[i];
               niz3[i]:=niz3[j];
               niz3[j]:=pom;
               i:=i+1;
               j:=j-1;
             end;
    until i>j;
    if levi < j then qs2(levi,j);
    if i < desni then qs2(i,desni);
  end;
begin
  assign(input,'ariprog.in');
  assign(output,'ariprog.out');
  reset(input);
  rewrite(output);
  readln(n);
  readln(m);
  max:=m*m+m*m;
  brojaca:=1;
  for p:=0 to m do
    for q:=0 to m do
    begin
      bisq:=p*p+q*q;
      if not niz[bisq]
        then begin
               niz2[brojaca]:=bisq;
               brojaca:=brojaca+1;
             end;
      niz[bisq]:=true;

    end;
  qs(1,brojaca-1);
  b:=1;
  for a:=1 to brojaca-1 do
    begin
      trenutan:=true;
      b:=niz2[a+1]-niz2[a];
      bb:=2;
      while(b*(n-1)<=max) and ((bb+a)<=(brojaca-1))do
        begin
          brojac:=0;
          while((brojac<=n) and ((niz2[a]+brojac*b) <= max)) do
            if niz[niz2[a]+brojac*b]
              then brojac:=brojac+1
              else break;
          if brojac>=n
            then begin
                   brs:=brs+1;
                   niz3[brs].a:=niz2[a];
                   niz3[brs].b:=b;
                   ijedan:=true;
                 end
            else trenutan:=false;
          b:=niz2[a+bb]-niz2[a];
          bb:=bb+1;
        end;
    end;
    qs2(1,brs);
    if not ijedan
      then writeln('NONE')
      else for i:=1 to brs do
             writeln(niz3[i].a,' ',niz3[i].b);
end.
