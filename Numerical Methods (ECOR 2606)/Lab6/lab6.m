%Lindsay Munro-Mirehouse, 100996746
%LAB 6

%set up equations in form Ax = b
A = [2 -14 5; 5 6 -2; 1 5 3];
b = [52; 2; 17];

%solve for x using inverses
x = inv(A) * b;
fprintf('Using inv(A): The values for a, b and c are %d, %d, and %d.\n', x)

x = A^-1 * b;
fprintf('Using A^-1: The values for a, b and c are %d, %d, and %d.\n', x)

%solving using left division
x = A \ b;
fprintf('Using \: The values for a, b and c are %d, %d, and %d.\n', x)