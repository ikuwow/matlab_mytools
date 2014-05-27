function [At Bt] = matchsize(A,B)


At=A;
Bt=B;

if sum(size(At)~=size(Bt))>0
    disp([inputname(1) ' and ' inputname(2) ' are different size.'])
    disp(['Truncated to smaller.' char(10)])
end

dimnum = max(ndims(At),ndims(Bt));

for dim = 1:dimnum

    if size(A,dim)<size(B,dim)
        Bt = Bt(1:size(At,dim),:);
    elseif size(A,dim)>size(B,dim)
        At = At(1:size(Bt,dim),:);
    end

end


end