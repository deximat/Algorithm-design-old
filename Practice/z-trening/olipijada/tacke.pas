type slog = record
              x,y:longint;
              koef:real;
            end;
var n,i,k,m,brojn,j:longint;
    t,trmax:int64;
    niz:array[0..100000] of slog;
    omotac1,omotac2:array[0..100000] of slog;
    temp:slog;
procedure quicksort(levi,desni:longint);
var i,j:longint;
    pivot:real;
    pom:slog;
  begin
    pivot:=niz[(levi + desni) div 2].koef;
    i:=levi;
    j:=desni;
    repeat
      while niz[i].koef < pivot do i:=i+1;
      while niz[j].koef > pivot do j:=j-1;
      if i <= j
        then begin
               pom:=niz[i];
               niz[i]:=niz[j];
               niz[j]:=pom;
               i:=i+1;
               j:=j-1;
             end;
    until i > j;
    if levi < j then quicksort(levi,j);
    if i < desni then quicksort(i,desni);
  end;
begin
  read(n);
  niz[0].x:=maxlongint;
  niz[0].y:=maxlongint;
  for i:=1 to n do
    begin
      read(niz[i].x,niz[i].y);
      if (niz[i].x<niz[k].x) or ((niz[i].x=niz[k].x) and (niz[i].y<niz[k].y))
        then k:=i;
    end;
  temp:=niz[k];
  niz[k]:=niz[1];
  niz[1]:=temp;
  for i:=2 to n do
    if niz[i].x<>niz[1].x
      then niz[i].koef:=(niz[i].y-niz[1].y)/(niz[i].x-niz[1].x)
      else niz[i].koef:=maxlongint;
  quicksort(2,n);
  omotac1[1]:=niz[1];
  omotac1[2]:=niz[2];
  n:=n+1;
  niz[n]:=niz[1];
  k:=2;
  for i:=3 to n do
    begin
      k:=k+1;
      omotac1[k]:=niz[i];
      while (k>=2) and ((omotac1[k-1].y-omotac1[k-2].y)*(omotac1[k].x-omotac1[k-2].x)-(omotac1[k].y-omotac1[k-2].y)*(omotac1[k-1].x-omotac1[k-2].x)>= 0) do
        begin
          k:=k-1;
          omotac1[k]:=niz[i];
        end;
    end;
  brojn:=k;
  //drugi omotac
  k:=0;
  read(m);
  niz[0].x:=maxlongint;
  niz[0].y:=maxlongint;
  for i:=1 to m do
    begin
      read(niz[i].x,niz[i].y);
      if (niz[i].x<niz[k].x) or ((niz[i].x=niz[k].x) and (niz[i].y<niz[k].y))
        then k:=i;
    end;
  temp:=niz[k];
  niz[k]:=niz[1];
  niz[1]:=temp;
  for i:=2 to m do
    if niz[i].x<>niz[1].x
      then niz[i].koef:=(niz[i].y-niz[1].y)/(niz[i].x-niz[1].x)
      else niz[i].koef:=maxlongint;
  quicksort(2,m);
  omotac2[1]:=niz[1];
  omotac2[2]:=niz[2];
  m:=m+1;
  niz[m]:=niz[1];
  k:=2;
  for i:=3 to m do
    begin
      k:=k+1;
      omotac2[k]:=niz[i];
      while (k>=2)and((omotac2[k-1].y-omotac2[k-2].y)*(omotac2[k].x-omotac2[k-2].x)-(omotac2[k].y-omotac2[k-2].y)*(omotac2[k-1].x-omotac2[k-2].x)>= 0) do
        begin
          k:=k-1;
          omotac2[k]:=niz[i];
        end;
    end;
 for i:=1 to brojn do
   for j:=1 to k do
     begin
      t:= sqr(omotac1[i].x-omotac2[j].x)+sqr(omotac1[i].y-omotac2[j].y);
     if trmax< t
       then trmax:= t;
     end;
 writeln(sqrt(trmax):0:3);
end.
