% p=2736
frac=0.9; del=23;
figure;
tol = 2
heights = zeros([9999,1]);
widths = zeros([9999,1]);
for i=1:N-1
    lvls = statelevels(out(i*256:(i*256)+256));
    heights(i) =lvls(2)-lvls(1);
    signal = ARC((out(i*256:(i*256)+256)-lvls(1)).',frac,del);
    signal(del+1:256);
    pw = pulsewidth(signal,'MidPercentReferenceLevel',100-tol-1,'Tolerance',tol,'Polarity','negative');
    lvls = statelevels(signal);
    plot(signal)
    if and(size(pw)==1,lvls(2)-lvls(1)>0.05)
        zeropts = find(signal<0.05 & signal>0.00);
        hold on
        scatter(zeropts,signal(zeropts));
        s=size(zeropts);
        if s(2)>1           
            widths(i) = max(zeropts(2:s(2))-zeropts(1:s(2)-1));
        end     
    end
    hold on
    pause(0.5)
    hold off
end
histogram(widths(widths>0 & widths<200),'Normalization','pdf')
hold on
pd = fitdist(widths(widths>0 & widths<110),'Normal')
dist = normpdf(1:0.1:256,pd.mu,pd.sigma);
plot(1:0.1:256,dist);
title("Pulse Width Spectrum")
xlabel("Time(samples)")
ylabel("Normalised Count")
Sa=10.24
str = ['{\mu} = ',num2str(round(pd.mu/Sa,2)),'ns',newline,'{\sigma} = ',num2str(round(pd.sigma/Sa,2)),'ns']
annotation('textbox',[0.6,.5,0.16,0.15],'String',str,'FontSize',30,'BackgroundColor',[210/256,238/256,250/256])
xlim([0,256]);
figure;
histogram(heights,100,'Normalization','pdf')
hold on
pd = fitdist(heights,'Kernel','BandWidth',0.01)
x=0:0.001:1;
y=pdf(pd,x)
plot(x,y);
hold on
f = fit(x(x>0.1 & x<0.26).',y(x>0.1 & x<0.26).','gauss1')
plot(f,'--k')
title("Pulse Height Spectrum")
xlabel("Pulse Height(-V)")
ylabel("Normalised Count")
xlim([0,1])
legend('Height spectrum','Kernel Fit','Gaussian Fit');
str = ['{\mu} = ',num2str(round(f.b1*10^3,1)),'mV',newline,'{\sigma} = ',num2str(round(f.c1*10^3,1)),'mV']
annotation('textbox',[0.6,.5,0.16,0.15],'String',str,'FontSize',30,'BackgroundColor',[210/256,238/256,250/256])


