%MIDIを読み込んでピアノロール状にして、結果と比べて

function MIDI_groundtruth = MIDI2pianoroll(fileaddress)

MinMIDI = 1;
MaxMIDI = 120;

midifile = readmidi(fileaddress);

[midifile_info ~] = midiInfo(midifile,0);

%３つ目の引数：1フレームあたりの秒
[midifile_pianoroll ttt nnn] = piano_roll(midifile_info,0,0.01);


midifile_pianoroll = cat(1,zeros(nnn(1)-MinMIDI,length(ttt)),midifile_pianoroll);
midifile_pianoroll = cat(1,midifile_pianoroll,zeros(MaxMIDI-nnn(end),length(ttt)));


MIDI_groundtruth = midifile_pianoroll;



end