Wn = 0.9999;
Wn=0.07;
[b,a] = butter(n, Wn,'low');
out = (filter(b,a,(data)));
trigS = getStarts(trig,0,N,0,0);
[s,diff,trigS,dataS]= getTimeRes(out,trigS,N,23,0.9)
% pd = fitdist(diff(diff>35-11 & diff<35+10 & trigS>0 & dataS>0 ),'Normal')
% dist = normpdf(0:0.1:100,pd.mu,pd.sigma);
% histogram(diff(diff>0 & dataS>0 & trigS>0),100,'Normalization','pdf')
% hold on
% plot(0:0.1:100,dist)
% str = ['{\mu} = ',num2str(pd.mu),newline,'{\sigma} = ',num2str(pd.sigma)]
% annotation('textbox',[0.8,.5,0.15,0.15],'String',str,'FontSize',30,'BackgroundColor',[210/256,238/256,250/256])
% title('Pulse Arrival Time')
% xlabel('Time (samples)')
% ylabel('Normalized Count')
figure;





ha(1) = subplot(1,2,1)
histogram(diff(not(isnan(dataS)) & not(isnan(trigS))),75,'Normalization','pdf')
hold on
pd = fitdist(diff( not(isnan(dataS)) & not(isnan(trigS))),'Kernel','BandWidth',1)
x=-200:0.1:60;
y=pdf(pd,x)
plot(x,y);
hold on
cond = x>23 & x<33
f = fit(x(cond).',y(cond).','gauss1')
plot(f,'--k')
% xlim([0,1])
Sa=10.24
str = ['{\mu} = ',num2str(round(f.b1/Sa,2)),'ns',newline,'{\sigma} = ',num2str(round(f.c1*1000/Sa)),'ps']
annotation('textbox',[0.15,.5,0.15,0.15],'String',str,'FontSize',30,'BackgroundColor',[210/256,238/256,250/256])
title("Transit Time Spread")
xlabel("Time (Samples)")
ylabel("Normalised Count")
ha(2) = subplot(1,2,2)
histogram(diff(not(isnan(dataS)) & not(isnan(trigS))),75,'Normalization','pdf')
hold on
x=0:0.1:60;
y=pdf(pd,x)
plot(x,y);
hold on
plot(f,'--k')
ylim(ha(2),[0,0.02])
xlim(ha(2),[0,60])
xlim(ha(1),[-200,60])
ylabel(ha(2),'')
%set(ha(2),'yticklabel','')
legend({'Transit Time Spread','Kernel Fit','Gaussian Fit'},'Location','northwest');







