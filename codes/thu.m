
[Maxima,MaxIdx] = findpeaks(b);
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

