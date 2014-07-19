% normc.m
% normalize rows of matrix
function n = normc(m)

% [mr,mc] = size(m);

if nargin < 1,error('Not enough input arguments.'); end

n = m ./ (ones(size(m,1),1)*sqrt(sum(m.^2,1)));

end % end of function
