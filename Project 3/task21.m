% Task 2.1 - The advection equation
N = input('Enter a number N: ');
M = input('Enter a number M: ');
a = input('Enter the diffusivity constant a: ');

x = linspace(0, 1, N+1)'; xx = x(1:end-1);
dx = 1/N; dx2 = dx^2;

tend = 5; dt = tend/M;
t = linspace(0, tend, M+1);
[X, T] = meshgrid(x, t);

solMatrix = zeros(N, M+1);
initialEq = exp(-100*(xx - 0.5).^2);
solMatrix(:, 1) = initialEq;
uold = initialEq;

amu = a*(dt/dx)

b = zeros(N,1);
b(1) = -2;
b(2) = 1;
Tdx = toeplitz(b)/dx2;

l2norm = zeros(M+1, 1);
l2norm(1) = rms(initialEq);

for i = 1:M
    unew = LaxWen(uold, amu);
    solMatrix(:, i + 1) = unew;
    l2norm(i + 1) = rms(unew);
    uold = unew;
end

solMatrix = [solMatrix; solMatrix(1, :)];

figure(1);
surf(X, T, solMatrix','EdgeColor','none');
title('Solution for the advection equation');
xlabel('Space x');
ylabel('Time t');

figure(2);
plot(t, l2norm);
title('L^2 norm of the solution');
xlabel('Time t');
ylabel('The L^2 norm');

