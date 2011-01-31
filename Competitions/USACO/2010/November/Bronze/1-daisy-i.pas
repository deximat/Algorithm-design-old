{
ID:deximat1
PROG:daisy
LANG:PASCAL
}
var idx:array[0..500] of record
                     f,l:longint;
                     p:boolean;
                   end;
    graf:array[0..65000] of record
                       c1,c2,next:longint;
                     end;
    i,n,m,a,b:longint;
    ima:boolean;
procedure dfs(v:longint);
var i:longint;
begin
  idx[v].p:=true;
  i:=idx[v].f;
  while graf[i].next<>0 do
    begin
      if not idx[graf[i].c2].p
        then dfs(graf[i].c2) ;
      i:=graf[i].next;
    end;
  if (idx[v].f <> 0) and not idx[graf[i].c2].p
    then dfs(graf[i].c2);
end;
procedure insert(a,b,i:longint);
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

end;
begin
  assign(input,'daisy.in'); reset(input);
  assign(output,'daisy.out'); rewrite(output);
  readln(n,m);
  for i:=1 to m do
    begin
      readln(a,b);
      insert(a,b,i);
      insert(b,a,i+m);
    end;
  dfs(1);
  for i:=1 to n do
    if not idx[i].p
     then begin
            writeln(i);
            ima:=true;
          end;
  if not ima
    then writeln(0);
  close(output);
end.