%% Task 1.1a
clear;
alpha = 0;
beta = 0;
L = pi;
N = 1000;

equigrid = linspace(0, L, N+2)';
interior = equigrid(2 : end-1);
fvec = sin(interior);
y = twopBVP(fvec, alpha, beta, L, N);
sol = -sin(equigrid);

figure(1);
hold on;
plot(equigrid, y);
plot(equigrid, sol);
title('Plot of the numerical and analytical solution');
grid on;

%% Task 1.1b
alpha = 0;
beta = 0;
L = pi;
k = 1:100;
N = 2.^k;
error(10, 1) = 0;

for i = k
    a = N(i);
    equigrid = linspace(0, L, a+2)';
    interior = equigrid(2 : end-1);
    fvec = sin(interior);
    sol = -sin(equigrid);
    y = twopBVP(fvec, alpha, beta, L, a);
    error(i) = sqrt(L/(a+1)).*norm(y - sol);
    %error(i) = rms(y - sol); %går med rms också
end

figure(1);
loglog(N, error);
title('Plot of the error');
grid on;

%% Task 1.2
alpha = 0;
beta = 0;
L = 10;
E = 1.9e11; %N/m^2 Construction Steel
I = @(x) 1e-3 * (3 - 2.*(cos((pi.*x)/L).^12));
q = -50e3; %kN/m
N = 999;

equigrid = linspace(0, L, N+2)';
interior = equigrid(2 : end-1);

fvec1 = q * ones(N,1);
M = twopBVP(fvec1, alpha, beta, L, N);

denominator = (E.*I(equigrid));
fvec2 = M./denominator;

u = twopBVP(fvec2(2 : end-1), alpha, beta, L, N);

figure(1);
plot(equigrid, u);
title('Plot of the deflection');
grid on;
format long;
display(u(501));
%display(-0.011741059085880);

%% Task 2.1a

% realEigVal = @(k) -(k*pi).^2;
% realEigFun = @(x, k) sin(k*pi*x);
%
% firstEigVal = realEigVal(1);
% secondEigVal = realEigVal(2);
% thirdEigVal = realEigVal(3);

clear;
firstEigVal = -(1*pi).^2;
secondEigVal = -(2*pi).^2;
thirdEigVal =  -(3*pi).^2;

k = 2:13;
N = (2.^k)';
error(length(N), 3) = 0;

for i = 1 : length(N)
    a = N(i);
    [~, lambda] = SturmSolver(a);
    lambda = flipud(lambda);
    error(i, :) = (lambda(1:3))';
end

error(:, 1) = error(:, 1) - firstEigVal;
error(:, 2) = error(:, 2) - secondEigVal;
error(:, 3) = error(:, 3) - thirdEigVal;

figure(1);
loglog(N, error);
grid on;

%% Task 2.1b
N = 499;
[~, lambda] = SturmSolver(499);
lambda = flipud(lambda);
display(lambda(1:3));

%% Task 2.1c
N = 1e3;
numberOfModes = 3;
x = linspace(0, 1, N+2);

[eigenModes, ~] = SturmSolver(N);

figure(1);
title('The three lowest eigenmodes');
xlabel('x in the interval [0, 1]');
ylabel('Eigenmodes');
hold on;

for i = 0 : (numberOfModes - 1)
    plot(x, eigenModes(:, end-i));
end

%% Task 2.2
clear;
%pot = @(x)  700.*(0.5 - abs(x - 0.5))';
pot = @(x) 800.*(sin(pi.*x)).^2;
%pot = @(x) x.*0;
%pot = @(x) dirac(x)

N = 1e3;
numberOfEigF = 4;
x = linspace(0, 1, N)';

[waveFun, probDens, lambda] = SchrodSolver(pot(x), N);

figure(1);
title('Wave Functions');
hold on;
for i = 0 : numberOfEigF - 1
    plot(x, 1e3*waveFun(:, end-i) + lambda(end-i));
end

figure(2);
title('Probability Density');
hold on;
for i = 1 : numberOfEigF
    plot(x, 1e4*probDens(:, end-i) + lambda(end-i));
end

%dx = 1/(N+1);
%x = 0:dx:1;
