% SNR.m
% up to 3-dimension

function SNRvalue = SNR(signal,noisy)
sigpower = signal.^2;
noisepower = (noisy-signal).^2;
SNRvalue = 10*log10( sum(sigpower(:)) / (sum(noisepower(:))) );
end