clear
clc
xd = [ 3.0 4.5 7.0 9.0 ];
yd = [ 2.0 1.0 2.5 0.5 ];
xplot=linspace(3, 9, 100);
youts=interp1(xd,yd,xplot,'spline');
plot (xd, yd, 'xk', xplot,youts,'-g','MarkerSize', 10);
axis ([2 10 0 4]); 
grid on;
hold on;


hold off;