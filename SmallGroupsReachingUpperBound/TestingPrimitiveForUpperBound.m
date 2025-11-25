M:=147;
Cand:=[];

for i in [0..145] do
 n:=M-i;
 if n mod 2 eq 1 or n le 116 then
  n2:=n div 2;
  for k in [1..NumberOfPrimitiveGroups(n)-2] do
    sum:=0;
    G:=PrimitiveGroup(n,k);
    classes:=Classes(G);    
    for cl in classes do
      O:=[#o : o in Orbits(sub<G|cl[3]>)];
      oddO:=[k : k in O | k mod 2 eq 1];
      if n mod 2 eq 0 and #oddO eq 0 then
          sum:=sum+cl[2]*2^#O;
      end if;
      if n mod 2 eq 1 and #oddO eq 1 then
          l:=oddO[1]; 
          sum:=sum+cl[2]*2^(#O-1)*l;
      end if;
    end for;
    bin:=Binomial(n,n2);
    if sum ge bin then
      print n,k, sum, bin; // sum, bin;
      Append(~Cand,[n,k]);
    end if;
  end for;
 end if;
end for;

Sort(~Cand);
print "Candidate primitive groups for attaining the upper bound:";
print Cand;

//

GoodGroups:=[]; // This will become the list of codes of primitive groups that attein the bound

for code in Cand do

 deg:=code[1];
 k:=code[2];

 if  not [deg,k] eq [32,3]  // We deal with the group PrimitiveGroup(32,3) = AGL(5,2) separately
     and k le NumberOfPrimitiveGroups(deg)-2 // We're not testing Alt(n) and Sym(n) on n points
    then
  G:=PrimitiveGroup(deg,k);
  t:=Transitivity(G);
  // print n,k;
  print "PrimitiveGroup",deg,k,",  order:",#G,",  transitivity:",t;
  n:=Degree(G);
  m:=n div 2; // This is the size of the sets we're testing;
  B:={n-t+1..n};
  f:=NumberingMap(G);
  fi:=Inverse(f);
  // print "Computing non separating elements";
  F:={};
  for x in B do
    // print x;
    for y in B do
       if exists(g){g:g in G| x^g eq y} then
         F:=F join f({h*g : h in Stabiliser(G,x)});
       end if;
       //  print y,#F;
    end for;
  end for;
  D:=SetToSequence({1..#G} diff F);
  print "Number of potentially separating elements",#D;

  OK:=true;
  S:=SetToSequence(Subsets({1..n-t},m-t));
  print "Number of sets to be tested:",#S;
  for i in [1..#S] do
    A:=S[i] join B;
    selfsep:=false;
    for j in D do
      g:=fi(j);
      if #(A meet A^g) eq 0 then 
        selfsep:=true;
        break j;
      end if;
    end for;
    if not selfsep then
      print A,"is not self separable";
      OK:=false;
      break i;
    end if;
  end for;

  if OK then 
    print "Every set of size",m,"is self separable";
    Append(~GoodGroups,[deg,k]);
  end if;

  print " ";
  
 end if;

end for;

print "PrimitiveGroups codenames for primitive groups that meet the `ceiling of (n+1)/2' bound";
print "With the exception of M_24 on 24 points (deal with separately):";
print GoodGroups;
