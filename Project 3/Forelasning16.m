%Instability will look different depending on whether N is odd or even.
close all
N = 30;
x = linspace(0,1,N+2)';
xint = x(2:N+1);
dx = 1/(N+1);
dx2 = dx^2;

M = 400;  %Stability border 189.
%M= 100; N= 99, M =100% For Crank-Nicolson  % Pr?va med M < 10.
trange = 0.1;
dt = trange/M;
t= linspace(0,trange,M+1);
[X,T] = meshgrid(x,t);

CFL = dt/dx2;

%Arbitrary function. Try with extra sinoidal terms.
sol = 3*exp(-30.*(xint-0.4).^2) + 0.5*sin(3*pi*xint);

u = sol;
a = zeros(N,1);
a(1) =-2;
a(2) =1;
Tdx = toeplitz(a)/dx2;
I = eye(size(Tdx));

for i = 1:M
    u = u +dt*Tdx*u;             % Explicit Euler
    %v = u +dt*Tdx*u/2;          % Trapezoidal part 1
    %u= (I -dt*Tdx/2)\v;         % Trapezoidal part 2
    sol = [sol u];   % Preallocate not optimal
end

sol = [zeros(1,length(t)); sol; zeros(1,length(t))];
figure(1);
surf(X,T,sol')
title('Föreläsning 16');