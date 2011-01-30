var s,i,j,f:longint;
    cc:CHAR;
    c:string;
    matrica:array[0..500,0..500] of char;
procedure osam(poc:longint);
  var j,red,kolona:longint;
  begin
    //gore horizontal
    red:=1;
    for kolona:=poc+2 to poc+1+s do
      matrica[red,kolona]:='-';
    //srednja horizontal
    red:=s+2;
    for kolona:=poc+2 to poc+1+s do
      matrica[red,kolona]:='-';
    //dole horizontal
    red:=2*s+3;
    for kolona:=poc+2 to poc+1+s do
      matrica[red,kolona]:='-';
    //levo uspravno gore
    kolona:=poc+1;
    for red:=2 to 1+s do
      matrica[red,kolona]:='|';
    //levo uspravno dole
    for red:=3+s to 2+2*s do
      matrica[red,kolona]:='|';
    //desno uspravno gore
    kolona:=poc+s+2;
    for red:=2 to 1+s do
      matrica[red,kolona]:='|';
    //desno uspravno dole
    for red:=3+s to 2+2*s do
      matrica[red,kolona]:='|';
  end;
procedure nula(poc:longint);
  var j,red,kolona:longint;
  begin
    //gore horizontal
    red:=1;
    for kolona:=poc+2 to poc+1+s do
      matrica[red,kolona]:='-';
    //dole horizontal
    red:=2*s+3;
    for kolona:=poc+2 to poc+1+s do
      matrica[red,kolona]:='-';
    //levo uspravno gore
    kolona:=poc+1;
    for red:=2 to 1+s do
      matrica[red,kolona]:='|';
    //levo uspravno dole
    for red:=3+s to 2+2*s do
      matrica[red,kolona]:='|';
    //desno uspravno gore
    kolona:=poc+s+2;
    for red:=2 to 1+s do
      matrica[red,kolona]:='|';
    //desno uspravno dole
    for red:=3+s to 2+2*s do
      matrica[red,kolona]:='|';
  end;
procedure jedan(poc:longint);
  var j,red,kolona:longint;
  begin
    //desno uspravno gore
    kolona:=poc+s+2;
    for red:=2 to 1+s do
      matrica[red,kolona]:='|';
    //desno uspravno dole
    for red:=3+s to 2+2*s do
      matrica[red,kolona]:='|';
  end;
procedure dva(poc:longint);
  var j,red,kolona:longint;
  begin
    //gore horizontal
    red:=1;
    for kolona:=poc+2 to poc+1+s do
      matrica[red,kolona]:='-';
    //srednja horizontal
    red:=s+2;
    for kolona:=poc+2 to poc+1+s do
      matrica[red,kolona]:='-';
    //dole horizontal
    red:=2*s+3;
    for kolona:=poc+2 to poc+1+s do
      matrica[red,kolona]:='-';
    //levo uspravno gore
    kolona:=poc+1;
    //levo uspravno dole
    for red:=3+s to 2+2*s do
      matrica[red,kolona]:='|';
    //desno uspravno gore
    kolona:=poc+s+2;
    for red:=2 to 1+s do
      matrica[red,kolona]:='|';
    //desno uspravno dole
  end;

procedure tri(poc:longint);
  var j,red,kolona:longint;
  begin
    //gore horizontal
    red:=1;
    for kolona:=poc+2 to poc+1+s do
      matrica[red,kolona]:='-';
    //srednja horizontal
    red:=s+2;
    for kolona:=poc+2 to poc+1+s do
      matrica[red,kolona]:='-';
    //dole horizontal
    red:=2*s+3;
    for kolona:=poc+2 to poc+1+s do
      matrica[red,kolona]:='-';
    //desno uspravno gore
    kolona:=poc+s+2;
    for red:=2 to 1+s do
      matrica[red,kolona]:='|';
    //desno uspravno dole
    for red:=3+s to 2+2*s do
      matrica[red,kolona]:='|';
  end;
procedure cetiri(poc:longint);
  var j,red,kolona:longint;
  begin
    //srednja horizontal
    red:=s+2;
    for kolona:=poc+2 to poc+1+s do
      matrica[red,kolona]:='-';
    //levo uspravno gore
    kolona:=poc+1;
    for red:=2 to 1+s do
      matrica[red,kolona]:='|';
    //desno uspravno gore
    kolona:=poc+s+2;
    for red:=2 to 1+s do
      matrica[red,kolona]:='|';
    //desno uspravno dole
    for red:=3+s to 2+2*s do
      matrica[red,kolona]:='|';
  end;
