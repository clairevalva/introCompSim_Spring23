% last edited by CV, February 2023
% script to introduce plotting and saving figures in matlab

xs = 0:0.1:100;
ys_1 = sin(xs*2) * 3;
ys_2 = cos(xs*5) * 5;

clf
plot(xs, ys_1)
hold on
plot(xs, ys_2, 'blue')
xlabel("x")
ylabel("f(x)")
legend("f(x) = 3sin(2x)", "f(x) = 5cos(5x)")
xlim([0,10])

% if you don't want to just click save figure, you can save the plot like
% this:
print('-dpng','-r300',"sample_fig.png")