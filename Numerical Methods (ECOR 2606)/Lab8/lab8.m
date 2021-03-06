%Lindsay Munro-Mirehouse, 100996746

%Imports data and shoves it into x and y vectors
A = importdata('data.txt');
x = A(:,1);
y = A(:,2);

%makes a cute plot c:
figure(1)
plot(x,y)
title('Graph of Data.txt')
xlabel('x')
ylabel('y')
grid on
hold on

%does a curve fit and plots it over original data
p = polyfit(x,y,3);
f = @(x) p(1)*x^3 + p(2)*x^2 + p(3)*x + p(4);
fplot(f,[4 20])

%finds value that gves 0.065
g = @(x) p(1)*x^3 + p(2)*x^2 + p(3)*x + p(4) - 0.065;
val = fzero(g,[8 10]); 

%outputs results nicely
fprintf('The coefficients of the 3rd order polynomial are: %d, %d, %d and %d.\nThe x-value of the fitted curve that gives 0.065 is %d.\n',p,val)                                                                                                                                                                     