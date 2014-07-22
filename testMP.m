% testMP.m
%
% The test code for MP.m
% 

n = 100; m = 120;
% d = rand(n,m);
d = generateOrthogonalDCTBasis(10);
Dictionary = normc(d); % normalize

y = rand(100,1);
% y = (1:100)';

[y_fit, s, debug] = MP(y,Dictionary);

figure(1)
plot(1:length(y),y,1:length(y_fit),y_fit)

