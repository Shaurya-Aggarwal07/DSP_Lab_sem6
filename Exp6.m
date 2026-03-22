clc; 
clear; 
close all;

M = 51; % filter length (odd)  
fc = 0.25;          
n = 0:M-1; % index
p = n - (M-1)/2;
% -------------------------------------------
z = sin(2*pi*fc*p) ./ (pi*p);
z((M+1)/2) = 2*fc;

figure;
stem(n,z); 
title('Truncated Impulse Response');

% freq resp 
[H,w] = freqz(z,1,1024);
figure;
plot(w/pi, abs(H)); 
title('Ideal Frequency Response');
%---------------------------------
% hamming
wh = hamming(M)';

figure;
plot(n,wh); 
title('Hamming Window');

% windowed
xh = z .* wh;
figure;
plot(n,xh); 
title('Hamming Window Multiplied with sinc function');

% Frequency response of windowed hamming function
[Hh,w] = freqz(xh,1,1024);
figure;
plot(w/pi, abs(Hh)); 
title('Hamming Freq Response');

figure;
plot(w/pi, 20*log10(abs(Hh)));
title('Hamming in dB');
% -------------------------
wb = blackman(M)';

figure;
plot(n,wb); 
title('Blackman Window');

% blackman multiplied with sinc function
xb = z .* wb;
figure;
plot(n,xb);
title('Blackman Window Multiplied with sinc function');

% Frequency response of windowed blackman function
[Hb,~] = freqz(xb,1,1024);
figure;
plot(w/pi, abs(Hb)); 
title('Blackman Freq Response');

figure;
plot(w/pi, 20*log10(abs(Hb))); 
title('Blackman in dB');
% -------------------------
% rectangle
wr = ones(1,M);

figure;
plot(n,wr); 
title('Rectangle Window');

% windowed
xr = z .* wr;
figure;
plot(n,xr); 
title('Rectangle Window Multiplied with sinc function');

% Frequency response of windowed function
[Hr,~] = freqz(xr,1,1024);
figure;
plot(w/pi, abs(Hr)); 
title('Rect Freq Response');

% Freq resp of windowed function in db
figure;
plot(w/pi, 20*log10(abs(Hr))); 
title('Rect in dB');
% -------------------------
% Bartlette
wbb = bartlett(M)';

figure;
plot(n,wbb); 
title('Barlett Window');

% windowed
xbb = z .* wbb;
figure;
plot(n,xbb); 
title('Bartlett Window Multiplied with sinc function');

% Frequency response of windowed function
[Hbb,~] = freqz(xbb,1,1024);
figure;
plot(w/pi, abs(Hbb)); 
title('Bartlett Freq Response');

% Freq resp of windowed function in db
figure;
plot(w/pi, 20*log10(abs(Hbb))); 
title('Bartlette in dB');
% --------------------------------------
% Hann
whh = hann(M)';

figure;
plot(n,whh); 
title('Hann Window');

% windowed
xhh = z .* whh;
figure;
plot(n,xhh); 
title('Hann Window Multiplied with sinc function');

% Frequency response of windowed function
[Hhh,~] = freqz(xhh,1,1024);
figure;
plot(w/pi, abs(Hhh)); 
title('Hann Freq Response');

% Freq resp of windowed function in db
figure;
plot(w/pi, 20*log10(abs(Hhh))); 
title('Hann in dB');
% ------------------------------------------------------
