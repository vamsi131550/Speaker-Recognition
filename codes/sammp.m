close all;
clear all;
clc
X=0;
folder='C:\Users\DOLLY\Desktop\SIG';
audio_files=dir(fullfile(folder,'*.wav'));
for i=1:10;
filename=audio_files(i).name;
[audio_in,audio_freq_sampl]=audioread(filename);
Length_audio=length(audio_in);
df=audio_freq_sampl/Length_audio;
frequency_audio=-audio_freq_sampl/2:df:audio_freq_sampl/2-df;

FFT_audio_in=fftshift(fft(audio_in))/length(fft(audio_in));
 % Flat bottom with value of 2 from indexex 4-6
%[peakValues, indexesOfPeaks] = findpeaks(abs(FFT_audio_in),'MinPeakDistance', 20);

%minIndexes = imregionalmin(abs(FFT_audio_in))
b=abs(FFT_audio_in);
  %      c=abs(FFT_audio_in);
d=length(frequency_audio);
a=floor(d/2);
[Maxima,MaxIdx]=findpeaks(b,'sortstr','descend');
%[Maxima,MaxIdx] = findpeaks(abs(FFT_audio_in),'npeaks',20);
%bInv = 1.01*max(b) - b;
%[Minima,MinIdx] = findpeaks(bInv);
Maxima=Maxima(1:20);
MaxIdx=MaxIdx(1:20);
for i=1:length(b);
    if i<=length(MaxIdx)
      b(MaxIdx(i))=6.125;
       
      
    else
        k=0;
        
    end
end
for i=1:length(b);
    if b(i)==6.125;
      b(i)=1;
       
      
    else
        b(i)=0;
        
    end
end


%figure
%x=plot(frequency_audio,abs(FFT_audio_in));
%x=plot(frequency_audio,b);
title('FFT of Input Audio');
xlabel('Frequency(Hz)1');
ylabel('Amplitude');
%x=plot(frequency_audio,minIndexes );
%/*y=plot(frequency_audio((a):(a+1500)),minIndexes((a):(a+1500)));
c5=frequency_audio((a):(a+1500)).*transpose(b((a):(a+1500)));
c5=c5(c5~=0);% elimination of zeros
%[~,ii] = sort(a(1,:));        // ascending order
%out = a(:,ii);
X=[c5,X];
end
x=sort(floor(X));
