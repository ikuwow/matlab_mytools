%Precision, Recall, Fmeasure
%2012/12/19
%A : GROUND TRUTH
%B : test matrix
%same size 2dimensional matrices.
%If different size, bigger matrix will be truncated.
% P R F is percent.(0 to 100)

function [Precision, Recall, Fmeasure] = PreRecF(MIDI_gt,MIDI_est)

At = MIDI_gt;
Bt = MIDI_est;

if size(MIDI_gt)~=size(Bt)
    disp(['Different size. truncated to smaller.' char(10)])
end

[At Bt] = matchsize(MIDI_gt,MIDI_est);

Ntp = 0;
Nfp = 0;
Nfn = 0;
Ntn = 0;

for ii=1:size(At,1)
    for jj=1:size(At,2)
        
        if At(ii,jj)>0&&Bt(ii,jj)>0
            Ntp = Ntp+1;
        elseif At(ii,jj)>0&&Bt(ii,jj)<=0
            Nfn = Nfn+1;
        elseif At(ii,jj)<=0&&Bt(ii,jj)>0
            Nfp = Nfp+1;
        else
            Ntn = Ntn+1;
        end
    end
end


Precision = 100*Ntp/(Ntp+Nfp);
Recall = 100*Ntp/(Ntp+Nfn);
Fmeasure = 2*Precision*Recall/(Precision+Recall);


end
