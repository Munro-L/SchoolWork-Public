%Lindsay Munro-Mirehouse, 100996746

%QUESTION 1
Temp = [300 305 310 315 320];
SpecHeat = [4.1354 10.0120 6.5956 3.5266 2.6559];
%i)
p = polyfit(Temp, SpecHeat, 4);
f = @(x) polyval(p,x);
%ii)
xin = linspace(300, 320, 100);
yout = spline(Temp, SpecHeat, xin);
%iii)
y2out = interp1(Temp, SpecHeat, xin, 'pchirp');

Interp303 = f(303);
Spline303 = spline(Temp, SpecHeat, 303);
Hermit303 = interp1(Temp, SpecHeat, 303, 'pchirp');
fprintf('The values of CP at 303 with each method are %f for the polynomial, %f for the cubic spline, and %f for the Cubic Hermite.\n', Interp303, Spline303, Hermit303)

Interp312 = f(312);
Spline312 = spline(Temp, SpecHeat, 312);
Hermit312 = interp1(Temp, SpecHeat, 312, 'pchirp');
fprintf('The values of CP at 312 with each method are %f for the polynomial, %f for the cubic spline, and %f for the Cubic Hermite.\n', Interp312, Spline312, Hermit312)

t = @(x) polyval(p,x) - 6;
cp = fzero(t, [310 315]);
fprintf('The Teperature at specific heat of 6 is %f degrees Kelvin\n\n', cp)

%plots
figure(1)
plot(Temp, SpecHeat, 'O')
title('Temp. vs Specific Heat')
xlabel('Temperature (K)')
ylabel('Specific Heat')
hold on
fplot(f, [300 320])
hold on
plot(xin, yout)
hold on
plot(xin, y2out)
grid on
legend('Data Points', 'Polynomial', 'Cubic Spline', 'Cubic Hermite')

%QUESTION 2
m = 1;
c = 1.5;
ep = 0.6;
I1 = @(x) (1 - (1 - cos(x)) / (2 * ep)).^c .* cos(m * x);
I = 1/(2*pi) * quad(I1, -acos(1 - 2*ep), acos(1 - 2*ep));
fprintf('The load distribution for a ball bearing at epsilon = 0.6 is %f.\n\n', I)

%QUESTION 3
t = [1 2 3.25 4.5 6 7 8 8.5 9.3 10];
v = [5 6 5.5 7 8.5 8 6 7 7 5];
%b)
d = trapz(t, v);
fprintf('The distance travelled according to trapz is %f.\n', d)
%c)
s = polyfit(t, v, 3);
r = @(x) polyval(s, x);
h = (10 - 1) / 2;
t1 = polyval(s,1);
t55 = polyval(s, 5.5);
t10 = polyval(s, 10);
Simpson = (h/3) * (t1 + 4*t55 + t10);
fprintf('The distance travelled according to Simpsons 1/3 is %f.\n', Simpson)
%d
l = quad(r, 1, 10);
fprintf('The distance travelled according to ordinary integration is %f.\n', l)

% figure(2)
% plot(t, v)
% title('Time vs Velocity')
% xlabel('Time (s)')
% ylabel('Velocity (m/s)')
% hold on
% fplot(r, [1 10])
% grid on