trigS = getStarts(trig,0,N,0,0);
f = @(x)getTimeRes(out,trig,N,frac,del);
dels = linspace(13,17,1);
fracs = linspace(0,1,1);
[x,y] = ndgrid(dels,fracs);
fit = arrayfun(@(p1,p2) getTimeRes(out,trigS,N,p1,p2),x,y);
[mini, ind] = min(fit);N
% min
% options = optimoptions('fminunc')
% options.Display = 'iter';
% fminunc(f,[0.5,25])
% x = getTimeRes(out,trigS,N,40,0.11)

