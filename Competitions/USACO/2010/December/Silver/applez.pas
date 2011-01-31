{
 PROG: apple
 LANG: PASCAL
 ID: Zuma9992
}
{$M 15000000}
{$inline on}
Uses Math;
var hs,s,f1,f2,n,m,len:Longint;
    Used : array[0..100001] of Boolean;
    d : array[0..100001] of Longint;
    v,l,head,w:array[0..400001] of longint;
    h,ih:array[0..100001] of longint;
Procedure Swap(var o,o2: longint);
var buf:longint;
begin
 buf:=o; o:=o2; o2:=buf;
end;
procedure addvertex(a , b, c :longint)inline;
begin
 inc(len);        //povecava mesto na kome ce se nalaziti grana
 v[len]:=b;       //v je cvor ka kome vodi grana
 l[len]:=head[a]; //l je adresa predhodni cvora, istog suseda
 w[len]:=c;       //w je tezina grane
 head[a]:=len;    //ovaj postaje predhodni
end;
procedure Siftdown inline;
var cur,x:longint;
begin
 cur:=1;        //trenutni
 While cur shl 1<=hs do begin
 	x:=cur;
 	if (cur shl 1<=hs) and (d[h[x]] > d[h[cur shl 1]])
          then x:=cur shl 1;
 	if ((cur shl 1) + 1 <=hs) and (d[h[x]] > d[h[(cur shl 1) + 1]])
          then x:=(cur shl 1) + 1;
 	if cur = x
          then break
          else begin
 	  	Swap(ih[h[cur]],ih[h[x]]);
 	  	Swap(h[cur],h[x]);
 	  	cur:=x;
 	       end;
 end;
end;
Function getmin : longint inline;
begin
 If (hs <=0) or (d[h[1]] = maxlongint)
   then  getmin:=-1
   else begin
        	getmin:=h[1];      //uzima sa vrha heap-a
        	ih[h[1]]:=-1;      //u indexu upisuje da je obrisan cvor
        	h[1]:=h[hs];       //na vrh stavlja poslednjeg
        	ih[h[1]]:=1;       //postavlja index poslednjeg
        	h[hs]:=0;          //brise poslednjeg u hipu
        	dec(hs);           //smanjuje broj clanova heap-a
                Siftdown;
        end;
end;
Procedure Siftup(x : Longint) inline;
begin
 While  ( x > 1 ) and (d[h[x]] < d[h[x shr 1]]) do
   begin
 	Swap(ih[h[x]], ih[h[x shr 1]]);
 	Swap(h[x], h[x shr 1]);
 	x:=x shr 1;
   end;
end;
Function Dist ( a , b:longint) : longint;
var i,j:longint;
begin
 hs:=n;
 For i:=1 to n do begin    //puni heap
 	used[i]:=false;    //da li je koristen
 	d[i]:=MaxLongint;  //udaljenost cvora
 	ih[i]:=i;          //indexsiran heap
 	h[i]:=i;           //heap
 end;
 Swap(h[a],h[1]);
 Swap(ih[a] , ih[1]);
 d[a]:=0;
 While Not Used[b] do begin
 	i:=GetMin;
 	if i = -1 then Break else begin
 		Used[i]:=true;
 		j:=head[i];
 		While j > 0 do begin
 		   If (Not Used[v[j]]) and (d[i] + w[j] < d[v[j]]) then begin
 		   	d[v[j]]:=d[i] + w[j];
 		   	Siftup(ih[v[j]]);
 		   end;
 		 j:=l[j];
 		end;
 	end;
 end;
 dist:=d[b];
end;
Function Path1 : longint;
begin
 Path1:= Dist(s, f1) + dist(f1, f2);
end;
Function Path2 : longint;
begin
 Path2:= Dist(s, f2) + Dist( f2 , f1 );
end;
Procedure reading;
var a,b,c,i:longint;
begin
 readln(m,n,s,f1,f2); len:=0;
 //len je mesto na koje ide grana grafa
 For i:=1 to m do begin
  readln(a,b,c);
  addvertex(a,b,c);  //dodaje granu
  addvertex(b,a,c);  //dodaje drugi smer grane
 end;
 writeln(Min( Path1, Path2 ));
end;
begin
 assign(input,'apple.in');
 reset(input);
 assign(output,'apple.out');
 rewrite(output);
  reading;
 close(input);
 close(output);
end.
