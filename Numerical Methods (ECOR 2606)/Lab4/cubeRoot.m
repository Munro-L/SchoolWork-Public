function [root] = cubeRoot(N, x0, Edes)
%CUBEROOT Finds and returns the cube root of a given number
%   INPUTS:
%       N - Number that could have the cube root taken on
%       x0 - Guess of cube root
%       Edes - Desired error margin
%   OUTPUTS:
%       root - The cube root of N
%
%Lindsay Munro-Mirehouse, 100996746

f = @(x) x^3 - N;
fp = @(x) 3*x;
x = x0;

for k = 1:100
   xnew = x - f(x) / fp(x);     %Caculates Newton method
   yr = f(xnew);                %Finds Y associated with new x-value
   Ea = abs(xnew - x);          %Finds approximate error
   
   if Ea <= Edes || yr == 0  % error acceptably small or direct hit
       return;
   end
   
   x = xnew;                    %lets x = xnew to prepare for next itteration
end

error('Newton-Raphson search has not converged.')

end

