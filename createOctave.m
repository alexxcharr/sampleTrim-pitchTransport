function createOctave(y, fs)
  %get 12 equally distributed values between fs-2*fs to create the different sampling rates of an octave
  oct = round(linspace(fs, 2*fs, 12));  
  %the 1sec appart that the notes will be
  void = zeros(44100, 1); 
  % the array to hold the final output
  final = cat(1, y, void); 
  o = 12; %number of frames every loop will be deleted (dont know if its the right way)
  %iterate 12 times to change the pitch via the sampling rate
  for i=2:12 
    %write audio with new pitch
    audiowrite('note.wav', y, oct(i)); 
    %read it back in
    [y1, oct(i)] = audioread('note.wav'); 
    %delete every nth frame to get fs = 44100
    y1(1:o:end) = []; 
    %sum it all up in one array
    final = cat(1, final, y1); 
    final = cat(1, final, void);
    o = o -1; %get from deleting every 12th to deleting every 2nd
  endfor
  audiowrite('octaveOut.wav', final, fs);
endfunction

%y1 = reshape([y'; zeros(size(y'))], [], 1); add zeros if you want to go an octave down
