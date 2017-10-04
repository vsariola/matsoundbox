addpath('../');
d = dir('*.wav');

tic;
for i = 1:length(d) 
    [tmp,name,ext] = fileparts(d(i).name);
    songFromBin = loadSoundBoxBin(name);
    songFromBin.endPattern = songFromBin.endPattern+1;
    exportMat(songFromBin,'tmpSong.m');
    rehash;
    tmpSong;
    delete('tmpSong.m');
    compareSongToWave(song,d(i).name);
    toc;    
end
rmpath('../');