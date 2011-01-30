var str1,
    str2,
    str:array[0..105] of char;
    mat:array[0..101] of set of char;
    matt:array[0..101] of boolean;
    procenat:array[0..101] of byte;
    i,n,d:longint;
procedure readline();
  var c:char;
      b,j:longint;
      bla:boolean;
  begin
      read(c); // '
      read(str1[1]);
      b:=0;
      j:=1;
      while true do
        begin
          j:=j+1;
          read(str1[j]);
          if str1[j-1]=''''
            then begin
                   if str1[j] = ''''
                     then begin
                            b:=b+1;
                            str[b]:=str1[j-1];
                            j:=j+1;
                            read(str1[j]);
                          end
                     else begin
                           { b:=b+1;
                            str[b]:=str1[j-1];   }
                            break;
                          end;
                end
            else  begin
                    b:=b+1;
                    str[b]:=str1[j-1];
                  end;
        end;
      str[0]:=chr(b);

      for j:=1 to 6 do
        read(c);

        j:=1;
      str2[0]:=chr(33);
      read(str2[1]);
      bla:=true;
      while str2[j] > chr(31) do
        begin
          j:=j+1;
          read(str2[j]);
          if (str2[j-1]=str2[j]) and (str2[j]='''') and bla
            then begin
                   j:=j-1;
                   bla:=false;
                 end
            else bla:=true;
        end;
      read(c);
      str2[0]:=chr(j-2);


  end;
function convertjocker():longint;
  var b,j:longint;
      c:char;
  begin
    b:=1;
    mat[1]:=[];
    j:=1;
    while j <= ord(str2[0]) do
      begin
        case str2[j] of
          '[':begin
                j:=j+1;
                if str2[j]='^'
                      then
                        while str2[j] <> ']' do
                          begin
                            if (str2[j]='-') and (str2[j-1] <> '[') and (str2[j+1]<>']')
                                 then for c:=str2[j-1] to str2[j+1] do
                                        mat[b]:=mat[b]+[c]
                                 else mat[b]:=mat[b]+[str2[j]];
                               j:=j+1;
                            matt[b]:=true;
                          end
                      else while str2[j] <> ']' do
                             begin
                               if (str2[j]='-') and (str2[j-1] <> '[') and (str2[j+1]<>']')
                                 then for c:=str2[j-1] to str2[j+1] do
                                        mat[b]:=mat[b]+[c]
                                 else mat[b]:=mat[b]+[str2[j]];
                               j:=j+1;
                               matt[b]:=false;
                             end
              end;
          '%':mat[b]:=mat[b]+[chr(1)];
          '_':for c:=chr(31) to chr(255) do
                mat[b]:=mat[b]+[c]
          else mat[b]:=mat[b]+[str2[j]];
        end;
        b:=b+1;
        mat[b]:=[];
        j:=j+1;
      end;
    convertjocker:=b-1;
  end;


function inorout(j:longint;izraz:boolean):boolean;
  begin
    if matt[j]
      then inorout:=not izraz
      else inorout:=izraz;
  end;
function find(j,k:longint):boolean;
  begin
    find:=true;
    while (find and ((j <= d) or (k <= ord(str[0]))) do
      if chr(1) in mat[j]
        then begin
               if j=d
                 then BEGIN
                        find:=true;
                        exit;
                      END
                 else j:=j+1;
               while k <= ord(str[0]) do
                 begin
                   if inorout(j,str[k] in mat[j])
                      then begin
                             case find(j,k) of
                                true:begin
                                    find:=true;
                                    break;
                                  end;
                                false:begin
                                   find:=false;
                                   k:=k+1;
                                   continue;
                                  end;
                             end;
                             k:=k+1;
                           end
                      else begin
                             k:=k+1;
                             find:=false;
                           end;
               end;
             end
        else if inorout(j,str[k] in mat[j])
               then if (k=ord(str[0])) and (j=d)
                      then begin
                             find:=true;
                             exit
                           end
                      else begin
                             if (k=ord(str[0])) or (j=d)
                               then find:=false;
                             j:=j+1;
                             k:=k+1;
                           end
               else begin
                      find:=false;
                      exit;
                    end;
  if (j=d) and (k=ord(str[0]))
    then find:=true
    else find:=false;
  end;
begin
  readln(n);
  //tps
  for i:=1 to n do
    begin
      readline;
      d:=convertjocker;
      if find(1,1)
        then writeln('YES')
        else writeln('NO');

    end;
end.
