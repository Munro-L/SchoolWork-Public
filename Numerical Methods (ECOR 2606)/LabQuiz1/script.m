A = 5;
B = 3;

DistVec = zeros(1,45);

for t = 0:45
    DistVec(t + 1) = door(A,B,t + 1);
end

figure(1)
plot(0:45,DistVec)
title('Distance Between Doors')
xlabel('Time')
ylabel('Distance')
grid on

    