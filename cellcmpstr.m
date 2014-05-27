%cellcmpstr
function resultcell = cellcmpstr(refcell,instname)

if isstr(instname)~=1
    error('2nd input must be string.')
end

resultcell = zeros(size(refcell));

for a = 1:size(refcell,1)
    for b = 1:size(refcell,2)
        resultcell(a,b) = strcmp(refcell(a,b),instname);
    end
end


end