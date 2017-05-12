%% Task 1.1 - The diffusion equation
%Instability will look different depending on whether N is odd or even.
N = 30;
equigrid = linspace(0, 1, N+2)';
xint = equigrid(2:end-1);
dx = 1/(N+1);
dx2 = dx^2;

M = 400;  %Stability border 189.
%M= 100; N= 99, M =100% For Crank-Nicolson  % Pr?va med M < 10.
trange = 0.1;
dt = trange/M;
t = linspace(0, trange, M+1);
[X, T] = meshgrid(equigrid, t);

a = zeros(N,1); a(1) =-2; a(2) =1; Tdx = toeplitz(a)/dx2; %Tdx

CFL = dt/dx2;
display(CFL);

%Arbitrary function. Try with extra sinoidal terms.

solMatrix = zeros(N, M+1);

testEquation = 3*exp(-30.*(xint-0.4).^2) + 0.5*sin(3*pi*xint);

solMatrix(:, 1) = testEquation;
uold = testEquation;

for i = 1:M
    %unew = eulerstep(Tdx, uold, dt);   % Explicit Euler
    unew = TRstep(Tdx, uold, dt);
    solMatrix(:, i+1) = unew;
    uold = unew;
end

solMatrix = [zeros(1, length(t)); solMatrix; zeros(1, length(t))];

figure(1);
surf(X, T, solMatrix')
title('Solution');

%% Task 2.1 - The advection equation
N = 30;
equigrid = linspace(0, 1, N+2)';
xint = equigrid(2:end-1);
dx = 1/(N+1);
dx2 = dx^2;

sol = exp(-100*(xint-0.5).^2);

M = 400;  %Stability border 189.
%M= 100; N= 99, M =100% For Crank-Nicolson  % Pr?va med M < 10.
trange = 0.1;
dt = trange/M;
t = linspace(0, trange, M+1);
[X, T] = meshgrid(equigrid, t);

uold = sol;

a = zeros(N,1);
a(1) = -2;
a(2) = 1;
Tdx = toeplitz(a)/dx2;
I = eye(size(Tdx));

amu = 1;

%error(M+1) = 0;

for i = 1:M+1
    unew = LaxWen(uold, amu);
    %error(i) = rms(unew);
    sol = [sol unew];   % Preallocate not optimal
    uold = unew;
end

sol = [zeros(1,length(t)); sol; zeros(1,length(t))];
size(sol)
figure(1);
surf(X, T, sol')

%figure(2);
%plot(t, error);

%% Task 3.1 - The convection-diffusion equation
N = 100;
M = 100;
tend = 1;
dx = 1/N;
dt = tend/M;
a = 3;
d = 0.5;
xx = linspace(0,1,N+1);
tt = linspace(0,tend,M+1);
[X,T] = meshgrid(xx,tt);

Pe = abs(a/d)
Pe*dx

if Pe*dx >= 2
    return
end

%CFL = d*dt/(dx^2)

uold = exp(-100.*(xx-1/2).^2);

u = zeros(N+1,M+1);

u(:,1) = uold;

for i = 2:M+1
    u(:,i) = convdif(u(:,i-1),a,d,dt);
end

mesh(X,T,u')