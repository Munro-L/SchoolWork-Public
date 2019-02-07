function[] = andrade()
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
    %
    %%Lindsay Munro-Mirehouse, 100996746

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
    title('Exponential Function')
    xlabel('T (K)')
    ylabel('mu')
    grid on
    
    
    
    
    
end
