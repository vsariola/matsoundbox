addpath('../');
d = dir('*.wav');

tic;
for i = 1:length(d) 
    [tmp,name,ext] = fileparts(d(i).name);    
    song = loadSoundBoxBin(name);
    compareSongToWave(song,d(i).name);
    toc;    
end
rmpath('../');