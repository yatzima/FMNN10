function udot = tdx(gvec)
    %ut=uxx
    %u(t,0)=u(t,1)=0;
    %u(0,x)=g(x)
    N = 1;
    equigrid = linspace(0, L, N+2)';
    interior = equigrid(2 : end-1);
    dx = 1/(N+1);
    dx2 = dx^2;
    
    a(N, 1) = 0;
    a(1) = -2;
    a(2) = 1;
    tdx = toeplitz(a)/dx2;
    
    gvec = gvec(equigrid);
    
    y = tdx\fvec;
    y = [alpha; y; beta];
end