function compareSongToWave(song,wavefile)
    wavegen = player(song);
    wavegen = max(min(wavegen,32767),-32767);     
    wavegen = reshape(wavegen/32768,2,length(wavegen)/2)';      
    try 
        waveload = audioread(wavefile);
    catch 
        waveload = wavread(wavefile);
    end
        
    
    lenGen = size(wavegen,1);
    lenLoad = size(waveload,1);
    
    subplot(3,1,1);    
    plot(wavegen);
    title('Generated','Interpreter','none');       
    subplot(3,1,2);
    plot(waveload);
    title(sprintf('Loaded from %s',wavefile),'Interpreter','none');       
    subplot(3,1,3);    
    if lenGen ~= lenLoad
        fprintf('Test failed: the number of samples is incorrect compared to %s\n',wavefile);
    end
    l = min(lenGen,lenLoad);
    diff = wavegen(1:l,:) - waveload(1:l,:);    
    plot(diff);        
    title('Difference');
    if any(abs(diff) > 3e-3)
        fprintf('Test failed: difference is too big for file %s\n',wavefile);
    end
    drawnow
end