for i = 1:30000-1
    pw = pulsewidth(out(i*256:(i*256)+256),'Polarity','positive');
    lvls = statelevels(ARC(out(i*256:(i*256)+256).',0.2,2));
    if and(size(pw)==1,lvls(2)-lvls(1)>0.05)
    statelevels(ARC(out(i*256:(i*256)+256).',0.2,2));
    ylim([-0.5,0.5])
    hold on
    plot(trig(i*256:(i*256)+256));
    pause(0.25)
    end
end