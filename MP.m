% MP.m
% 
% The Matching pursuit algorithm.
% If you have MATLAB Wavelet Toolbox, there is an MP function 'wmpalg',
% so I recommend use this than MP.m.
% 
% The student version of MATLAB does not include Wavelet Toolbox...
% So I decided to write codes for myself.
%
% ( There is another MP library called MPTK, but installing every Mac I use
% is very annoying. )
%
% USAGE: y \approx y_fit = MPDict*s
% 

function  [y_fit, s, debug] = MP(y,MPDict,varargin)

if nargin==3
    sparseN = varargin{1};
else
    sparseN = 10;
end

% 1) initialize
residual = zeros(length(y),sparseN+1);
residual(:,1) = y;
s = zeros(size(MPDict,2),1);

% main loop
for itr = 2:sparseN+1
    tmp_resid = MPDict'*residual(:,itr-1);
    [~, idx] = max(tmp_resid);
    s(idx) = MPDict(:,idx)'*residual(:,itr-1);
    residual(:,itr) = residual(:,itr-1) - s(idx) * MPDict(:,idx);
end

y_fit = MPDict*s;
debug = residual;

end % end of function
