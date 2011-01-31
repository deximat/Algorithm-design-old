{
ID:deximat
PROG:traffic
LANG:PASCAL
}
{$inline on}
type th = record
            f,l,razdaljina,pp,pb:longint;
	    b:array[0..1] of longint;
          end;
var graf:array[0..200000*2+1] of record
                             c1,c2:longint; //susedni cvorovi
                             t:longint; //tezina
                             next:longint; //adresa sledeceg suseda
                                                        end;
    idx:array[0..100000+1] of th;
    heap:array[0..100000+2] of longint;
    cvor1,resenje,i,cvor2,tezina,c,p,pb,pa1,pa2,ph,s,d,n,m:longint;
    bb:char;
function proveri(cvor,t:longint):longint;
  var c:longint;
  begin
    c:=idx[cvor].pb;
    if t-idx[cvor].pp >= 0
	  then begin
	         t:=t-idx[cvor].pp;
	         c:=1-c;
	       end;
     while t - idx[cvor].b[c] >= 0 do
	   begin
	     t:=t-idx[cvor].b[c];
	     c:=1-c;
	   end;
	 proveri:=c;
  end;
function cekanje(cvor1,cvor2,tVreme:longint):longint;
    begin
      for i:=0 to 300 do
	    if proveri(cvor1,tVreme+i)=proveri(cvor2,tVreme+i)
		  then begin
		         cekanje:=i;
		         exit;
		       end;
	  cekanje:=1000000000;
    end;
procedure push(element:longint)inline;
var temp:longint;
    trenPoz:longint;
begin
  ph:=ph+1;
  heap[ph]:=element;

  //trazenje pozicije
  trenPoz:=ph;
  while (idx[heap[trenPoz]].razdaljina<idx[heap[trenPoz shr 1]].razdaljina) and (trenPoz shr 1>0) do
    begin
      temp:=heap[trenPoz];
      heap[trenPoz]:=heap[trenPoz shr 1];
      heap[trenPoz shr 1]:=temp;
      trenPoz:=trenPoz shr 1;
    end;

end;
procedure pop();
var nasao:boolean;
    trenPoz:longint;
    temp:longint;
begin
  nasao:=true;
  heap[1]:=heap[ph];
  heap[ph]:=0;
  ph:=ph-1;

  //trazenje pozicije
  trenPoz:=1;
  while trenPoz<=ph do
  if idx[heap[trenPoz shl 1]].razdaljina > idx[heap[trenPoz shl 1 + 1]].razdaljina
    then if idx[heap[trenPoz]].razdaljina>idx[heap[trenPoz shl 1 + 1]].razdaljina
           then begin
                  temp:=heap[trenPoz];
                  heap[trenPoz]:=heap[trenPoz shl 1 + 1];
                  heap[trenPoz shl 1 + 1]:=temp;
                  trenPoz:=trenPoz shl 1 + 1;
                end
           else break

    else if idx[heap[trenPoz]].razdaljina>idx[heap[trenPoz shl 1]].razdaljina
           then begin
                  temp:=heap[trenPoz];
                  heap[trenPoz]:=heap[trenPoz shl 1];
                  heap[trenPoz shl 1]:=temp;
                  trenPoz:=trenPoz shl 1;
                end
           else break
end;
procedure insert(cvor1,cvor2,i,tezina:longint)inline;
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
var i,j:longint;
begin

  while ph>0 do
    begin

      j:=idx[heap[1]].f;
      while graf[j].c1<>0 do
        begin
          if idx[graf[j].c2].razdaljina > idx[graf[j].c1].razdaljina+graf[j].t + cekanje(graf[j].c1,graf[j].c2,idx[graf[j].c1].razdaljina)
            then begin
                   idx[graf[j].c2].razdaljina:=idx[graf[j].c1].razdaljina+graf[j].t + cekanje(graf[j].c1,graf[j].c2,idx[graf[j].c1].razdaljina);
                   push(graf[j].c2);
                 end;
          j:=graf[j].next;
        end;
      pop;
    end;
end;
begin
  assign(input,'traffic.in');
  reset(input);
  assign(output,'traffic.out');
  rewrite(output);


  readln(s,d);//pocetak i kraj
  readln(n,m);//cvorovi i grane

  //ucitavam opise cvorova
  for i:=1 to n do
    begin
      readln(bb,idx[i].pp,idx[i].b[0],idx[i].b[1]);
	  if bb='B'
	    then idx[i].pb:=0
		else idx[i].pb:=1;
	end;
  for i:=1 to m do
    begin
      readln(cvor1,cvor2,tezina);
      if (idx[cvor1].pp=idx[cvor2].pp) and
          (idx[cvor1].b[0]=idx[cvor2].b[1]) and
          (idx[cvor1].b[1]=idx[cvor2].b[0])
      then continue;
      insert(cvor1,cvor2,i,tezina);
      insert(cvor2,cvor1,m+i,tezina);
    end;
  for i:=1 to n do
    idx[i].razdaljina:=maxlongint;
  idx[s].razdaljina:=0;
  idx[0].razdaljina:=maxlongint;

  push(s);
  dijkstra(s);

  if idx[d].razdaljina=maxlongint
    then writeln(0)
    else writeln(idx[d].razdaljina);
  close(output);
end.
