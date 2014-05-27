%solver of y=Ax with sparse constraint
%A : n*m matrix
%y : m dim column vector
%2012/3/23 new

function x=solvwithKLdiv(A,y,lambda,x_init)

if nargin~=4
    error('Invalid imput variable number.')
end

%‰Šú’l
x = x_init;
for itr = 1:50
    x = x.*(A'*(y./(A*x)))./(A'*ones(size(A,1),1)+lambda);
end



end

