function compareSongToWave(song,wavefile)
    wavegen = player(song);
    wavegen = max(min(wavegen,32767),-32767);     
    wavegen = reshape(wavegen/32768,2,length(wavegen)/2)';        
    [waveload,~] = audioread(wavefile);
    subplot(3,1,1);
    l = size(waveload,1);
    plot(wavegen(1:l,:));
    title('Generated','Interpreter','none');       
    subplot(3,1,2);
    plot(waveload(1:l,:));
    title(sprintf('Loaded from %s',wavefile),'Interpreter','none');       
    subplot(3,1,3);    
    diff = wavegen(1:l,:) - waveload(1:l,:);    
    plot(diff);        
    title('Difference');
    if any(abs(diff) > 1e-3)
        fprintf('Test failed: difference is too big for file %s',wavefile);
    end
    drawnow
end