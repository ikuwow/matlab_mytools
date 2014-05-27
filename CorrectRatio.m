%Precision, Recall, Fmeasure
%2012/12/19
%A : GROUND TRUTHA0,1,2,3,...,n (n is instrument number)
%B : test matrix (similary
%same size 2dimensional matrices.
%If different size, bigger matrix will be truncated.

%inst recognition between truely estimated pitches and frame

function  parcentage = CorrectRatio(A,B)





if max(max(A))>10 || max(max(B))>10
    error('It''s not true data.');
end

[At Bt] = matchsize(A,B);
    


%³‚µ‚­‹‚ß‚ç‚ê‚Ä‚¢‚È‚¢‚Ì‚Í–³‹H 0‚ğ–³‹‚·‚ê‚Î‚æ‚¢H

Correct = (At==Bt).*( (At~=0).*(Bt~=0) );
Wrong = (At~=Bt).*( (At~=0).*(Bt~=0) );

N_c = sum(sum(Correct));
N_w = sum(sum(Wrong));

parcentage = N_c/(N_c+N_w);




end
