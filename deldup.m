%deldup.m
%sort, and delete the duplication
%numbers only (no string, char)
%2012/1/9
%A : vector
%B : vector ( length(B)<=length(A) )

function B = deldup(A)

B=sort(A);
Bdif = diff(B);

B(find(Bdif==0)+1) = [];

end