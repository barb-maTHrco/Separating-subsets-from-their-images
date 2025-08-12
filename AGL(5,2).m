// This code randomly tests 16-elements subsets of the 5-dim space over GF(2)
// for being self-separable under AGL(5,2).
// The code stops when a non-self-separable set is found.

G:=AGL(5,2);
SocG:=Socle(G);
H,a,b:=Holomorph(SocG);
B:=[a(SocG.i) : i in [1..5]];
print "Generators of AGL(5,2)";
for i in [1..5] do
  print B[i];
end for;

count:=1;

repeat
print count;

// Choose A

GetSeed();
A:={1^B[i] : i in [1..5]};
repeat
  A := A join {Random(1,32)};
until #A eq 16;
selfsep:=false;
print "Checking the set",A;

for g in H do
  if #(A meet A^g) eq 0 then
     selfsep:=true;
     break;
  end if;
end for;

if not selfsep then
  print "The set is not self sep for AGL(5,2)!!!";
  print "In terms of vectors:";
  X:=[[i1,i2,i3,i4,i5]: i1 in [0,1], i2 in [0,1], i3 in [0,1], i4 in [0,1], i5 in [0,1]];
  for x in X do g:=B[1]^x[1]; for j in [2..5] do g:=g*(B[j]^x[j]); end for; if 1^g in A then print x; end if; end for;
end if;
count:=count+1;
until not selfsep;
