var stub:array[0..51,0..2501] of boolean;
    mat:array[0..51,0..51] of integer;
    direktni:array[0..2501] of integer;
    stub2:array[0..51] of longint;
    y,x,i,j,budzet,parah,l,pocy,pocx,krajx,krajy,id,resp,resh,tpov:longint;
    ax,bx,by,ay:longint;
begin
  //assign(input,'output.txt'); reset(input);
  //assign(output,'output2.txt'); rewrite(output);
  //ucitavanje


  readln(y,x);
  for i:=y downto 1 do
    begin
      for j:=1 to x do
        read(mat[i,j]);
      readln;
    end;

  readln(budzet);
  //sledeca promenljiva oznacava maksimalan broj hektara sa trenutnim budzetom
  parah:=budzet div 1000000;
  //trenutno resenje povrsine je maxlongint jer se trazi najmanja
  resp:=1000000000;
  //brojim koliko ima id polja
  //stali
  for i:=1 to y do
    for j:=1 to x do
      if mat[i,j]<>0
        then inc(direktni[mat[i,j]]);

  //postavljam pocetnu tacku
  for pocy:=1 to y do
    for pocx:=1 to x do
      begin
        fillchar(stub,sizeof(stub),false);
        for i:=1 to 50 do
          stub2[i]:=0;
        //postavljam krajnju tacku
        for krajy:=pocy to y do
          for krajx:=pocx to x do
            begin
              tpov:=(krajy-pocy+1)*(krajx-pocx+1);
              if (tpov > parah)
                then break;
              id:=mat[krajy,krajx];
              for l:=krajx to x do
              begin
                if not stub[l,id]
                  then stub2[l]:=stub2[l]+direktni[id];
                stub[l,id]:=true;
              end;
              if (tpov>1) and (( stub2[krajx] > resh) or
                 ((stub2[krajx] = resh) and (tpov < resp)))
                then begin
                       resp:=tpov;

                       resh:=stub2[krajx];
                       ax:=pocx;
                       ay:=pocy;
                       bx:=krajx;
                       by:=krajy;
                     end;


            end;

      end;

  writeln(ax,' ',ay,' ',bx,' ',by);
  writeln(budzet - resp*1000000);
  writeln(resh);
  close(output);
end.
