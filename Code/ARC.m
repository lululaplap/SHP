function out = ARC(input,frac,del)
out2 = [-frac.*input,zeros(1,del)];
out1 = [zeros(1,del),input];
out=out1+out2;
s=size(input)
out=out(1:s(2));

% plot(input)
% hold on
% plot(out1)
% hold on
% plot(out2)
% hold on
% hold on
% plot(out)
% legend('input','frac aten','invert del','out')
end
