% testGetLinearPatchIndices.m

clear all
close all

% initialization
image = imread('/Users/degawaikuo/Documents/MATLAB/AutoShared/testimages/512/barbara.bmp');
image = rgb2gray(image);
plin = 5^7;
psz = 9;

% 1. costly calculation
% (It must reserve big memory spaces)
tic
for itr=1:10^3
    w = (psz-1)/2;
    psub = zeros(2,1);
    [psub(1),psub(2)] = ind2sub(size(image),plin);
    mask = zeros(size(image));
    mask(psub(1)-w:psub(1)+w,psub(2)-w:psub(2)+w) = 1;
    linpatch1 = find(mask);
end
toc

% 2. getLinearPatchIndices
tic
for itr=1:10^3
    linpatch2 = getLinearPatchIndices(psz,plin,size(image));
end
toc

% 3. getPatch
tic
for itr=1:10^3
    [linpatch3,rows,cols] = getPatch(size(image),plin,psz);
end
toc

% call
if all(linpatch1(:)==linpatch2(:))
    disp('Success!');
else
    disp('Failure...');
end


