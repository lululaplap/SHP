function start=getStarts(out,cdr,N,del,frac)
tol = 49;
start = zeros([30000-1,1]);

for i=1:N-1
    
    lvls = statelevels(out(i*256:(i*256)+256));
    if cdr==1
        signal = ARC(((out(i*256:(i*256)+256))-lvls(1)).',frac,del);
        signal=signal(50:256);
        pw = pulsewidth(signal,'Polarity','positive');%,'MidPercentReferenceLevel',100-tol-1,'Tolerance',tol,'Polarity','positive');
        lvls = statelevels(signal);
%         statelevels(signal)
%         ylim([-0.5,0.5])
%         hold on
        if and(size(pw)==1,lvls(2)-lvls(1)>0.05)
            x = getStartTime(signal,frac*lvls(2));
            start(i) = x;
%             if not(start(i)==0)
%             scatter(start(i), signal(start(i)))
%             end
           
        else
            start(i) = 0;
        end
%                     pause(0.5)

        hold off
    else
        signal = out(i*256:(i*256)+256);
        [W,I,F] = pulsewidth(signal);
        if size(W)==1
            start(i) = I;
        else
            start(i) = 0;
        end
    end
    
    
end
end