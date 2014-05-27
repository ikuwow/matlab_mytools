function x = l1minimize(A,y,lambda,num_update)

x = ones(size(A,2),1);
I = ones(size(A,1),1);

if length(lambda) == 1
    lambda = lambda*ones(size(A,2),1);
end

for itr = 1:num_update
    x = x.*(A'*(y./(A*x)))./(A'*I+lambda);
end

end