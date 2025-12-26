This is the code supporting the paper Separating Subsets from their Images.

In the file m(G).m is the code for computing the parameter $\mathop m$.

The file m_small_groups.txt contains the parameter $\mathop m$ computed for groups of degrees up to $19$, degree $21$ and degree $23$. The code for this computation is in the folder code_for_small_groups

The folder SmallGroupsReachingUpperBound contains the files used in the computation of groups that reach the upper bound for the parameter $\mathop m$, that is the groups $G$ for which $\mathop m(G) = \lceil (m+1)/2 \rceil$.

- DivideGroups.m sorts the groups of degree from 2 to 18, that reach the upper bound, into 4 groups: primitive, groups with blocks of size two, groups with two blocks, and groups that belong to both of the latter,
- TestingPrimitiveForUpperBound.m deals with primitive groups,
- recognise_constructions.m is used to recognise the groups given by an identifier in the library of transitive groups as one of the constructions described in the paper,
- the other files are used to test groups where the action induced on the blocks sytem or the action induced on a block is M12.
\end{itemize}

