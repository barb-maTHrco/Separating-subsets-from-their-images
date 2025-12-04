

WrH2:=function(H);
  n:=Degree(H);
  gen:=Generators(H);
  S:=Sym(2*n);
  gen2:=[S!([i^g : i in [1..n]] cat [i+n : i in [1..n]]) : g in gen];
  gen3:=[S!([i : i in [1..n]] cat [i+n : i in [1..n]]) : g in gen];
  gen4 := S!([i + n : i in [1..n]] cat [i : i in [1..n]]);
  G:=sub<S|gen2 cat gen3 cat [gen4]>;
  return G;
 end function;


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

load m12;
H := WrH2(G);


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
         print(X);
         break;
       end if;
    end for;

  // if everyone_separable eq true, then we went through all subsets and all were separable
  return everyone_separable;
 end function;

 AllSetsSeparable(H, 24, 12, 1);
