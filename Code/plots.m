
% size(data)
plot(data(:,1))
figure;
% for i =1:4
%     abs(fft(data(1:1000,i))));
%     hold on;
% end
% close all
% x = data(:,1).*data(:,2).*data(:,3).*data(:,4);
% plot(abs(fft(x(1:1000))))
A = [57 59 60 100 59 58 57 58 300 61 62 60 62 58 57];
TF = isoutlier(A)
events = data;
% events = events.*(events>0.001 | events<-0.001);
events = events(isoutlier(events));
events = events(1:1280*floor(size(events)/1280));
events = reshape(events,256,[],5);

plot(events(200,:,2));
figure
histogram(events(:,:,2))

