% getLinearPatchIndices.m
% 
% inputs
% - patchsize: 
% - 
% 
% outputs
% - idxs
% 
function [idxs] = getLinearPatchIndices(patchsize,center,imsize)

w = (patchsize-1)/2;
psub = zeros(2,1);
[psub(1),psub(2)] = ind2sub(imsize,center);
mask = zeros(imsize);
mask(max(1,psub(1)-w):min(psub(1)+w,imsize(1)), max(1,psub(2)-w):min(psub(2)+w,imsize(2))) = 1;
idxs = find(mask);

end % end of function
