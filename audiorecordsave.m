 micrecorder = audiorecorder(44100,16,2);
disp('Now, speak into microphone...');
record(micrecorder,3);
while (isrecording(micrecorder)==1)
disp('Recording...');
pause(0.5);
end
disp('Recording stopped.');
y1 = getaudiodata(micrecorder);
st=strcat('u',num2str(1));
wavwrite(y1,44100,16,st);