%specpeak2MIDInum.m
%2012/1/8
%2012/4/15 expand MIDI numbers
%spec : column vector (assumed as log scale)
%MIDInumbers : pitch candidate
%dependent on "localmaximum.m
%MIDInumbers -> MIDI1~MIDI120 (size_pitch=120)
%frequency resolution is assumed to be 10Hz.

function MIDInumbers = specpeak2MIDInum(spec,size_pitch)

A4 = 440;%Hz

GaussRadius         = 20;
GaussWindow         = gausswin(2*GaussRadius+1);
LocalThreshold      = -inf(length(spec),1);
semitone            = nthroot(2,12);


LocalThreshold(:) = conv( spec,GaussWindow,'same' )/sum( GaussWindow );
GrobalThreshold = max(spec)-50;%magicnumber
Threshold_spec = LocalThreshold;
Threshold_spec(GrobalThreshold>LocalThreshold) = GrobalThreshold;

%figure(100),plot(spec),hold on,plot(Threshold_spec),hold off

%findpeaksÇÕÉNÉ\ÅB
[~, specpeak_idx] = localmaximum(spec,Threshold_spec);

Freq2MIDI = [floor( (A4*( semitone.^((1:size_pitch)-69) ))' ),...
             round( (A4*( semitone.^((1:size_pitch)-69) ))' ),...
              ceil( (A4*( semitone.^((1:size_pitch)-69) ))' )];
          
pointer = 1;


for itr = 1:length(specpeak_idx)
    hogehoge = sum(abs(Freq2MIDI-specpeak_idx(itr))<3,2);
    next = length(find(hogehoge~=0));
    MIDInumbers(pointer:(pointer+next-1)) = find(hogehoge~=0);
    pointer = pointer+next;
end

MIDInumbers = deldup(MIDInumbers)';


end
