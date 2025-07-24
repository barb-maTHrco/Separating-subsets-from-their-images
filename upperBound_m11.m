HalfDegreeTest:=function(GG);
  nonsep:=false;
  n:= Ceiling(Degree(GG)/2);
  r:=Ceiling(n/3);
  B:=[x : x in {1,2}^GG];
  if not n eq #B
   then 
     print "Blocks not identified correctly!!!!"; 
   else
   A1:=&join[B[i] : i in [1..r]];
    if n-3 <2 then
    return nonsep;
    end if;
     for j in [r+1..n] do
       A2:=A1 join B[j];
       X:={1..2*n} diff A2;
       for S in Subsets(X,n-(2*r+2)) do
         A:=A2 join S;
         T:=Transversal(W,Stabiliser(W,A));
          if not 0 in [#(A meet A^g) : g in T]
             then
               print "The following set is non-separable:",A;
               nosep:=true; 
               break j;
          end if;
       end for;
     end for;
   if not nonsep then
     print "All sets of size",n,"are separable in this group of degree",Degree(W);
   end if;
  end if;
  return nonsep;
 end function;


SubgroupsReachingUperBound:=function(G);
    W:= WreathProduct(Sym(2), G);
    S := Subgroups(W: IsTransitive := true);
    s := #S;
    print "the examples that reach the upper bound are :" ;
    for i in [1..s] do;
        grupa := S[i]`subgroup;
        if not HalfDegreeTest(gruoup) then
            group;
        // TransitiveIdentification(grupa);
    end if;
end for;
end function;


load m11;
G10:=G;
print "M11";
SubgroupsReachingUperBound(G10);
