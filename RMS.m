

function rms = RMS(A,B)

C=(A-B).^2;
rms = sqrt(mean(C(:)));

end