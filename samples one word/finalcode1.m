%% clc;
close all;
clear all;
msgbox('     welcome my friend');
p = which('a.wav');
filelist = dir([fileparts(p) filesep 'a*.wav']);
filenames = {filelist.name}';
n=length(filenames);
inp=zeros(n,5);
y1=zeros(n,5);
for k=1:n
    
    % read wave files
  
    [audio_in,audio_freq_sampl]=audioread(filenames{k});
    [m,o]=size(audioread(filenames{k}));

Length_audio=length(audio_in);% find the length of the audio

df=audio_freq_sampl/Length_audio;%finding the duration of the signal

frequency_audio=-audio_freq_sampl/2:df:audio_freq_sampl/2-df; 

FFT_audio_in=fftshift(fft(audio_in))/length(fft(audio_in));%fast fourier transform

 b=abs(FFT_audio_in);
 

d=length(frequency_audio);
 
a=floor(d/2);

[Maxima,MaxIdx]=findpeaks(b,'sortstr','descend');

z=b;
Maxima=Maxima(1:10);
MaxIdx=MaxIdx(1:10);

for i=1:length(b);
    if i<=length(MaxIdx)
      b(MaxIdx(i))=6.125;
       
        
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
u=plot(frequency_audio,abs(FFT_audio_in));

%figure
x=plot(frequency_audio,b);
%title('FFT of Input Audio');
%xlabel('Frequency(Hz)1');
%ylabel('Amplitude');


c=frequency_audio((a):(a+1500)).*transpose(b((a):(a+1500)));
r=z((a):(a+1500)).*transpose(b((a):(a+1500))');
c=c(c~=0);
r=r(r~=0);
d=[c,r'];

%length=m/10e4;
%c=sort(floor(c));
%if k<=20
%else if k >20 && k <= 40
 %       c = 100*c;
%else k > 40 && k <= 60
    %    c = 1000*c;
    %end 
    inp(k,1:end) = (c); 
end
  
figure,plot(c);
%figure
y=plot(frequency_audio((a):(a+1500)),b((a):(a+1500)));
%define target
tar=zeros(40,1);
tar(1:20,1)=1;
tar(21:40,1)=1000;
%tar(41:60,1)=1000;
%tar(61:80,1)=10000;
%tar(121:150,1)=5;
 
%neural network training
trinput = inp';
trtarget = tar';

% 3 hidden layers with 10 neurons
n1=70;
n2=70;
n3=10;
net=newff(trinput,trtarget,[n1,n2],{'tansig' 'tansig' 'tansig', 'purelin'});
net.performFcn='msereg';
net.performParam.ratio=0.99; 
net.trainparam.show = 5;
net.trainparam.epochs = 800;
net.trainparam.goal =1;
net.trainparam.min_grad = 1e-10;
net.trainparam.mu_max = 1e10;
net.trainparam.max_fail=100000;
net = train(net,trinput,trtarget);


disp('hey training has been done');
msgbox('Network Training Has been done my friend');
pause(2);
msgbox('thankyou');
%%
%clear all the screen

% retriveing the sample data and sample rate
[audio_in,audio_freq_sampl]=audioread('a34.wav')

Length_audio=length(audio_in);% find the length of the audio
df=audio_freq_sampl/Length_audio;%finding the duration of the signal

frequency_audio=-audio_freq_sampl/2:df:audio_freq_sampl/2-df; 

FFT_audio_in=fftshift(fft(audio_in))/length(fft(audio_in));%fast fourier transform

 b=abs(FFT_audio_in);
 

d=length(frequency_audio);
 
a=floor(d/2);

[Maxima,MaxIdx]=findpeaks(b,'sortstr','descend');

z=b;
Maxima=Maxima(1:10);
MaxIdx=MaxIdx(1:10);

for i=1:length(b);
    if i<=length(MaxIdx)
      b(MaxIdx(i))=6.125;
        
    end
end
for i=1:length(b);
    if b(i)==6.125;
      b(i)=1;
       
      
    else
        b(i)=0;
        
    end
end





%y=plot(frequency_audio((a):(a+1500)),b((a):(a+1500)));
c=frequency_audio((a):(a+1500)).*transpose(b((a):(a+1500)));
r=z((a):(a+1500)).*transpose(b((a):(a+1500))');
c=c(c~=0);
r=r(r~=0);
d=[c,r'];
c=c;
inp(1,1:end) = (c);
%c=sort(floor(c));
y=sim(net,c')
y1(1,1:end) = (y);
if y < 85 && y >5 ||y< 980 && y >900
    msgbox('Welcome vamsi How may I Help You');
elseif y>980 && y <1200
    msgbox('Welcome sai manoj How may I Help You');
else
    msgbox('Welcome uday How may I Help You'); 
end

    



