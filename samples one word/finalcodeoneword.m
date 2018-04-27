%% clc;
close all;
clear all;
msgbox('     welcome my friend');
p = which('a.wav');
filelist = dir([fileparts(p) filesep 'a*.wav']);
filenames = {filelist.name}';
n=length(filenames)
inp=zeros(n,5);
i1=zeros(20,5);
i2=zeros(20,5);
i3=zeros(20,5);
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
%u=plot(frequency_audio,abs(FFT_audio_in));

%figure
%x=plot(frequency_audio,b);
%title('FFT of Input Audio');
%xlabel('Frequency(Hz)1');
%ylabel('Amplitude');

%figure
%y=plot(frequency_audio((a):(a+1500)),b((a):(a+1500)));
c=frequency_audio((a):(a+1500)).*transpose(b((a):(a+1500)));
r=z((a):(a+1500)).*transpose(b((a):(a+1500))');
c=c(c~=0);
r=r(r~=0);
d=[c,r'];

%length=m/10e4;
%c=sort(floor(c));
if k<=20
    i1(k,1:end) = (c);
   
elseif k>20 && k<=40
 i2(k-20,1:end) = (10*c);

else
    i3(k-40,1:end) = (100*c);
    
end
end
%figure,plot(c);
%figure,plot(f,mx);

%define target

%tar(61:80,1)=10000;
%tar(121:150,1)=5;
 
%neural network training

% 3 hidden layers with 10 neurons
inp1 = inp(1:20,:);
tar1 =  g1
trinput1 = i1';
trtarget1 = tar1';
n1=50;
n2=50;
n3=50;
net=newff(trinput1,trtarget1,[n1,n2],{'tansig' 'tansig' 'tansig', 'purelin'});
net.performFcn='msereg';
net.performParam.ratio=0.9; 
net.trainparam.show = 5;
net.trainparam.epochs = 1000;
net.trainparam.goal = 2;
net.trainparam.min_grad = 10e-10;
net.trainparam.mu_max = 1e10;
net.trainparam.max_fail=100000;
net = train(net,trinput1,trtarget1);

inp2 = inp(21:40,:);
tar2 =  g2;
trinput2 = i2';
trtarget2 = tar2';
n1=30;
n2=30;
n3=50;


net1=newff(trinput2,trtarget2,[n1,n2],{'tansig' 'tansig' 'tansig','purelin'});
net1.performFcn='msereg';
net1.performParam.ratio=0.9; 
net1.trainparam.show = 5;
net1.trainparam.epochs = 1000;
net1.trainparam.goal = 2;
net1.trainparam.min_grad = 1e-10;
net1.trainparam.mu_max = 1e10;
net1.trainparam.max_fail=100000;
net1 = train(net1,trinput2,trtarget2);


inp3 = inp(41:60,:);
tar3 =  g3;
trinput3 = i3';
trtarget3 = tar3';
n1=50;
n2=50;
n3=50;



net2=newff(trinput3,trtarget3,[n1,n2],{'tansig' 'tansig' 'tansig', 'purelin'});
net2.performFcn='msereg';
net2.performParam.ratio=0.9; 
net2.trainparam.show = 5;
net2.trainparam.epochs = 1000;
net2.trainparam.goal = 2;
net2.trainparam.min_grad = 1e-10;
net2.trainparam.mu_max = 1e10;
net2.trainparam.max_fail=100000;
net2 = train(net1,trinput3,trtarget3);


disp('hey training has been done');
msgbox('Network Training Has been done my friend');
pause(2);
msgbox('thankyou');
%%
%clear all the screen

% retriveing the sample data and sample rate
[audio_in,audio_freq_sampl]=audioread('v.wav');

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
%c=50*c;
%c=sort(floor(c));
y=sim(net,c')
y1=sim(net1,c')
y2=sim(net2,c')
if y < 15 && y >10
    msgbox('Welcome VAMSI How may I Help You');
elseif y >15 && y <20
    msgbox('Welcome KANAKA RAJU How may I Help You');
elseif y > 20 && y<30
    msgbox('Welcome SARATH How may I Help You');
else
    msgbox('Welcome SAI MANOJ How may I Help You'); 
end

    



