// Generates the permutation group of degree 2n
// arising from the action of S_n on the cosets of A_{n-1}

HCos:=function(H,S)
  _,G:=CosetAction(H,S);
 return G;
end function;

//

SnA:=function(n)
  S:=Sym(n);
  S1:=Stabiliser(S,n);
  f,X:=Action(S1,GSet(S1,{1..n-1}));
  A:=Alt(n-1) @@ f;
  _,G:=CosetAction(S,A);
 return G;
end function;

// Generates the direct product H \times Sym(2) acting in the product action on 2n points

C2H:=function(H);
  n:=Degree(H);
  gen:=Generators(H);
  S:=Sym(2*n);
  gen2:=[S!([i^g : i in [1..n]] cat [i^g+n : i in [1..n]]) : g in gen];
  t:=S!([i+n : i in [1..n]] cat [1..n]);
  return sub<S|gen2 cat [t]>;
 end function;

AH:=function(H);
  n:=Degree(H);
  gen:=Generators(H);
  S:=Sym(2*n);
  gen2:=[S!([i^g : i in [1..n]] cat [i^g+n : i in [1..n]]) : g in gen];
  gent:=[ S!([1..j-1] cat [j+n,j+1+n] cat [j+2..n] cat [i+n : i in [1..j-1]]
             cat [j,j+1] cat [j+2+n..2*n])    : j in [1..n-1] ];   
  return sub<S|gen2 cat gent>;
 end function;

WrH:=function(H);
  n:=Degree(H);
  gen:=Generators(H);
  S:=Sym(2*n);
  gen2:=[S!([i^g : i in [1..n]] cat [i^g+n : i in [1..n]]) : g in gen];
  gent:=[ S!([1..j-1] cat [j+n] cat [j+1..n] cat [i+n : i in [1..j-1]]
             cat [j] cat [j+1+n..2*n])    : j in [1..n] ];   
  G:=sub<S|gen2 cat gent>;
  K:=sub<G|gent>;
  HH:=sub<G|gen2>;
  return G,K,HH;
 end function;

MixHSA:=function(H,S);
  n:=Degree(H);
  X,K,HH:=WrH(H);
  Y:=AH(S);
  Q,q:=quo<X|Y>;
  cand:=[x`subgroup @@ q : x in Subgroups(Q) | #(x`subgroup) eq 2];
  cand:=[x : x in cand | not x meet K eq K and not HH meet x eq HH];
  if not #cand eq 1 then
     print "ERROR:",#cand;
  end if;
  return cand[1];
end function;

//
// f is an element in Sym(m) wr C2 such that f^2 \in H
QHf:=function(H,f);
  n:=Degree(H);
  // first define Q0
  gen:=Generators(H);
  S := Sym(2*n);
  gen2 := [S!([i^g : i in [1..n]] cat [i^(f^(-1)*g*f)+n : i in [1..n]]) : g in gen];
  Q0:=sub<S|gen2>;
  f_ := S!([i^f + n: i in [1..n]] cat [i^f: i in [1..n]]);
  Q := sub<S|gen2 cat [f_]>;
  return Q;
end function;

//
