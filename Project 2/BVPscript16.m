function BVPscript16
    N = 999;
    xx = linspace(0, 1,N+2);
    x = xx(2:end-1);
    dx = 1/(N+1);
    
    a = zeros(N, 1);
    a(1) = -2;
    a(2) = 1;
    Tdx = toeplitz(a)./dx^2;
    
    f = x.^2 - 4*x - sin(2*x-1);
    u = Tdx\f;
    uu = [0 ; u ; 0];
    plot(xx, uu,'r');
    grid on;

%     lam = eig(Tdx);
%     lam(N)/pi^2
%     lam(N-1)/pi^2
%     lam(N-2)/pi^2
    
end