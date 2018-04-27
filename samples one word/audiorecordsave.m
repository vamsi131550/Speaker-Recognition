micrecorder = audiorecorder(44100,16,1);micrecorder = audiorecorder(8800,16,1);
disp('Now, speak into microphone...');
record(micrecorder,1);
while (isrecording(micrecorder)==1)
disp('Recording...');
pause(0.5);
end
disp('Recording stopped.');
y1 = getaudiodata(micrecorder);
st=strcat('u',num2str(1));
wavwrite(y1,8800,16,st)