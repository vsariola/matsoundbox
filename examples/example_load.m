addpath('..');

f = fopen('sway_by_m');
data = fread(f,'uint8=>uint8');
fclose(f);

song = loadSoundBoxBin(data);
% The player crashes if some notes are still playing when we hit the end,
% so add some extra time in the end
song.endPattern = song.endPattern+1;
tic;
wave = player(song);
toc;
%%
wavesat  = max(min(wave,32767),-32767);     
wavestereo = reshape(wavesat/32768,2,length(wavesat)/2)';
%%
ap = audioplayer(wavestereo,44100);
playblocking(ap);
%%
rmpath('..');