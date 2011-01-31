{
ID:deximat1
PROG:chocmilk
LANG:PASCAL
}
var graf:array[0..100000+1] of record
                             c1,c2:longint; //susedni cvorovi
                             //t:longint; //tezina
                             next:longint; //adresa sledeceg suseda
                                   end;
     idx:array[0..100001] of record
                            f,l:longint; // adresa prvog i poslednjeg
                            broj:longint;
                            ulaz,izlaz:longint;
                            baza,muzara:boolean;
                          end;
     povezan:boolean;
     muzara:array[0..100001] of longint;
     n,m,i,j,cvor1,cvor2,b,kreni:longint;
     queue:array[0..100004] of longint;
procedure insert(cvor1,cvor2,i:longint);
    begin
      if idx[cvor1].f = 0
        then begin
               idx[cvor1].f:=i;  //ukoliko je prvi sused cvora1 na adresi 0, to znaci da je ovo prvi sused i dodeljujemo mu adresu trenutnog suseda
               idx[cvor1].l:=i;
             end
        else begin
               graf[idx[cvor1].l].next:=i;
               idx[cvor1].l:=i;
             end;
        //ubacujemo granu u niz graf

      graf[i].c1:=cvor1;
      graf[i].c2:=cvor2;

    end;

procedure dfs(f:longint);
var i:longint;
begin
   i:=idx[f].f;
   idx[f].broj:=m;
   while graf[i].next<>0 do
     begin
       dfs(graf[i].c2);
       i:=graf[i].next;
     end;
   if i<>0
     then dfs(graf[i].c2);
end;
function bfs():longint;
  var pocetak,kraj,i:longint;
  begin
    pocetak:=1;
    kraj:=m;
    for i:=1 to m do
      queue[i]:=muzara[i];

    while pocetak<=kraj do
      begin
        idx[queue[pocetak]].broj:=idx[queue[pocetak]].broj+1;
        if idx[queue[pocetak]].broj=m
          then begin
                 bfs:=queue[pocetak];
                 exit;
               end;
        i:=idx[queue[pocetak]].f;
        while graf[i].next<>0 do
          begin
            kraj:=kraj+1;

            queue[kraj]:=graf[i].c2;
            i:=graf[i].next;
          end;
        if i<>0
         then begin
                 kraj:=kraj+1;
                 queue[kraj]:=graf[i].c2;
              end;
        pocetak:=pocetak+1;
      end;
  end;
begin
assign(input,'chocmilk.in'); reset(input);
assign(output,'chocmilk.out'); rewrite(output);
readln(n);
For i:=1 to n-1 do
      begin
        readln(cvor1,cvor2);  //ucitava susedne cvorove
        idx[cvor1].izlaz:=idx[cvor1].izlaz+1;
        idx[cvor2].ulaz:=1;
        {idx[cvor1].postoji:=true;
        idx[cvor2].postoji:=true;
        idx2[cvor2].postoji:=true;
        idx2[cvor1].postoji:=true;   }
        insert(cvor1,cvor2,i); //ubacuje granu u graf na mesto i
        //insert2(cvor2,cvor1,i);
      end;
for i:=1 to n do
  if (idx[i].izlaz>0) and not (idx[i].ulaz>0)
    then begin
           m:=m+1;
           muzara[m]:=i;
           idx[i].muzara:=true;
         end;
for i:=1 to n do
  if not (idx[i].izlaz>0) and (idx[i].ulaz>0)
    then begin
           b:=b+1;
           idx[i].baza:=true;
         end;

  kreni:=bfs;
  while(idx[kreni].izlaz=1)do
    begin
      idx[kreni].broj:=m;
      kreni:=graf[idx[kreni].f].c2;
    end;
  idx[kreni].broj:=m;
  for i:=1 to n do
    if (idx[i].broj=m)and not((b>1)and idx[i].baza) and not idx[i].muzara
      then if (idx[i].izlaz>1)
            then begin
                   writeln(i);
                   break;
                 end
            else writeln(i);

  close(output);
end.
