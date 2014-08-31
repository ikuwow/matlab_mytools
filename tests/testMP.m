% testMP.m
%
% The test code for MP.m
% 

clear all;
close all;

n = 400; m = 500;
% d = rand(n,m);
d = generateOrthogonalDCTBasis(20);
Dictionary = normc(d); % normalize

y = rand(400,1);
% y = (1:100)';

% [y_fit, s, debug] = MP(y,Dictionary,30);
s = OMP(Dictionary,y,30);
y_fit = Dictionary*s;

figure(1)
plot(1:length(y),y,1:length(y_fit),y_fit)

