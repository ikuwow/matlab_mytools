% magnitude_spectrum : column vector
% no zero padding

function cepstrum = mag2cep(magnitude_spectrum,FL)

logpower = log10(magnitude_spectrum.^2);
cepstrum = ifft(logpower,FL);
cepstrum = real(cepstrum);
end