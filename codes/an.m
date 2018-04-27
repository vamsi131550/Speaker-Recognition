close all;
[audio_in,audio_freq_sampl]=audioread('p.wav');
Length_audio=length(audio_in);
df=audio_freq_sampl/Length_audio;
frequency_audio=-audio_freq_sampl/2:df:audio_freq_sampl/2-df;

FFT_audio_in=fftshift(fft(audio_in))/length(fft(audio_in));
 % Flat bottom with value of 2 from indexex 4-6
%[peakValues, indexesOfPeaks] = findpeaks(abs(FFT_audio_in),'MinPeakDistance', 20);

%minIndexes = imregionalmin(abs(FFT_audio_in))
b=abs(FFT_audio_in);
u=plot(frequency_audio,abs(FFT_audio_in));
/*for i=1:length(fft(audio_in))
        if (b(i)>=(max(b)/1.7))
           b(i)=b(i);
        
        else
            
    
            b(i)=0;
        
        end

end
  %      c=abs(FFT_audio_in);
d=length(frequency_audio);
a=floor(d/2);
%[peakValues1, indexesOfPeaks] = findpeaks(abs(FFT_audio_in),'MinPeakHeight',(max(b)/1.5));
%minIndexes = imregionalmin(-b);

[Maxima,MaxIdx] = findpeaks(b,'npeaks',20);
bInv = 1.01*max(b) - b;
[Minima,MinIdx] = findpeaks(bInv);
j=1;
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


figure
%x=plot(frequency_audio,abs(FFT_audio_in));
%x=plot(frequency_audio,b);
title('FFT of Input Audio');
xlabel('Frequency(Hz)1');
ylabel('Amplitude');
%x=plot(frequency_audio,minIndexes );
y=plot(frequency_audio((a):(a+1500)),b((a):(a+1500)));
c=frequency_audio((a):(a+1500)).*transpose(b((a):(a+1500)));
c=c(c~=0);% elimination of zeros
%[~,ii] = sort(a(1,:));        // ascending order
%out = a(:,ii);
c=sort(floor(c));
count=0;
for i=1:length(c);
    for j=1:length(x)
        if abs(c(i)-x(j))<=3;
            count=count+1;
        else
            count=count;
        end
    end
end
%count=count/length(c);