#
Const MaxN = 100100;
#
      MaxM =  80200;
#
Type SlogC = Record Fs, Ls: LongInt; End;
#
Type SlogV = Record Cvor, Sused, Tezina: LongInt; End;
#
Var
#
   Veza : Array[1..2*MaxM] Of SlogV;
#
   Cvor : Array[1..  MaxN] Of SlogC;
#
   MinD : Array[1..  MaxN] Of LongInt;
#
   N, M, i, P, Source, Dest : LongInt;
#
 
#
  Procedure QSort(Left, Right : LongInt);
#
   Var
#
      i, j, Pivot : LongInt;
#
      P        : SlogV;
#
   Begin
#
      Pivot := Veza[(Left + Right) Div 2].Cvor;
#
      i := Left;
#
      j := Right;
#
 
#
      Repeat
#
         While Veza[i].Cvor < Pivot Do i := i + 1;
#
         While Veza[j].Cvor > Pivot Do j := j - 1;
#
 
#
         If i <= j
#
           Then Begin
#
                  P := Veza[i];
#
                  Veza[i] := Veza[j];
#
                  Veza[j] := P;
#
                  i := i + 1;
#
                  j := j - 1;
#
                End;
#
 
#
      Until i >= j;
#
 
#
      If Left < j     Then QSort(Left, j);
#
      If    i < Right Then QSort(i, Right);
#
   End;
#
 
#
   Procedure NajkraciPutevi(Pocetak, Kraj : LongInt);
#
    Var j, i, Z : LongInt;
#
        X       : Array[1..20*MaxN] Of LongInt;
#
    Begin
#
       X[1] := Source;
#
       Repeat
#
          Z := Kraj;
#
 
#
          For i := Pocetak To Kraj Do
#
            For j := Cvor[X[i]].Fs To Cvor[X[i]].Ls Do
#
              If j <> 0 Then
#
                If MinD[ Veza[j].Sused ] > MinD[ X[i] ] + Veza[j].Tezina Then
#
                  Begin
#
                    Z := Z + 1;
#
                    MinD[ Veza[j].Sused ] := MinD[ X[i] ] + Veza[j].Tezina;
#
                    X[Z] := Veza[j].Sused;
#
                  End;
#
          Pocetak := Kraj + 1; Kraj := Z;
#
       Until Pocetak > Kraj;
#
    End;
#
 
#
Begin
#
   ReadLn(N, M, Source, Dest);
#
 
#
   For i := 1 To M Do
#
   Begin
#
      ReadLn(Veza[i].Cvor, Veza[i].Sused, Veza[i].Tezina);
#
      Veza[i+m].Cvor   := Veza[i].Sused;
#
      Veza[i+m].Sused  := Veza[i].Cvor;
#
      Veza[i+m].Tezina := Veza[i].Tezina;
#
   End;
#
 
#
   M := M * 2;
#
   QSort(1, M);
#
 
#
   For i := 1 to M do      Cvor[Veza[i].Cvor].Ls := i;
#
   For i := M downto 1 do  Cvor[Veza[i].Cvor].Fs := i;
#
 
#
   For i := 1 To N Do MinD[i] := MaxLongInt;
#
   MinD[Source] := 0;
#
 
#
   NajkraciPutevi(1, 1);
#
 
#
   If MinD[Dest] = MaxLongInt
#
     Then WriteLn('-1')
#
     Else WriteLn(MinD[Dest]);
#
End.