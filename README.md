# EEG Signal Processing CHW1

## Overview

This project focuses on analyzing a continuous signal with a time-varying frequency using MATLAB. 

## Objectives

1. **Generate Chirp Signal**
   - Create a 2-second segment with a 1000 Hz sampling frequency using the `chirp` function.

2. **Analyze Windows**
   - Generate and compare rectangular, triangular, Gaussian, and Hamming windows (length 128).
   - Plot their time-domain and frequency-domain representations.

3. **STFT Analysis**
   - Compute and plot the spectrogram using `spectrogram` with different windows. Compare results.

4. **Window Overlap and Length**
   - Study effects of overlap points (0, 64, 127) and window lengths (32, 128, 512) on the spectrogram.

5. **FFT Points**
   - Examine the impact of varying FFT points (2, 4, 8) on one window type.

6. **Custom Spectrogram Function**
   - Implement and test a custom spectrogram function, comparing it with MATLAB’s built-in `spectrogram`.

7. **EEG Signal Processing**
   - Analyze a provided EEG signal (512 samples, 256 Hz) using time-domain, frequency-domain, and STFT plots.
   - Downsample and compare the results, applying zero padding and varying DFT points.

8. **Power Spectral Density**
   - Compute and compare PSD using autocorrelation, `periodogram`, and `pwelch`.

## Requirements

- MATLAB

