N = 30;
M = 400;

x = linspace(0, 1, N+2)';
xInterior = x(2:end-1);
dx = 1/(N+1); 
dx2 = dx^2;

trange = 0.1;
dt = trange/M;
t = linspace(0, trange, M+1);

[X, T] = meshgrid(x, t);

a = zeros(N,1); 
a(1) =-2; 
a(2) =1; 
Tdx = toeplitz(a)/dx2;

solMatrix = zeros(N, M+1);

testEquation = 7*exp(-30.*(xInterior-0.6).^2) + (1/3)*sin(pi*xInterior);

solMatrix(:, 1) = testEquation;
uold = testEquation;

for i = 1:M
    unew = TRstep(Tdx, uold, dt);
    solMatrix(:, i+1) = unew;
    uold = unew;
end

solMatrix = [zeros(1, length(t)); solMatrix; zeros(1, length(t))];

figure(1);
surf(X, T, solMatrix')
title('Solution');

CFL = dt/dx2;
display(CFL);