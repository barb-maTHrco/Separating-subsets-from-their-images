// this is the list of groups reaching the upper bound for degrees 2 to 21 (see code for small_m)
GroupsReachingUpperBound := [[1], 
[1, 2],
[1, 2, 3, 4, 5],
[1, 2, 3, 4, 5],
[2, 3, 5, 8, 9, 10, 11, 13, 14, 15, 16],
[2, 4, 6, 7],
[3, 9, 13, 14, 17, 18, 19, 21, 22, 24, 25, 26, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50],
[14, 15, 19, 23, 26, 27, 32, 33, 34],
[11, 12, 17, 19, 20, 22, 25, 27, 29, 30, 33, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45],
[7, 8],
[123, 179, 180, 181, 182, 183, 218, 219, 220, 256, 257, 270, 272, 277, 278, 279, 285, 286, 287, 288, 293, 295, 296, 297, 298, 299, 300, 301],
[8, 9],
[39, 46, 47, 49, 54, 56, 57, 58, 59, 60, 61, 62, 63],
[103, 104],
[1078, 1502, 1506, 1693, 1798, 1799, 1801, 1802, 1803, 1804, 1805, 1838, 1839, 1842, 1843, 1844, 1860, 1861, 1873, 1878, 1882, 1883, 1902, 1903, 1906, 1916, 1938, 1940, 1944, 1945, 1946, 1948, 1949, 1950, 1951, 1952, 1953, 1954],
[9, 10],
[855, 887, 888, 897, 913, 914, 937, 938, 952, 965, 966, 968, 978, 979, 980, 981, 982, 983],
[7, 8],
[163, 164],
[6, 7]];


// this code to check if a group admits blocks of size 2
BlocksOfSize2 := function(G)
n:= Degree(G);
bs2 := false;
for k in [2..n] do
  if IsBlock(G, {1,k}) then
  bs2 := true;
  end if;
end for;
return bs2;
end function;

//this is the code to check if a group admits two blocks
Twoblocks := function(G)
n:= Degree(G);
bsm := false;
if 2*(n div 2) eq n then
for A in Subsets({1..n}, n div 2) do
  if IsBlock(G, A) then
  bsm := true;
  end if;
end for;
end if;
return bsm;
end function;

Primitive :=[];
Blockssize2 :=[];
TwoBlocks := [];
Both := [];

for i in [1..17] do
  S:= GroupsReachingUpperBound[i];
  n := i+1; //since the list GroupsReachingUpperBound starts with groups of degree 2
  P :=[];
  Bs2 :=[];
  TwoB := [];
  B := [];
  for x in S do
  G := TransitiveGroup(n,x);
  if IsPrimitive(G) then
    Append(~P,x);
  end if;
  if BlocksOfSize2(G) then
    Append(~Bs2,x);
  end if;
  if Twoblocks(G) then
    Append(~TwoB,x);
  end if;
  if BlocksOfSize2(G) and Twoblocks(G) then
    Append(~B,x);
  end if;
  end for;
Append(~Primitive,P);
Append(~Blockssize2, Bs2);
Append(~TwoBlocks, TwoB);
Append(~Both, B);
end for;

// we now obtain the desired lists of groups, separated by degrees. We identify them using the function recognise_constructions.m
Primitive;
Blockssize2;
TwoBlocks;
Both;

//just to check if we got all the groups
//for i in [1 .. 17] do
//#Primitive[i] + #Blockssize2[i] + #TwoBlocks[i] - #Both[i] eq #GroupsReachingUpperBound[i];
//end for;
