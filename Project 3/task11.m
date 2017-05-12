% Task 1.1 - The diffusion equation
N = input('Enter a number N: ');
M = input('Enter a number M: ');

x = linspace(0, 1, N+2)'; xInterior = x(2:end-1);
dx = 1/(N+1); dx2 = dx^2;

trange = 0.1; dt = trange/M;
t = linspace(0, trange, M+1);

[X, T] = meshgrid(x, t);

a = zeros(N,1);
a(1) =-2;
a(2) =1;
Tdx = toeplitz(a)/dx2;

solMatrix = zeros(N, M+1);

initialEq = 10*(0.5 - abs(xInterior-0.5));
%initialEq = xInterior.^2 - xInterior;

solMatrix(:, 1) = initialEq;
uold = initialEq;

for i = 1:M
    unew = eulerstep(Tdx, uold, dt);
    %unew = TRstep(Tdx, uold, dt); %Crank-Nicholson method for Task 1.2
    solMatrix(:, i+1) = unew;
    uold = unew;
end

solMatrix = [zeros(1, length(t)); solMatrix; zeros(1, length(t))];

figure(1);
surf(X, T, solMatrix','EdgeColor','none')
lighting phong;
%title('Solution for the diffusion equation');
%xlabel('Space x');
%ylabel('Time t');

CFL = dt/dx2;
display(CFL);