{
ID:deximat1
PROG:apple
LANG:PASCAL
}
var graf:array[0..80000*2+1] of record
                             c1,c2:longint; //susedni cvorovi
                             t:longint; //tezina
                             next:longint; //adresa sledeceg suseda
                                                        end;
    idx:array[0..100000+1] of record
                          f,l,razdaljina:longint; // adresa prvog i poslednjeg
                          end;
    cvor1,resenje,i,cvor2,tezina,c,p,pb,pa1,pa2:longint;
    x:array[0..10*100000+1] of longint;
procedure insert(cvor1,cvor2,i,tezina:longint);
begin
      if idx[cvor1].f = 0
        then begin
                idx[cvor1].f:=i;
                idx[cvor1].l:=i;
              end
         else begin
                graf[idx[cvor1].l].next:=i;
                idx[cvor1].l:=i;
              end;  //ukoliko je prvi sused cvora1 na adresi 0, to znaci da je ovo prvi sused i dodeljujemo mu adresu trenutnog suseda
        //ubacujemo granu u niz graf

      graf[i].c1:=cvor1;
      graf[i].c2:=cvor2;
      graf[i].t:=tezina;
      //poslednjem susedu cvor1 dodeljujemo adresu na ovog suseda, kao sledeceg
end;
procedure dijkstra(start:longint);
var i:longint;
begin
  i:=idx[start].f;
  while graf[i].next<>0 do
    begin
      if  idx[graf[i].c2].razdaljina>(idx[start].razdaljina+graf[i].t)
        then begin
               idx[graf[i].c2].razdaljina:=idx[start].razdaljina+graf[i].t;
               dijkstra(graf[i].c2);
             end;
      i:=graf[i].next;
    end;
  if (idx[graf[i].c2].f<>0) and (idx[graf[i].c2].razdaljina>(idx[start].razdaljina+graf[i].t))
        then begin
               idx[graf[i].c2].razdaljina:=idx[start].razdaljina+graf[i].t;
               dijkstra(graf[i].c2);
             end
end;
procedure dijkstra2(start:longint);
var i,j,poc,kraj:longint;
begin
  x[1]:=start;
  poc:=1;
  kraj:=1;
  while poc<=kraj do
    begin
      j:=idx[x[poc]].f;
      while graf[j].next<>0 do
        begin
          if idx[graf[j].c2].razdaljina>idx[graf[j].c1].razdaljina+graf[j].t
            then begin
                   idx[graf[j].c2].razdaljina:=idx[graf[j].c1].razdaljina+graf[j].t;
                   kraj:=kraj+1;
                   x[kraj]:=graf[j].c2;
                 end;
          j:=graf[j].next;
        end;
      if (idx[graf[j].c2].razdaljina>idx[graf[j].c1].razdaljina+graf[j].t)and
         (j<>0)
            then begin
                   idx[graf[j].c2].razdaljina:=idx[graf[j].c1].razdaljina+graf[j].t;
                   kraj:=kraj+1;
                   x[kraj]:=graf[j].c2;
                 end;
      poc:=poc+1;
    end;

end;
procedure isprazni;
var i:longint;
begin
  for i:=1 to p do
    idx[i].razdaljina:=maxlongint;

end;

begin
  assign(input,'highway.pas');
  reset(input);
  read(p);
  read(c);
  read(pb);
  readln(pa1);
  for i:=1 to p do
    idx[i].razdaljina:=maxlongint;
  for i:=1 to c do
    begin
      readln(cvor1,cvor2,tezina);
      insert(cvor1,cvor2,i,tezina);
      insert(cvor2,cvor1,2*c+i,tezina);
    end;
  idx[pb].razdaljina:=0;
  dijkstra2(pb);
  //writeln('pa1:',idx[pa1].razdaljina,' pa2:',idx[pa2].razdaljina);
  if idx[pa1].razdaljina=maxlongint
    then writeln(-1)
    else writeln(idx[pa1].razdaljina);
end.
