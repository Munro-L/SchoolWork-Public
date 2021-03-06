function[] = work()
    %Lindsay Munro-Mirehouse, 100996746
    
    %Part 1
    %Imports data and shoves it into x and y vectors
    A = importdata('data.txt');
    x = A(:,1);
    y = A(:,2);

    %makes a cute plot c:
    figure(1)
    plot(x,y,'O')
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
    fprintf('The coefficients of the 3rd order polynomial are: %d, %d, %d and %d.\nThe x-value of the fitted curve that gives 0.065 is %d.\n',p,val)
    
    
    %Part 2
    T = [0 5 10 20 30 40];
    for i = 1:6
        T(i) = T(i) + 273.15;
    end
    mui = [1.787 1.519 1.307 1.002 0.7975 0.6529];
    fitExp(mui,T);
end

function [D,B] = fitExp(mu,Ta)
    %FITEXP Takes in mu and Ta to calculate exponential fit for given data
    %   INPUTS:
    %       mu - Dynamc viscosity
    %       Ta - Absolute temperature (K)
    %   OUTPUTS
    %       D, B - Unknown parameters

    %makes linear
    muTrans = log(mu);

    %linear regression
    fex = polyfit(Ta, muTrans, 1);

    %finds D and B
    D = exp(fex(2));
    B = fex(1);
    
    %subs B and D into anon function
    g = @(x) D * exp(B*x);
    
    figure(2)
    fplot(g,[270 315])
    hold on
    plot(Ta,mu,'O')
    title('Andrade Function')
    xlabel('T (K)')
    ylabel('mu')
    grid on
end
