% getPatch.m
%
% function of getting linear indices of patch centered at 'center'
%
% Inputs:
% - imageSize: the size of image (ex. [512,512])
% - center: linear index of the center of patch (scalar)
% - patchsize: the patch size (NxN, scalar)
% 
% Outputs: 
% - Hp: linear indices of patch (patchsize x patchsize matrix. Why not vector?) 
% - rows: linear indices rows of patch of size 'patchsize'
% - cols: linear indices cols of patch of size 'patchsize'
%
% TODO: よく調べる。理解する。
% TODO: 線形インデックスが行列の形で出てきても大丈夫だという確信を得る。
%
function [Hp,rows,cols] = getPatch(imageSize,center,patchsize)
    w=(patchsize-1)/2; center=center-1; y=floor(center/imageSize(1))+1; center=rem(center,imageSize(1)); x=floor(center)+1;
    rows = max(x-w,1):min(x+w,imageSize(1));
    cols = (max(y-w,1):min(y+w,imageSize(2)))';
    Hp = sub2ndx(rows,cols,imageSize(1));
end

function N = sub2ndx(rows,cols,nTotalRows)
    X = rows(ones(length(cols),1),:);
    Y = cols(:,ones(1,length(rows)));
    N = X+(Y-1)*nTotalRows;
end
