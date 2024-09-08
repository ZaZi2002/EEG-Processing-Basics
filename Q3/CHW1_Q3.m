clc
close all
clear all

fs = 256; % sampling freq
load("NewEEGSignal.mat");

%% Part1
N = 2*length(NewEEGSignal)-1; % length of autocorr
ar = conv(NewEEGSignal,conj(NewEEGSignal)); % autocorr
S = fftshift(fft(ar));
f = fs*(-N/2:N/2-1)/N; % freq
figure('Name','Part1')
plot(f,abs(S));
grid minor
title('psd of EEGSignal')
xlabel('Frequency(Hz)')
xlim([0,128])

%% Part2
% pwelch
figure('Name','Part2_a')
EEG_pwelch = pwelch(NewEEGSignal); % pwelch
EEG_pwelch = fftshift(EEG_pwelch);
N = length(EEG_pwelch);
f = fs*(-N/2:N/2-1)/N; % freq
plot(f,EEG_pwelch);
grid minor
title('pwelch of EEGSignal')
xlabel('Frequency(Hz)')
xlim([0,128])

% periodogram
figure('Name','Part2_a')
EEG_periodogram = periodogram(NewEEGSignal);
EEG_periodogram = fftshift(EEG_periodogram);
N = length(EEG_periodogram);
f = fs*(-N/2:N/2-1)/N; % freq
plot(f,EEG_periodogram);
grid minor
title('periodogram of EEGSignal')
xlabel('Frequency(Hz)')
xlim([0,128])
