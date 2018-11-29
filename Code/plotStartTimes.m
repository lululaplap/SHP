
figure
%ylim([-0.5,1])
for i =1:30000-1
    i
    if dataS(i)>0 & trigS(i)>0 & diff(i)>0
    signal = out(256*i:256+i*256);%.',0.9,15);
    trigSig = trig(256*i:256+i*256);
    plot(signal)
    hold on
    plot(trigSig)
    hold on
    scatter(dataS(i),signal(dataS(i)))
    hold on
    scatter(trigS(i),trigSig(int32(trigS(i))))
    ylim([-1,1])
    hold on
    %plot(data(i:256+i))
    hold off
    pause(0.5)
    
    end
end