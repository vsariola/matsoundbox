addpath('../');
d = dir('*.wav');

tic;
for i = 1:length(d) 
    [tmp,name,ext] = fileparts(d(i).name);
    f = fopen(sprintf('%s',name));
    data = fread(f,'uint8=>uint8');
    fclose(f);
    song = loadSoundBoxBin(data);
    compareSongToWave(song,d(i).name);
    toc;    
end
rmpath('../');