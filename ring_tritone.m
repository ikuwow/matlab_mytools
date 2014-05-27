%ring_tritone.m
%supposing tritone.wav
%2013/5/16

function ring_tritone

tritonewav = wavread('tritone');
sound(tritonewav(1:round(length(tritonewav)*3/4),:),44100)

end