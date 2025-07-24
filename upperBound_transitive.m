IsExampleOfBound:=function(GG);
  everyone_separable:=false;
  rett := false;
  n:= Ceiling(Degree(GG)/2);
  r:=Ceiling(n/3);
  //find blocks
  for i in [2.. 2*n] do
    if IsBlock(GG, {1,i}) then
        X:={1..2*n};
        for S in Subsets(X,n) do
            T:=Transversal(GG,Stabiliser(GG,S));
            if not 0 in [#(S meet S^g) : g in T] then
              everyone_separable:=false;
              continue i;
            end if;
        end for;
        everyone_separable := true;
        rett := true;
        break i;
    end if;
  end for;
 return rett;
 end function;

p := TransitiveGroupProcess([2, 4, 6, 8, 10, 12, 14, 16, 18], IsExampleOfBound);
while not IsEmpty(p) do
     CurrentLabel(p)
    Advance(~p);
end while;
