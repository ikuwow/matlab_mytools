% PSNR.m

function psnr = PSNR(X,Y,maxvalue)

if size(X)~=size(Y)
    error('input must be same size.')
end

tmp = (X-Y).^2;

MSE = sum(tmp(:))/numel(tmp);
psnr = 10*log10(maxvalue^2/MSE);