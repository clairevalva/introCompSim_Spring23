% using subplots 
subplot(2,1,1); % col, row, 1st plot
x = linspace(0,10);
y1 = sin(x);
plot(x,y1)

subplot(2,1,2); % col, row, 2nd plot
y2 = sin(5*x);
plot(x,y2)