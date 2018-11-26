Wn = 0.9999;
Wn=0.07;
[b,a] = butter(n, Wn,'low');
out = (filter(b,a,(data)));
trigS = getStarts(trig,0,N,0,0);
[s,diff,trigS,dataS]= getTimeRes(out,trigS,N,15,0.79)
pd = fitdist(diff(diff>35-11 & diff<35+10 & trigS>0 & dataS>0 ),'Normal')
dist = normpdf(0:0.1:100,pd.mu,pd.sigma);
histogram(diff(diff>0 & dataS>0 & trigS>0),100,'Normalization','pdf')
hold on
plot(0:0.1:100,dist)
str = ['{\mu} = ',num2str(pd.mu),newline,'{\sigma} = ',num2str(pd.sigma)]
annotation('textbox',[0.8,.5,0.15,0.15],'String',str,'FontSize',30,'BackgroundColor',[210/256,238/256,250/256])
title('Pulse Arrival Time')
xlabel('Time (samples)')
ylabel('Normalized Count')




