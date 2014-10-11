% imgPSNR.m
%
% psnr = imgPSNR(X,Y)
% 

function psnr = imgPSNR(X,Y)

if ismatrix(X)~=2 && ismatrix(Y)~=2 && ndims(X)~=3 && ndims(Y)~=3
    error('Input images must be 2d or 3d.')
end

if ~isequal(size(X),size(Y))
    error('Two images must be same size.')
end

if isinteger(X) && isinteger(Y)
    maxValue = 255;
elseif isfloat(X) && isfloat(Y)
    maxValue = 1;
else
    error('Input argument types must be same (Basically uint8 or double).');
end

X = double(X);
Y = double(Y);

tmp = (X-Y).^2;

MSE = sum(tmp(:))/numel(tmp);
psnr = 10*log10(maxValue^2/MSE);

end % end of function
