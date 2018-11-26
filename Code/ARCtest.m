x=-100:0.1:100;
frac=0.3
del=100

y=normpdf(x,1,10);
z = normpdf(x,1,20);
plot(x,z)
hold on
plot(x,y)
hold on
y_new = ARC(y,frac,del);
y_new= y_new;
plot(x,y_new)
hold on
z_new = ARC(z,frac,del);
z_new = z_new;
plot(x,z_new)
hold on
line(xlim,[0,0])