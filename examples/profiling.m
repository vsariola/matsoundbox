addpath('..');

song = loadSoundBoxBin('sway_by_m');

profile on;
tic;
wave = player(song);
toc;
profile viewer;
profile off;

rmpath('..');