procedure pet(poc:longint);
  var j,red,kolona:longint;
  begin
    //gore horizontal
    red:=1;
    for kolona:=poc+2 to poc+1+s do
      matrica[red,kolona]:='-';
    //srednja horizontal
    red:=s+2;
    for kolona:=poc+2 to poc+1+s do
      matrica[red,kolona]:='-';
    //dole horizontal
    red:=2*s+3;
    for kolona:=poc+2 to poc+1+s do
      matrica[red,kolona]:='-';
    //levo uspravno gore
    kolona:=poc+1;
    for red:=2 to 1+s do
      matrica[red,kolona]:='|';
    //levo uspravno dole
    //desno uspravno gore
    kolona:=poc+s+2;
    //desno uspravno dole
    for red:=3+s to 2+2*s do
      matrica[red,kolona]:='|';
  end;
procedure sest(poc:longint);
  var j,red,kolona:longint;
  begin
    //gore horizontal
    red:=1;
    for kolona:=poc+2 to poc+1+s do
      matrica[red,kolona]:='-';
    //srednja horizontal
    red:=s+2;
    for kolona:=poc+2 to poc+1+s do
      matrica[red,kolona]:='-';
    //dole horizontal
    red:=2*s+3;
    for kolona:=poc+2 to poc+1+s do
      matrica[red,kolona]:='-';
    //levo uspravno gore
    kolona:=poc+1;
    for red:=2 to 1+s do
      matrica[red,kolona]:='|';
    //levo uspravno dole
    for red:=3+s to 2+2*s do
      matrica[red,kolona]:='|';
    //desno uspravno gore
    kolona:=poc+s+2;
    //desno uspravno dole
    for red:=3+s to 2+2*s do
      matrica[red,kolona]:='|';
  end;
procedure sedam(poc:longint);
  var j,red,kolona:longint;
  begin
    //gore horizontal
    red:=1;
    for kolona:=poc+2 to poc+1+s do
      matrica[red,kolona]:='-';
    //desno uspravno gore
    kolona:=poc+s+2;
    for red:=2 to 1+s do
      matrica[red,kolona]:='|';
    //desno uspravno dole
    for red:=3+s to 2+2*s do
      matrica[red,kolona]:='|';
  end;
procedure devet(poc:longint);
  var j,red,kolona:longint;
  begin
    //gore horizontal
    red:=1;
    for kolona:=poc+2 to poc+1+s do
      matrica[red,kolona]:='-';
    //srednja horizontal
    red:=s+2;
    for kolona:=poc+2 to poc+1+s do
      matrica[red,kolona]:='-';
    //dole horizontal
    red:=2*s+3;
    for kolona:=poc+2 to poc+1+s do
      matrica[red,kolona]:='-';
    //levo uspravno gore
    kolona:=poc+1;
    for red:=2 to 1+s do
      matrica[red,kolona]:='|';
    //desno uspravno gore
    kolona:=poc+s+2;
    for red:=2 to 1+s do
      matrica[red,kolona]:='|';
    //desno uspravno dole
    for red:=3+s to 2+2*s do
      matrica[red,kolona]:='|';
  end;

procedure ubacicifru(c:char;i:longint);
  begin
    case c of
      '0': nula(i*(s+3));
      '1': jedan(i*(s+3));
      '2': dva(i*(s+3));
      '3': tri(i*(s+3));
      '4': cetiri(i*(s+3));
      '5': pet(i*(s+3));
      '6': sest(i*(s+3));
      '7': sedam(i*(s+3));
      '8': osam(i*(s+3));
      '9': devet(i*(s+3));
    end;
  end;
begin
  //assign(output,'bla.txt');
  //rewrite(output);
  read(s);
  fillchar(matrica,sizeof(matrica),' ');
  while(s<>0)do
    begin

      readln(f);
      str(f,c);
      for i:=1 to length(c) do
        ubacicifru(c[i],i);
      for j:=1 to s*2+3 do

        begin
          for i:=s+4 to length(c)*(s+3)+(s+3)-1 do
            write(matrica[j,i]);
          writeln;
        end;
      fillchar(matrica,sizeof(matrica),' ');
      read(s);
      if s<> 0
        then writeln;
    end;
  writeln;
  //close(output);
end.
