function cutAudio(input)
  in = 'fem.wav';
  %1sec distance between each piece
  void = zeros(44100, 1);
  %array to store the final output
  final = []; 
  %duration of each piece
  dur = 0.4; 
  %read audio
  [y, fs] = audioread(input); 
  %random starting frame
  r = round(1 + ((length(y) - 0.4*fs) - 1).*rand(1,1)); 
  %start and end frame
  samples = [r, (r + (dur*fs))]; 
  %cut audio
  [y1, fs] = audioread(input, samples); 
  %add it all up to one array
  createOctave(y1, fs);
endfunction


