%localmaximum.m
%help?

%U : vector
%v : vector,localthreshold,same size to U

function [lmaximum indices] = localmaximum(U,v)

DIF = diff(U);

lmaximum = 0;
indices = 0;
counter = 1;

for itr = 1:(length(DIF)-1)
    if DIF(itr)>0 && DIF(itr+1)<0 && U(itr+1)>v(itr+1)
        lmaximum(counter,1) = U(itr+1);
        indices(counter,1) = itr+1;
        counter=counter+1;
    end
    
end

end