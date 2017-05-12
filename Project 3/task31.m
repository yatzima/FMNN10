% Task 3.1 - The convection-diffusion equation
N = input('Enter a number N: ');
M = input('Enter a number M: ');
a = input('Enter a number a: ');
d = input('Enter a number d: ');

Pe = abs(a/d);

x = linspace(0, 1, N+1)'; xx = x(1:end-1);
dx = 1/N; dx2 = dx^2;

display(Pe*dx);

if Pe*dx >= 2
    return
end

tend = 1; dt = tend/M;
t = linspace(0, tend, M+1);
[X, T] = meshgrid(x, t);

solMatrix = zeros(N, M+1);

initialEq = exp(-100*(xx - 0.5).^2);

solMatrix(:, 1) = initialEq;
uold = initialEq;

b = zeros(N,1);
b(1) = -2;
b(2) = 1;
Tdx = toeplitz(b)/dx2;

for i = 1:M
    unew = convdif(uold, a, d, dt);
    solMatrix(:, i + 1) = unew;
    uold = unew;
end

solMatrix = [solMatrix; solMatrix(1, :)];

figure(1);
surf(X, T, solMatrix','EdgeColor','none');
lighting phong;
title('Solution for the convection-diffusion equation');
xlabel('Space x');
ylabel('Time t');