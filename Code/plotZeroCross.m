figure
ylim([-0.5,0])

% for i =1:10000
%     if and(size(pulsewidth((out(i*256:(i*256)+256))))==1,1)
% %     plot((out(i:256+i)))
%     ylim([-0.5,0])
% % %     hold on
% % %     plot(data(i:256+i))
% % %     hold off
%         pulsewidth((out(i*256:(i*256)+256)),'MidPercentReferenceLevel',7,'Tolerance',6)
%     end
%      pause(0.04)
%      
% end
figure;
tol = 2
midref = 97
for i=1:9999
    lvls = statelevels(out(i*256:(i*256)+256));
    signal = ARC((out(i*256:(i*256)+256)-lvls(1)).',frac,del);
    signal=signal(del+1:256);
    pw = pulsewidth(signal,'MidPercentReferenceLevel',midref,'Tolerance',tol,'Polarity','positive');
    lvls = statelevels(signal);
    zeropts = find(signal<0.005 & signal>-0.005);

    if and(size(pw)==1,lvls(2)-lvls(1)>0.05)
        %pulsewidth(signal,'MidPercentReferenceLevel',midref,'Tolerance',tol,'Polarity','negative')
        plot(signal);
        hold on
        size(zeropts)
        hold on
        scatter(zeropts,signal(zeropts));
        hold on
        pause(1)
        
%     else
%         ax = gca;
%         ax.ColorOrderIndex = 2;
%         plot(signal);
%         hold on
    end
    hold off
end