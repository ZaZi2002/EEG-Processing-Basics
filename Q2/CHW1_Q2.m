clc
close all
clear all

fs = 256; % sampling freq
load("NewEEGSignal.mat");

%% Part1
t = 0.00001 : 1/fs : 2; % time
N = length(NewEEGSignal); % length of sig
f = fs*(-N/2:N/2-1)/N; % freq

figure('Name','Part1_a')
subplot(3,1,1);
plot(t,NewEEGSignal);
grid minor
title('EEGSignal');
xlabel('Time(s)');

EEG_fft = fft(NewEEGSignal); % fft of the signal
EEG_fft = fftshift(EEG_fft); % shift to zero
subplot(3,1,2);
plot(f,abs(EEG_fft));
grid minor
title('fft of EEGSignal')
xlabel('Frequency(Hz)')
xlim([0,64]) % limit for showing freq range

L = 32; % nfft
window = hamming(L); % hamming window
subplot(3,1,3)
spectrogram(NewEEGSignal,window,L/2,L,fs,'yaxis');
title('spectogram of EEGSignal')

% new method for freq region
figure('Name','Part1_b')
EEG_pwelch = pwelch(NewEEGSignal);
EEG_pwelch = fftshift(EEG_pwelch);
N2 = length(EEG_pwelch);
f2 = fs*(-N2/2:N2/2-1)/N2; % freq
plot(f2,EEG_pwelch);
grid minor
title('pwelch of EEGSignal')
xlabel('Frequency(Hz)')
xlim([0,128])

%% Part2
[b,a] = butter(6,60/(fs/2),'low'); % Butterworth filter of order 6
filtered_signal = filter(b,a,NewEEGSignal); % filtering the signal with above filter
EEG_ds = downsample(filtered_signal,2); % downsampling the signal by 2
d_fs = fs/2; % new sampling freq

t = 0.00001 : 1/d_fs : 2; % new time
N = length(EEG_ds); % length of downsampled signal
f = d_fs*(-N/2:N/2-1)/N; % new freq

figure('Name','Part2')
subplot(3,1,1);
plot(t,EEG_ds);
grid minor
title('EEG-downsampled');
xlabel('Time(s)');

EEG_ds_fft = fft(EEG_ds); % fft of the signal
EEG_ds_fft = fftshift(EEG_ds_fft); % shift to zero
subplot(3,1,2);
plot(f,abs(EEG_ds_fft));
grid minor
title('fft of EEG-downsampled')
xlabel('Frequency(Hz)')
xlim([0,64])

L = 16; % nfft
window = hamming(L); % hamming window
subplot(3,1,3)
spectrogram(EEG_ds,window,L/2,L,d_fs,'yaxis');
title('spectogram of EEG-downsampled')

%% Part3
N = length(EEG_ds);
EEG_ds_N2 = fft(EEG_ds(1:N/2),N/2); % DFT of N/2 samples
EEG_ds_N2 = fftshift(EEG_ds_N2);
EEG_ds_N4 = fft(EEG_ds(1:N/4),N/4); % DFT of N/4 samples
EEG_ds_N4 = fftshift(EEG_ds_N4); 
EEG_ds_N8 = fft(EEG_ds(1:N/8),N/8); % DFT of N/8 samples
EEG_ds_N8 = fftshift(EEG_ds_N8); 
f_N2 = d_fs*(-N/4:N/4-1)/(N/2); % freq DFT N/2
f_N4 = d_fs*(-N/8:N/8-1)/(N/4); % freq DFT N/4
f_N8 = d_fs*(-N/16:N/16-1)/(N/8); % freq DFT N/8

figure('Name','part3');
subplot(3,1,1);
plot(f_N2,abs(EEG_ds_N2));
grid minor
title('DFT of N/2 samples')
xlabel('Frequency(Hz)')
xlim([0,64])

subplot(3,1,2);
plot(f_N4,abs(EEG_ds_N4));
grid minor
title('DFT of N/4 samples')
xlabel('Frequency(Hz)')
xlim([0,64])

subplot(3,1,3);
plot(f_N8,abs(EEG_ds_N8));
grid minor
title('DFT of N/8 samples')
xlabel('Frequency(Hz)')
xlim([0,64])

%% Part4
zero_N2 = zeros(1,N);
zero_N4 = zeros(1,N);
zero_N8 = zeros(1,N);
zero_N2(1:N/2) = EEG_ds(1:N/2);
zero_N4(1:N/4) = EEG_ds(1:N/4);
zero_N8(1:N/8) = EEG_ds(1:N/8);
zero_N2_fft = fft(zero_N2,N);
zero_N2_fft = fftshift(zero_N2_fft);
zero_N4_fft = fft(zero_N4,N);
zero_N4_fft = fftshift(zero_N4_fft);
zero_N8_fft = fft(zero_N8,N);
zero_N8_fft = fftshift(zero_N8_fft);

figure('Name','part4');
f = d_fs*(-N/2:N/2-1)/N; % new freq

subplot(3,1,1);
plot(f,abs(zero_N2_fft));
grid minor
title('zero padding N/2')
xlabel('Frequency(Hz)')
xlim([0,64])

subplot(3,1,2);
plot(f,abs(zero_N4_fft));
grid minor
title('zero padding N/4')
xlabel('Frequency(Hz)')
xlim([0,64])

subplot(3,1,3);
plot(f,abs(zero_N8_fft));
grid minor
title('zero padding N/2')
xlabel('Frequency(Hz)')
xlim([0,64])