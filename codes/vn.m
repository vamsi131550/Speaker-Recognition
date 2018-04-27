clear all;clc
[audio_in,audio_freq_sampl]=audioread('h.wav');

sound(audio_in,audio_freq_sampl)% Sampling Rate
[audio_in1,audio_freq_sampl1]=audioread('g.wav');
[P1,f1] = periodogram(audio_in,[],[],audio_freq_sampl,'power');
[P2,f2] = periodogram(audio_in1,[],[],audio_freq_sampl1,'power');

figure
t = (0:numel(audio_in)-1)/audio_freq_sampl;
t1 = (0:numel(audio_in1)-1)/audio_freq_sampl1;
subplot(2,2,1)
plot(t,audio_in,'k')
ylabel('s1')
grid on
title('Time Series')
subplot(2,2,3)
plot(t1,audio_in1)
ylabel('s2')
grid on
xlabel('Time (secs)')
subplot(2,2,2)
plot(f1,P1,'k')
ylabel('P1')
grid on
axis tight
title('Power Spectrum')
subplot(2,2,4)
plot(f2,P2)
ylabel('P2')
grid on
axis tight
xlabel('Frequency (Hz)')
