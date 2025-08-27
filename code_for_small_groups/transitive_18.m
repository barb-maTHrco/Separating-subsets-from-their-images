AllSetsSeparable := function(G,n,k,r);
// G is a group, k the size of the set, r is how much homogenous we are, n is the degree
// The function returns true if all sets of size k are self separable, and false otherwise
    Domain := GSet(G);
    everyone_separable := true; 

    // first we can add arbitrary r points, since r-homogenous
    A:=&join[{Domain[i]} : i in [1..r]];
    // then we have another k - r points to add
    B:= &join[{Domain[i]} : i in [r+1..n]];

    for S in Subsets(B,k-r) do
       X:=A join S;
       T:=Transversal(G,Stabiliser(G ,X));
       if not 0 in [#(X meet X^g) : g in  T] then //no one separates X from itself
         everyone_separable := false; 
         break;
       end if;
    end for;

  // if everyone_separable eq true, then we went through all subsets and all were separable
  return everyone_separable;
 end function;

m := function(G);
    // G is a group, r is how much homogenous we are
    n:= Degree(G);
    if G eq Alt(n) or G eq Sym(n) then
          return Ceiling((n+1)/2);
    end if;
    for k in [Ceiling(Sqrt(n)).. Ceiling(n/2)+1] do
        if not AllSetsSeparable(G,n,k,1) then
            return k;
        end if;
    end for;
end function;

p := TransitiveGroupProcess([18]);
while not IsEmpty(p) do
     its := IntegerToString;
    P, Q := CurrentLabel(p);
    o := its(P) cat " " cat its(Q) cat " has m= " cat its(m(Current(p)));
    Write("output_18", o);
     //print CurrentLabel(p), "has m=", m(Current(p));
    Advance(~p);
end while;
