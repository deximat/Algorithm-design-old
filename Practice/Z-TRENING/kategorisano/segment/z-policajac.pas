type nesto = record
               t,p,pp:longint;
             end;
var
	 i,j,n,m,a,b,k,tren,max:longint;
	 niz:array[0..31000] of nesto;
	 res:array[0..11000] of longint;
procedure sort(levi,desni:longint);
var i,j,pivot,pivot2:longint;
    pom:nesto;
  begin
    i:=levi;
    j:=desni;
    pivot:=niz[(levi+desni) div 2].p;
    pivot2:=niz[(levi+desni) div 2].t;
    repeat
      while (niz[i].p < Pivot) OR ((Niz[i].p = Pivot) and (Niz[i].t < Pivot2)) do i:=i+1;
      while (niz[j].p > Pivot) OR ((Niz[j].p = Pivot) and (Niz[j].t > Pivot2)) do j:=j-1;

      if i<=j
        then begin
               pom:=niz[i];
               niz[i]:=niz[j];
               niz[j]:=pom;
               i:=i+1;
               j:=j-1;
             end;
    until i > j;
    if levi<j then sort(levi,j);
    if i<desni then sort(i,desni);
  end;
begin
  readln(n);
  for i:=1 to n do
    begin
	  readln(a,b);
	  k:=k+1;
	  niz[k].t:=1;
	  niz[k].p:=a;
	  k:=k+1;
	  niz[k].t:=2;
	  niz[k].p:=b;
	end;
  sort(1,k);
  for i:=1 to k do
    begin
	case niz[i].t of
	  1:tren:=tren+1;
	  2:tren:=tren-1;
	end;
	if tren>max
	  then max:=tren;
	end;
  writeln(max);
end.
