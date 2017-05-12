function forelasning10
N = 99;
%101 points. Use column vectors, always!
xx =linspace(0,1,N+2)';
x = xx(2:end-1);

%Construct a Toeplitz matrix, F?rel?sarens l?sning bortmarkerad.
%a(1) = -2;
%a(2) = 1;
%Tdx = toeplitz(a)/dx^2;
Tdx = full(gallery('tridiag',N,-1,2,-1));
f = x.^2 - x + sin(2*x-1);
u = Tdx\f;

plot(x,u);

uu = [0;u;0];
plot(xx,uu,'r')

grid ON

lam = eig(Tdx);
lam(N)/pi^2
lam(N-1)/pi^2
lam(N-2)/pi^2