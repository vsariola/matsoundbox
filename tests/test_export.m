addpath('../');
d = dir('*.wav');

tic;
for i = 1:length(d) 
    [tmp,name,ext] = fileparts(d(i).name);
    f = fopen(sprintf('%s',name));
    data = fread(f,'uint8=>uint8');
    fclose(f);
    songFromBin = loadSoundBoxBin(data);
    songFromBin.endPattern = songFromBin.endPattern+1;
    exportMat(songFromBin,'tmpSong.m');
    rehash;
    tmpSong;
    delete('tmpSong.m');
    
    wavegen = player(song);
    wavegen = max(min(wavegen,32767),-32767);     
    wavegen = reshape(wavegen/32768,2,length(wavegen)/2)';        
    [waveload,fs] = audioread(d(i).name);
    subplot(3,1,1);
    l = size(waveload,1);
    h1 = plot(wavegen(1:l,:));
    title(sprintf('Generated from %s',name),'Interpreter','none');       
    subplot(3,1,2);
    h2 = plot(waveload(1:l,:));
    title(sprintf('Loaded from %s',d(i).name),'Interpreter','none');       
    subplot(3,1,3);    
    diff = wavegen(1:l,:) - waveload(1:l,:);    
    h3 = plot(diff);        
    title('Difference');
    if any(abs(diff) > 1e-3)
        fprintf('Test failed: difference is too big for file %s',d(i).name);
    end
    drawnow
    toc;    
end
rmpath('../');