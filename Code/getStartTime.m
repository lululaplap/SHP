function t=getStartTime(signal,thresh)
t=find(signal>0 & gradient(signal)>=0,1);
if isempty(t)
    t=0;
else
    t=t;
end
end