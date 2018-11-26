function out = CRT(input,frac,del)
out1 = [frac.*input,zeros(1,del)];
out2 = [zeros(1,del),-input];
out=out1+out2;

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

