var niz:array[0..11,0..11] of char;
    niz2:array[0..11,0..11] of boolean;
    n,m,i,j,k:longint;
    s:string;
procedure popuni(i,j,ik,jk,pomi,pomj:longint);
begin
  while(i<>ik) or (j<>jk)do
      begin
        niz2[i,j]:=true;
        inc(j,pomj);
        inc(i,pomi);
      end;
 niz2[ik,jk]:=true;
end;
procedure nadji(s:string;i,j,pomi,pomj:longint);
  var mesto,poci,pocj:longint;
  begin
    mesto:=1;
    poci:=i;
    pocj:=j;
    while(j<=n) and (i<=n) and (i>0) and (j>0)do
      begin
        if niz[i,j]=s[mesto]
          then mesto:=mesto+1
          else exit;
        if mesto = length(s)+1
          then begin
                 popuni(poci,pocj,i,j,pomi,pomj);
                 exit;
               end;
        inc(j,pomj);
        inc(i,pomi);
      end;
  end;
begin
  readln(n);
  for i:=1 to n do
    begin
      for j:=1 to n do
        read(niz[i,j]);
      readln;
    end;
  readln(m);
  for k:=1 to m do
    begin
      readln(s);
      for i:=1 to n do
        for j:=1 to n do
          begin
            nadji(s,i,j,1,0);
            nadji(s,i,j,-1,0);
            nadji(s,i,j,0,1);
            nadji(s,i,j,0,-1);
            nadji(s,i,j,1,1);
            nadji(s,i,j,-1,-1);
            nadji(s,i,j,-1,1);
            nadji(s,i,j,1,-1);
          end;
    end;
  s:='';
  for i:=1 to n do
    for j:=1 to n do
      if not niz2[i,j]
        then s:=s+niz[i,j];
  writeln(s);
end.
