function [s,diff,trigS,dataS]=getTimeRes(out,trigS,N,del,frac)
frac
del=int32(del)
dataS = getStarts(out,1,N,del,frac);
diff=dataS-trigS;
x=diff(dataS>0 & trigS>0)
try
    pd = fitdist(diff(dataS>0 & trigS>0 & diff>0),'Normal');
    size(diff(dataS>0 & trigS>0 & diff>0 & diff<9000))
    histogram(diff(dataS>0 & trigS>0))
    s = pd.sigma;
    
catch
    s = 1000
end
end