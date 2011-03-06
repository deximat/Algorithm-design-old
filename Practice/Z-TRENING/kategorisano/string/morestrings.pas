uses strutils;
var a,b,c:string;
   aa,bb,i:longint;
function func(poc,aa,bb:longint):string;
  var i:longint;
  begin
  i:=poc;
  if poc<=length(c)
  then begin
        if a[aa]=c[i]
          then if func(i+1,aa+1,bb)='yes'
                 then begin
                        func:='yes';
                        exit;
                      end;
        if b[bb]=c[i]
          then if func(i+1,aa,bb+1)='yes'
                 then begin
                        func:='yes';
                        exit;
                      end;
        func:='no';
        exit;
      end
  else func:='yes';
  end;
begin
  readln(a);
  c:=copy(a,NPos(' ',a,2)+1,length(a)-NPos(' ',a,2));
  b:=copy(a,NPos(' ',a,1)+1,NPos(' ',a,2)-NPos(' ',a,1)-1);
  a:=copy(a,1,pos(' ',a)-1);
  aa:=1;
  bb:=1;
  writeln(func(1,1,1));
end.