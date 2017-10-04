addpath('..');

song = loadSoundBoxBin('sway_by_m');

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