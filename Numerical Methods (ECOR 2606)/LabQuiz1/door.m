function [d] = door(A, B, t)
    %Lindsay Munro-Mirehouse, 100996746
    %INPUTS
        %A = Size of door 1
        %B = Size of door 2
        %t = time elapsed
    %OUTPUTS
        %d = distance the doors are apart from eachother


    %Checks if entries are reasonable
    if t < 0 || A <= 0 || B <= 0
        error('Negative entries are not allowed')
    end

    %Door A
    Xa = @(theta) A*cos(theta);
    Ya = @(theta) A*sin(theta);

    %Door B
    Xb = @(theta) -B*cos(theta) + A;
    Yb = @(theta) B*sin(theta);

    %angle doors will open to
    theta = 2 * t;

    %positions of the two doors
    Apos = [Xa(theta) Ya(theta)];
    Bpos = [Xb(theta) Yb(theta)];

    %difference in door positions
    PosDiff = Bpos - Apos;
    d = sqrt(PosDiff(1)^2 + PosDiff(2)^2);    

    return
end


