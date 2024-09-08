clc
close all
clear all

f = @(t) 100 + 100*(t.^2); % f(t)
x = @(t) cos(2*pi*f(t).*t); % x(t)

%% Part1
fs = 1000; % sampling freq
t = 0 : 1/fs : 2; % time
figure('Name','Part1')
plot(t,x(t));
grid minor
title('x(t)');
xlabel('Time(s)');
ylim([-2,2]);

%% Part2
L = 128;
window_rect = rectwin(L);
window_triangle = triang(L);
window_gaussian = gausswin(L);
window_hamming = hamming(L);

wvtool(window_rect); % rect
wvtool(window_triangle); % triangle
wvtool(window_gaussian); % gaussian
wvtool(window_hamming); % hamming
wvtool(window_rect,window_triangle,window_gaussian,window_hamming); % for comparing

%% Part3
figure('Name','Part3');
subplot(2,2,1);
spectrogram(x(t),window_rect,0,L,fs,'yaxis');
title('rect window');

subplot(2,2,2);
spectrogram(x(t),window_triangle,0,L,fs,'yaxis');
title('triangle window');

subplot(2,2,3);
spectrogram(x(t),window_gaussian,0,L,fs,'yaxis');
title('gaussian window');

subplot(2,2,4);
spectrogram(x(t),window_hamming,0,L,fs,'yaxis');
title('hamming window');

%% Part4
figure('Name','Part4');
subplot(3,1,1);
spectrogram(x(t),window_hamming,0,L,fs,'yaxis');
title('hamming window (OL = 0)');

subplot(3,1,2);
spectrogram(x(t),window_hamming,64,L,fs,'yaxis');
title('hamming window (OL = 64)');

subplot(3,1,3);
spectrogram(x(t),window_hamming,127,L,fs,'yaxis');
title('hamming window (OL = 127)');

%% Part5
figure('Name','Part5');
L = 32;
window_hamming = hamming(L);
subplot(3,1,1);
spectrogram(x(t),window_hamming,L-1,L,fs,'yaxis');
title('hamming window (L = 32)');

L = 128;
window_hamming = hamming(L);
subplot(3,1,2);
spectrogram(x(t),window_hamming,L-1,L,fs,'yaxis');
title('hamming window (L = 128)');

L = 512;
window_hamming = hamming(L);
subplot(3,1,3);
spectrogram(x(t),window_hamming,L-1,L,fs,'yaxis');
title('hamming window (L = 512)');

%% Part6
figure('Name','Part5');
L = 128;
window_hamming = hamming(L);

subplot(3,1,1);
spectrogram(x(t),window_hamming,L/2,L,fs,'yaxis');
title('hamming window (nfft = L)');

subplot(3,1,2);
spectrogram(x(t),window_hamming,L/2,2*L,fs,'yaxis');
title('hamming window (nfft = 2L)');

subplot(3,1,3);
spectrogram(x(t),window_hamming,L/2,4*L,fs,'yaxis');
title('hamming window (nfft = 4L)');

% %% Part7
% fs = 1000; % Sample rate
% t = 0:1/fs:2; % Time vector
% 
% % Define parameters for spectrogram
% L = 256; % Window size
% Nov = 128; % Overlap of segments
% nfft = 256; % FFT length
% 
% % Initialize spectrogram matrix
% N = length(x);
% spectrogram_matrix = zeros(nfft/2+1, floor(N/Nov));
% 
% % Compute the spectrogram of the signal using fft
% for i = 1:floor(N/Nov)
%     segment = x((i-1)*noverlap+1:(i-1)*noverlap+window_size); % Segment of signal
%     windowed_segment = segment .* hamming(window_size); % Apply window function
%     fft_segment = fft(windowed_segment, nfft); % Compute FFT of segment
%     spectrogram_matrix(:, i) = abs(fft_segment(1:nfft/2+1)); % Store magnitude of FFT in spectrogram matrix
% end
% 
% % Plot the spectrogram in decibels
% figure
% imagesc(10*log10(spectrogram_matrix)); axis xy;
% colorbar;
% xlabel('Time (s)');
% ylabel('Frequency (Hz)');
% 
