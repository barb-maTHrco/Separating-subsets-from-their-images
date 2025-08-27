// This code writes out all transitive subgroups of c2 wr M12 and M12 wr C2 tht induce M12 on the blocks and on a single block, respectively.

K:= WreathProduct(H,G);
//find all subgroups of the wreath product
seznam := SubgroupClasses(K: IsTransitive := true);
seznam;
for a in seznam do
S := a`subgroup;
blk := { 1,2 };
if #BlocksImage(S, blk) eq #G then
  print "stevilka", TransitiveGroupIdentification(S);
end if;
end for;

K:= WreathProduct(G,H);
for a in seznam do
S := a`subgroup;
blk := { 1,2,3,4,5,6,7,8,9,10,11,12};
f, Im, Kern := BlocksAction(S, blk); // Kern stabilises blocks setwise
SS := Stabilizer(S, SetToSequence(blk)); //this stabilizes one block pointwise
if #Kern eq #G * #SS then
  print "stevilka", TransitiveGroupIdentification(S);
else
end if;
end for;
