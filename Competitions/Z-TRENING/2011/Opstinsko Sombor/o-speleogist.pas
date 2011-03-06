{$inline on}
var idx:array[0..100002] of record
                        f,l,pred,veze:longint;
                        p:boolean;
                        dubina:int64;
                      end;
   graf:array[0..200002] of record
                         c1,c2,t,next:longint;
                      end;
   resenje:array[0..100001] of longint;
   i,j,n,a,b,t,trazeni:longint;
   max:int64;
procedure dfs(v:longint);
var i:longint;
begin
  i:=idx[v].f;
  while graf[i].next<>0 do
    begin
      if  (idx[graf[i].c2].dubina < idx[graf[i].c1].dubina + graf[i].t) and not idx[graf[i].c2].p
        then begin
               idx[graf[i].c2].dubina:=idx[graf[i].c1].dubina + graf[i].t;
               idx[graf[i].c2].pred:=graf[i].c1;
               idx[graf[i].c2].p:=true;
               dfs(graf[i].c2);
             end;
      i:=graf[i].next;
    end;
  if (idx[v].f <> 0) and   not idx[graf[i].c2].p  and
     ( idx[graf[i].c2].dubina < idx[graf[i].c1].dubina + graf[i].t)
    then begin
               idx[graf[i].c2].dubina:=idx[graf[i].c1].dubina + graf[i].t;
               idx[graf[i].c2].pred:=graf[i].c1;
               idx[graf[i].c2].p:=true;
               dfs(graf[i].c2);
         end;
end;
procedure insert(a,b,t,i:longint);
begin
  if idx[a].f=0
    then begin
           idx[a].f:=i;
           idx[a].l:=i;
         end
    else begin
           graf[idx[a].l].next:=i;
           idx[a].l:=i;
         end;
  graf[i].c1:=a;
  graf[i].c2:=b;
  inc(idx[a].veze);
  inc(idx[b].veze);
  graf[i].t:=t;

end;
begin
  //assign(input,'haha.txt'); reset(input);
  readln(n);
  for i:=1 to n-1 do
    begin
      readln(a,b,t);
      insert(a,b,t,i);
      insert(b,a,t,i+(n-1));
    end;
   idx[1].p:=true;
   dfs(1);
   for i:=1 to n do
    if (max<idx[i].dubina)
      then  begin
              trazeni:=i;
              max:=idx[i].dubina;
            end;
  j:=0;
  i:=trazeni;
  while idx[i].pred<>0 do
    begin
      j:=j+1;
      resenje[j]:=i;
      i:=idx[i].pred;
    end;
  if i<>resenje[j]
    then begin
           j:=j+1;
           resenje[j]:=i;
         end;
  writeln(max);
  for i:=j downto 1 do
    writeln(resenje[i]);
end.
